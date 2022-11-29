import m5
from m5.objects import StaticPred

m5.util.addToPath('../')

class StaticPredWrap(StaticPred):
  
    def __init__(self, options=None):
        super(StaticPredWrap, self).__init__()
        pass

class StaticPredPar(StaticPredWrap):

    def __init__(self, options=None):
        super(StaticPredPar, self).__init__(options)
        if not options or not options.btb_entries:
            return
        self.BTBEntries = options.btb_entries