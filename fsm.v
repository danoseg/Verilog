`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2025 04:25:39 PM
// Design Name: 
// Module Name: fsm
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
// Each state represents an angle position for a motor
//////////////////////////////////////////////////////////////////////////////////


module fsm#(
    //binary encoding of states
    parameter State_width = 3,
              An0 = 3'b000,
              An45 = 3'b001,
              An90 = 3'b010,
              An135 = 3'b011,
              An180 = 3'b100,
              An225 = 3'b101,
              An270 = 3'b110,
              An315 = 3'b111
              )
    (//ports
        input wire clk, reset, moveCW, moveCCW,
        input wire [(State_width-1):0] physicalPos,
        output wire [(State_width-1):0] desiredPos, posError
    );
    
    reg [(State_width)-1:0] currentState, nextState;
    
    //body of FSM is a case statement
    always @(moveCW or moveCCW or physicalPos or currentState)
        begin: Combinational
            case(currentState)
                An0: if(moveCW == 1)
                        nextState = An45;
                     else if (moveCCW == 1)
                        nextState = An315;
                     else
                        nextState = An0;                 
                An45: if(moveCW == 1)
                        nextState = An90;
                     else if (moveCCW == 1)
                        nextState = An0;
                     else
                        nextState = An45;    
                An90: if(moveCW == 1)
                        nextState = An135;
                     else if (moveCCW == 1)
                        nextState = An45;
                     else
                        nextState = An90;
                An135: if(moveCW == 1)
                        nextState = An180;
                     else if (moveCCW == 1)
                        nextState = An90;
                     else
                        nextState = An135;                  
                An180: if(moveCW == 1)
                        nextState = An225;
                     else if (moveCCW == 1)
                        nextState = An135;
                     else
                        nextState = An180;
                An225: if(moveCW == 1)
                        nextState = An270;
                     else if (moveCCW == 1)
                        nextState = An180;
                     else
                        nextState = An225;
                An270: if(moveCW == 1)
                        nextState = An315;
                     else if (moveCCW == 1)
                        nextState = An225;
                     else
                        nextState = An270;
                An315: if(moveCW == 1)
                        nextState = An0;
                     else if (moveCCW == 1)
                        nextState = An270;
                     else
                        nextState = An315;
                 default: 
                 nextState = physicalPos;
            endcase
        end
    
    //Current State Register
    always@(posedge clk or negedge reset)
        begin: Sequential
            if(!reset)
                currentState = physicalPos;
            else
                currentState = nextState;
        end          
        
    //Output Logic
    //Moore Outputs
    assign desiredPos = currentState;
    //MEaly Outputs
    assign posError = desiredPos - physicalPos;
    
endmodule
