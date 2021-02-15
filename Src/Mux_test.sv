module Mux_test();
	logic [1:0]S ;
	logic [63:0] D3,D2, D1, D0 , out ;
	Mux2to4 mux2(S,D0,D1,D2,D3,out);
	always 
		begin
			D0 = 13 ;
			D1 = 14 ;
			D2 = 15 ;
			D3 = 16 ;
			S = 2'b00 ;
			#20 ;
			S = 2'b01 ;
			#20 ;
			S = 2'b10 ;
			#20 ;
			S = 2'b11 ;
			#20;
		end
//	MUX1to2 mux1(S,D1,D0,out) ;
//	always
//		begin 
//			D1 = 13 ;
//			D0 = 17 ;
//			S = 1 ;
//			#20 ; 
//			S = 0 ;
//			#20 ;
//		end
endmodule 