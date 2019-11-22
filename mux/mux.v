	module mux( A, B, sel, X);
 
input wire A, B; // As entradas sao A e B
input wire sel; // O sinal de selecao é S
output wire X; // O sinal de saida é X
wire S0_inv, a1, b1;
 
not u1( S0_inv, sel );
and u2( a1, S0_inv, A );
and u3( b1, sel, B );
or  u4( X, a1, b1 );
 
endmodule