module addressdecoder(
	in, out, cs
);

input [31:0] in;
output reg [31:0] out;
output cs; // 1 para memória interna, 0 para memória externa

// 1000h a 13ffh é memória interna
// refazer expressão
assign cs = (!in[11] && !in[10] && !in[3] && ( !in[7] || !in[6] || !in[5] || !in[4] ));

// remover
always @ (in) begin
	if(cs) begin
		out = in - 'h1000;
	end else begin
		out = in;
	end
end

endmodule