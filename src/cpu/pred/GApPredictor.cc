#include "cpu/pred/GApPredictor.hh"

#include "base/intmath.hh"
#include "base/logging.hh"
#include "base/trace.hh"
#include "debug/Fetch.hh"

namespace gem5
{

namespace branch_prediction
{

GApPred::GApPred(const GApPredParams &params)
    : BPredUnit(params)
      // more parameters are needed to be passed here, check BranchPredictor.py
{
    // you may want to add some checks of the passed parameters here
}

// unused
void
GApPred::btbUpdate(ThreadID tid, Addr branch_addr, void * &bp_history)
{
// Place holder for a function that is called to update predictor history when
// a BTB entry is invalid or not found.
}

bool
GApPred::lookup(ThreadID tid, Addr branch_addr, void * &bp_history)
{
    // implement the lookup logic here

    return 0;
}

void
GApPred::update(ThreadID tid, Addr branch_addr, bool taken, void *bp_history,
                bool squashed, const StaticInstPtr & inst, Addr corrTarget)
{
    // implement the update logic here
}

// unused
void
GApPred::uncondBranch(ThreadID tid, Addr pc, void *&bp_history)
{
}

}

}
