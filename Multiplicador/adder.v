// Quartus Prime Verilog Template
// Unsigned Adder

module adder
#(parameter WIDTH=16)
(
	input [WIDTH-1:0] dataa,
	input [WIDTH-1:0] datab,
	output [WIDTH:0] result
);

	assign result = dataa + datab;
	
endmodule
