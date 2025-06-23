// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
// Date        : Thu May 22 11:09:49 2025
// Host        : DESKTOP-LPO2IM4 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top debouncer_0 -prefix
//               debouncer_0_ debouncer_0_stub.v
// Design      : debouncer_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "debouncer,Vivado 2023.1" *)
module debouncer_0(clk, rst, btn_in, btn_out)
/* synthesis syn_black_box black_box_pad_pin="rst,btn_in,btn_out" */
/* synthesis syn_force_seq_prim="clk" */;
  input clk /* synthesis syn_isclock = 1 */;
  input rst;
  input btn_in;
  output btn_out;
endmodule
