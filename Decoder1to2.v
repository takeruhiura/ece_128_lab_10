`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 02:00:55 PM
// Design Name: 
// Module Name: Decoder1to2
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


module Decoder1to2(
    input S,
    input en,
    output [1:0] m

    );
    
    assign m[0] = ~S & en;
    assign m[1] = S & en;
endmodule
