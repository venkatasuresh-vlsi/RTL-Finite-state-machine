module tb;
     reg clk;
     reg rst;
     wire [2:0] light_a;
     wire [2:0] light_b;
	
     two_way_traffic_light_controller dut (
         .clk(clk),
         .rst(rst),
         .light_a(light_a),
         .light_b(light_b)
         );

     initial clk = 0;
     always #5 clk = ~clk; 
	
     initial begin
	     $monitor("Time=%0t } clk=%b } rst=%b } light_a=%b } light_b=%b", $time, clk, rst, light_a, light_b);
         rst = 1;
         #10;
         rst = 0;
         #1000;
         $finish;
        end    
    endmodule
