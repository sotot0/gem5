import m5
from m5.objects import GAgPred

m5.util.addToPath("../")


class GAgWrap(GAgPred):
    def __init__(self, options=None):
        super(GAgWrap, self).__init__()
        pass


class GAgPar(GAgWrap):
    def __init__(self, options=None):
        super(GAgPar, self).__init__(options)
        if not options or not options.history_size:
            return
        self.historySize = options.history_size
        if not options or not options.ptable_height:
            return
        self.predSize = options.pred_size
        if not options or not options.btb_entries:
            return
        self.BTBEntries = options.btb_entries
