`timescale 1ns / 1ps
module seq_det_110_mealy(
    input clk,
    input rstn,
    input in,
    output out
    );
 
	parameter s0=0, s1=1, s2=2;
	reg[1:0] CS, NS;
	
	assign out= (~in & CS==s2?1:0);
	
	always@(posedge clk)
	begin
		if(!rstn)
			CS<=s0;
		else
			CS<=NS;
	end
	
	always@(CS, in)
	begin
		case(CS)
			s0: if(in) NS<=s1;
				 else NS<=s0;
			s1: if(in) NS<=s2;
				 else NS<=s0;
			s2: if(in) NS<=s2;
				 else NS<=s0;
		default: NS<=s0;
		endcase
	end

endmodule
