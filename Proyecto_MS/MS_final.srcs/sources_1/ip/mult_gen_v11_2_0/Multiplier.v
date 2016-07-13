////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.15xf
//  \   \         Application: netgen
//  /   /         Filename: Multiplier.v
// /___/   /\     Timestamp: Wed Jul 13 13:15:39 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/azure/Desktop/repoMS/sase_project-master/Proyecto_MS/MS_final.srcs/sources_1/ip/mult_gen_v11_2_0/tmp/_cg/Multiplier.ngc C:/Users/azure/Desktop/repoMS/sase_project-master/Proyecto_MS/MS_final.srcs/sources_1/ip/mult_gen_v11_2_0/tmp/_cg/Multiplier.v 
// Device	: 6slx16csg324-2
// Input file	: C:/Users/azure/Desktop/repoMS/sase_project-master/Proyecto_MS/MS_final.srcs/sources_1/ip/mult_gen_v11_2_0/tmp/_cg/Multiplier.ngc
// Output file	: C:/Users/azure/Desktop/repoMS/sase_project-master/Proyecto_MS/MS_final.srcs/sources_1/ip/mult_gen_v11_2_0/tmp/_cg/Multiplier.v
// # of Modules	: 1
// Design Name	: Multiplier
// Xilinx        : C:\Xilinx\14.1\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module Multiplier (
a, b, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input [7 : 0] a;
  input [7 : 0] b;
  output [15 : 0] p;
  
  // synthesis translate_off
  
  wire N1;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>_33 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_34 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_35 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<7>_36 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<7>_37 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<6>_38 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<6>_39 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<5>_40 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<5>_41 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<4>_42 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<4>_43 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<3>_44 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<3>_45 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<2>_46 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<2>_47 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<1>_48 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<1>_49 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<0>_50 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<0>_51 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>_52 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<7>_53 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<7>_54 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<6>_55 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<6>_56 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<5>_57 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<5>_58 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<4>_59 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<4>_60 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<3>_61 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<3>_62 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<2>_63 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<2>_64 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<1>_65 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<1>_66 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<0>_67 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<0>_68 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>_69 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<7>_70 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<7>_71 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<6>_72 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<6>_73 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<5>_74 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<5>_75 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<4>_76 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<4>_77 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<3>_78 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<3>_79 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<2>_80 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<2>_81 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<1>_82 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<1>_83 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<0>_84 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<0>_85 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>_rt_250 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_rt_251 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_rt_252 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>_rt_253 ;
  wire \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>_rt_254 ;
  wire [11 : 2] \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> ;
  wire [11 : 4] \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> ;
  wire [9 : 0] \U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> ;
  wire [9 : 0] \U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> ;
  wire [9 : 0] \U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> ;
  wire [9 : 2] \U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> ;
  wire [8 : 0] \U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> ;
  wire [8 : 0] \U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> ;
  wire [8 : 0] \U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> ;
  wire [8 : 0] \U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> ;
  GND   XST_GND (
    .G(N1)
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[9].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [8]),
    .LI(N1),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [9])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[9].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [8]),
    .LI(N1),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [9])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[9].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [8]),
    .LI(N1),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [9])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[9].ppadd.b_is_even.stageMSB.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [8]),
    .LI(N1),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [9])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [7]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [8])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [7]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [8])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [7]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [8])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [7]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [8])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [6]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [7])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [6]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [7])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [6]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [7])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [6]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [7])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [5]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [6])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [5]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [6])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [5]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [6])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [5]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [6])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [4]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [5])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [4]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [5])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [4]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [5])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [4]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [5])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [3]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [4])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [3]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [4])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [3]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [4])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [3]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [4])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [2]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [3])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [2]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [3])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [2]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [3])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [2]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [3])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [1]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [2])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [0]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [1])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [1]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [2])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [0]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [1])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [1]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [2])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [0]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [1])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [1]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [2])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.xorcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [0]),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.lut_sig ),
    .O(p[1])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [7]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [8])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [7]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [8])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [7]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [8])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [7]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [8])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [6]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [7])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [6]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [7])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [6]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [7])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [6]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [7])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [5]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [6])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [5]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [6])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [5]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [6])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [5]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [6])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [4]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [5])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [4]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [5])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [4]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [5])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [4]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [5])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [3]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [4])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [3]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [4])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [3]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [4])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [3]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [4])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [2]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [3])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [2]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [3])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [2]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [3])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [2]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [3])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [1]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [2])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [1]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [2])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [1]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [2])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [1]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [2])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [0]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [1])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(N1),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [0])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(N1),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<3> [0])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [0]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [1])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(N1),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [0])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(N1),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<2> [0])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [0]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [1])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(N1),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [0])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(N1),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<1> [0])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.muxcy0  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [0]),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [1])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.xorcy0  (
    .CI(N1),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ),
    .O(p[0])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.muxcy00  (
    .CI(N1),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig ),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_cout<0> [0])
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b[7]),
    .I1(a[7]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b[5]),
    .I1(a[7]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b[3]),
    .I1(a[7]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.ma0  (
    .I0(b[1]),
    .I1(a[7]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b[7]),
    .I1(a[6]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b[5]),
    .I1(a[6]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b[3]),
    .I1(a[6]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.ma0  (
    .I0(b[1]),
    .I1(a[6]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b[7]),
    .I1(a[5]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b[5]),
    .I1(a[5]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b[3]),
    .I1(a[5]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.ma0  (
    .I0(b[1]),
    .I1(a[5]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b[7]),
    .I1(a[4]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b[5]),
    .I1(a[4]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b[3]),
    .I1(a[4]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.ma0  (
    .I0(b[1]),
    .I1(a[4]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b[7]),
    .I1(a[3]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b[5]),
    .I1(a[3]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b[3]),
    .I1(a[3]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.ma0  (
    .I0(b[1]),
    .I1(a[3]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b[7]),
    .I1(a[2]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b[5]),
    .I1(a[2]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b[3]),
    .I1(a[2]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.ma0  (
    .I0(b[1]),
    .I1(a[2]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b[7]),
    .I1(a[1]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b[5]),
    .I1(a[1]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b[3]),
    .I1(a[1]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.ma0  (
    .I0(b[1]),
    .I1(a[1]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b[7]),
    .I1(a[0]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b[6]),
    .I1(a[0]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b[5]),
    .I1(a[0]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b[4]),
    .I1(a[0]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b[3]),
    .I1(a[0]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b[2]),
    .I1(a[0]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.ma0  (
    .I0(b[1]),
    .I1(a[0]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.ma_sig )
  );
  MULT_AND   \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.ma0  (
    .I0(b[0]),
    .I1(a[0]),
    .LO(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.ma_sig )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<11>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>_33 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [11]),
    .O(p[15])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<10>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_34 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>_rt_250 ),
    .O(p[14])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_34 ),
    .DI(N1),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>_rt_250 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>_33 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<9>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_35 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_rt_251 ),
    .O(p[13])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_35 ),
    .DI(N1),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_rt_251 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_34 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<8>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<7>_36 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_rt_252 ),
    .O(p[12])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<7>_36 ),
    .DI(N1),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_rt_252 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_35 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<7>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<6>_38 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<7>_37 ),
    .O(p[11])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<7>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<6>_38 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [11]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<7>_37 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<7>_36 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<7>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [11]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [7]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<7>_37 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<6>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<5>_40 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<6>_39 ),
    .O(p[10])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<6>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<5>_40 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [10]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<6>_39 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<6>_38 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<6>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [10]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<6>_39 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<5>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<4>_42 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<5>_41 ),
    .O(p[9])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<5>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<4>_42 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [9]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<5>_41 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<5>_40 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<5>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [9]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [5]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<5>_41 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<4>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<3>_44 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<4>_43 ),
    .O(p[8])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<4>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<3>_44 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [8]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<4>_43 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<4>_42 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<4>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [8]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<4>_43 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<3>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<2>_46 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<3>_45 ),
    .O(p[7])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<3>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<2>_46 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [7]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<3>_45 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<3>_44 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<3>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [7]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [3]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<3>_45 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<2>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<1>_48 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<2>_47 ),
    .O(p[6])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<2>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<1>_48 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [6]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<2>_47 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<2>_46 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<2>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [6]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<2>_47 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<1>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<0>_50 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<1>_49 ),
    .O(p[5])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<1>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<0>_50 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [5]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<1>_49 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<1>_48 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<1>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [5]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [1]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<1>_49 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_xor<0>  (
    .CI(N1),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<0>_51 ),
    .O(p[4])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<0>  (
    .CI(N1),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [4]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<0>_51 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<0>_50 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<0>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [4]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_lut<0>_51 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<9>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>_52 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [9]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [11])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<8>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<7>_53 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>_rt_253 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [10])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<7>_53 ),
    .DI(N1),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>_rt_253 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>_52 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<7>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<6>_55 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<7>_54 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [9])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<7>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<6>_55 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [9]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<7>_54 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<7>_53 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<7>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [9]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [7]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<7>_54 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<6>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<5>_57 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<6>_56 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [8])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<6>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<5>_57 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [8]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<6>_56 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<6>_55 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<6>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [8]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<6>_56 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<5>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<4>_59 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<5>_58 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [7])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<5>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<4>_59 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [7]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<5>_58 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<5>_57 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<5>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [7]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [5]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<5>_58 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<4>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<3>_61 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<4>_60 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [6])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<4>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<3>_61 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [6]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<4>_60 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<4>_59 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<4>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [6]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<4>_60 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<3>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<2>_63 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<3>_62 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [5])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<3>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<2>_63 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [5]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<3>_62 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<3>_61 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<3>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [5]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [3]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<3>_62 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<2>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<1>_65 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<2>_64 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [4])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<2>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<1>_65 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [4]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<2>_64 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<2>_63 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<2>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [4]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<2>_64 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<1>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<0>_67 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<1>_66 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [3])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<1>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<0>_67 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [3]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<1>_66 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<1>_65 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<1>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [3]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [1]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<1>_66 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_xor<0>  (
    .CI(N1),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<0>_68 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [2])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<0>  (
    .CI(N1),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [2]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<0>_68 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<0>_67 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<0>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<2> [2]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_lut<0>_68 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<9>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>_69 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [9]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [11])
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<8>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<7>_70 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>_rt_254 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [10])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<7>_70 ),
    .DI(N1),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>_rt_254 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>_69 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<7>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<6>_72 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<7>_71 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [9])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<7>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<6>_72 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [9]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<7>_71 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<7>_70 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<7>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [9]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [7]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<7>_71 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<6>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<5>_74 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<6>_73 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [8])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<6>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<5>_74 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [8]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<6>_73 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<6>_72 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<6>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [8]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<6>_73 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<5>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<4>_76 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<5>_75 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [7])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<5>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<4>_76 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [7]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<5>_75 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<5>_74 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<5>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [7]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [5]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<5>_75 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<4>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<3>_78 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<4>_77 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [6])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<4>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<3>_78 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [6]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<4>_77 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<4>_76 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<4>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [6]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<4>_77 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<3>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<2>_80 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<3>_79 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [5])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<3>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<2>_80 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [5]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<3>_79 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<3>_78 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<3>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [5]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [3]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<3>_79 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<2>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<1>_82 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<2>_81 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<0> [4])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<2>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<1>_82 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [4]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<2>_81 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<2>_80 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<2>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [4]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<2>_81 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<1>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<0>_84 ),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<1>_83 ),
    .O(p[3])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<1>  (
    .CI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<0>_84 ),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [3]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<1>_83 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<1>_82 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<1>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [3]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [1]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<1>_83 )
  );
  XORCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_xor<0>  (
    .CI(N1),
    .LI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<0>_85 ),
    .O(p[2])
  );
  MUXCY   \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<0>  (
    .CI(N1),
    .DI(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [2]),
    .S(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<0>_85 ),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<0>_84 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<0>  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<0> [2]),
    .I1(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_lut<0>_85 )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[6]),
    .I1(b[7]),
    .I2(a[7]),
    .I3(b[6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[7].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[5]),
    .I1(b[7]),
    .I2(a[6]),
    .I3(b[6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[6].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[4]),
    .I1(b[7]),
    .I2(a[5]),
    .I3(b[6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[5].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[3]),
    .I1(b[7]),
    .I2(a[4]),
    .I3(b[6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[4].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[2]),
    .I1(b[7]),
    .I2(a[3]),
    .I3(b[6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[3].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[1]),
    .I1(b[7]),
    .I2(a[2]),
    .I3(b[6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[2].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[0]),
    .I1(b[7]),
    .I2(a[1]),
    .I3(b[6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[1].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[6]),
    .I1(b[5]),
    .I2(a[7]),
    .I3(b[4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[7].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[5]),
    .I1(b[5]),
    .I2(a[6]),
    .I3(b[4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[6].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[4]),
    .I1(b[5]),
    .I2(a[5]),
    .I3(b[4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[5].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[3]),
    .I1(b[5]),
    .I2(a[4]),
    .I3(b[4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[4].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[2]),
    .I1(b[5]),
    .I2(a[3]),
    .I3(b[4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[3].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[1]),
    .I1(b[5]),
    .I2(a[2]),
    .I3(b[4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[2].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[0]),
    .I1(b[5]),
    .I2(a[1]),
    .I3(b[4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[1].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[6]),
    .I1(b[3]),
    .I2(a[7]),
    .I3(b[2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[7].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[5]),
    .I1(b[3]),
    .I2(a[6]),
    .I3(b[2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[6].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[4]),
    .I1(b[3]),
    .I2(a[5]),
    .I3(b[2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[5].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[3]),
    .I1(b[3]),
    .I2(a[4]),
    .I3(b[2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[4].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[2]),
    .I1(b[3]),
    .I2(a[3]),
    .I3(b[2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[3].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[1]),
    .I1(b[3]),
    .I2(a[2]),
    .I3(b[2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[2].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[0]),
    .I1(b[3]),
    .I2(a[1]),
    .I3(b[2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[1].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[6]),
    .I1(b[1]),
    .I2(a[7]),
    .I3(b[0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[7].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[5]),
    .I1(b[1]),
    .I2(a[6]),
    .I3(b[0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[6].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[4]),
    .I1(b[1]),
    .I2(a[5]),
    .I3(b[0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[5].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[3]),
    .I1(b[1]),
    .I2(a[4]),
    .I3(b[0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[4].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[2]),
    .I1(b[1]),
    .I2(a[3]),
    .I3(b[0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[3].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[1]),
    .I1(b[1]),
    .I2(a[2]),
    .I3(b[0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[2].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT4 #(
    .INIT ( 16'h7888 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Mxor_NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.lut_sig_xo<0>1  (
    .I0(a[0]),
    .I1(b[1]),
    .I2(a[1]),
    .I3(b[0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[1].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/ai[7]_bi[7]_AND_73_o1  (
    .I0(a[7]),
    .I1(b[7]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[8].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/ai[7]_bi[5]_AND_54_o1  (
    .I0(a[7]),
    .I1(b[5]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[8].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/ai[7]_bi[3]_AND_35_o1  (
    .I0(a[7]),
    .I1(b[3]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[8].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/ai[7]_bi[1]_AND_16_o1  (
    .I0(a[7]),
    .I1(b[1]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[8].ppadd.b_is_even.stageN.lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig1  (
    .I0(a[0]),
    .I1(b[6]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[3].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig1  (
    .I0(a[0]),
    .I1(b[4]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[2].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig1  (
    .I0(a[0]),
    .I1(b[2]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[1].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig1  (
    .I0(a[0]),
    .I1(b[0]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.ppgen[0].carrychain[0].ppadd.b_is_even.stageLSB.lut_sig )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>_rt  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [10]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<10>_rt_250 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_rt  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [9]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<9>_rt_251 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_rt  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/NxM_mult.stage_1_add.sum<1> [8]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_2_add.sum<0><16:4>_Madd_cy<8>_rt_252 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>_rt  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<3> [8]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<1><11:2>_cy<8>_rt_253 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>_rt  (
    .I0(\U0/i_mult/gLUT.gNO_LUT6.iLUT/pp_out<1> [8]),
    .O(\U0/i_mult/gLUT.gNO_LUT6.iLUT/Madd_NxM_mult.stage_1_add.sum<0><11:2>_cy<8>_rt_254 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
