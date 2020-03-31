`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2020 13:43:29
// Design Name: 
// Module Name: hex_test
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


module hex_test(
  input      [15:0] sw,
  output     [15:0] led,
  output reg [6:0]  hex,
  output     [7:0]  hex_on
    );

  assign hex_on = 8'b1111_1110;
  assign led    = sw;
  reg [3:0] dc1;
  reg [3:0] dc2;
  reg [3:0] func;
  reg [3:0] dec;
  reg [3:0] swtch;
  
  always @(*) begin
    case (sw[3:0])
      4'b0000 : dc1 = 4'd4;
      4'b0001 : dc1 = 4'd3; 
      4'b0010 : dc1 = 4'd3;
      4'b0011 : dc1 = 4'd2;
      4'b0100 : dc1 = 4'd3;
      4'b0101 : dc1 = 4'd2;
      4'b0110 : dc1 = 4'd2;
      4'b0111 : dc1 = 4'd1;
      4'b1000 : dc1 = 4'd3;
      4'b1001 : dc1 = 4'd2;
      4'b1010 : dc1 = 4'd2;
      4'b1011 : dc1 = 4'd1;
      4'b1100 : dc1 = 4'd2;
      4'b1101 : dc1 = 4'd1;
      4'b1110 : dc1 = 4'd1;
      4'b1111 : dc1 = 4'd0;
    endcase
  end
  
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
  
  always @(*) begin
    func = (sw[0] || sw[1]^(sw[2] & sw[3]));
  end
  
  always @(*) begin
    case (sw[3:0])
      4'b0000 : swtch = 4'd0;
      4'b0001 : swtch = 4'd1; 
      4'b0010 : swtch = 4'd2;
      4'b0011 : swtch = 4'd3;
      4'b0100 : swtch = 4'd4;
      4'b0101 : swtch = 4'd5;
      4'b0110 : swtch = 4'd6;
      4'b0111 : swtch = 4'd7;
      4'b1000 : swtch = 4'd8;
      4'b1001 : swtch = 4'd9;
      4'b1010 : swtch = 4'd10;
      4'b1011 : swtch = 4'd11;
      4'b1100 : swtch = 4'd12;
      4'b1101 : swtch = 4'd13;
      4'b1110 : swtch = 4'd14;
      4'b1111 : swtch = 4'd15;
    endcase
  end
    
    always @(*) begin
    case (sw[9:8])
      2'b00 : dec = dc1;
      2'b01 : dec = dc2; 
      2'b10 : dec = func;
      2'b11 : dec = swtch;
    endcase
  end
      
    always @(*) begin
    case (dec)
      4'b0000 : hex = 7'b100_0000;
      4'b0001 : hex = 7'b111_1001; 
      4'b0010 : hex = 7'b010_0100;
      4'b0011 : hex = 7'b011_0000;
      4'b0100 : hex = 7'b001_1001;
      4'b0101 : hex = 7'b001_0010;
      4'b0110 : hex = 7'b000_0010;
      4'b0111 : hex = 7'b111_1000;
      4'b1000 : hex = 7'b000_0000;
      4'b1001 : hex = 7'b001_0000;
      4'b1010 : hex = 7'b100_0000;
      4'b1011 : hex = 7'b000_1000;
      4'b1100 : hex = 7'b000_0011;
      4'b1101 : hex = 7'b010_0001;
      4'b1110 : hex = 7'b000_0110;
      4'b1111 : hex = 7'b000_1110;
      endcase
    end
        
    
endmodule
