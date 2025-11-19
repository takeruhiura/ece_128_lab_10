`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2025 02:20:58 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input clk,
    input rst,
    input [2:0] adr1,
    input [2:0] adr2,
    output [7:0] result
    );
    wire [2:0] state_out;
    wire [2:0] rom_addr;
    wire [3:0] rom_data;
    wire [3:0] reg_A, reg_B;
    wire [7:0] ram_d_out;
    wire [7:0] product;
    wire [2:0] ram_addr;
    wire w_rf, w_ram;
    wire da, sa, sb;
    
    rom ROM (.ROM_addr(rom_addr), .ROM_data(rom_data));

    RF register_file ( .A(reg_A), .B(reg_B), .SB(sb), .D(rom_data), .DA(da), .W(w_rf), .rst(rst), .clk(clk), .SA(sa));
    combinational_mult multiplier(.a(reg_A), .b(reg_B), .p(product));
    ram RAM (.clk(clk), .rst(rst), .w(w_ram), .data_in(product), .addr(ram_addr), .data_out(result));
   // control_unit CU(.clk(clk), .rst(rst), .rom_adr(rom_addr), .W_rf(w_rf), .DA(da), .SA(sa), .SB(sb), .St_out(state_out), .W_ram(w_ram), .adr_ram(ram_addr));
   cu CU ( clk, rst,adr1,adr2,w_rf,rom_addr,da,sa,sb,state_out,w_ram,ram_addr);
    //assign result = ram_data_out;
    
    
endmodule
