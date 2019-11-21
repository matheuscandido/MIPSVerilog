module control_TB;

reg clk;
reg [31:0]instruction_memory;
wire [20:0]control_signal;


control DUT(
.clk(clk),
.instruction_memory(instruction_memory),
.control_signal(control_signal)

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
		instruction_memory <= 32'b000001_00001_00010_01000_00000_110010;//mul
		
		#500
		instruction_memory <= 32'b000001_00011_00100_01001_00000_100000;//add 
		
		#500
		instruction_memory <= 32'b000001_01000_01001_01010_00000_100010; //sub
		#500
		instruction_memory <= 32'b000011_00110_01010_0000000000000000;//sw
		#500
		$stop;
		end
		
		endmodule 