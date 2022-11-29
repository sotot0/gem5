import m5
from m5.objects import Cache
from m5.objects import BIPRP

m5.util.addToPath('../')

from common import ObjectList

class L1Cache(Cache):
  #assoc = 2
  tag_latency = 2
  data_latency = 2
  response_latency = 2
  mshrs = 4
  tgts_per_mshr = 20
  #replacement_policy = BIPRP()

  def connectBus(self, bus):
    self.mem_side = bus.cpu_side_ports

  def connectCPU(self, cpu):
    raise NotImplementedError

  def __init__(self, options=None):
    super(L1Cache, self).__init__()
    pass

class L1ICache(L1Cache):
  size = '16kB'
  assoc = '2'
  def __init__(self, options=None):
    super(L1ICache, self).__init__(options)
    if not options or not options.l1i_size:
      return
    self.size = options.l1i_size
  def connectCPU(self, cpu):
    self.cpu_side = cpu.icache_port


class L1DCache(L1Cache):
  size = '64kB'
  assoc = '2'
  replacement_policy = BIPRP()
  def __init__(self, options=None):
    super(L1DCache, self).__init__(options)
    if not options or not options.l1d_size:
      return
    self.size = options.l1d_size
    if not options or not options.l1d_assoc:
      return
    self.assoc = options.l1d_assoc
    if not options or not options.rp_type:
      return
    Rp_Class = ObjectList.rp_list.get(options.rp_type)
    self.replacement_policy = Rp_Class()
    if not options or not options.l1d_hwp_type:
      return
    Hwp_Class = ObjectList.hwp_list.get(options.l1d_hwp_type)
    self.prefetcher = Hwp_Class()

  def connectCPU(self, cpu):
    self.cpu_side = cpu.dcache_port


class L2Cache(Cache):
  size = '256kB'
  assoc = 8
  tag_latency = 20
  data_latency = 20
  response_latency = 20
  mshrs = 20
  tgts_per_mshr = 12

  def __init__(self, options=None):
    super(L2Cache, self).__init__()
    if not options or not options.l2_size:
      return
    self.size = options.l2_size
       
  
  def connectCPUSideBus(self, bus):
    self.cpu_side = bus.mem_side_ports

  def connectMemSideBus(self, bus):
    self.mem_side = bus.cpu_side_ports

