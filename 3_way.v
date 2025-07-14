module three_way_traffic_light_controller(
     input clk, rst,
	 output reg [2:0] road_a, road_b, road_c
	 );
	 reg [2:0] state;
	 reg [3:0] timer;
	 
	 parameter a_green = 3'b000,
	           a_yellow = 3'b001,
			   b_green = 3'b010,
			   b_yellow = 3'b011,
			   c_green = 3'b100,
			   c_yellow = 3'b101;
     
	 parameter green_time = 4'd15,
	           yellow_time = 4'd10;
			  
	 always @(posedge clk or posedge rst) begin
	     if (rst) begin
		     state <= a_green;
			 timer <= 0;
			 road_a <= 3'b001;
			 road_b <= 3'b100;
			 road_c <= 3'b100;
			end
		 else begin
		     timer <= timer + 1;
			 case(state)
			     a_green : begin
				     road_a <= 3'b001;
					 road_b <= 3'b100;
					 road_c <= 3'b100;
					 if (timer >= green_time) begin
					     state <= a_yellow;
						 timer <= 0;
						end
					end
				 a_yellow : begin
				     road_a <= 3'b010;
					 road_b <= 3'b100;
					 road_c <= 3'b100;
					 if (timer >= yellow_time) begin
					     state <= b_green;
						 timer <= 0;
						end
					end
				 b_green : begin
				     road_a <= 3'b100;
					 road_b <= 3'b001;
					 road_c <= 3'b100;
					 if (timer >= green_time) begin
					     state <= b_yellow;
						 timer <= 0;
						end
					end
				 b_yellow : begin
				     road_a <= 3'b001;
					 road_b <= 3'b010;
					 road_c <= 3'b100;
					 if (timer >= yellow_time) begin
					     state <= c_green;
						 timer <= 0;
						end	
                    end						
				 c_green : begin
				     road_a <= 3'b100;
					 road_b <= 3'b100;
					 road_c <= 3'b001;
					 if (timer >= green_time) begin
					     state <= c_yellow;
						 timer <= 0;
						end
					end
				 c_yellow : begin
				     road_a <= 3'b100;
					 road_b <= 3'b100;
					 road_c <= 3'b010;
					 if (timer >= yellow_time) begin
					     state <= a_green;
						 timer <= 0;
						end
					end
				 default : begin
				     road_a <= 3'b001;
					 road_b <= 3'b100;
					 road_c <= 3'b100;
					 timer <= 0;
					 state <= a_green;
					end
				endcase
			end
		end
	endmodule
			
					