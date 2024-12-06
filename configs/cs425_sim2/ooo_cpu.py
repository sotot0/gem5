import m5
from m5.objects import O3CPU
from m5.objects import FUPool
from m5.objects import FUDesc
from m5.objects import OpDesc

class custom_Simple_Int(FUDesc):
    def __init__(self, options=None):
        super(custom_Simple_Int, self).__init__()

        if not options:
            return
        self.opList = [ OpDesc(opClass='IntAlu', opLat=options.int_latency, pipelined=options.int_pipelined) ]
        self.count = options.num_int_FUs

class custom_Complex_Int(FUDesc):
    def __init__(self,options=None):
        super(custom_Complex_Int, self).__init__()

        if not options:
            return
        self.opList = [ OpDesc(opClass='IntMult', opLat=options.mult_latency, pipelined=options.mult_pipelined),
                            OpDesc(opClass='IntDiv', opLat=options.div_latency, pipelined=options.div_pipelined),
                            OpDesc(opClass='IprAccess', opLat=3, pipelined=True) ]
        self.count = options.num_complex_FUs

class custom_Load(FUDesc):
    def __init__(self, options=None):
        super(custom_Load, self).__init__()
        
        if not options:
            return
        self.opList = [ OpDesc(opClass='MemRead', opLat=options.read_latency, pipelined=True), OpDesc(opClass='FloatMemRead', opLat=options.float_read_latency, pipelined=True) ]
        self.count = options.num_ls_FUs

class custom_Store(FUDesc):
    def __init__(self, options=None):
        super(custom_Store, self).__init__()

        if not options:
            return
        self.opList = [ OpDesc(opClass='MemWrite',opLat=options.write_latency, pipelined=True), OpDesc(opClass='FloatMemWrite',opLat=options.float_write_latency, pipelined=True) ]
        self.count = options.num_ls_FUs

class custom_FloatingPoint(FUDesc):
    def __init__(self, options=None):
        super(custom_FloatingPoint, self).__init__()

        if not options:
            return
        self.opList = [OpDesc(opClass='SimdAdd', opLat=4),
                        OpDesc(opClass='SimdAddAcc', opLat=4),
                        OpDesc(opClass='SimdAlu', opLat=4),
                        OpDesc(opClass='SimdCmp', opLat=4),
                        OpDesc(opClass='SimdCvt', opLat=3),
                        OpDesc(opClass='SimdMisc', opLat=3),
                        OpDesc(opClass='SimdMult',opLat=5),
                        OpDesc(opClass='SimdMultAcc',opLat=5),
                        OpDesc(opClass='SimdShift',opLat=3),
                        OpDesc(opClass='SimdShiftAcc', opLat=3),
                        OpDesc(opClass='SimdSqrt', opLat=9),
                        OpDesc(opClass='SimdFloatAdd',opLat=5),
                        OpDesc(opClass='SimdFloatAlu',opLat=5),
                        OpDesc(opClass='SimdFloatCmp', opLat=3),
                        OpDesc(opClass='SimdFloatCvt', opLat=3),
                        OpDesc(opClass='SimdFloatDiv', opLat=3),
                        OpDesc(opClass='SimdFloatMisc', opLat=3),
                        OpDesc(opClass='SimdFloatMult', opLat=3),
                        OpDesc(opClass='SimdFloatMultAcc',opLat=5),
                        OpDesc(opClass='SimdFloatSqrt', opLat=9),

                        OpDesc(opClass='FloatAdd', opLat=options.fadd_latency, pipelined=True),
                        OpDesc(opClass='FloatCmp', opLat=options.fcmp_latency, pipelined=True),
                        OpDesc(opClass='FloatCvt', opLat=5, pipelined=True),
                        OpDesc(opClass='FloatDiv', opLat=options.fdiv_latency, pipelined=options.fdiv_pipelined),
                        OpDesc(opClass='FloatSqrt', opLat=options.fsqrt_latency, pipelined=options.fsqrt_pipelined),
                        OpDesc(opClass='FloatMult', opLat=options.fmult_latency, pipelined=options.fmult_pipelined),
                        OpDesc(opClass='FloatMultAcc', opLat=5, pipelined=True),
                        OpDesc(opClass='FloatMisc', opLat=3)]
        self.count = options.num_float_FUs

class cs425_Custom_FUpool(FUPool):
    def __init__(self, options=None):
        super(cs425_Custom_FUpool, self).__init__()

        if not options:
            return
        self.FUList = [custom_Simple_Int(options), custom_Complex_Int(options), custom_Load(options), custom_Store(options), custom_FloatingPoint(options)]

class OoOCPU(O3CPU):
    def __init__(self, options=None):
        super(OoOCPU, self).__init__()
        
        if not options:
            return
        self.LQEntries = options.LSQ_Entries
        self.SQEntries = options.LSQ_Entries
        self.numPhysIntRegs = options.numPhys_Regs
        self.numPhysFloatRegs = options.numPhys_Regs
        self.numPhysVecRegs = options.numPhys_Regs
        self.numROBEntries = options.numROB_Entries
        self.fuPool = cs425_Custom_FUpool(options)