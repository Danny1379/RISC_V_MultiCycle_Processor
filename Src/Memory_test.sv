module Memory_test();
	logic clk ,memwrite ,  memread; 
	logic [63:0] adr ,Data_in;
	logic IorD ;
	logic[63:0]  Data_out; 
	logic Override ;
	RISCV_Memory mem(clk,memwrite,memread,adr,Data_in,IorD,Data_out,Override);
	always
	begin
	clk<=0 ; #20 ;clk<=1;#20 ;
	end
	always 
	begin
		memwrite = 1 ;
		memread = 0 ;
		adr = 20 ;
		IorD = 1 ;
		Data_in = 100 ;
		Override = 0 ;
		#20 ;
		memwrite = 0 ;
		memread = 1 ;
		adr = 20 ;
		IorD = 1 ;
		#20 ;
		Data_in[31:0] =32'b0000_0000_0101_0111_1000_1000_0011_0011 ;
		Data_in[63:32] = 0 ;
		memwrite = 1 ;
		memread = 0 ;
		Override = 1 ;
		adr = 0 ;
		#20 ;
		memwrite = 0 ;
		memread = 1 ;
		Override = 0 ;
		IorD = 0;
		adr = 0 ;
		#20 ;
	end
endmodule 