module mux_TB;
 
reg [31:0]A_tb, B_tb; 
reg sel_tb;
wire [31:0]X_tb;
 
mux dut( A_tb, B_tb, sel_tb, X_tb);
 
initial
begin
A_tb <= 32'hffff; B_tb <= 32'h0000; sel_tb <= 1'b0; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb <= 32'hffff; B_tb <= 32'h0000; sel_tb <= 1'b0; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb <= 32'hffff; B_tb <= 32'h0000; sel_tb <= 1'b0; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb <= 32'hffff; B_tb <= 32'h0000; sel_tb <= 1'b0; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb <= 32'hffff; B_tb <= 32'h0000; sel_tb <= 1'b1; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb <= 32'hffff; B_tb <= 32'h0000; sel_tb <= 1'b1; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb <= 32'hffff; B_tb <= 32'h0000; sel_tb <= 1'b1; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
A_tb <= 32'hffff; B_tb <= 32'h0000; sel_tb <= 1'b1; #1
$display("A = %x, B = %x, sel = %x, X = %x", A_tb, B_tb, sel_tb, X_tb);
end
endmodule