`timescale 1ns/1ps 

module GCDTest;
logic clk, rst, done;
logic [31:0] a,b,gcd;

GCD gcd_inst(.clk(clk),.rst_n(rst),.a_in(a), .b_in(b), .done(done), .gcd(gcd));

initial begin 
    clk = 0;
    forever begin
      #50ns clk = !clk;
    end
end


function int gcd_fcn(int a, int b);
    return b == 0 ? a : gcd_fcn(b, a % b);
endfunction

function int gcd_fcn_while(int a, int b);
  while(a!=b) begin
      if(a>b) a = a-b;
      else    b = b-a;       
  end
  return a;
endfunction : gcd_fcn_while

initial begin
  int NUM_TESTS = 1000;
  int expected_val = 0;
  int test_id = 0;
  int test_result = 1;
  rst=1; 
  a = 0;
  b = 0;
  #500ns;
  rst = 0;
  a = 14;
  b = 161;
  while(test_id<NUM_TESTS) begin
  @(posedge done)
    test_id++;
  expected_val = gcd_fcn_while(a,b);
  if(expected_val==gcd) begin
       $display("[%4d]-GCD(%4d,%4d): expected=%4d   actual=%4d  PASS", test_id, a, b, expected_val, gcd); 
  end else begin
       $display("[%4d]-GCD(%4d,%4d): expected=%4d   actual=%4d  FAIL", test_id, a, b, expected_val, gcd);
  end
  #50ns;
  a = $urandom_range(NUM_TESTS, 10);
  b = $urandom_range(NUM_TESTS, 10);
  end
  if(test_result==1) begin 
      $display("Test Pass!");
  end else begin
      $display("Test Fail :(");
  end

  $finish();
end 

initial begin
  $dumpfile("gcd_normal.vcd");
  $dumpvars(1);
end

initial begin
  #600ms;
$finish();
end

endmodule
