`timescale 1ns / 1ps

module seq_det_101_and_110_moore(
    input clk,
    input rstn,
    input in,
    output out
    );
	 
	 parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5;
	 reg [2:0] CS, NS;
	 
	 assign out= (CS==s4?1:0)|(CS==s5?1:0);
	 
	 always@(posedge clk)
		if(rstn)
			CS<=NS;
		else
			CS<=s0;
			
	always@(CS, in)
		case(CS)
			s0: if(in) NS<=s1;
				 else NS<=s0;
			s1: if(in) NS<=s2;
				 else NS<=s3;
			s2: if(in) NS<=s2;
				 else NS<=s4;
			s3: if(in) NS<=s5;
				 else NS<=s0;
			s4: if(in) NS<=s5;
				 else NS<=s0;
			s5: if(in) NS<=s2;
				 else NS<=s3;
		default: NS<=s0;
		endcase	
endmodule
