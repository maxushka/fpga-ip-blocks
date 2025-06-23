-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Thu May 22 11:09:49 2025
-- Host        : DESKTOP-LPO2IM4 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top debouncer_0 -prefix
--               debouncer_0_ debouncer_0_stub.vhdl
-- Design      : debouncer_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu9eg-ffvb1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debouncer_0 is
  Port ( 
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    btn_in : in STD_LOGIC;
    btn_out : out STD_LOGIC
  );

end debouncer_0;

architecture stub of debouncer_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rst,btn_in,btn_out";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "debouncer,Vivado 2023.1";
begin
end;
