module tb;
     reg clk;
     reg rst;
     wire [2:0] road_a;
     wire [2:0] road_b;
	 wire [2:0] road_c;
	
     three_way_traffic_light_controller uut (
         .clk(clk),
         .rst(rst),
         .road_a(road_a),
         .road_b(road_b),
		 .road_c(road_c)
         );

     initial clk = 0;
     always #5 clk <= ~clk; 
	
     initial begin
	     $monitor("Time=%0t } clk=%b } rst=%b } road_a=%b } road_b=%b } road_c=%b", $time, clk, rst, road_a, road_b, road_c);
         rst = 1;
         #10;
         rst = 0;
         #1000;
         $finish;
        end    
    endmodule
