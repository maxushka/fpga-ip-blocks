vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/work
vlib modelsim_lib/msim/xil_defaultlib

vmap work modelsim_lib/msim/work
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work work  -incr -mfcu  -sv \
"../../../../ipblocks.gen/sources_1/ip/debouncer_0/debouncer.sv" \
"../../../../ipblocks.gen/sources_1/ip/debouncer_0/sim/debouncer_0.sv" \


vlog -work work \
"glbl.v"

