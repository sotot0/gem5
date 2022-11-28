Command line arguments format

./runall.sh < CPU_TYPE > StaticPred BTB_Entries

./runall.sh < CPU_TYPE > LocalBP BTB_Entries PredictorSize PredictorBits

./runall.sh < CPU_TYPE > GApPred BTB_Entries HistorySize Ptable_height Ptable_width PredictorBits

./runall.sh < CPU_TYPE > PAgPred BTB_Entries LtableHeight LhistoryWidth GtableHeight PredictorBits


< CPU_TYPE > : TimingSimpleCPU for debugging/testing
< CPU_TYPE > : O3CPU for measurements
