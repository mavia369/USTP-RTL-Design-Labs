module alu_32bit(
    input  logic [31:0] A,
    input  logic [31:0] B,
    input  logic [2:0]  opcode,
    output logic [31:0] result
);

always_comb begin
    case (opcode)
        3'b000: result = A + B;     
        3'b001: result = A - B;    
        3'b010: result = A & B;    
        3'b011: result = A | B;    
        3'b100: result = A ^ B;     
        3'b101: result = ~A;        
        3'b110: result = A << 1;   
        3'b111: result = A >> 1;    
        default: result = 32'd0;
    endcase
end

endmodule