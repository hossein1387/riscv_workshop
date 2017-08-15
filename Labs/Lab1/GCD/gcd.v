`timescale 1ns/1ps 

module GCD (
  input   clk,
  input   rst_n,
  input   [31:0] a_in,
  input   [31:0] b_in,
  output  done,
  output  [31:0] gcd
);

parameter s0 = 2'd0, s1 = 2'd1, s2 = 2'd2, s3=2'd3;

reg [1:0] state;
reg [1:0] state_next;
reg [31:0] a_next, a;
reg [31:0] b_next, b;
reg [31:0] gcd_reg;
reg done_reg; 

always @(posedge clk) begin
  if(rst_n) begin
    a      <= 0;    
    b      <= 0;
    state  <= s0;
  end else begin
    a <= a_next;
    b <= b_next;
    state <= state_next;
  end
end

always @(*) begin
    a_next = a;
    b_next = b;
    gcd_reg    = 32'd0;   
    state_next = state;
    case (state)
      s0: begin
            a_next      = a_in;
            b_next      = b_in;
            gcd_reg         = 32'd0;
            state_next  = s1; 
            done_reg        = 0;
        end
      s1: begin
        if(a!=b) begin
            a_next= (a >= b) ? a - b : a;
            b_next     = (b >  a) ? b - a : b;
            gcd_reg        = 32'd0;
            state_next = s1;
        end else begin
            gcd_reg = a;
            state_next = s0;
            done_reg = 1;
            end
        end
        default: begin
            state_next = s0;
        end
    endcase
end
  
  assign gcd = gcd_reg;
  assign done = done_reg;
endmodule

