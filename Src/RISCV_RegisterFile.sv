module RISCV_RegisterFile(input logic clk , input logic [4:0]AD1 ,AD2,AD3,input logic [63:0]Data,input Regwrite,
	output [63:0] A,B);
	logic [63:0] RF [31:0] ;
	initial 
	begin
		integer i ;
		for(i=0;i<32;i=i+1)begin
			RF[i] = 0 ;
		end
	end
	assign A = RF[AD1] ;
	assign B = RF[AD2] ;
	always@(negedge clk)
	begin
		if(Regwrite) RF[AD3] = Data ;
	end
	
endmodule 