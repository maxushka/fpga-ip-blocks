transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+debouncer_0  -L work -L unisims_ver -L unimacro_ver -L secureip -O5 work.debouncer_0 work.glbl

do {debouncer_0.udo}

run 1000ns

endsim

quit -force
