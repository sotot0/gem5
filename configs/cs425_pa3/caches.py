import m5
from m5.objects import Cache
from m5.objects import StridePrefetcher
from m5.objects import TaggedPrefetcher
from m5.objects import System
from m5.objects import LRURP
from m5.objects import RandomRP

m5.util.addToPath('../')

from common import ObjectList

class CustStridePref(StridePrefetcher):
  def __init__(self, options=None):
    super(CustStridePref,self).__init__()

    if not options or not options.pref_degree:
      return
    self.degree = options.pref_degree

class CustTaggedPref(TaggedPrefetcher):
  def __init__(self, options=None):
    super(CustTaggedPref, self).__init__()

    if not options or not options.pref_degree:
      return
    self.degree = options.pref_degree


class CustSystem(System):
  def __init__(self, options=None):
    super(CustSystem, self).__init__()
    pass

class WrapSystem(CustSystem):
  def __init__(self, options=None):
    super(WrapSystem, self).__init__(options)
    if not options or not options.cacheline_size:
      return
    self.cache_line_size = options.cacheline_size

class L1Cache(Cache):
  tag_latency = 2
  data_latency = 1
  response_latency = 1
  mshrs = 16
  tgts_per_mshr = 20
  clusivity = 'mostly_incl'
  replacement_policy = LRURP()

  def connectBus(self, bus):
    self.mem_side = bus.cpu_side_ports

  def connectCPU(self, cpu):
    raise NotImplementedError

  def __init__(self, options=None):
    super(L1Cache, self).__init__()
    pass

class L1ICache(L1Cache):
  size = '32kB'
  assoc = '4'
  def __init__(self, options=None):
    super(L1ICache, self).__init__(options)
    if not options or not options.l1i_size:
      return
    self.size = options.l1i_size
  def connectCPU(self, cpu):
    self.cpu_side = cpu.icache_port


class L1DCache(L1Cache):
  size = '32kB'
  assoc = '1'
  def __init__(self, options=None):
    super(L1DCache, self).__init__(options)

    if not options or not options.l1d_assoc:
      return
    self.assoc = options.l1d_assoc

  def connectCPU(self, cpu):
    self.cpu_side = cpu.dcache_port


class L2Cache(Cache):
  size = '128kB'
  assoc = '4'
  tag_latency = 4
  data_latency = 6
  response_latency = 4
  mshrs = 32
  tgts_per_mshr = 20
  replacement_policy = RandomRP()

  def __init__(self, options=None):
    super(L2Cache, self).__init__()
    if not options or not options.l2_size:
      return
    self.size = options.l2_size

    if not options or not options.l2_assoc:
      return
    self.assoc = options.l2_assoc

    if not options or not options.clusivity:
      return
    self.clusivity = options.clusivity

    if not options or not options.rp_type:
      return
    Rp_Class = ObjectList.rp_list.get(options.rp_type)
    self.replacement_policy = Rp_Class()

    if not options or not options.l2_hwp_type:
      return
    if options.l2_hwp_type == 'StridePrefetcher':
      self.prefetcher = CustStridePref(options)
    if options.l2_hwp_type == 'TaggedPrefetcher':
      self.prefetcher = CustTaggedPref(options) 

  def connectCPUSideBus(self, bus):
    self.cpu_side = bus.mem_side_ports

  def connectMemSideBus(self, bus):
    self.mem_side = bus.cpu_side_ports