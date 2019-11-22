module cpu(
	input  clk,rst,
	input [31:0] external_memory,
	output reg chip_select,wr,
	output reg [31:0] b_out,
	output reg [15:0]addr
);




//instruction fetch
wire [9:0] cont;
wire [31:0]instruction_to_control;
instructionmemory inst_mem (
.clk(clk),
.pc(cont),
.out(instruction_to_control)//signal to control block
);

pc counter(
.next(clk),
.rst(rst),
.outputData(cont)//signal to instruction memory


);


//instruction decode
wire [21:0] control_signal;
wire [31:0] out_imm,out_rA,out_rB;
control control_mips(

.instruction_memory(instruction_to_control),
.control_signal(control_signal)

);


registerFile register_file(

.clk(clk),
.rst(rst),
.write(out_WB_mux3[21]),//signal from write_back ctrl register
.Adr_register_to_save(out_WB_mux3[10:6]),//signal from write_back ctrl register
.data_from_ctrl(out_mux3_rf),//signal from write_back mux
.Adr_register_to_A(control_signal[20:16]),//signal from control block
.Adr_register_to_B(control_signal[15:11]),//signal from control block
.data_to_A(out_rA),//signal to register A
.data_to_B(out_rB)//signal to register B

);

extend ext(

.dataIn(instruction_to_control),
.dataOut(out_imm)//signal to imm register

);



//ID/EX registers

wire [31:0] out_imm_mux1,out_B_mux1,out_MUL_ALU;
wire[31:0] out_id_ctrl;
Register IMM(

.clk(clk),
.reset(rst),
.data_in(out_imm),//signal from extend block
.data_out(out_imm_mux1)

);

Register A(

.clk(clk),
.reset(rst),
.data_in(out_rA),//signal from register file
.data_out(out_MUL_ALU)//signal to execute stage

);

Register B(

.clk(clk),
.reset(rst),
.data_in(out_rB),//signal from register file
.data_out(out_B_mux1)//signal to execute stage 

);

Register ctrl_ID_EX(
.clk(clk),
.reset(rst),
.data_in(control_signal),
.data_out(out_id_ctrl)//signals to mux1,ALU, mux2 and ctrl_EX/MEM

);

//execute stage
wire [31:0]out_mux1_ALU,out_MUL_mux2;
wire [31:0]out_ALU_mux2,out_mux2_D;
mux mux1(
.A(out_B_mux1),//signal from register B
.B(out_imm_mux1),//signal from imm register
.sel(out_id_ctrl[5]),//control signal from ctrl_ID_EX
.X(out_mux1_ALU)

);

alu ALU(
.A(out_MUL_ALU),
.B(out_mux1_ALU),
.op(out_id_ctrl[1:0]),
.out(out_ALU_mux2)
);


multiplicador mul(

.clk(clk),
.rst(rst),
.mndo(out_MUL_ALU),
.mdor(out_B_mux1),
.produto(out_MUL_mux2)

);

mux mux2(
.A(out_ALU_mux2),
.B(out_MUL_mux2),
.sel(out_id_ctrl[4]),
.X(out_mux2_D)

);

//EX/MEM
wire[31:0]out_D_addr,out_B_mem,out_ex_ctrl;

Register D(

.clk(clk),
.reset(rst),
.data_in(out_mux2_D),
.data_out(out_D_addr)

);

Register B_EX_MEM(

.clk(clk),
.reset(rst),
.data_in(out_B_mux1),
.data_out(out_B_mem)

);

Register ctrl_EX_MEM(

.clk(clk),
.reset(rst),
.data_in(out_id_ctrl),
.data_out(out_ex_ctrl)//signals to memory and ctrl_MEM_WB

);
//memory stage

wire [31:0] out_addr_mem,out_mem_bus,out_mem_mux3,out_exmem_mux3;
wire out_bus;

addressdecoder(

.in(out_D_addr),//signal from register D
.out(out_addr_mem),
.cs(out_bus)
);



datamemory data_mem(
.clk(clk),
.addr(out_addr_mem),//decoder ou registro D?
.din(out_B_mem),
.rw(out_ex_ctrl[3]),
.S_datamemory(out_mem_bus)//signal to bus controller

);

busController bus(
.chipSelect(out_bus),
.internal_memory(out_mem_bus),
.external_memory(external_memory),
.data_out_internal(out_mem_mux3),

);

//MEM/WB
wire [31:0] out_D2_mux3,out_WB_mux3,out_mux3_rf;

Register D_2(
.clk(clk),
.reset(rst),
.data_in(out_D_addr),
.data_out(out_D2_mux3)

);

Register ctrl_MEM_WB(

.clk(clk),
.reset(rst),
.data_in(out_ex_ctrl),
.data_out(out_WB_mux3)

);

mux mux3(

.A(out_D2_mux3),
.B(out_WB_mux3),
.sel(out_WB_mux3[2]),
.X(out_mux3_rf)

);

//assign b_out <= out_B_mem;
//assign addr <= out_D_addr;
//assign wr <= out_ex_ctrl[3];

endmodule
