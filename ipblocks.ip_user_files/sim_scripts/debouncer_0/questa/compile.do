vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/work
vlib questa_lib/msim/xil_defaultlib

vmap work questa_lib/msim/work
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work work  -incr -mfcu  -sv \
"../../../../ipblocks.gen/sources_1/ip/debouncer_0/debouncer.sv" \
"../../../../ipblocks.gen/sources_1/ip/debouncer_0/sim/debouncer_0.sv" \


vlog -work work \
"glbl.v"

