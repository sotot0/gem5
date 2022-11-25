#!/bin/bash

export GEM5_DIR=../code

MAX_INSTS=5000000

if [ "$1" = "O3CPU" ]
then
	if [ "$2" = "StaticPred" ]
	then
		export BENCHMARK=./benchmark1/bin/benchmark
		export ARGUMENT=./benchmark1/data/input.program
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_$1_$2_BTB:$3 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='O3CPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='StaticPred' --btb_entries=$3
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark2/bin/benchmark
		export ARGUMENT=./benchmark2/data/inp.in
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_$1_$2_BTB:$3 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='O3CPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='StaticPred' --btb_entries=$3	
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark3/bin/benchmark
		export ARGUMENT=./benchmark3/data/bombesin.hmm.new
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_$1_$2_BTB:$3 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='O3CPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='StaticPred' --btb_entries=$3
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark4/bin/benchmark
		export ARGUMENT=./benchmark4/data/test.txt
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_$1_$2_BTB:$3 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='O3CPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='StaticPred' --btb_entries=$3
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark5/bin/benchmark
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_$1_$2_BTB:$3 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type='O3CPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='StaticPred' --btb_entries=$3
		echo "-------------------------------------------------------"
    elif [ "$2" = "LocalBP" ]
    then
		export BENCHMARK=./benchmark1/bin/benchmark
		export ARGUMENT=./benchmark1/data/input.program
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_$1_$2_BTB:$3_lpredSize:$4_predBits:$5 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='LocalBP' --btb_entries=$3 --local_predictor_size=$4 --local_ctr_bits=$5
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark2/bin/benchmark
		export ARGUMENT=./benchmark2/data/inp.in
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_$1_$2_BTB:$3_lpredSize:$4_predBits:$5 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='LocalBP' --btb_entries=$3 --local_predictor_size=$4 --local_ctr_bits=$5	
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark3/bin/benchmark
		export ARGUMENT=./benchmark3/data/bombesin.hmm.new
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_$1_$2_BTB:$3_lpredSize:$4_predBits:$5 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='LocalBP' --btb_entries=$3 --local_predictor_size=$4 --local_ctr_bits=$5
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark4/bin/benchmark
		export ARGUMENT=./benchmark4/data/test.txt
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_$1_$2_BTB:$3_lpredSize:$4_predBits:$5 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='LocalBP' --btb_entries=$3 --local_predictor_size=$4 --local_ctr_bits=$5
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark5/bin/benchmark
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_$1_$2_BTB:$3_lpredSize:$4_predBits:$5 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='LocalBP' --btb_entries=$3 --local_predictor_size=$4 --local_ctr_bits=$5
		echo "-------------------------------------------------------"
    elif [ "$2" = "GApPred" ]
    then
		export BENCHMARK=./benchmark1/bin/benchmark
		export ARGUMENT=./benchmark1/data/input.program
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_$1_$2_BTB:$3_histSize:$4_height:$5_width:$6_predBits:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='GApPred' --btb_entries=$3 --history_size=$4 --ptable_height=$5 --ptable_width=$6 --pred_size=$7
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark2/bin/benchmark
		export ARGUMENT=./benchmark2/data/inp.in
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_$1_$2_BTB:$3_histSize:$4_height:$5_width:$6_predBits:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='GApPred' --btb_entries=$3 --history_size=$4 --ptable_height=$5 --ptable_width=$6 --pred_size=$7	
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark3/bin/benchmark
		export ARGUMENT=./benchmark3/data/bombesin.hmm.new
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_$1_$2_BTB:$3_histSize:$4_height:$5_width:$6_predBits:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='GApPred' --btb_entries=$3 --history_size=$4 --ptable_height=$5 --ptable_width=$6 --pred_size=$7
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark4/bin/benchmark
		export ARGUMENT=./benchmark4/data/test.txt
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_$1_$2_BTB:$3_histSize:$4_height:$5_width:$6_predBits:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='GApPred' --btb_entries=$3 --history_size=$4 --ptable_height=$5 --ptable_width=$6 --pred_size=$7
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark5/bin/benchmark
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_$1_$2_BTB:$3_histSize:$4_height:$5_width:$6_predBits:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='GApPred' --btb_entries=$3 --history_size=$4 --ptable_height=$5 --ptable_width=$6 --pred_size=$7
		echo "-------------------------------------------------------"
    elif [ "$2" = "PAgPred" ]
    then
		export BENCHMARK=./benchmark1/bin/benchmark
		export ARGUMENT=./benchmark1/data/input.program
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_$1_$2_BTB:$3_ltable_height:$4_lhist_width:$5_gtable_height:$6_gpred_size:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='PAgPred' --btb_entries=$3 --ltable_height=$4 --lhistory_width=$5 --gtable_height=$6 --gpred_size=$7
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark2/bin/benchmark
		export ARGUMENT=./benchmark2/data/inp.in
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_$1_$2_BTB:$3_ltable_height:$4_lhist_width:$5_gtable_height:$6_gpred_size:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='PAgPred' --btb_entries=$3 --ltable_height=$4 --lhistory_width=$5 --gtable_height=$6 --gpred_size=$7	
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark3/bin/benchmark
		export ARGUMENT=./benchmark3/data/bombesin.hmm.new
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_$1_$2_BTB:$3_ltable_height:$4_lhist_width:$5_gtable_height:$6_gpred_size:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='PAgPred' --btb_entries=$3 --ltable_height=$4 --lhistory_width=$5 --gtable_height=$6 --gpred_size=$7
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark4/bin/benchmark
		export ARGUMENT=./benchmark4/data/test.txt
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_$1_$2_BTB:$3_ltable_height:$4_lhist_width:$5_gtable_height:$6_gpred_size:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='PAgPred' --btb_entries=$3 --ltable_height=$4 --lhistory_width=$5 --gtable_height=$6 --gpred_size=$7
		echo "-------------------------------------------------------"
		export BENCHMARK=./benchmark5/bin/benchmark
		time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_$1_$2_BTB:$3_ltable_height:$4_lhist_width:$5_gtable_height:$6_gpred_size:$7 $GEM5_DIR/configs/cs425_pa1/cs425_pa1.py  -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type='TimingSimpleCPU' --l1d_size='32kB' --l1d_assoc='4' --bp-type='PAgPred' --btb_entries=$3 --ltable_height=$4 --lhistory_width=$5 --gtable_height=$6 --gpred_size=$7
		echo "-------------------------------------------------------"
    else
        echo THE SECOND ARGUMENT IS WRONG, CHANGE BRANCH PREDICTOR TYPE!
	fi
else
	echo THE FIRST ARGUMENT IS WRONG, CHANGE CPU TYPE!
fi    
