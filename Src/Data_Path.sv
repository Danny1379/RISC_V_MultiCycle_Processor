module Data_Path(input logic clk ,
input logic RegWrite,ALUSrcA , IorD , 
IRWrite , PCWrite,PCWriteCond, RegDst,MemtoReg ,MemR,
input logic [1:0] ALUSrcB ,ALUOp , PCSource,
output zero  ,
output [63:0]memadr ,memwrite,
input [63:0] memread ,
output [6:0] IRD  ,
output [63:0] PCout
);
	
	logic [63:0]  PC , ALUOut ,IR , MDR ,A,B,PCOffset   ; //non architectural Registers+PC ;
	logic [63:0]  PCValue ,RegIn,IGout ,ALUResultout ;//wires
	logic [1:0] ALUCtl ;
	logic [63:0] ALUBin,ALUAin ;
	assign IRD = IR[6:0] ;
	initial 
		PC = 0;
	
	MUX1to2 muxPC(PCSource[0],ALUOut,ALUResultout,PCValue);//Programe counter Multiplexer
	assign PCOffset = {{52{IR[31]}}, IR[7], IR[30:25], IR[11:8], 1'b0};
	always_ff@(posedge clk)
		begin
			if(IRWrite)
			IR <= memread ;
		end
		MUX1to2 muxRF(MemtoReg,MDR,ALUOut,RegIn);
	always_ff@(posedge clk)
		begin
			if(MemR & IorD)
				MDR = memread ;
		end
	always@(posedge clk)
	begin 
		if(PCWrite)
			PC = PCValue ;
	end
//	RISCV_Memory mem(clk,memWrite,MemRead,memadr>>2,memIn,memOut,Override);//memory instance
	assign memwrite = B ;
	MUX1to2 muxMem(IorD,ALUOut,PC,memadr);
	//RF inputs 
	
	
	RISCV_RegisterFile RF(clk,IR[19:15],IR[24:20],IR[11:7],RegIn,RegWrite,A,B);//register file instance;
	
	
	ALU_Control AC(IR[31:25],IR[14:12],ALUOp,ALUCtl);//ALUControler
	
	MUX1to2 muxA(ALUSrcA,A,PC,ALUAin);//ALUinput MUX 
	
	Mux2to4 muxB(ALUSrcB,B,B,IGout,PCOffset,ALUBin);//ALUinput MUX 
	
	RISCV_ALU Alu(ALUCtl,ALUAin,ALUBin,ALUResultout,zero) ;//ALU 
	
	//ALUout 
	always_ff@(posedge clk)
	begin
		if(~(ALUOp==2'b10))begin
			ALUOut = ALUResultout ;
		end
	end
	
	ImmGen IG(IR[31:0],IGout);//immgenerator 
endmodule

	