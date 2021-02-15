module RF_Test();
	logic [5:0] AD1 ,AD2 ,AD3 ;
	logic [63:0] Data , A , B ;
	logic clk ;
	logic Regwrite ;
	RISCV_RegisterFile rf(clk,AD1,AD2,AD3,Data,Regwrite,A,B);
	always
		begin
			//generate clock
			clk <= 0 ; #10 ; clk <= 1 ; #10 ; 
		end
	always 
	begin
	Regwrite = 1 ;
	AD3 = 10 ; 
	Data = 1023 ;
	#20;
	AD3 = 11 ;
	Data = 1024 ;
	Regwrite = 1 ;
	#20 ;
	Regwrite = 0 ;
	AD1 = 10 ;
	AD2 = 11 ;
	#20 ;
	end
endmodule 