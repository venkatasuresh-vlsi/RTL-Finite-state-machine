module sequence_detector_1101_moore(
     input rst, clk, x,
	 output reg y
	 );
	 reg [2:0] state, next_state;
	 
	 parameter a = 3'b000,
	           b = 3'b001,
			   c = 3'b010,
			   d = 3'b011,
			   e = 3'b100;
	 always @(posedge clk or posedge rst) begin
	     if(rst) 
		    state <= a;
		 else 
		    state <= next_state;
		end
	 always @(*) begin
         case(state)
             a: next_state = (x) ? b : a;
             b: next_state = (x) ? c : a;
             c: next_state = (x) ? d : a;
             d: next_state = (x) ? b : e;
             e: next_state = (x) ? b : a;
             default: next_state = a;
            endcase
        end
     always @(*) begin
         y = (state == e) ? 1 : 0;
        end
    endmodule
			 