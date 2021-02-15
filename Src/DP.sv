module DP();
	logic [15:0]Control_word;
	logic clk ;
	logic reset ;
	logic Override = 0 ;
	logic [6:0] Opcode ;
	logic [1:0] ALUSrcB ,ALUOp , PCSource ;
	logic zero ;
	logic memWrite,RegWrite,MemRead ,ALUSrcA , IorD , IRWrite , PCWrite,PCWriteCond, RegDst,MemtoReg ;
	logic [63:0] memadr , ALUOutm , memout,memin ;
	assign PCWrite = Control_word[15] ;
	assign PCWriteCond = Control_word[14] ;
	assign IorD = Control_word[13] ;
	assign MemRead = Control_word[12] ;
	assign memWrite = Control_word[11] ;
	assign IRWrite = Control_word[10] ;
	assign MemtoReg = Control_word[9] ;
	assign PCSource = Control_word[8:7] ;
	assign ALUOp = Control_word[6:5] ;
	assign ALUSrcB = Control_word[4:3] ;
	assign ALUSrcA = Control_word[2] ;
	assign RegWrite = Control_word[1] ;
	assign RegDst = Control_word[0] ;
	Data_Path dp(clk,memWrite,RegWrite,MemRead ,ALUSrcA , IorD ,IRWrite , PCWrite,PCWriteCond, RegDst,MemtoReg ,
	ALUSrcB ,ALUOp , PCSource,Override ,zero,memadr,ALUOutm,memin,memout);
	
	assign Control_word = 16'b1001_0100_0000_1000 ;
	assign memout = 32'b0000_0000_0101_0111_1000_1000_0011_0011;
endmodule 