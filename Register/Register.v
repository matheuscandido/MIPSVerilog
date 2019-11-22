module Register #(parameter DATA_WIDTH=32)(
	clk,
	reset,
	data_in,
	data_out
);

input clk;
input reset;
input [DATA_WIDTH-1:0] data_in;
output reg [DATA_WIDTH-1:0] data_out ;


always @(posedge clk or posedge reset) begin
	if (reset) data_out <= 32'b0;
	else if (clk) begin
		data_out <= data_in;
	end
end
endmodule