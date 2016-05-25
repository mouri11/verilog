module testbench;
	wire w[0:3];
	halfadder h1(w[3],w[2],w[1],w[0]);
	test t1(w[0],w[1],w[3],w[2]);
endmodule

module halfadder(output sum,output carry,input a,b);
	xor(sum,a,b);
	and(carry,a,b);
endmodule

module test(output reg a,b,input sum,carry);
	initial begin
		$dumpfile("hadump.vcd");
		$dumpvars(2, testbench);
		$monitor($time,,,"a=%b b=%b sum=%b,carry=%b", a,b,sum,carry);
		{a, b} = 2'b00;
		{a, b} = #1 2'b01;
		{a, b} = #1 2'b10;
		{a, b} = #1 2'b11;
	#1 $finish;
	end
endmodule

	
		

