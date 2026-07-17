module mux4to1(
  input logic [3:0]i,
  input logic [1:0] sel,
  output logic out
);
  
  always_comb begin
    case(sel)
      2'b00:out=i[0];
      2'b01:out=i[1];
      2'b10:out=i[2];
      2'b11:out=i[3];
      default: out = 0;
    endcase
  end
  
endmodule  