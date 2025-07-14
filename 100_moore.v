module sequence_detector_100_moore(
     input rst, clk, x,
	 output reg y
	 );
	 reg [1:0] state, next_state;
	 
	 parameter a = 2'b00,
	           b = 2'b01,
			   c = 2'b10,
			   d = 2'b11;
	 always @(posedge clk or posedge rst) begin
	     if(rst) 
		    state <= a;
		 else 
		    state <= next_state;
		end
	 always @(*) begin
         case(state)
             a: next_state = (x) ? b : a;
             b: next_state = (x) ? b : c;
             c: next_state = (x) ? a : d;
             d: next_state = (x) ? b : a;
             default: next_state = a;
            endcase
        end
     always @(*) begin
         y = (state == d) ? 1 : 0;
        end
    endmodule		
			 