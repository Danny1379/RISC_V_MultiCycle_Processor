module RISC_V_TEST();
	logic clk , reset ;
	logic [63:0] PC ;
	initial
	begin 
	reset = 1 ;
	#22 ;
	reset = 0 ;
	end 
	always
	begin
		clk <= 0 ; #20 ; clk<=1 ;#20;
	end
	CPU risc(clk,reset);
endmodule 