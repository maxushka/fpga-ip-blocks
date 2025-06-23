onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L work -L unisims_ver -L unimacro_ver -L secureip -lib work work.debouncer_0 work.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {debouncer_0.udo}

run 1000ns

quit -force
