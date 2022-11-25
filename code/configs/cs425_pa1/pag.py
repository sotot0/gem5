import m5
from m5.objects import PAgPred

m5.util.addToPath('../')

class PAgWrap(PAgPred):

    def __init__(self, options=None):
        super(PAgWrap, self).__init__()
        pass

class PAgPar(PAgWrap):

    def __init__(self, options=None):
        super(PAgPar, self).__init__(options)
        if not options or not options.ltable_height:
            return
        self.ltableHeight = options.ltable_height
        if not options or not options.lhistory_width:
            return
        self.lhistoryWidth = options.lhistory_width
        if not options or not options.gtable_height:
            return
        self.gtableHeight = options.gtable_height
        if not options or not options.gpred_size:
            return
        self.gpredSize = options.gpred_size        
        if not options or not options.btb_entries:
            return
        self.BTBEntries = options.btb_entries


