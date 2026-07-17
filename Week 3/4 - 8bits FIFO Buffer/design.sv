module fifo_8bit (
    input  logic       clk,
    input  logic       rst_n,    
    input  logic       wr_en,    
    input  logic       rd_en,   
    input  logic [7:0] data_in,  
    output logic [7:0] data_out, 
    output logic       full,     
    output logic       empty     
);

  parameter DEPTH = 8; 

  logic [7:0] memory [DEPTH-1:0];

  logic [2:0] wr_ptr; 
  logic [2:0] rd_ptr; 
  logic [3:0] count;  

  assign empty = (count == 0);
  assign full  = (count == DEPTH);

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      wr_ptr   <= 3'b0;
      rd_ptr   <= 3'b0;
      count    <= 4'b0;
      data_out <= 8'b0;
    end else begin
      
      if (wr_en && !full) begin
        memory[wr_ptr] <= data_in;
        wr_ptr         <= wr_ptr + 1;
      end

      if (rd_en && !empty) begin
        data_out <= memory[rd_ptr];
        rd_ptr   <= rd_ptr + 1;
      end

      if (wr_en && !full && !(rd_en && !empty)) begin
        count <= count + 1; 
      end else if (rd_en && !empty && !(wr_en && !full)) begin
        count <= count - 1; 
      end
    end
  end

endmodule
