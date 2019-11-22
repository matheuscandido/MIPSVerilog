`timescale 1ns/100ps
module registerFile_TB;

reg clk,rst;
reg write;	//write = 1(write in adress) ,write = 0(read from register address)
reg [3:0] Adr_register_to_save;	//input register address from ctrl block
reg [31:0] data_from_ctrl;	//input data to save in target register
reg [3:0] Adr_register_to_A,Adr_register_to_B;	//address of registers selected by the control block
wire [31:0] data_to_A,data_to_B;	//data to send from register file to registers A and B



registerFile DUT(

.clk(clk),
.rst(rst),
.write(write),
.Adr_register_to_save(Adr_register_to_save),
.data_from_ctrl(data_from_ctrl),
.Adr_register_to_A(Adr_register_to_A),
.Adr_register_to_B(Adr_register_to_B),
.data_to_A(data_to_A),
.data_to_B(data_to_B)

);



always 


		begin
			clk <= 1;
			#25;
			clk <= 0;
			#25;
		end
		
		
		initial
		begin
		
		rst <= 1;
		#20;
		rst <= 0;
		#20;
		
		end
		
		
		
		initial
	
		begin
		   #50
			write <= 1'b1;//write mode
			#50
			Adr_register_to_save <= 4'd5;//selects $s5 register
			data_from_ctrl <= 32'd555;//saves in $s5 register
			#50
			Adr_register_to_save <= 4'd3;//saves in $s3 register
			data_from_ctrl <= 32'd333;//saves in $s3 register
			
			#50
			
			Adr_register_to_A <= 4'd5;//output expected of 555 in data_to_A
			#500
			Adr_register_to_B <= 4'd3;//output expected of 333 in data_to_b
			#50
			
		
			#2000 
			$stop;
		end	
		
	endmodule	
		
		
		
		
		