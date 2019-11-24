module control(
input [31:0]instruction_memory,
output reg [21:0]control_signal

);

//signals table of the instruction following MIPS ISA
//instruction_memory[5:0] is the code of the operation
//instruction_memory[10:6] is a default value of 10 decimal
//instruction_memory[15:11] is register_Destiny
//instruction_memory[20:16] is registerSource_B
//instruction_memory[25:21] is registerSource_A
//instruction_memory[31:26] is the instructions type
 


//instruction decode
//control_signal[21:17] is registerSource_A; 
//control_signal[16:12] is registerSource_B; 

//execute
//control_signal[11] is mux (B/IMM) registers 0 for extend, 1 for B (mux 1) 
//control_signal[10] is mux (ALU/MUL) 0 for ALU, 1 for MUL (mux 2) 
//control_signal[9:8] is for ALU, selects operation in ALU 
//00 for add
//01 for sub
//10 for and
//11 for or


//memory
//control_signal[7] is data memory, 0 for read, 1 for write 

//write back
//control_signal[6] is write back mux(D/M) 0 for D, 1 for M 
//control_signal[5:1] is register_Destiny; 
//control_signal[0] is for write in register file, 1 for write (mux 3)

reg write_rf;
reg [4:0] registerSource_A;//address of source register in A
reg [4:0] registerSource_B;//address of source register in B
reg [4:0] register_Destiny;//address of destiny register
reg mux_B_IMM;//mux for B and IMM registers
reg mux_ALU_MUL;//mux for ALU and MUL
reg memory_rd_wr;//read/write for data memory
reg mux_write_back;//write back mux
reg [1:0] alu_op;//operation selected in ALU

always@(instruction_memory)
begin
	
	if(instruction_memory[31:26] == 6'b000001)// this if checks if the instruction is of type R
	begin
		case(instruction_memory[5:0])
		
		31://Nop operation, defaults all values to zero
			begin
			write_rf = 1'b0;
			registerSource_A = 5'b00000;
			registerSource_B = 5'b00000;
			register_Destiny = 5'b00000;
			mux_B_IMM = 1'b0;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf};  
			
			end
		32://Add
			begin
			write_rf = 1'b1;
			registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf};  
		
			end
		34://sub
			begin
			write_rf = 1'b1;
		   registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b01;
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf};  
			
			end
		36://and
			begin
			write_rf = 1'b1;
		   registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b10;
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf}; 
			
			end
		37://or
			begin
			write_rf = 1'b1;
			registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b11;
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf}; 
			
			end
		50://mul
			begin
			write_rf = 1'b1;
			registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = instruction_memory[15:11];
			mux_B_IMM = 1'b1;
			mux_ALU_MUL = 1'b1;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;//as alu is not used values defaults to 0
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf};  
			
			end
		default://nop
			begin
			write_rf = 1'b0;
			registerSource_A = 5'b00000;
			registerSource_B = 5'b00000;
			register_Destiny = 5'b00000;
			mux_B_IMM = 1'b0;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf};   
			end
		
		endcase
	
	end 
		
		else //this else checks if the instruction is o type I
		if(instruction_memory[31:26] == 6'b000010)//load word immediate
		begin
			write_rf = 1'b1;
			registerSource_A = instruction_memory[25:21];
			registerSource_B = 0;
			register_Destiny = instruction_memory[20:16];
			mux_B_IMM = 1'b0;//selects immediate register
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b1;//selects data from memory and saves in register
			alu_op = 2'b00;//as alu is not used values defaults to 0
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf}; 
		
		end
		else
		if(instruction_memory[31:26] == 6'b000011)//store word immediate
		begin
			write_rf = 1'b0;
			registerSource_A = instruction_memory[25:21];
			registerSource_B = instruction_memory[20:16];
			register_Destiny = 0;
			mux_B_IMM = 1'b0;//selects immediate register
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b1;//write to memory
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf};  
		
		end
		else
		begin
		//defaults to NOP
		
			write_rf = 1'b0;
			registerSource_A = 5'b00000;
			registerSource_B = 5'b00000;
			register_Destiny = 5'b00000;
			mux_B_IMM = 1'b0;
			mux_ALU_MUL = 1'b0;
			memory_rd_wr = 1'b0;
			mux_write_back = 1'b0;
			alu_op = 2'b00;
			control_signal = {registerSource_A,registerSource_B,mux_B_IMM,mux_ALU_MUL,alu_op,memory_rd_wr,mux_write_back,register_Destiny,write_rf};   
		end

end 

endmodule 