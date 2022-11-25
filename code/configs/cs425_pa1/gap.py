import m5
from m5.objects import GApPred

m5.util.addToPath('../')

class GApWrap(GApPred):

    def __init__(self, options=None):
        super(GApWrap, self).__init__()
        pass

class GApPar(GApWrap):

    def __init__(self, options=None):
        super(GApPar, self).__init__(options)
        if not options or not options.history_size:
            return
        self.historySize = options.history_size
        if not options or not options.ptable_height:
            return
        self.ptableHeight = options.ptable_height
        if not options or not options.ptable_width:
            return
        self.ptableWidth = options.ptable_width
        if not options or not options.pred_size:
            return
        self.predSize = options.pred_size        
        if not options or not options.btb_entries:
            return
        self.BTBEntries = options.btb_entries
