module Mux2to4(input logic [1:0] S ,input logic [63:0] D0 , D1 ,D2 ,D3,output logic [63:0] out);
	always_comb
		begin
			case(S) 
			2'b00 : out = D0 ;
			2'b01 : out = 64'b100 ;
			2'b10 : out = D2 ;
			2'b11 : out = D3 ;
			endcase 
		end
endmodule 