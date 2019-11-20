module control(
input clk,
input instruction_memory[31:0],
output [17:0] control_signal

);



reg [4:0] registerSource_A;
reg [4:0] registerSource_B;
reg [4:0] register_Destiny;

//signals table
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

always@(posedge clk)
begin
	
	if(instruction_memory[31:26] == 1'b0001)// this if checks if the instruction is of type R
	
		case(instruction_memory[5:0])
		
		31://Nop
			begin
			
			
			end
		32://Add
		begin
		
		end
		34://sub
		begin
		
		end
		36://and
		begin
		
		end
		37://or
		begin
		
		end
		50://mul
		begin
		
		end
		default://nop
		
		else //this else checks if the instruction is o type I
		if(instruction_memory[31:26] == 1'b0010)//load word immediate
		begin
		
		end
		else
		if(instruction_memory[31:26] == 1'b0011)//store word immediate
		begin
		
		end


end 

endmodule 