module control(
input clk,
input [31:0]instruction_memory,
output reg [20:0]control_signal

);

//signals table of the instruction following MIPS ISA
//instruction_memory[5:0] is the code of the operation
//instruction_memory[10:6] is a default value of 10 decimal
//instruction_memory[15:11] is register_Destiny
//instruction_memory[20:16] is registerSource_B
//instruction_memory[25:21] is registerSource_A
//instruction_memory[31:26] is the instructions type
 

//signals table for the control signal
//control_signal[17:14] is registerSource_A;
//control_signal[13:10] is registerSource_B;
//control_signal[9:6] is register_Destiny;
//control_signal[5] is mux (B/IMM) registers 0 for extend, 1 for B
//control_signal[4] is mux (ALU/MUL) 0 for ALU, 1 for MUL
//control_signal[3] is data memory, 0 for read, 1 for write
//control_signal[2] is write back mux(D/M) 0 for D, 1 for M
//control_signal[1:0] is for ALU, selects operation in ALU
//00 for add
//01 for sub
//10 for and
//11 for or


reg [4:0] registerSource_A;//address of source register in A
reg [4:0] registerSource_B;//address of source register in B
reg [4:0] register_Destiny;//address of destiny register
reg mux_B_IMM;//mux for B and IMM registers
reg mux_ALU_MUL;//mux for ALU and MUL
reg memory_rd_wr;//read/write for data memory
reg mux_write_back;//write back mux
reg [1:0] alu_op;//operation selected in ALU

always@(posedge clk)
begin
	
	if(instruction_memory[31:26] == 6'b000001)// this if checks if the instruction is of type R
	begin
		case(instruction_memory[5:0])
		
		31://Nop operation, defaults all values to zero
			begin
		
			registerSource_A = 5'b00000;
			registerSource_B = 5'b00000;
			register_Destiny = 5'b00000;
			mux_B_IMM = 1'b0;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op};  
			
			end
		32://Add
			begin
		
			registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op};  
		
			end
		34://sub
			begin
			
		   registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b01;
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op}; 
			
			end
		36://and
			begin
			
		   registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b10;
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op};
			
			end
		37://or
			begin
			
			registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b11;
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op};
			
			end
		50://mul
			begin
			
			registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b1;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;//as alu is not used values defaults to 0
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op}; 
			
			end
		default://nop
			begin
			registerSource_A = 5'b00000;
			registerSource_B = 5'b00000;
			register_Destiny = 5'b00000;
			mux_B_IMM = 1'b0;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op};  
			end
		
		endcase
	
	end 
		
		else //this else checks if the instruction is o type I
		if(instruction_memory[31:26] == 6'b000010)//load word immediate
		begin
		
			registerSource_A = instruction_memory[25:21];
			registerSource_B = 0;
			register_Destiny = instruction_memory[20:16];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b1;//selects data from memory and saves in register
			alu_op = 2'b00;//as alu is not used values defaults to 0
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op}; 
		
		end
		else
		if(instruction_memory[31:26] == 6'b000011)//store word immediate
		begin
		
			registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = 0;
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b1;//write to memory
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,register_Destiny,mux_B_IMM,mux_ALU_MUL,memory_rd_wr,mux_write_back,alu_op}; 
		
		end


end 

endmodule 