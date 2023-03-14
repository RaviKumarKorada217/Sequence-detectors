`timescale 1ns / 1ps

module nol_seq_det_101_and_110_moore_test;

	// Inputs
	reg clk;
	reg rstn;
	reg in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	nol_seq_det_101_and_110_moore uut (
		.clk(clk), 
		.rstn(rstn), 
		.in(in), 
		.out(out)
	);
	always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk <= 0;
		rstn <= 0;
		in <= 0;

		repeat(1)@(posedge clk)
			rstn<=1;
		repeat(50)@(posedge clk)
			in<=$random;
		
		#1000 $finish;


	end
   
	initial $monitor($time," input= %b, output= %b",in,out);
endmodule
