	module mux( A, B, sel, X);
 
input  [31:0] A, B; // As entradas sao A e B
input  sel; // O sinal de selecao é S
output reg[31:0] X; // O sinal de saida é X
//wire [31:0]S0_inv, a1, b1;
 
//not u1( S0_inv, sel );
//and u2( a1, S0_inv, A );
//and u3( b1, sel, B );
//or  u4( X, a1, b1 );
 
 always@(A or B or sel)
 begin
	case(sel)
	1'b0 : X <= A;
	1'b1 : X<= B;
	
	endcase
 end
 
 
endmodule
