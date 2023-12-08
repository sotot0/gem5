#!/bin/bash

export GEM5_DIR=..

MAX_INSTS=50000000

LSQ_ENTRIES=16
ROB_ENTRIES=64
INT_FU=2
COM_FU=2
FP_FU=2
LS_FU=1

if [ $1 -ne 0 ]; then
	LSQ_ENTRIES=$1
fi

if [ $2 -ne 0 ]; then
	ROB_ENTRIES=$2
fi

if [ $3 -ne 0 ]; then
	INT_FU=$3
fi

if [ $4 -ne 0 ]; then
	COM_FU=$4
fi

if [ $5 -ne 0 ]; then
	FP_FU=$5
fi

if [ $6 -ne 0 ]; then
	LS_FU=$6
fi

export BENCHMARK=./benchmark1/bin/benchmark
export ARGUMENT=./benchmark1/data/input.program
time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark1/m5out_LSQ:$LSQ_ENTRIES._ROB:$ROB_ENTRIES._IFU:$INT_FU._CFU:$COM_FU._FFU:$FP_FU._LSFU:$LS_FU $GEM5_DIR/configs/cs425_pa2/cs425_pa2.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='O3CPU' --l1i_size='64kB' --l1i_assoc='4' --l1d_size='64kB' --l1d_assoc='4' --l2_size='256kB' --l2_assoc='8' --bp-type='TournamentBP' --btb_entries='1024' --LSQ_Entries=$LSQ_ENTRIES --numROB_Entries=$ROB_ENTRIES --num_int_FUs=$INT_FU --num_complex_FUs=$COM_FU --num_ls_FUs=$LS_FU --num_float_FUs=$FP_FU
echo "-------------------------------------------------------"
export BENCHMARK=./benchmark2/bin/benchmark
export ARGUMENT=./benchmark2/data/inp.in
time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark2/m5out_LSQ:$LSQ_ENTRIES._ROB:$ROB_ENTRIES._IFU:$INT_FU._CFU:$COM_FU._FFU:$FP_FU._LSFU:$LS_FU $GEM5_DIR/configs/cs425_pa2/cs425_pa2.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='O3CPU' --l1i_size='64kB' --l1i_assoc='4' --l1d_size='64kB' --l1d_assoc='4' --l2_size='256kB' --l2_assoc='8' --bp-type='TournamentBP' --btb_entries='1024' --LSQ_Entries=$LSQ_ENTRIES --numROB_Entries=$ROB_ENTRIES --num_int_FUs=$INT_FU --num_complex_FUs=$COM_FU --num_ls_FUs=$LS_FU --num_float_FUs=$FP_FU
echo "-------------------------------------------------------"
export BENCHMARK=./benchmark3/bin/benchmark
export ARGUMENT=./benchmark3/data/bombesin.hmm.new
time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark3/m5out_LSQ:$LSQ_ENTRIES._ROB:$ROB_ENTRIES._IFU:$INT_FU._CFU:$COM_FU._FFU:$FP_FU._LSFU:$LS_FU $GEM5_DIR/configs/cs425_pa2/cs425_pa2.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='O3CPU' --l1i_size='64kB' --l1i_assoc='4' --l1d_size='64kB' --l1d_assoc='4' --l2_size='256kB' --l2_assoc='8' --bp-type='TournamentBP' --btb_entries='1024' --LSQ_Entries=$LSQ_ENTRIES --numROB_Entries=$ROB_ENTRIES --num_int_FUs=$INT_FU --num_complex_FUs=$COM_FU --num_ls_FUs=$LS_FU --num_float_FUs=$FP_FU
echo "-------------------------------------------------------"
export BENCHMARK=./benchmark4/bin/benchmark
export ARGUMENT=./benchmark4/data/test.txt
time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark4/m5out_LSQ:$LSQ_ENTRIES._ROB:$ROB_ENTRIES._IFU:$INT_FU._CFU:$COM_FU._FFU:$FP_FU._LSFU:$LS_FU $GEM5_DIR/configs/cs425_pa2/cs425_pa2.py -c $BENCHMARK -o $ARGUMENT -I $MAX_INSTS --cpu-type='O3CPU' --l1i_size='64kB' --l1i_assoc='4' --l1d_size='64kB' --l1d_assoc='4' --l2_size='256kB' --l2_assoc='8' --bp-type='TournamentBP' --btb_entries='1024' --LSQ_Entries=$LSQ_ENTRIES --numROB_Entries=$ROB_ENTRIES --num_int_FUs=$INT_FU --num_complex_FUs=$COM_FU --num_ls_FUs=$LS_FU --num_float_FUs=$FP_FU
echo "-------------------------------------------------------"
export BENCHMARK=./benchmark5/bin/benchmark
time $GEM5_DIR/build/X86/gem5.opt -d ./benchmark5/m5out_LSQ:$LSQ_ENTRIES._ROB:$ROB_ENTRIES._IFU:$INT_FU._CFU:$COM_FU._FFU:$FP_FU._LSFU:$LS_FU $GEM5_DIR/configs/cs425_pa2/cs425_pa2.py -c $BENCHMARK -o "20 reference.dat 0 1 ./benchmark5/data/100_100_130_cf_a.of" -I $MAX_INSTS --cpu-type='O3CPU' --l1i_size='64kB' --l1i_assoc='4' --l1d_size='64kB' --l1d_assoc='4' --l2_size='256kB' --l2_assoc='8' --bp-type='TournamentBP' --btb_entries='1024' --LSQ_Entries=$LSQ_ENTRIES --numROB_Entries=$ROB_ENTRIES --num_int_FUs=$INT_FU --num_complex_FUs=$COM_FU --num_ls_FUs=$LS_FU --num_float_FUs=$FP_FU
echo "-------------------------------------------------------"
