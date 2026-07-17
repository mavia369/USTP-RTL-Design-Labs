module vending_machine (
    input  logic clk,
    input  logic rst_n,   
    input  logic nickel,  
    input  logic dime,    
    output logic dispense 
);

  typedef enum logic [1:0] {
    S_0c  = 2'b00, 
    S_5c  = 2'b01, 
    S_10c = 2'b10, 
    S_15c = 2'b11  
  } state_t;

  state_t current_state, next_state;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      current_state <= S_0c;
    end else begin
      current_state <= next_state;
    end
  end

  always_comb begin
    next_state = current_state;

    case (current_state)
      S_0c: begin
        if (nickel)      next_state = S_5c;
        else if (dime)   next_state = S_10c;
      end

      S_5c: begin
        if (nickel)      next_state = S_10c;
        else if (dime)   next_state = S_15c;
      end

      S_10c: begin
        if (nickel || dime) next_state = S_15c; 
      end

      S_15c: begin
        next_state = S_0c;
      end

      default: next_state = S_0c;
    endcase
  end

  assign dispense = (current_state == S_15c);

endmodule
