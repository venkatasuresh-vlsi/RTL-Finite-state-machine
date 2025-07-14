module traffic_light_controller(
     input clk,
	 input rst,
	 output reg [2:0] light
	 );
	 reg [1:0] state;
	 
	 parameter green = 2'b00,
	           yellow = 2'b01,
	           red = 2'b10;
	 reg [3:0] counter;
	 
	 parameter green_time = 7'd10,
	           yellow_time = 7'd5,
			   red_time = 7'd7;
	 always @(posedge clk or posedge rst) begin
	     if (rst)begin
		     state <= green;
			 light <= 3'b001;
			 counter <= 0;
			end
		 else begin
		     counter <= counter + 1;
			 case(state)
			     green : begin
				     light <= 3'b001;
					 if (counter >= green_time) begin
					     state <= yellow;
						 counter <= 0;
						end
					end
				 yellow : begin 
				     light <= 3'b010;
					 if (counter >= yellow_time) begin
					     state <= red;
						 counter <= 0;
						end
					end
				 red : begin
				     light <= 3'b100;
					 if (counter >= red_time) begin
					     state <= green;
						 counter <= 0;
						end
					end
				 default : begin 
				     light <= 3'b001;
					 counter <= 0;
					 state <= green;
					end
				endcase
			end
		end
	endmodule
					