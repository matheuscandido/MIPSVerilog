
module multiplicador(

input clk, rst, St,
input [15:0] mndo, mdor,
output  [31:0] produto,
output done1

);

wire m,k,load,ad,Sh;
wire [16:0] soma;

controlMul control(

.clk(clk), 
.St(St), 
.rst(rst), 
.m(m),// sinal do acumulador
.k(k),//sinal do counter
.done(done1),
.Sh(Sh), 
.load(load), 
.ad(ad)

);

counter cont(

  .clk(clk), 
  .rst(rst), 
  .load(load), 
  .k(k),
  .done1(done1)
  
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
 .accOut(produto),
 .done(done1)
); 

adder addr(

	.dataa(mndo),
	.datab(produto[31:16]),
	.result(soma)
	
	);
	
	endmodule 