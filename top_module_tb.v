`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 02:27:34 PM
// Design Name: 
// Module Name: top_module_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module_tb;
    reg clk;
    reg rst;
    reg [2:0] adr1;
   reg [2:0] adr2;
    wire [7:0] result;
    
    top_module dut(.clk(clk), .rst(rst),.adr1(adr1),.adr2(adr2), .result(result));
    
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    
    
    initial begin
    rst = 1;
    #10;
    adr1 = 2'd1;   rst = 0;
    #10;
    adr2 = 2'd2;
   
    #100;
    
    rst = 1;
    #10;
    adr1 = 2'd3;   rst = 0;
    #10;
    adr2 = 2'd5;
    
    #100;
    
    $finish;
    
    end
endmodule
