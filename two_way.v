module two_way_traffic_light_controller(
    input clk, rst,
    output reg [2:0] light_a, light_b
);
    reg [1:0] state;

    parameter a_green  = 2'b00,
              a_yellow = 2'b01,
              b_green  = 2'b10,
              b_yellow = 2'b11;

    reg [4:0] timer;

    parameter green_time  = 4'd10,
              yellow_time = 4'd5;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            light_a <= 3'b001; 
            light_b <= 3'b100; 
            timer <= 0;
            state <= a_green;
        end else begin
            case (state)
                a_green: begin
                    light_a <= 3'b001; 
                    light_b <= 3'b100;
                    if (timer >= green_time) begin
                        state <= a_yellow;
                        timer <= 0;
                    end else
                        timer <= timer + 1;
                end

                a_yellow: begin
                    light_a <= 3'b010;
                    light_b <= 3'b100; 
                    if (timer >= yellow_time) begin
                        state <= b_green;
                        timer <= 0;
                    end else
                        timer <= timer + 1;
                end

                b_green: begin
                    light_a <= 3'b100;
                    light_b <= 3'b001;
                    if (timer >= green_time) begin
                        state <= b_yellow;
                        timer <= 0;
                    end else
                        timer <= timer + 1;
                end

                b_yellow: begin
                    light_a <= 3'b100; 
                    light_b <= 3'b010; 
                    if (timer >= yellow_time) begin
                        state <= a_green;
                        timer <= 0;
                    end else
                        timer <= timer + 1;
                end

                default: begin
                    light_a <= 3'b001;
                    light_b <= 3'b100;
                    timer <= 0;
                    state <= a_green;
                end
            endcase
        end
    end
endmodule
