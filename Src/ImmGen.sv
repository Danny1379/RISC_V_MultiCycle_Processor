module ImmGen(input logic [31:0] IR,output logic [63:0]IGout);
	parameter LD = 7'b000_0011,SD = 7'b010_0011 ;
	logic [6:0] opcode ;
	assign opcode = IR[6:0] ; 
	assign IGout = (opcode == LD) ? {{53{IR[31]}} , IR[30:20]} : {{53{IR[31]}} , IR[30:25] , IR[11:7]} ;
endmodule 