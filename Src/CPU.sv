module CPU(input logic clk,reset );
	logic [63:0] ReadData ,memadr ,writedata ;
	logic memWrite,MemRead;
	logic IorD ; 
	logic Override ;
	RISCV rsv(clk,reset,memWrite,MemRead,ReadData,memadr,writedata,IorD);
	RISCV_Memory RAM(clk,memWrite,MemRead,memadr,writedata,IorD,ReadData,Override);
endmodule 
