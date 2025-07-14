module tb;
     reg clk, rst;
	 reg [3:0] floor_request;
	 wire [1:0] current_floor;
	 wire move_up, move_down, door_open;
	 
	 elevator_controller_three_floor uut(
	 .clk(clk),
	 .rst(rst),
	 .floor_request(floor_request),
	 .current_floor(current_floor),
	 .move_up(move_up),
	 .move_down(move_down),
	 .door_open(door_open)
	 );
	 initial clk = 0;
	 always #5 clk <= ~clk;
	 
	 initial begin
	     $monitor("Time=%0t | clk=%b | rst=%b | floor_request=%b | current_floor=%b | move_up=%b | move_down=%b | door_open=%b",
		 $time, clk, rst, floor_request, current_floor, move_up, move_down, door_open);
			 rst=1; floor_request = 4'b0001; #10;
             rst=0; #10;	
			 
			 floor_request = 4'b0001; #10;
			 floor_request = 4'b0010; #20;
			 floor_request = 4'b0100; #40;
			 floor_request = 4'b1000; #80;
			 
			 floor_request = 4'b0010; #160;
			 floor_request = 4'b0010; #20;
			 floor_request = 4'b0001; #10;
			 floor_request = 4'b0010; #20;
			 floor_request = 4'b0100; #40;
			 floor_request = 4'b1000; #80;
			 
			 floor_request = 4'b0100; #160;
			 floor_request = 4'b0100; #40;
			 floor_request = 4'b0010; #20;
			 floor_request = 4'b0001; #10;
			 floor_request = 4'b0010; #20;
			 floor_request = 4'b0100; #160;
			 floor_request = 4'b1000; #80;
			 
			 floor_request = 4'b1000; #160;
			 floor_request = 4'b1000; #80;
			 floor_request = 4'b0100; #40;
			 floor_request = 4'b0010; #20;
			 floor_request = 4'b0001; #10;
			 floor_request = 4'b0010; #20;
			 floor_request = 4'b0100; #40;
			 rst=1; #10;
			$finish;
		end
	endmodule