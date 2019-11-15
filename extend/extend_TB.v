module extend_TB;


reg [15:0] dataIn;
wire  [31:0] dataOut;


extend	DUT(

.dataIn(dataIn),
.dataOut(dataOut)

);


	always

		
		
		begin
		dataIn <= 16'd5;
		#500
		dataIn <= 16'd32768;
		#500
		$stop;
		end
		
	endmodule	
		
