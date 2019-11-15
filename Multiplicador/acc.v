// Quartus Prime Verilog Template
// One-bit wide, N-bit long shift register

module acc
#(parameter N=33)
(
	input clk,Sh,load,ad,rst,
	input [16:0] adderInput,
	input [15:0] multiplicador,
	output reg m_out,
	output reg [N-1:0] accOut
);

	

	always @ (posedge clk or posedge rst)
	begin
	if(rst)
	accOut <= 33'b0;
		else
			begin
			
			m_out <= accOut[0];
			
			if(load)
			begin
			accOut[15:0] <= multiplicador;
			end
			
			if(ad)
			begin
			accOut[N-1:16] <= adderInput;
			end
			
			if(Sh)
			begin
			accOut <= accOut >> 1;
			end
			
		end
	
	end


endmodule
