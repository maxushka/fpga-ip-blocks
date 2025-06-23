transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vmap -link {C:/Users/hpuser/Repos/FPGA/ipblocks/ipblocks.cache/compile_simlib/riviera}
vlib riviera/work
vlib riviera/xil_defaultlib

vlog -work work  -incr -l work \
"../../../../ipblocks.gen/sources_1/ip/debouncer_0/debouncer.sv" \
"../../../../ipblocks.gen/sources_1/ip/debouncer_0/sim/debouncer_0.sv" \


vlog -work work \
"glbl.v"

