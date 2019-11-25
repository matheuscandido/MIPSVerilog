module addressdecoder(
	in, cs
);

input [31:0] in;
output cs; // 1 para memória interna, 0 para memória externa

// 1000h a 13ffh é memória interna
assign cs = !in[15] && !in[14] && !in[13] && in[12] && !in[11] && !in[10];

endmodule
//assign cs = (!in[15] && !in[14] && !in[13] && !in[12] && !in[11] && !in[10]);