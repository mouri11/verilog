module testbench;
	wire i0, i1, i2, ps, pc, fs, fc;
	halfadder h1(i0, i1, ps, pc), h2(i2, ps, fs, fc);
	or(o, fc, pc);
	test t1(i0, i1, i2, fs, o);
endmodule

module halfadder(input a, b, output sum, carry);
	xor(sum, a, b);
	and(carry, a, b);
endmodule

module test(output reg i0, i1, i2, input fs, fc);
	initial begin
		$dumpfile("fadump.vcd");
		$dumpvars(2, testbench);
		$monitor($time,,, "i0 = %b i1 = %b i2 = %b sum = %b carry = %b\n\n", i0, i1, i2, fs, fc);
		{i0, i1, i2} = #1 3'b000;
		{i0, i1, i2} = #1 3'b001;
		{i0, i1, i2} = #1 3'b010;
		{i0, i1, i2} = #1 3'b011;
		{i0, i1, i2} = #1 3'b100;
		{i0, i1, i2} = #1 3'b101;
		{i0, i1, i2} = #1 3'b110;
		{i0, i1, i2} = #1 3'b111;
		$finish;
	end
endmodule

	
		

