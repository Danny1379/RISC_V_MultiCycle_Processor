module ALU_Test();
	logic [1:0] ALUCtl ;
	logic [63:0] A, B , ALUOut ;
	logic zero ;
	RISCV_ALU alu(ALUCtl,A,B,ALUOut,zero);
	
		always
		begin
		A = 1000 ;
		B = 1000 ;
		ALUCtl = 2'b01 ;
		#10 ;
		A = 4 ;
		B = 2 ;
		ALUCtl = 2'b00 ;
		#10 ;
		A = 100 ;
		B = 50 ;
		ALUCtl = 2'b11 ;
		#10 ;
		A =200 ;
		B = 100 ;
		ALUCtl = 2'b10 ;
		#10 ;
		end
	
endmodule 