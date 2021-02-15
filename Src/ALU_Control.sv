module ALU_Control(input logic [6:0] Func7 ,input logic [2:0] Func3, input logic [1:0] ALUOp,output logic [1:0] ALUCtl);
	always_comb
	begin
	case (ALUOp)
		2'b01 : ALUCtl = 3 ;
		2'b00 : ALUCtl = 2 ;
		2'b10 : case (Func3)
				3'b000 : case (Func7) 
						7'b000_0000 : ALUCtl = 2 ;
						7'b010_0000 : ALUCtl = 3 ;
						default : ALUCtl = 2 ;
					endcase
				3'b111 : ALUCtl = 0 ;
				3'b110 : ALUCtl = 1 ;
				default : ALUCtl = 2 ;
				endcase
		default : ALUCtl = 2 ;
	endcase 
	end
//		if(ALUOp==2'b01) begin
//			ALUCtl = 3 ;
//		end
//		else if(ALUOp==2'b10) begin 
//			if(Func3 == 3'b000)begin
//				if(Func7== 0 )// add
//					ALUCtl = 2 ;
//				else//sub
//					ALUCtl = 3 ;
//			end
//			else if(Func3 == 3'b110) //or
//				ALUCtl = 1 ;
//			else if(Func3 ==3'b111)//and
//				ALUCtl = 0 ;
//		end
//		else if(ALUOp==00)//fetch +decode + memadr
//			ALUCtl = 2 ;
//		end
endmodule 
