vlog RCS.v +acc
vsim RCS_FH_tb
add wave *
run -all
vsim -debugDB RCS_FH_tb

