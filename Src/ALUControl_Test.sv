module ALUControl_Test();
	logic [6:0]Func7 ;
	logic [2:0]Func3 ;
	logic [1:0]ALUOp , ALUCtl ;
	ALU_Control ac(Func7,Func3,ALUOp,ALUCtl);
	always  
	begin
		#20
		ALUOp = 2'b10 ;
		Func7 = 0 ;
		Func3 = 0 ;
		#20 ; 
		Func7 = 32 ;
		Func3= 0 ;
		#20 ;
		Func7 = 0 ;
		Func3 = 3'b110 ;
		#20 ;
		Func7 = 0 ;
		Func3 = 3'b110 ;
		ALUOp = 2'b01 ;
	end
endmodule 