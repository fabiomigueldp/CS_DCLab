transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Usuario/Desktop/oipsjf/CS_DCLab/LAB_CD_TA/somador_4bits/FA.vhd}
vcom -93 -work work {C:/Users/Usuario/Desktop/oipsjf/CS_DCLab/LAB_CD_TA/somador_4bits/Somador.vhd}

