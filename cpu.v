module cpu(
	input  clk,rst,
	input clkMul,
	input [31:0] external_memory,
	//output reg chip_select,wr,
	output [31:0] out_B2Saida
	//output reg [9:0]addr,
	//output reg done1
);

wire [31:0] out_inst_ctrl;// output of instruction memory to control
wire [31:0] out_rf_A;
wire [31:0] out_rf_B;
wire [31:0] out_A;
wire [31:0] out_B;
wire [31:0] out_imm;
wire [31:0] out_mux1;
wire [31:0] out_mux2;
wire [31:0] out_mul;
wire [31:0] out_alu;
wire [31:0] out_D;
wire [31:0] out_D2;
wire [31:0] out_B2;
wire [31:0] out_bus;
wire [31:0] out_dtmem;
wire [31:0] out_mux3;
wire [31:0] out_ext;
wire [21:0] control_signal;
wire [9:0] cont;
wire [11:0] ctrl1;
wire [7:0] ctrl2;
wire [6:0] ctrl3;
wire out_cs;

//ALU
assign out_B2Saida = out_B2;
alu ALU(
	 
	 .A(out_A),
	 .B(out_mux1),
	 .op(ctrl1[9:8]),
	 .out(out_alu)
);

//multiplicador
multiplicador mult(

.clk(clkMul), 
.rst(rst), 
.St(1'b1),
.mndo(out_A), 
.mdor(out_B),
.produto(out_mul),
.done1()



);

//decoder
addressdecoder decoder(

	.in(out_D2), 
	.cs(out_cs)

);
//bus controler
busController bus(

.chipSelect(out_cs),
.internal_memory(out_dtmem),
.external_memory(external_memory),
.data_out_internal(out_bus)

);


//pc
pc counter(

	.next(clk), 
	.rst(rst),
	.outputData(cont)


);

//extend block
extend ext(

.dataIn(out_inst_ctrl),
.dataOut(out_ext)

);

//control block

control ctrl(

.instruction_memory(out_inst_ctrl),
.control_signal(control_signal)

);

//system memories
datamemory dtmem(
	
	.addr(out_D[9:0]),
	.din(out_B2),
	.rw(ctrl2[7]), 
	.clk(clk),
	.S_datamemory(out_dtmem)

);

instructionmemory instmem(

	.clk(clk), 
	.pc(cont), 
	.out(out_inst_ctrl)

);

//data registers 
Register A(

	.clk(clk),
	.reset(rst),
	.data_in(out_rf_A),
	.data_out(out_A)

);


Register B(

	.clk(clk),
	.reset(rst),
	.data_in(out_rf_B),
	.data_out(out_B)

);

Register B_2(

	.clk(clk),
	.reset(rst),
	.data_in(out_B),
	.data_out(out_B2)

);


Register D(

	.clk(clk),
	.reset(rst),
	.data_in(out_mux2),
	.data_out(out_D)

);


Register D_2(

	.clk(clk),
	.reset(rst),
	.data_in(out_D),
	.data_out(out_D2)

);

Register IMM(

	.clk(clk),
	.reset(rst),
	.data_in(out_ext),
	.data_out(out_imm)

);
//system multiplexers
mux mux1(

.A(out_imm),
.B(out_B),
.sel(ctrl1[11]),
.X(out_mux1)

);

mux mux2(

.A(out_alu),
.B(out_mul),
.sel(ctrl1[10]),
.X(out_mux2)

);

mux mux3(

.A(out_D2),
.B(out_bus),
.sel(ctrl3[6]),
.X(out_mux3)

);


//control registers
Register #(12) ctrla1(

	.clk(clk),
	.reset(rst),
	.data_in(control_signal[11:0]),
	.data_out(ctrl1)

);

Register #(8) ctrlb2(

	.clk(clk),
	.reset(rst),
	.data_in(ctrl1[7:0]),
	.data_out(ctrl2)

);

Register #(7) ctrlc3(

	.clk(clk),
	.reset(rst),
	.data_in(ctrl2[6:0]),
	.data_out(ctrl3)

);

//register file

registerFile rf(


 .clk(clk),
 .rst(rst),
 .write(ctrl3[0]),	
 .Adr_register_to_save(ctrl3[5:1]),	
 .data_from_ctrl(out_mux3),	
 .Adr_register_to_A(control_signal[21:17]),//control signal meaning register A
 .Adr_register_to_B(control_signal[16:12]),//control signal meaning register B	
 .data_to_A(out_rf_A),
 .data_to_B(out_rf_B)	


);
endmodule
