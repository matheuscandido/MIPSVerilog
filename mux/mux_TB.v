module mux_TB;
 
reg A_tb, B_tb, sel_tb;
wire X_tb;
 
mux dut( A_tb, B_tb, sel_tb, X_tb);
 
initial
begin
A_tb = 1'b0; B_tb = 1'b0; sel_tb = 1'b0; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb = 1'b0; B_tb = 1'b1; sel_tb = 1'b0; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb = 1'b1; B_tb = 1'b0; sel_tb = 1'b0; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb = 1'b1; B_tb = 1'b1; sel_tb = 1'b0; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb = 1'b0; B_tb = 1'b0; sel_tb = 1'b1; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb = 1'b0; B_tb = 1'b1; sel_tb = 1'b1; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb = 1'b1; B_tb = 1'b0; sel_tb = 1'b1; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb = 1'b1; B_tb = 1'b1; sel_tb = 1'b1; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
end
endmodule