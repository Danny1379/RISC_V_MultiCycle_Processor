module FSM_Test();
	logic clk ;
	logic reset ;
	logic [6:0] Opcode ;
	logic [1:0] ALUSrcB ,ALUOp , PCSource ;
	logic [15:0] Control_Word ;
	logic zero ;
	logic memWrite,RegWrite,MemRead ,ALUSrcA , IorD , IRWrite , PCWrite,PCWriteCond, RegDst,MemtoReg ;
	FSM_Controler fsm(Opcode,clk,reset,zero,memWrite,RegWrite,MemRead ,ALUSrcA , IorD , IRWrite , PCWrite,PCWriteCond, 
		RegDst,MemtoReg,ALUSrcB ,ALUOp , PCSource);
		
	initial 
		begin
			Opcode = 7'b000_0011 ;
			zero = 0 ;
			reset <= 1  ; 
			clk <= 0 ;#20 ; reset <= 0 ;
		end
		always
		begin
			//generate clock
			clk <= 0 ; #10 ; clk <= 1 ; #10 ; 
		end
		always
		begin
			#110  ;
			Opcode = 7'b010_0011 ;
			#80 ; 
			Opcode = 7'b001_0011 ;
			#80 ; 
			Opcode = 7'b110_0011 ;
			#60 ;
			Opcode = 7'b001_0011 ; 
		end
	endmodule 
	