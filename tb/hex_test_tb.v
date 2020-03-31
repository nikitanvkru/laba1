`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:54:15
// Design Name: 
// Module Name: hex_test_tb
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


module hex_test_tb(

    );

  reg  [9:4] sw;
  wire [15:0] led;
  wire [6:0]  hex;
  wire [7:0]  hex_on;
  reg [3:0] dc2;
  
  hex_test DUT (
  .sw     (sw),
  .led    (led),
  .hex    (hex),
  .hex_on (hex_on)
  );
  
    always @(*) begin
    case (sw[7:4])
      4'b0000 : dc2 = 4'd5;
      4'b0001 : dc2 = 4'd5; 
      4'b0010 : dc2 = 4'd7;
      4'b0011 : dc2 = 4'd7;
      4'b0100 : dc2 = 4'd5;
      4'b0101 : dc2 = 4'd5;
      4'b0110 : dc2 = 4'd7;
      4'b0111 : dc2 = 4'd7;
      4'b1000 : dc2 = 4'd13;
      4'b1001 : dc2 = 4'd13;
      4'b1010 : dc2 = 4'd15;
      4'b1011 : dc2 = 4'd15;
      4'b1100 : dc2 = 4'd13;
      4'b1101 : dc2 = 4'd13;
      4'b1110 : dc2 = 4'd15;
      4'b1111 : dc2 = 4'd15;
    endcase
  end
  
  initial begin
    sw[7:4] = 4'b0000;
    sw[8] = 1;
    sw[9] = 0;
    forever begin
      #5 sw[7:4] = sw[7:4] +1'b1;
    end
  end     
    
  
endmodule
