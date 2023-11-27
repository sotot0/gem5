# import the m5 (gem5) library created when gem5 is built
import m5

import argparse
import sys
import os

# import all of the SimObjects
from m5.objects import *
from caches import *
from staticpred import *
from gag import *
from localpred import *
from pag import *

m5.util.addToPath("../")
from common import Options
from common import Simulation
from common import ObjectList

parser = argparse.ArgumentParser(description="A simple system with 2-level cache.")

# these arguments are moved/implemented inside the options file... check them there...
# parser.add_argument("binary", default="", nargs="?", type=str, help="Path to the binary to execute.")
# parser.add_argument("--l1i_size", help="L1 instruction cache size. Default: 16kB.")
# parser.add_argument("--l1d_size", help="L1 data cache size. Default: 64kB.")
# parser.add_argument("--l2_size", help="L2 cache size. Default: 256kB.")
# parser.add_argument("--l1d_assoc", help="L1 data cache associativity. Default: 2.")
# parser.add_argument("--list-cpu-types", action=Options.ListCpu, nargs=0, help="List available CPU types")

# Options.addNoISAOptions(parser)
Options.addCommonOptions(parser)
Options.addSEOptions(parser)

options = parser.parse_args()

# create the system we are going to simulate
system = System()

# Set the clock fequency of the system (and all of its children)
system.clk_domain = SrcClockDomain()
system.clk_domain.clock = "1GHz"
system.clk_domain.voltage_domain = VoltageDomain()

(Cpu_Class, Mem_Mode) = Simulation.getCPUClass(options.cpu_type)
system.mem_mode = Mem_Mode
system.cpu = Cpu_Class()

system.mem_ranges = [AddrRange(options.mem_size)]

if options.bp_type == "StaticPred":
    system.cpu.branchPred = StaticPredPar(options)
elif options.bp_type == "GagPred":
    system.cpu.branchPred = GAgPar(options)
elif options.bp_type == "LocalBP":
    system.cpu.branchPred = LocalBPPar(options)
elif options.bp_type == "PAgPred":
    system.cpu.branchPred = PAgPar(options)
else:
    bpClass = ObjectList.bp_list.get(options.bp_type)
    system.cpu.branchPred = bpClass()

system.cpu.icache = L1ICache(options)
system.cpu.dcache = L1DCache(options)

system.cpu.icache.connectCPU(system.cpu)
system.cpu.dcache.connectCPU(system.cpu)

system.l2bus = L2XBar()

system.cpu.icache.connectBus(system.l2bus)
system.cpu.dcache.connectBus(system.l2bus)

system.l2cache = L2Cache(options)

system.l2cache.connectCPUSideBus(system.l2bus)

# Create a memory bus, a system crossbar, in this case
system.membus = SystemXBar()

system.l2cache.connectMemSideBus(system.membus)

# Hook the CPU ports up to the membus
# system.cpu.icache_port = system.membus.cpu_side_ports
# system.cpu.dcache_port = system.membus.cpu_side_ports

# create the interrupt controller for the CPU and connect to the membus
system.cpu.createInterruptController()

# For x86 only, make sure the interrupts are connected to the memory
# Note: these are directly connected to the memory bus and are not cached
if m5.defines.buildEnv["TARGET_ISA"] == "x86":
    system.cpu.interrupts[0].pio = system.membus.mem_side_ports
    system.cpu.interrupts[0].int_requestor = system.membus.cpu_side_ports
    system.cpu.interrupts[0].int_responder = system.membus.mem_side_ports

# Create a DDR3 memory controller and connect it to the membus
system.mem_ctrl = MemCtrl()
system.mem_ctrl.dram = DDR3_1600_8x8()
system.mem_ctrl.dram.range = system.mem_ranges[0]
system.mem_ctrl.port = system.membus.mem_side_ports

# Connect the system up to the membus
system.system_port = system.membus.cpu_side_ports

# get ISA for the binary to run.
isa = str(m5.defines.buildEnv["TARGET_ISA"]).lower()

# Default to running 'hello', use the compiled ISA to find the binary
# grab the specific path to the binary
# -->>>binary = '/home/sototo/gem5_tests/a.out'

work = options.cmd
opts = options.options.split(";")

# we need it to give command line executables
# binary = options.binary

# -->>>system.workload = SEWorkload.init_compatible(binary)

# Create a process for a simple "Hello World" application
process = Process()
process.executable = work
process.cwd = os.getcwd()

print(process.cwd)

process.cmd = [work] + opts[0].split()


# Set the command
# cmd is a list which begins with the executable (like argv)
# -->>>process.cmd = [binary]

system.workload = SEWorkload.init_compatible(process.executable)

# Set the cpu to use the process as its workload and create thread contexts
system.cpu.workload = process
system.cpu.createThreads()

system.cpu.max_insts_any_thread = options.maxinsts

# set up the root SimObject and start the simulation
root = Root(full_system=False, system=system)
# instantiate all of the objects we've created above
m5.instantiate()

print("Beginning simulation!")
exit_event = m5.simulate()
print("Exiting @ tick %i because %s" % (m5.curTick(), exit_event.getCause()))
