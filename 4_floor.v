module elevator_controller_three_floor (
    input clk, rst,
    input [4:0] floor_request,
    output reg [1:0] current_floor,
    output reg move_up, move_down, door_open
);
    reg [2:0] floor, next_floor;

    parameter ground_floor = 3'b000,
              first_floor  = 3'b001,
              second_floor = 3'b010,
              third_floor  = 3'b011,
			  fourth_floor = 3'b100;

    always @(posedge clk or posedge rst) begin
        if (rst)
            floor <= ground_floor;
        else
            floor <= next_floor;
    end

    always @(*) begin
        next_floor = floor;
        move_up    = 0;
        move_down  = 0;
        door_open  = 0;
        case (floor)
            ground_floor: begin
                if (floor_request[0]) door_open = 1;
                else if (floor_request[1]) begin next_floor = first_floor; move_up = 1; end
                else if (floor_request[2]) begin next_floor = second_floor; move_up = 1; end
                else if (floor_request[3]) begin next_floor = third_floor; move_up = 1; end
				else if (floor_request[4]) begin next_floor = fourth_floor; move_up = 1; end
            end
            first_floor: begin
                if (floor_request[1]) door_open = 1;
                else if (floor_request[0]) begin next_floor = ground_floor; move_down = 1; end
                else if (floor_request[2]) begin next_floor = second_floor; move_up = 1; end
                else if (floor_request[3]) begin next_floor = third_floor; move_up = 1; end
				else if (floor_request[4]) begin next_floor = fourth_floor; move_up = 1; end
            end
            second_floor: begin
                if (floor_request[2]) door_open = 1;
                else if (floor_request[3]) begin next_floor = third_floor; move_up = 1; end
				else if (floor_request[4]) begin next_floor = fourth_floor; move_up = 1; end
                else if (floor_request[1]) begin next_floor = first_floor; move_down = 1; end
                else if (floor_request[0]) begin next_floor = ground_floor; move_down = 1; end
            end
            third_floor: begin
                if (floor_request[3]) door_open = 1;
				else if (floor_request[4]) begin next_floor = fourth_floor; move_up = 1; end
                else if (floor_request[2]) begin next_floor = second_floor; move_down = 1; end
                else if (floor_request[1]) begin next_floor = first_floor; move_down = 1; end
                else if (floor_request[0]) begin next_floor = ground_floor; move_down = 1; end
            end
			fourth_floor: begin
                if (floor_request[4]) door_open = 1;
				else if (floor_request[3]) begin next_floor = third_floor; move_down = 1; end
                else if (floor_request[2]) begin next_floor = second_floor; move_down = 1; end
                else if (floor_request[1]) begin next_floor = first_floor; move_down = 1; end
                else if (floor_request[0]) begin next_floor = ground_floor; move_down = 1; end
        endcase

        assign current_floor = floor;
    end
endmodule
