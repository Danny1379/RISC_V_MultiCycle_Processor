module RISCV_ALU(input logic [1:0]ALUCtl,input logic [63:0]A,B,output logic [63:0] ALUOut,output logic Zero);
	assign Zero = (ALUOut==0) ;
	always_comb
		case (ALUCtl)
		0: ALUOut = A & B ;
		1: ALUOut = A | B ;
		2: ALUOut = A + B ;
		3: ALUOut = A - B ;
		endcase 
endmodule 
