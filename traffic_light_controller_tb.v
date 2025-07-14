module tb;
     reg clk, rst;
	 wire [2:0] light;
	 
	 traffic_light_controller uut (
	     .clk(clk),
		 .rst(rst),
		 .light(light)
		 );
	 initial clk = 0;
	 always #5 clk = ~clk;
	 
	 initial begin
	     $monitor("Time = %0t | Reset = %b | Light = %b", $time, rst, light);
		     rst=1;
			 #10;
			 rst=0;
			 #1000;
			 rst=1;
			$finish;
		end
	endmodule