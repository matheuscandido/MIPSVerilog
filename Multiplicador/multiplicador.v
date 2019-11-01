
module multiplicador(

input clk, rst, St,
input [3:0] mndo, mdor,
output reg [7:0] produto,
output reg done

);

wire m,k,load,ad,Sh;
wire [3:0] soma;
wire 

controlMul control(

.clk(clk), 
.St(St), 
.rst(rst), 
.m(m),// sinal do acumulador
.k(k),//sinal do counter
.done(done),
.Sh(Sh), 
.load(load), 
.ad(ad)

);

counter cont(

  .clk(clk), 
  .rst(rst), 
  .load(load), 
  .dload(mndo),
  .k(k)
  
  );
  
  
acc	acumulador(

 .clk(clk),
 .Sh(Sh),
 .load(load),
 .ad(ad),
 .rst(rst),
 .adderInput(soma),//sinal do adder
 .multiplicador(mdor),
 .m_out(m),
 .accOut(produto)
); 

adder addr(

	.dataa(mndo),
	.datab(produto[7:4]),
	.result(soma)
	
	);
	
	endmodule 