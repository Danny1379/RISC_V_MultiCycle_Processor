module MUX1to2(input logic S , input logic[63:0] D1,D0,output logic[63:0] out);
	assign out = S ? D1 : D0 ;
endmodule 