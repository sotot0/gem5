Note that the first argument stands always for the number of Task in this assignment.

For Task 1:
./runall.sh 1 <cacheline_size> <L1_DCache_associativity>

For Task 2:
./runall.sh 2 <cacheline_size>(found in Task 0) <L1_DCache_associativity>(found in Task 0) <L2_size> <L2_associativity> <L2_replacement_policy> <L2_clusivity>

For Task 3:
./runall.sh 3 <cacheline_size>(found in Task 0) <L1_DCache_associativity>(found in Task 0) <L2_size>(found in Task 1) <L2_associativity>(found in Task 1) <L2_replacement_policy>(found in Task 1) <L2_clusivity>(found in Task 1) <L2_prefetcher> <prefetch_degree>

For <L2_replacement_policy> use: LRURP, RandomRP or FIFORP
For <L2_prefetcher> use: StridePrefetcher or TaggedPrefetcher
