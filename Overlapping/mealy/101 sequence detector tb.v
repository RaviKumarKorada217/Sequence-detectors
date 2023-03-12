`timescale 1ns / 1ps

module seq_det_101_mealy_test;

	// Inputs
	reg clk;
	reg rstn;
	reg in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	seq_det_101 uut (
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

		// Wait 100 ns for global reset to finish
		repeat(4)@(posedge clk)
			rstn<=1;
		repeat(40)@(posedge clk)
			in <= $random;
      
		#1000 $finish;

		end
		initial $monitor($time," input= %b, output= %b",in,out);
      
endmodule
