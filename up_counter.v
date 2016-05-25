module up_counter(out, enable, clk, reset);
	output [7:0] out;
	input enable, clk, reset;
	reg [7:0] out;

	always @(posedge clk)
		if (reset) 
		begin
			out <=8'b0;
		end 
	else if (enable) 
		begin
			out<=out+1;
		end
endmodule
module tg_up(out,enable,clk,reset);
	input [7:0] out;
	output reg enable,clk,reset;
	initial	begin		 
		$dumpfile("up_counter.vcd");
		$dumpvars(0,out,enable,clk,reset);
		$monitor($time,,,"reset = %b out=%b enable=%b",reset, out, enable);
		reset = 1'b1;clk=1'b1;
		#5 reset = 1'b0;clk=1'b1;
		#5 enable= 1'b1;
		#5 clk=1'b1;
		#5 clk=1'b0;
		#5 clk=1'b1;
		#5 clk=1'b0;	
		#5 clk=1'b1;
		#5 clk=1'b0;
		#5 clk=1'b1;
		#5 clk=1'b0;	
		#5 clk=1'b1;
		#5 clk=1'b0;
		#5 clk=1'b1;
		#5 clk=1'b0;	
		#5 clk=1'b1;
		#5 clk=1'b0;
		#5 clk=1'b1;
		#5 clk=1'b0;	
		#5 reset =1'b0;
	end
endmodule
module wb;
	wire enable,clk,reset;
	wire [7:0] out;
	up_counter counter(out,enable,clk,reset);
	tg_up count(out,enable,clk,reset);
endmodule 
