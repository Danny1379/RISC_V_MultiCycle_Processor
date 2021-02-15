module RISCV(input clk,reset,
	output memWrite,MemRead,
	input [63:0] ReadData ,
	output [63:0] memadr, writedata ,
	output IorD 
	);
	logic[6:0] Op;
	logic zero;	
	logic RegWrite,ALUSrcA ,IRWrite , PCWrite,PCWriteCond, RegDst,MemtoReg ;
	logic  [1:0] ALUSrcB ,ALUOp , PCSource;
	logic [6:0] IRD ;
	Data_Path dp(clk,RegWrite,ALUSrcA,IorD,IRWrite,PCWrite,PCWriteCond,RegDst,MemtoReg,MemRead,ALUSrcB,ALUOp,
	PCSource,zero,memadr,writedata,ReadData,IRD,PC) ;
	
	
	FSM_Controler fsm(IRD[6:0],clk,reset,zero,memWrite,RegWrite,MemRead,ALUSrcA,
	IorD,IRWrite,PCWrite,PCWriteCond,RegDst,MemtoReg,ALUSrcB,ALUOp,PCSource);
	
endmodule 
