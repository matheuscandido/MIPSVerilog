module registerFile(

input clk,rst,
input write,	//write = 1(write in adress) ,write = 0(read from register address)
input [3:0] Adr_register_to_save,	//input register address from ctrl block
input [31:0] data_from_ctrl,	//input data to save in target register
input [4:0] Adr_register_to_A,Adr_register_to_B,	//address of registers selected by the control block
output reg [31:0] data_to_A,data_to_B	//data to send from register file to registers A and B

);

/*
TODO:
Adicionar defaults em condições não checadas
*/


reg [31:0] s0,s1,s2,s3,s4,s5,s6,s7;//registers $s0 to $s7
reg [31:0] t0,t1,t2,t3,t4,t5,t6,t7;//registers $t0 to $t7

always @(negedge clk)//register file works in descending edge in order to work in 5 clock pulses
                      //as it is in MIPS architecture 
	begin
	
	if(rst)//reset defaults registers values to 0
		
		begin	
			s0 <= 32'b0;
			s1 <= 32'b0;
			s2 <= 32'b0;
			s3 <= 32'b0;
			s4 <= 32'b0;
			s5 <= 32'b0;
			s6 <= 32'b0;
			s7 <= 32'b0;
			
			t0 <= 32'b0;
			t1 <= 32'b0;
			t2 <= 32'b0;
			t3 <= 32'b0;
			t4 <= 32'b0;
			t5 <= 32'b0;
			t6 <= 32'b0;
			t7 <= 32'b0;
		end
		
	else
	 if(write)//write data from write back stage to target register address
		 begin
			case(Adr_register_to_save)
				
					0 : s0 <= data_from_ctrl;
					1 : s1 <= data_from_ctrl;
					2 : s2 <= data_from_ctrl;
					3 : s3 <= data_from_ctrl;
					4 : s4 <= data_from_ctrl;
					5 : s5 <= data_from_ctrl;
					6 : s6 <= data_from_ctrl;
					7 : s7 <= data_from_ctrl;
					
					8  : t0 <= data_from_ctrl;
					9  : t1 <= data_from_ctrl;
					10 : t2 <= data_from_ctrl;
					11 : t3 <= data_from_ctrl;
					12 : t4 <= data_from_ctrl;
					13 : t5 <= data_from_ctrl;
					14 : t6 <= data_from_ctrl;
					15 : t7 <= data_from_ctrl;
					default: data_to_A <= s0;//reads $s0 if address is invalid
		  endcase
		 end
	end
	
	
	always@(*)
	begin
	//if(!write)//read data from registers s0 to s7 and t0 to t7 to send out to registers A and B
	// begin
	 
		 case(Adr_register_to_A)
				
					0 : data_to_A <= s0;
					1 : data_to_A <= s1;
					2 : data_to_A <= s2;
					3 : data_to_A <= s3;
					4 : data_to_A <= s4;
					5 : data_to_A <= s5;
					6 : data_to_A <= s6;
					7 : data_to_A <= s7;
					
					8  : data_to_A <= t0;
					9  : data_to_A <= t1;
					10 : data_to_A <= t2;
					11 : data_to_A <= t3;
					12 : data_to_A <= t4;
					13 : data_to_A <= t5;
					14 : data_to_A <= t6;
					15 : data_to_A <= t7;
					default:data_to_A <= 32'b0;
		 endcase  
		 
	  case(Adr_register_to_B)
			
				0 : data_to_B <= s0;
				1 : data_to_B <= s1;
				2 : data_to_B <= s2;
				3 : data_to_B <= s3;
				4 : data_to_B <= s4;
				5 : data_to_B <= s5;
				6 : data_to_B <= s6;
				7 : data_to_B <= s7;
				
				8  : data_to_B <= t0;
				9  : data_to_B <= t1;
				10 : data_to_B <= t2;
				11 : data_to_B <= t3;
				12 : data_to_B <= t4;
				13 : data_to_B <= t5;
				14 : data_to_B <= t6;
				15 : data_to_B <= t7;
				default:data_to_B <= 32'b0;
	  endcase
	// end
	end
	
endmodule
