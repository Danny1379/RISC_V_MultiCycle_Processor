module RISCV_Memory(input logic clk ,input logic memwrite , input logic memread , 
input logic [63:0] adr ,Data_in,
input logic IorD ,
output logic[63:0]  Data_out ,
input logic Override //for loading instructions into memory 
);
	logic [63:0] Memory [1023:0] ;
	initial 
		begin			
			 Memory[10'b1000000000] <= 64'b0000_0000_0000_00001_011_00001_0000011;
			 Memory[10'b1000000001] <= 64'b0100000_00001_00001_000_00001_0110011;
			 Memory[10'b1000000010] <= 64'b0000001_01010_10100_011_00000_0100011;
			 Memory[10'b0000000001] <= 64'b01;
			 Memory[10'b0000000010] <= 64'b10 ;
			 Memory[10'b0000000011] <= 64'b11 ;
			 Memory[10'b0000000100] <= 64'b100 ;
			 Memory[10'b0000000101] <= 64'b1010 ;
		end
	always@(posedge clk)
		begin
			if(memwrite)
			begin
				if(Override)
				Memory[{1'b1,adr[10:2]}] = Data_in ;
				else
				Memory[{1'b0,adr[10:2]}] = Data_in ;
			end
			else if(memread)
			begin
				if(IorD)begin//read from bottom half of memory msb = 0 ; DATA
					Data_out = Memory[{1'b0,adr[10:2]}] ;
				end
				else begin//read from top half of memory msb = 1; PC
					Data_out = Memory[{1'b1 , adr[10:2]}];
				end
			end
		end
endmodule 