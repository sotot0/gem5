import m5
from m5.objects import LocalBP

m5.util.addToPath('../')

class LocalBPWrap(LocalBP):

    def __init__(self, options=None):
        super(LocalBPWrap, self).__init__()
        pass

class LocalBPPar(LocalBPWrap):

    def __init__(self, options=None):
        super(LocalBPPar, self).__init__(options)
        if not options or not options.local_predictor_size:
            return
        self.localPredictorSize = options.local_predictor_size
        if not options or not options.local_ctr_bits:
            return
        self.localCtrBits = options.local_ctr_bits
        if not options or not options.btb_entries:
            return
        self.BTBEntries = options.btb_entries

