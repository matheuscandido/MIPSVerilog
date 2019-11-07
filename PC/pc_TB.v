`timescale 1ns/10ps

module pc_TB ();
	reg next;
	reg rst;
	wire [9:0] outputData;
	
pc DUT (
	.next(next),
	.rst(rst),
	.outputData(outputData)
);


initial begin
	next <=0;
	rst <=0;

	#400 rst <= 1;
end

always
	#50 next <= ~next;
	

initial	#3000 $stop;	

endmodule
	