`timescale 1ns/1ps 

module GCD (
input  logic clk,  
input  logic rst_n,
input  logic [31:0] a_in,
input  logic [31:0] b_in,
output logic done,
output logic [31:0] gcd
);

parameter s0 = 2'd0, s1 = 2'd1, s2 = 2'd2, s3=2'd3;

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
            //a_next ???;
            //b_next ???;
            //gcd    ???;
            //state_next ???; 
            //done       ???;
        end
      s1: begin
        if(a!=b) begin
            //a_next ???;
            //b_next ???;
            //gcd    ???;
            //state_next ???;
        end else begin
            //state_next ???;
            end
        end
      s2: begin
            //gcd ???;
            //state_next ???;
            //done ???;
        end
        default: begin
            //state_next ???;
        end
    endcase
end
endmodule

