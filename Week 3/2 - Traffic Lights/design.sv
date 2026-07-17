module traffic_light_fsm (
    input  logic clk,
    input  logic rst_n, 
    output logic red,
    output logic yellow,
    output logic green
);

  typedef enum logic [1:0] {
    S_RED    = 2'b00,
    S_GREEN  = 2'b01,
    S_YELLOW = 2'b10
  } state_t;

  state_t current_state, next_state;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      current_state <= S_RED;
    end else begin
      current_state <= next_state;
    end
  end

  always_comb begin
    case (current_state)
      S_RED:    next_state = S_GREEN; 
      S_GREEN:  next_state = S_YELLOW;
      S_YELLOW: next_state = S_RED;    
      default:  next_state = S_RED;    
    endcase
  end

  always_comb begin
    red    = 1'b0;
    yellow = 1'b0;
    green  = 1'b0;

    case (current_state)
      S_RED:    red    = 1'b1;
      S_GREEN:  green  = 1'b1;
      S_YELLOW: yellow = 1'b1;
    endcase
  end

endmodule
