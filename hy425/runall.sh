#!/bin/bash

export GEM5_DIR=..

MAX_INSTS=100000000

if [ $1 -eq 1 ]; then
	# TASK 1
	export BENCHMARK=./benchmark1/benchmark1
	export ARGUMENT=./benchmark1/data/input.program
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_TASK:1_cacheline_sz:$2_l1d_assoc:$3 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -I $MAX_INSTS --cpu-type=O3CPU --l1d_size='64kB' --l1d_assoc=$3 --cacheline_size=$2 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark2/bin/benchmark
	export ARGUMENT=./benchmark2/data/inp.in
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_TASK:1_cacheline_sz:$2_l1d_assoc:$3 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_size='64kB' --l1d_assoc=$3 --cacheline_size=$2 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark3/bin/benchmark
	export ARGUMENT=./benchmark3/data/bombesin.hmm.new
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_TASK:1_cacheline_sz:$2_l1d_assoc:$3 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_size='64kB' --l1d_assoc=$3 --cacheline_size=$2 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark4/bin/benchmark
	export ARGUMENT=./benchmark4/data/test.txt
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_TASK:1_cacheline_sz:$2_l1d_assoc:$3 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_size='64kB' --l1d_assoc=$3 --cacheline_size=$2 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark5/bin/benchmark
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_TASK:1_cacheline_sz:$2_l1d_assoc:$3 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type=O3CPU --l1d_size='64kB' --l1d_assoc=$3 --cacheline_size=$2 --bp-type='TournamentBP'
elif [ $1 -eq 2 ]; then
	#TASK 2
	export BENCHMARK=./benchmark1/benchmark1
	export ARGUMENT=./benchmark1/data/input.program
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_TASK:2_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark2/bin/benchmark
	export ARGUMENT=./benchmark2/data/inp.in
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_TASK:2_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark3/bin/benchmark
	export ARGUMENT=./benchmark3/data/bombesin.hmm.new
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_TASK:2_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark4/bin/benchmark
	export ARGUMENT=./benchmark4/data/test.txt
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_TASK:2_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark5/bin/benchmark
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_TASK:2_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --bp-type='TournamentBP'
elif [ $1 -eq 3 ]; then
	# TASK 3
	export BENCHMARK=./benchmark1/benchmark1
	export ARGUMENT=./benchmark1/data/input.program
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_TASK:3_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7_l2_pref:$8_pref_deg:$9 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --pref_degree=$9 --l2-hwp-type=$8 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark2/bin/benchmark
	export ARGUMENT=./benchmark2/data/inp.in
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_TASK:3_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7_l2_pref:$8_pref_deg:$9 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --pref_degree=$9 --l2-hwp-type=$8 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark3/bin/benchmark
	export ARGUMENT=./benchmark3/data/bombesin.hmm.new
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_TASK:3_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7_l2_pref:$8_pref_deg:$9 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --pref_degree=$9 --l2-hwp-type=$8 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark4/bin/benchmark
	export ARGUMENT=./benchmark4/data/test.txt
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_TASK:3_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7_l2_pref:$8_pref_deg:$9 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --pref_degree=$9 --l2-hwp-type=$8 --bp-type='TournamentBP'
	echo "-------------------------------------------------------"
	export BENCHMARK=./benchmark5/bin/benchmark
	time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_TASK:3_cacheline_sz:$2_l1d_assoc:$3_l2_sz:$4_l2_assoc:$5_rp_type:$6_l2_clus:$7_l2_pref:$8_pref_deg:$9 $GEM5_DIR/configs/cs425_pa3/cs425_pa3.py -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type=O3CPU --l1d_assoc=$3 --cacheline_size=$2 --clusivity=$7 --rp-type=$6 --l2_size=$4 --l2_assoc=$5 --pref_degree=$9 --l2-hwp-type=$8 --bp-type='TournamentBP'
else
	# Error
	echo "Wrong task argument given, stop!"
fi
