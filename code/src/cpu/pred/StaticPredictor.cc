#include "cpu/pred/StaticPredictor.hh"

#include "base/intmath.hh"
#include "base/logging.hh"
#include "base/trace.hh"
#include "debug/Fetch.hh"

namespace gem5
{

namespace branch_prediction
{

StaticPred::StaticPred(const StaticPredParams &params)
    : BPredUnit(params)
{
    printf("A static predictor is instantiated\n");
}

// unused
void
StaticPred::btbUpdate(ThreadID tid, Addr branch_addr, void * &bp_history)
{
// Place holder for a function that is called to update predictor history when
// a BTB entry is invalid or not found.
}

bool
StaticPred::lookup(ThreadID tid, Addr branch_addr, void * &bp_history)
{
    bool taken;

		// not taken
    taken = 0;

    return taken;
}

void
StaticPred::update(ThreadID tid, Addr branch_addr, bool taken, void *bp_history,
                bool squashed, const StaticInstPtr & inst, Addr corrTarget)
{
    assert(bp_history == NULL);
}

// unused
void
StaticPred::uncondBranch(ThreadID tid, Addr pc, void *&bp_history)
{
}

}

}
