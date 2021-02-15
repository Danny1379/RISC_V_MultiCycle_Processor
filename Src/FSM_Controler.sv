module FSM_Controler(input logic[6:0] Op ,input logic clk,reset,zero,output logic memWrite,RegWrite,MemRead ,ALUSrcA , IorD , 
IRWrite , PCWrite,PCWriteCond, RegDst,MemtoReg,
	output logic  [1:0] ALUSrcB ,ALUOp , PCSource    );
	parameter LD = 7'b000_0011, SD = 7'b010_0011, BEQ = 7'b110_0011, ALUop= 7'b001_0011;
	typedef enum logic [3:0] {Fetch,Decode,MemAdr,Memread,MemWB,MemWrite,Execute,R_Type,Branch,Jump} Statetype ;
	Statetype state , nextState ;
	logic [15:0] Control_word ;
	always_ff@(posedge clk)
	begin
		if(reset) state <= Fetch ;
		else state <= nextState ;
	end
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
	always_comb
		begin
			case (state) 
			Fetch : begin
				Control_word = 16'b1001_0100_0000_1000 ;
//				MemRead = 1 ;
//				ALUSrcA = 0 ;
//				IorD = 0 ;
//				IRWrite = 1 ;
//				ALUSrcB = 01 ;
//				ALUOp = 00 ;
//				PCSource = 00 ;
//				PCWrite = 1 ;
//				RegDst = 0 ;
//				MemtoReg = 0 ;
//				PCWriteCond = 0 ;
//				memWrite = 0 ;
//				RegWrite = 0 ;
				nextState = Decode ;
			end
			Decode : begin 
//				ALUSrcA = 0 ; 
//				ALUSrcB = 11 ;
//				ALUOp = 00 ;
				Control_word = 16'b0000_0000_0001_1000 ;
				if(Op==LD||Op==SD) nextState = MemAdr ;
				else if(Op==BEQ) nextState = Branch ; 
				else  nextState = Execute ;
				//jump unimplemented 
			end 
			MemAdr : begin //memory address computation ;
//				ALUSrcA = 1 ; 
//				ALUSrcB = 10 ;
//				ALUOp = 00 ;
				Control_word = 16'b0000_0000_0001_0100 ;
				if(Op==LD) nextState = Memread ;
				else  nextState = MemWrite ; 
			end
			Memread : begin //LD
//				MemRead = 1 ;
//				IorD = 1 ; 
				Control_word = 16'b0011_0000_0000_0000 ;
				nextState = MemWB ;
			end
			MemWB : begin //LD
//				RegDst = 0 ;
//				RegWrite = 1 ;
//				MemtoReg = 1 ;
				Control_word = 16'b0000_0010_0000_0010 ;
				nextState = Fetch ;
			end
			MemWrite : begin //SD
//				memWrite = 1;
//				IorD = 1 ;	
				Control_word = 16'b0010_1000_0000_0000 ;
				nextState = Fetch ;
			end
			Branch : begin //branch completion
//				ALUSrcA = 1 ;
//				ALUSrcB = 00 ;
//				ALUOp = 01 ;
//				PCWriteCond = 1 ;
//				PCSource = 01 ;
				Control_word = 16'b0100_0000_1010_0100 ;
				if(zero)
				Control_word[15] = 1 ;
				nextState = Fetch ;
			end
			Execute : begin //execute alu computation depending on given function 
//				ALUSrcA = 1 ;
//				ALUSrcB = 00 ;
//				ALUOp = 10 ;
				//check ALU 
				Control_word = 16'b0000_0000_0100_0100 ;
				nextState = R_Type ;
			end
			R_Type : begin 
//				RegDst = 1 ;
//				RegWrite = 1 ;
//				MemtoReg =	0 ;
				Control_word = 16'b0000_0000_0000_0011 ;
				nextState = Fetch ;
			end
			default : nextState = Fetch ;
			endcase 
		end
endmodule 