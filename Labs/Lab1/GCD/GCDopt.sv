`timescale 1ns/1ps 

module GCD (
input  logic clk,  
input  logic rst_n,
input  logic [31:0] a_in,
input  logic [31:0] b_in,
output logic done,
output logic [31:0] gcd
);

parameter s0 = 2'd0, s1 = 2'd1;

logic [1:0] state;
logic [1:0] state_next;
logic [31:0] a_next, a;
logic [31:0] b_next, b;

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
    gcd    = 32'd0;   
    state_next = state;
    case (state)
      s0: begin
            a_next      = a_in;
            b_next      = b_in;
            gcd         = 32'd0;
            state_next  = s1; 
            done        = 0;
        end
      s1: begin
        if(a!=b) begin
            a_next= (a >= b) ? a - b : a;
            b_next     = (b >  a) ? b - a : b;
            gcd        = 32'd0;
            state_next = s1;
        end else begin
            gcd = a;
            state_next = s0;
            done = 1;
            end
        end
        default: begin
            state_next = s0;
        end
    endcase
end
endmodule

