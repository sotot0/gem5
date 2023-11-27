Command line arguments format

./runall.sh < CPU_TYPE > StaticPred

./runall.sh < CPU_TYPE > LocalBP PredictorSize PredictorBits

./runall.sh < CPU_TYPE > GAgPred HistorySize PredictorBits

./runall.sh < CPU_TYPE > PAgPred LtableHeight LhistoryWidth GtableHeight PredictorBits


< CPU_TYPE > : TimingSimpleCPU for debugging/testing
< CPU_TYPE > : O3CPU for measurements
