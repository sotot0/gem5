In the following arguments the <CPU_TYPE> equals to O3CPU, everything else instead of O3CPU is considered
an invalid option.

./runall.sh <CPU_TYPE> StaticPred BTB_Entries

./runall.sh <CPU_TYPE> LocalBP BTB_Entries PredictorSize PredictorBits

./runall.sh <CPU_TYPE> GApPred BTB_Entries HistorySize Ptable_height Ptable_width PredictorBits

./runall.sh <CPU_TYPE> PAgPred BTB_Entries LtableHeight LhistoryWidth GtableHeight PredictorBits
