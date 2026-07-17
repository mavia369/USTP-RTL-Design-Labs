module seq_detector_1101_moore (
    input  logic clk,
    input  logic rst_n,   
    input  logic din,      
    output logic dout      
);

    typedef enum logic [2:0] {
        IDLE  = 3'b000,
        S1    = 3'b001,
        S11   = 3'b010,
        S110  = 3'b011,
        S1101 = 3'b100  
    } state_t;

    state_t current_state, next_state;

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            current_state <= IDLE;
        end else begin
            current_state <= next_state;
        end
    end

    always_comb begin
        next_state = current_state;

        case (current_state)
            IDLE: begin
                if (din) next_state = S1;
                else     next_state = IDLE;
            end

            S1: begin
                if (din) next_state = S11;
                else     next_state = IDLE;
            end

            S11: begin
                if (din) next_state = S11; 
                else     next_state = S110;
            end

            S110: begin
                if (din) next_state = S1101; 
                else     next_state = IDLE;
            end

            S1101: begin
                if (din) next_state = S1;
                else     next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

    assign dout = (current_state == S1101);
endmodule
