module tb;
     reg rst, clk, x;
	 wire y;
	 
	 sequence_detector_1011_moore uut(
	     .rst(rst),
		 .clk(clk),
		 .x(x),
		 .y(y)
		);
	 always #5 clk <= ~clk;

     initial begin
         $monitor("time=%0t | rst=%b, clk=%b, x=%b | y=%b", $time, rst, clk, x, y);
             clk=0; rst=1; x=0; #10;
             rst=0; #10;
			 x=1; #10;
			 x=0; #10;
			 x=1; #10;
			 x=1; #10;
			 x=0; #10;
			 x=1; #10;
			 x=1; #10;
			#10 $finish;
		end
    endmodule		
   			 