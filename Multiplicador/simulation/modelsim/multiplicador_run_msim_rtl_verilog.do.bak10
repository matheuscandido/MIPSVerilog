transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador {C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador/counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador {C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador/controlMul.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador {C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador {C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador/acc.v}
vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador {C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador/multiplicador.v}

vlog -vlog01compat -work work +incdir+C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador {C:/Users/user/Documents/GitHub/MIPSVerilog/Multiplicador/multiplicador_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  multiplicador_TB

add wave *
view structure
view signals
run -all
