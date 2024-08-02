`timescale 1ns / 1ps
//****************************************VSCODE PLUG-IN**********************************//
//----------------------------------------------------------------------------------------
// IDE :                   VSCODE     
// VSCODE plug-in version: Verilog-Hdl-Format-2.7.20240716
// VSCODE plug-in author : Jiang Percy
//----------------------------------------------------------------------------------------
//****************************************Copyright (c)***********************************//
// Copyright(C)            HBUT
// All rights reserved     
// File name:              
// Last modified Date:     2024/08/02 16:17:23
// Last Version:           V1.0
// Descriptions:           
//----------------------------------------------------------------------------------------
// Created by:             zf Lee
// Created date:           2024/08/02 16:17:23
// mail      :             Please Write mail 
// Version:                V1.0
// TEXT NAME:              Seq_Rec_3_1s_Mealy.v
// PATH:                   D:\Program Files\VMshared\verilog\Sec_Rec_3_1s_Mealy\Seq_Rec_3_1s_Mealy.v
// Descriptions:           
//                         
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module Seq_Rec_3_1s_Mealy(
    input                               clk                        ,
    input                               rst_n                      ,
    input d_in,
    input   en,
    output reg d_out
);
    parameter S_idle = 2'd0;
    parameter S_0 = 2'd1;
    parameter S_1 = 2'd2;
    parameter S_2 = 2'd3;
    
    reg [1:0]state,next_state;

    always @(posedge clk or negedge rst_n)           
    begin                                        
        if(!rst_n)                               
            state <= S_idle;
        else if(en)
            state <= next_state;
        else 
            state <= S_idle;           
    end                         
            
    always @(*)begin
        case(state)
            S_idle:begin
                if(en & d_in)begin
                    next_state <= S_1;
                end else if(d_in==0)begin
                    next_state <= S_0;
                end else begin
                    next_state <= S_idle;
                end
            end
            S_0:begin
                if(d_in==1)begin
                    next_state <= S_1;
                end else if(d_in==0)begin
                    next_state <= S_0;
                end else begin
                    next_state <= S_idle;
                end
            end
            S_1:begin
                if(d_in==1)begin
                    next_state <= S_2;
                end else if(d_in==0)begin
                    next_state <= S_0;
                end else begin
                    next_state <= S_idle;
                end
            end
            S_2:begin
                if(d_in & d_out)begin
                    next_state <= S_2;
                end else if(d_in==0)begin
                    next_state <= S_0;
                end else begin
                    next_state <= S_idle;
                end
            end
            default: next_state <= S_idle;
        endcase
    end

    always @(*)begin
        if(state==S_2)begin
            d_out = d_in;
        end
    end
                                                            
endmodule