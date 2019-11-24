module pc(next, rst, outputData);

	input next, rst;
	output reg [9:0] outputData;
	
	initial begin
		outputData = 0;
	end

	always @ (posedge next or posedge rst) begin
		if(rst) outputData = 0;
		else outputData = outputData + 10'd1;
	end

endmodule	