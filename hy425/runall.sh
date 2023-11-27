#!/bin/bash

export GEM5_DIR=..

MAX_INSTS=50000000

if [ "$1" = "O3CPU" ] || [ "$1" = "TimingSimpleCPU" ]; then
	if [ "$2" = "StaticPred" ]; then
		export BENCHMARK=./benchmark1/bin/benchmark
		export ARGUMENT=./benchmark1/data/input.program
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_$1_$2 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark2/bin/benchmark
		export ARGUMENT=./benchmark2/data/inp.in
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_$1_$2 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark3/bin/benchmark
		export ARGUMENT=./benchmark3/data/bombesin.hmm.new
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_$1_$2 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark4/bin/benchmark
		export ARGUMENT=./benchmark4/data/test.txt
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_$1_$2 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark5/bin/benchmark
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_$1_$2 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2
		echo "-------------------------------------------------------"
	elif [ "$2" = "LocalBP" ]; then
		export BENCHMARK=./benchmark1/bin/benchmark
		export ARGUMENT=./benchmark1/data/input.program
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_$1_$2_lpredSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --local_predictor_size=$3 --local_ctr_bits=$4
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark2/bin/benchmark
		export ARGUMENT=./benchmark2/data/inp.in
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_$1_$2_lpredSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --local_predictor_size=$3 --local_ctr_bits=$4
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark3/bin/benchmark
		export ARGUMENT=./benchmark3/data/bombesin.hmm.new
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_$1_$2_lpredSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --local_predictor_size=$3 --local_ctr_bits=$4
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark4/bin/benchmark
		export ARGUMENT=./benchmark4/data/test.txt
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_$1_$2_lpredSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --local_predictor_size=$3 --local_ctr_bits=$4
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark5/bin/benchmark
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_$1_$2_lpredSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --local_predictor_size=$3 --local_ctr_bits=$4
		echo "-------------------------------------------------------"
	elif [ "$2" = "GAgPred" ]; then
		export BENCHMARK=./benchmark1/bin/benchmark
		export ARGUMENT=./benchmark1/data/input.program
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_$1_$2_histSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --history_size=$3 --pred_size=$4
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark2/bin/benchmark
		export ARGUMENT=./benchmark2/data/inp.in
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_$1_$2_histSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --history_size=$3 --pred_size=$4
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark3/bin/benchmark
		export ARGUMENT=./benchmark3/data/bombesin.hmm.new
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_$1_$2_histSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --history_size=$3 --pred_size=$4
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark4/bin/benchmark
		export ARGUMENT=./benchmark4/data/test.txt
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_$1_$2_histSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --history_size=$3 --pred_size=$4
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark5/bin/benchmark
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_$1_$2_histSize:$3_predBits:$4 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --history_size=$3 --pred_size=$4
		echo "-------------------------------------------------------"
	elif [ "$2" = "PAgPred" ]; then
		export BENCHMARK=./benchmark1/bin/benchmark
		export ARGUMENT=./benchmark1/data/input.program
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_$1_$2_ltable_height:$3_lhist_width:$4_gtable_height:$5_gpred_size:$6 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --ltable_height=$3 --lhistory_width=$4 --gtable_height=$5 --gpred_size=$6
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark2/bin/benchmark
		export ARGUMENT=./benchmark2/data/inp.in
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_$1_$2_ltable_height:$3_lhist_width:$4_gtable_height:$5_gpred_size:$6 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --ltable_height=$3 --lhistory_width=$4 --gtable_height=$5 --gpred_size=$6
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark3/bin/benchmark
		export ARGUMENT=./benchmark3/data/bombesin.hmm.new
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_$1_$2_ltable_height:$3_lhist_width:$4_gtable_height:$5_gpred_size:$6 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --ltable_height=$3 --lhistory_width=$4 --gtable_height=$5 --gpred_size=$6
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark4/bin/benchmark
		export ARGUMENT=./benchmark4/data/test.txt
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_$1_$2_ltable_height:$3_lhist_width:$4_gtable_height:$5_gpred_size:$6 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --ltable_height=$3 --lhistory_width=$4 --gtable_height=$5 --gpred_size=$6
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark5/bin/benchmark
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_$1_$2_ltable_height:$3_lhist_width:$4_gtable_height:$5_gpred_size:$6 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type=$1 --l1d_size='32kB' --l1d_assoc='4' --bp-type=$2 --ltable_height=$3 --lhistory_width=$4 --gtable_height=$5 --gpred_size=$6
		echo "-------------------------------------------------------"
	else
		echo "THE SECOND ARGUMENT IS WRONG, CHANGE BRANCH PREDICTOR TYPE!"
	fi
else
	echo "THE FIRST ARGUMENT IS WRONG, CHANGE CPU TYPE!"
fi
