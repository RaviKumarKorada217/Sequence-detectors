`timescale 1ns / 1ps
module nol_seq_det_101_mealy(clk,rstn,in,out);
	input clk, rstn, in;
	output out;
	
	parameter s0=0,s1=1,s2=2;
	reg [1:0] cur_state, next_state;
	
	assign out=((in)&(cur_state==s2?1:0));
	
	always @ (posedge clk)
	begin
		if(!rstn)
			cur_state<=s0;
		else
			cur_state <=next_state;
	end
	
	always @ (cur_state or in) 
	begin
		case(cur_state)
			s0: begin
					if(in) next_state = s1;
					else next_state=s0;
				 end
			s1: begin
					if(in) next_state = s1;
					else next_state=s2;
				 end
			s2: begin
					if(in) next_state = s0;
					else next_state=s0;
				 end
   	default: begin
					next_state = s0;
					end
	  endcase
	end
	
endmodule
