vlib  work                             

vlog  VectCORDIC.sv \
	  CustomVect.sv rot_cordic.sv \
	  RinvrMatrix.sv MulMatrix.sv q_matrix.sv \
	  matrix_inv.sv \
	  top_tb.sv \
	  +cover -covercells              



vsim -voptargs=+acc work.matrix_inv_tb -cover 


add wave -position insertpoint  \
sim:/matrix_inv_tb/DUT/addr_i_q \
sim:/matrix_inv_tb/DUT/angle_i_rcord \
sim:/matrix_inv_tb/DUT/angle_i_rcord_3 \
sim:/matrix_inv_tb/DUT/angle_o_vcord \
sim:/matrix_inv_tb/DUT/clk \
sim:/matrix_inv_tb/DUT/cos_i_q \
sim:/matrix_inv_tb/DUT/cos_o_rcord \
sim:/matrix_inv_tb/DUT/count \
sim:/matrix_inv_tb/DUT/data_out \
sim:/matrix_inv_tb/DUT/done \
sim:/matrix_inv_tb/DUT/done_o_inv \
sim:/matrix_inv_tb/DUT/done_o_mult \
sim:/matrix_inv_tb/DUT/done_o_q \
sim:/matrix_inv_tb/DUT/done_o_rcord \
sim:/matrix_inv_tb/DUT/done_o_rcord1 \
sim:/matrix_inv_tb/DUT/done_o_rcord2 \
sim:/matrix_inv_tb/DUT/done_o_rcord3 \
sim:/matrix_inv_tb/DUT/done_o_vcord \
sim:/matrix_inv_tb/DUT/finish \
sim:/matrix_inv_tb/DUT/finish_o_inv \
sim:/matrix_inv_tb/DUT/finish_o_mult \
sim:/matrix_inv_tb/DUT/finish_o_q \
sim:/matrix_inv_tb/DUT/FRAC \
sim:/matrix_inv_tb/DUT/i \
sim:/matrix_inv_tb/DUT/INT \
sim:/matrix_inv_tb/DUT/j \
sim:/matrix_inv_tb/DUT/load_i_q \
sim:/matrix_inv_tb/DUT/loaded_o_mult \
sim:/matrix_inv_tb/DUT/mag_o_vcord \
sim:/matrix_inv_tb/DUT/mat \
sim:/matrix_inv_tb/DUT/Q \
sim:/matrix_inv_tb/DUT/R \
sim:/matrix_inv_tb/DUT/read \
sim:/matrix_inv_tb/DUT/read_i_inv \
sim:/matrix_inv_tb/DUT/read_i_mult \
sim:/matrix_inv_tb/DUT/read_i_q \
sim:/matrix_inv_tb/DUT/rst_n \
sim:/matrix_inv_tb/DUT/s1 \
sim:/matrix_inv_tb/DUT/s2 \
sim:/matrix_inv_tb/DUT/s3 \
sim:/matrix_inv_tb/DUT/s4 \
sim:/matrix_inv_tb/DUT/s5 \
sim:/matrix_inv_tb/DUT/s6 \
sim:/matrix_inv_tb/DUT/sin_i_q \
sim:/matrix_inv_tb/DUT/sin_o_rcord \
sim:/matrix_inv_tb/DUT/SIZE \
sim:/matrix_inv_tb/DUT/start \
sim:/matrix_inv_tb/DUT/start_i_inv \
sim:/matrix_inv_tb/DUT/start_i_mult \
sim:/matrix_inv_tb/DUT/start_i_q \
sim:/matrix_inv_tb/DUT/start_i_rcord \
sim:/matrix_inv_tb/DUT/start_i_vcord \
sim:/matrix_inv_tb/DUT/state \
sim:/matrix_inv_tb/DUT/STG \
sim:/matrix_inv_tb/DUT/write_i_mult \
sim:/matrix_inv_tb/DUT/X_i_rcord1 \
sim:/matrix_inv_tb/DUT/X_i_rcord2 \
sim:/matrix_inv_tb/DUT/X_i_rcord3 \
sim:/matrix_inv_tb/DUT/X_i_vcord \
sim:/matrix_inv_tb/DUT/X_o_rcord1 \
sim:/matrix_inv_tb/DUT/X_o_rcord2 \
sim:/matrix_inv_tb/DUT/Y_i_rcord1 \
sim:/matrix_inv_tb/DUT/Y_i_rcord2 \
sim:/matrix_inv_tb/DUT/Y_i_rcord3 \
sim:/matrix_inv_tb/DUT/Y_i_vcord \
sim:/matrix_inv_tb/DUT/Y_o_rcord1 \
sim:/matrix_inv_tb/DUT/Y_o_rcord2


coverage save matrix_inv.ucdb -onexit                                              

run -all

quit -sim 

vcover report matrix_inv.ucdb -details -annotate -all > code_coverage.txt         