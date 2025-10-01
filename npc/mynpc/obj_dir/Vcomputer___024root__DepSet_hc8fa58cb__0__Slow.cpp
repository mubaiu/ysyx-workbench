// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcomputer.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vcomputer___024root.h"

VL_ATTR_COLD void Vcomputer___024root___eval_static(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vcomputer___024root___eval_initial(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vtrigrprev__TOP__clock = vlSelf->clock;
}

VL_ATTR_COLD void Vcomputer___024root___eval_final(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_final\n"); );
}

VL_ATTR_COLD void Vcomputer___024root___eval_triggers__stl(Vcomputer___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__stl(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___eval_stl(Vcomputer___024root* vlSelf);

VL_ATTR_COLD void Vcomputer___024root___eval_settle(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_settle\n"); );
    // Init
    CData/*0:0*/ __VstlContinue;
    // Body
    vlSelf->__VstlIterCount = 0U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        __VstlContinue = 0U;
        Vcomputer___024root___eval_triggers__stl(vlSelf);
        if (vlSelf->__VstlTriggered.any()) {
            __VstlContinue = 1U;
            if (VL_UNLIKELY((0x64U < vlSelf->__VstlIterCount))) {
#ifdef VL_DEBUG
                Vcomputer___024root___dump_triggers__stl(vlSelf);
#endif
                VL_FATAL_MT("vsrc/computer.v", 1, "", "Settle region did not converge.");
            }
            vlSelf->__VstlIterCount = ((IData)(1U) 
                                       + vlSelf->__VstlIterCount);
            Vcomputer___024root___eval_stl(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__stl(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VstlTriggered.at(0U)) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(IData/*31:0*/ thispc);
extern const VlUnpacked<CData/*1:0*/, 256> Vcomputer__ConstPool__TABLE_h8742e4d4_0;
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP();

VL_ATTR_COLD void Vcomputer___024root___stl_sequent__TOP__0(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___stl_sequent__TOP__0\n"); );
    // Body
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state 
        = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state;
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake 
        = ((IData)(vlSelf->computer__DOT__cpu__DOT__io_ifu_rready) 
           & ((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
              & (IData)(vlSelf->computer__DOT__io_slave_rvalid)));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake 
        = ((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_bready) 
           & ((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
              & (IData)(vlSelf->computer__DOT__io_slave_bvalid)));
    vlSelf->computer__DOT__io_slave_awvalid = ((3U 
                                                == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                               & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid));
    vlSelf->computer__DOT__io_slave_wvalid = ((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                              & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid));
    vlSelf->computer__DOT__io_slave_arvalid = ((1U 
                                                == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                ? (IData)(vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid)
                                                : (
                                                   (2U 
                                                    == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_arvalid)));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake 
        = (((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
            & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_bready)) 
           & (IData)(vlSelf->computer__DOT__io_slave_bvalid));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake 
        = (((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
             ? (IData)(vlSelf->computer__DOT__cpu__DOT__io_ifu_rready)
             : ((2U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
                & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rready))) 
           & (IData)(vlSelf->computer__DOT__io_slave_rvalid));
    vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid 
        = ((2U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
           & (IData)(vlSelf->computer__DOT__io_slave_rvalid));
    vlSelf->computer__DOT__cpu__DOT__lsu_wmask = 0U;
    vlSelf->computer__DOT__cpu__DOT__alu_op = 0U;
    vlSelf->computer__DOT__cpu__DOT__mem_read = 0U;
    vlSelf->computer__DOT__cpu__DOT__mem_write = 0U;
    vlSelf->computer__DOT__cpu__DOT__reg_write = 0U;
    vlSelf->computer__DOT__cpu__DOT__alu_src = 0U;
    vlSelf->computer__DOT__cpu__DOT__auipc_flag = 0U;
    vlSelf->computer__DOT__cpu__DOT__ecall_en = 0U;
    vlSelf->computer__DOT__cpu__DOT__ebreak_en = 0U;
    vlSelf->computer__DOT__cpu__DOT__mret_en = 0U;
    vlSelf->computer__DOT__cpu__DOT__branch = 0U;
    vlSelf->computer__DOT__cpu__DOT__jal_en = 0U;
    vlSelf->computer__DOT__cpu__DOT__jalr_en = 0U;
    vlSelf->computer__DOT__cpu__DOT__imm = 0U;
    vlSelf->computer__DOT__cpu__DOT__is_csr_op = 0U;
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg = 1U;
    if (vlSelf->computer__DOT__cpu__DOT__inst_valid) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode 
            = (0x7fU & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg);
        vlSelf->computer__DOT__cpu__DOT__funct3 = (7U 
                                                   & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                      >> 0xcU));
        vlSelf->computer__DOT__cpu__DOT__rs2_addr = 
            (0xfU & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                     >> 0x14U));
        vlSelf->computer__DOT__cpu__DOT__rd_addr = 
            (0xfU & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                     >> 7U));
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg 
            = (1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__inst_valid)));
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7 
            = (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
               >> 0x19U);
        vlSelf->computer__DOT__cpu__DOT__rs1_addr = 
            (0xfU & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                     >> 0xfU));
        if ((0x40U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if ((0x20U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((0x10U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((8U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if (vlSelf->reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                        }
                    } else if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if (vlSelf->reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                        }
                    } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                            if ((0U == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
                                if ((0U == (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                            >> 0x14U))) {
                                    vlSelf->computer__DOT__cpu__DOT__ecall_en = 1U;
                                } else if ((1U == (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                   >> 0x14U))) {
                                    vlSelf->computer__DOT__cpu__DOT__ebreak_en = 1U;
                                } else if ((0x302U 
                                            == (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                >> 0x14U))) {
                                    vlSelf->computer__DOT__cpu__DOT__mret_en = 1U;
                                } else {
                                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                                }
                            } else if ((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
                                vlSelf->computer__DOT__cpu__DOT__reg_write = 1U;
                                vlSelf->computer__DOT__cpu__DOT__is_csr_op = 1U;
                                vlSelf->computer__DOT__cpu__DOT__alu_op = 0xcU;
                                vlSelf->computer__DOT__cpu__DOT__imm 
                                    = (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                       >> 0x14U);
                            } else if ((2U == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
                                vlSelf->computer__DOT__cpu__DOT__reg_write = 1U;
                                vlSelf->computer__DOT__cpu__DOT__is_csr_op 
                                    = (0U != (IData)(vlSelf->computer__DOT__cpu__DOT__rs1_addr));
                                vlSelf->computer__DOT__cpu__DOT__alu_op = 0xcU;
                                vlSelf->computer__DOT__cpu__DOT__imm 
                                    = (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                       >> 0x14U);
                            } else {
                                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                            }
                        } else if (vlSelf->reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                        }
                    } else if (vlSelf->reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                    }
                } else if ((8U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                            if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                                vlSelf->computer__DOT__cpu__DOT__reg_write = 1U;
                                vlSelf->computer__DOT__cpu__DOT__jal_en = 1U;
                                vlSelf->computer__DOT__cpu__DOT__alu_src = 1U;
                                vlSelf->computer__DOT__cpu__DOT__alu_op = 0U;
                                vlSelf->computer__DOT__cpu__DOT__imm 
                                    = (((- (IData)(
                                                   (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                    >> 0x1fU))) 
                                        << 0x14U) | 
                                       ((0xff000U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg) 
                                        | ((0x800U 
                                            & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                               >> 9U)) 
                                           | (0x7feU 
                                              & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                 >> 0x14U)))));
                            } else if (vlSelf->reset) {
                                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                            }
                        } else if (vlSelf->reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                        }
                    } else if (vlSelf->reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                    }
                } else if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                            vlSelf->computer__DOT__cpu__DOT__reg_write = 1U;
                            vlSelf->computer__DOT__cpu__DOT__jalr_en = 1U;
                            vlSelf->computer__DOT__cpu__DOT__alu_src = 1U;
                            vlSelf->computer__DOT__cpu__DOT__alu_op = 0U;
                            vlSelf->computer__DOT__cpu__DOT__imm 
                                = (((- (IData)((vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                >> 0x1fU))) 
                                    << 0xcU) | (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                >> 0x14U));
                        } else if (vlSelf->reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                        }
                    } else if (vlSelf->reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                    }
                } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        vlSelf->computer__DOT__cpu__DOT__branch = 1U;
                        vlSelf->computer__DOT__cpu__DOT__alu_src = 0U;
                        if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
                            vlSelf->computer__DOT__cpu__DOT__alu_op 
                                = ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                    ? ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                        ? 0xfU : 0xeU)
                                    : ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                        ? 0xdU : 0xcU));
                        } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                        } else {
                            vlSelf->computer__DOT__cpu__DOT__alu_op 
                                = ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                    ? 0xbU : 0xaU);
                        }
                        vlSelf->computer__DOT__cpu__DOT__imm 
                            = (((- (IData)((vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                            >> 0x1fU))) 
                                << 0xcU) | ((0x800U 
                                             & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                << 4U)) 
                                            | ((0x7e0U 
                                                & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                   >> 0x14U)) 
                                               | (0x1eU 
                                                  & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                     >> 7U)))));
                    } else if (vlSelf->reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                    }
                } else if (vlSelf->reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                }
            } else if (vlSelf->reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
            }
        } else if ((0x20U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if ((0x10U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((8U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if (vlSelf->reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                    }
                } else if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                            vlSelf->computer__DOT__cpu__DOT__reg_write = 1U;
                            vlSelf->computer__DOT__cpu__DOT__alu_op = 0xaU;
                            vlSelf->computer__DOT__cpu__DOT__alu_src = 1U;
                            vlSelf->computer__DOT__cpu__DOT__imm 
                                = (0xfffff000U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg);
                        } else if (vlSelf->reset) {
                            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                        }
                    } else if (vlSelf->reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                    }
                } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        vlSelf->computer__DOT__cpu__DOT__reg_write = 1U;
                        vlSelf->computer__DOT__cpu__DOT__alu_src = 0U;
                        vlSelf->computer__DOT__cpu__DOT__alu_op 
                            = ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                ? ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                    ? ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                        ? 9U : 8U) : 
                                   ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                     ? ((0U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7))
                                         ? 6U : 7U)
                                     : 5U)) : ((2U 
                                                & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                                ? (
                                                   (1U 
                                                    & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                                    ? 4U
                                                    : 3U)
                                                : (
                                                   (1U 
                                                    & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                                    ? 2U
                                                    : 
                                                   ((0U 
                                                     == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7))
                                                     ? 0U
                                                     : 1U))));
                    } else if (vlSelf->reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                    }
                } else if (vlSelf->reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                }
            } else if ((8U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if (vlSelf->reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                }
            } else if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if (vlSelf->reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                }
            } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    vlSelf->computer__DOT__cpu__DOT__alu_src = 1U;
                    vlSelf->computer__DOT__cpu__DOT__mem_write = 1U;
                    vlSelf->computer__DOT__cpu__DOT__alu_op = 0U;
                    vlSelf->computer__DOT__cpu__DOT__imm 
                        = (((- (IData)((vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                        >> 0x1fU))) 
                            << 0xcU) | ((0xfe0U & (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                                   >> 0x14U)) 
                                        | (0x1fU & 
                                           (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                            >> 7U))));
                    vlSelf->computer__DOT__cpu__DOT__lsu_wmask 
                        = ((0U == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                            ? 1U : ((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                     ? 3U : 0xfU));
                } else if (vlSelf->reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                }
            } else if (vlSelf->reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
            }
        } else if ((0x10U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if ((8U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if (vlSelf->reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                }
            } else if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                        vlSelf->computer__DOT__cpu__DOT__reg_write = 1U;
                        vlSelf->computer__DOT__cpu__DOT__alu_op = 0U;
                        vlSelf->computer__DOT__cpu__DOT__auipc_flag = 1U;
                        vlSelf->computer__DOT__cpu__DOT__alu_src = 1U;
                        vlSelf->computer__DOT__cpu__DOT__imm 
                            = (0xfffff000U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg);
                    } else if (vlSelf->reset) {
                        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                    }
                } else if (vlSelf->reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                }
            } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                    vlSelf->computer__DOT__cpu__DOT__imm 
                        = (((- (IData)((vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                        >> 0x1fU))) 
                            << 0xcU) | (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                        >> 0x14U));
                    vlSelf->computer__DOT__cpu__DOT__reg_write = 1U;
                    vlSelf->computer__DOT__cpu__DOT__alu_src = 1U;
                    vlSelf->computer__DOT__cpu__DOT__alu_op 
                        = ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                            ? ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                ? ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                    ? 9U : 8U) : ((1U 
                                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                                   ? 
                                                  ((0U 
                                                    == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7))
                                                    ? 6U
                                                    : 7U)
                                                   : 5U))
                            : ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                ? ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                    ? ((0U == vlSelf->computer__DOT__cpu__DOT__imm)
                                        ? 0xbU : 4U)
                                    : 3U) : ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))
                                              ? 2U : 0U)));
                } else if (vlSelf->reset) {
                    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
                }
            } else if (vlSelf->reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
            }
        } else if ((8U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if (vlSelf->reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
            }
        } else if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if (vlSelf->reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
            }
        } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
            if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode))) {
                vlSelf->computer__DOT__cpu__DOT__alu_src = 1U;
                vlSelf->computer__DOT__cpu__DOT__mem_read = 1U;
                vlSelf->computer__DOT__cpu__DOT__alu_op = 0U;
                vlSelf->computer__DOT__cpu__DOT__imm 
                    = (((- (IData)((vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                                    >> 0x1fU))) << 0xcU) 
                       | (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                          >> 0x14U));
            } else if (vlSelf->reset) {
                Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
            }
        } else if (vlSelf->reset) {
            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
        }
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake 
        = ((IData)(vlSelf->computer__DOT__io_slave_awready) 
           & (IData)(vlSelf->computer__DOT__io_slave_awvalid));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake 
        = ((IData)(vlSelf->computer__DOT__io_slave_wready) 
           & (IData)(vlSelf->computer__DOT__io_slave_wvalid));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake 
        = ((IData)(vlSelf->computer__DOT__io_slave_arready) 
           & (IData)(vlSelf->computer__DOT__io_slave_arvalid));
    vlSelf->__Vtableidx1 = (((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_arvalid) 
                             << 7U) | (((IData)(vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid) 
                                        << 6U) | ((
                                                   ((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid) 
                                                    & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid)) 
                                                   << 5U) 
                                                  | (((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake) 
                                                      << 4U) 
                                                     | (((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake) 
                                                         << 3U) 
                                                        | (((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state) 
                                                            << 1U) 
                                                           | (IData)(vlSelf->reset)))))));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state 
        = Vcomputer__ConstPool__TABLE_h8742e4d4_0[vlSelf->__Vtableidx1];
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake 
        = ((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rready) 
           & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid));
    vlSelf->computer__DOT__cpu__DOT__mem_to_reg = ((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid) 
                                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag));
    if (vlSelf->computer__DOT__cpu__DOT__ebreak_en) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP();
    }
    if (vlSelf->computer__DOT__cpu__DOT__mem_read) {
        vlSelf->computer__DOT__io_slave_size = (((0U 
                                                  == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3)) 
                                                 | (4U 
                                                    == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3)))
                                                 ? 0U
                                                 : 
                                                (((1U 
                                                   == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3)) 
                                                  | (5U 
                                                     == (IData)(vlSelf->computer__DOT__cpu__DOT__funct3)))
                                                  ? 1U
                                                  : 2U));
    } else if (vlSelf->computer__DOT__cpu__DOT__mem_write) {
        vlSelf->computer__DOT__io_slave_size = ((1U 
                                                 == (IData)(vlSelf->computer__DOT__cpu__DOT__lsu_wmask))
                                                 ? 0U
                                                 : 
                                                ((3U 
                                                  == (IData)(vlSelf->computer__DOT__cpu__DOT__lsu_wmask))
                                                  ? 1U
                                                  : 2U));
    }
    vlSelf->computer__DOT__cpu__DOT__load_data = 0U;
    if (((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid) 
         & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag))) {
        if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
            if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
                vlSelf->computer__DOT__cpu__DOT__load_data 
                    = vlSelf->computer__DOT__io_slave_rdata;
            } else if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
                if ((2U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)) {
                    if ((2U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)) {
                        vlSelf->computer__DOT__cpu__DOT__load_data 
                            = (vlSelf->computer__DOT__io_slave_rdata 
                               >> 0x10U);
                    }
                } else {
                    vlSelf->computer__DOT__cpu__DOT__load_data 
                        = (0xffffU & vlSelf->computer__DOT__io_slave_rdata);
                }
            } else {
                vlSelf->computer__DOT__cpu__DOT__load_data 
                    = ((2U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                        ? ((1U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                            ? (vlSelf->computer__DOT__io_slave_rdata 
                               >> 0x18U) : (0xffU & 
                                            (vlSelf->computer__DOT__io_slave_rdata 
                                             >> 0x10U)))
                        : ((1U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                            ? (0xffU & (vlSelf->computer__DOT__io_slave_rdata 
                                        >> 8U)) : (0xffU 
                                                   & vlSelf->computer__DOT__io_slave_rdata)));
            }
        } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
            vlSelf->computer__DOT__cpu__DOT__load_data 
                = vlSelf->computer__DOT__io_slave_rdata;
        } else if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__funct3))) {
            if ((2U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)) {
                if ((2U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)) {
                    vlSelf->computer__DOT__cpu__DOT__load_data 
                        = (((- (IData)((vlSelf->computer__DOT__io_slave_rdata 
                                        >> 0x1fU))) 
                            << 0x10U) | (vlSelf->computer__DOT__io_slave_rdata 
                                         >> 0x10U));
                }
            } else {
                vlSelf->computer__DOT__cpu__DOT__load_data 
                    = (((- (IData)((1U & (vlSelf->computer__DOT__io_slave_rdata 
                                          >> 0xfU)))) 
                        << 0x10U) | (0xffffU & vlSelf->computer__DOT__io_slave_rdata));
            }
        } else {
            vlSelf->computer__DOT__cpu__DOT__load_data 
                = ((2U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                    ? ((1U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                        ? (((- (IData)((vlSelf->computer__DOT__io_slave_rdata 
                                        >> 0x1fU))) 
                            << 8U) | (vlSelf->computer__DOT__io_slave_rdata 
                                      >> 0x18U)) : 
                       (((- (IData)((1U & (vlSelf->computer__DOT__io_slave_rdata 
                                           >> 0x17U)))) 
                         << 8U) | (0xffU & (vlSelf->computer__DOT__io_slave_rdata 
                                            >> 0x10U))))
                    : ((1U & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)
                        ? (((- (IData)((1U & (vlSelf->computer__DOT__io_slave_rdata 
                                              >> 0xfU)))) 
                            << 8U) | (0xffU & (vlSelf->computer__DOT__io_slave_rdata 
                                               >> 8U)))
                        : (((- (IData)((1U & (vlSelf->computer__DOT__io_slave_rdata 
                                              >> 7U)))) 
                            << 8U) | (0xffU & vlSelf->computer__DOT__io_slave_rdata))));
        }
    }
    if (vlSelf->reset) {
        vlSelf->computer__DOT__cpu__DOT__rs1_data = 0U;
        vlSelf->computer__DOT__cpu__DOT__rs2_data = 0U;
    } else {
        vlSelf->computer__DOT__cpu__DOT__rs1_data = 
            ((0U == (IData)(vlSelf->computer__DOT__cpu__DOT__rs1_addr))
              ? 0U : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers
             [vlSelf->computer__DOT__cpu__DOT__rs1_addr]);
        vlSelf->computer__DOT__cpu__DOT__rs2_data = 
            ((0U == (IData)(vlSelf->computer__DOT__cpu__DOT__rs2_addr))
              ? 0U : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers
             [vlSelf->computer__DOT__cpu__DOT__rs2_addr]);
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0 
        = ((IData)(vlSelf->computer__DOT__cpu__DOT__jal_en) 
           | (IData)(vlSelf->computer__DOT__cpu__DOT__jalr_en));
    vlSelf->computer__DOT__cpu__DOT__mret_taken = 0U;
    vlSelf->computer__DOT__cpu__DOT__ecall_taken = 0U;
    vlSelf->computer__DOT__cpu__DOT__mret_target = 0U;
    if (((IData)(vlSelf->computer__DOT__cpu__DOT__mret_en) 
         & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)))) {
        vlSelf->computer__DOT__cpu__DOT__mret_taken = 1U;
        vlSelf->computer__DOT__cpu__DOT__mret_target 
            = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc;
    }
    vlSelf->computer__DOT__cpu__DOT__ecall_target = 0U;
    if (((IData)(vlSelf->computer__DOT__cpu__DOT__ecall_en) 
         & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)))) {
        vlSelf->computer__DOT__cpu__DOT__ecall_taken = 1U;
        vlSelf->computer__DOT__cpu__DOT__ecall_target 
            = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec;
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0 
        = (vlSelf->computer__DOT__cpu__DOT__imm + vlSelf->computer__DOT__cpu__DOT__pc);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
        = (((IData)(vlSelf->computer__DOT__cpu__DOT__auipc_flag) 
            | (IData)(vlSelf->computer__DOT__cpu__DOT__jal_en))
            ? vlSelf->computer__DOT__cpu__DOT__pc : vlSelf->computer__DOT__cpu__DOT__rs1_data);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b 
        = ((IData)(vlSelf->computer__DOT__cpu__DOT__alu_src)
            ? vlSelf->computer__DOT__cpu__DOT__imm : vlSelf->computer__DOT__cpu__DOT__rs2_data);
    vlSelf->computer__DOT__cpu__DOT__alu_result = 0U;
    if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)))) {
        vlSelf->computer__DOT__cpu__DOT__alu_result 
            = ((8U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                ? ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                    ? ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                        ? 0U : ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                 ? 0U : ((0x300U == vlSelf->computer__DOT__cpu__DOT__imm)
                                          ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus
                                          : ((0x341U 
                                              == vlSelf->computer__DOT__cpu__DOT__imm)
                                              ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc
                                              : ((0x342U 
                                                  == vlSelf->computer__DOT__cpu__DOT__imm)
                                                  ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause
                                                  : 
                                                 ((0x305U 
                                                   == vlSelf->computer__DOT__cpu__DOT__imm)
                                                   ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec
                                                   : 
                                                  ((0xb00U 
                                                    == vlSelf->computer__DOT__cpu__DOT__imm)
                                                    ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle
                                                    : 
                                                   ((0xb80U 
                                                     == vlSelf->computer__DOT__cpu__DOT__imm)
                                                     ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh
                                                     : 
                                                    ((0xf11U 
                                                      == vlSelf->computer__DOT__cpu__DOT__imm)
                                                      ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid
                                                      : 
                                                     ((0xf12U 
                                                       == vlSelf->computer__DOT__cpu__DOT__imm)
                                                       ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid
                                                       : 0U))))))))))
                    : ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                        ? ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                            ? (0U == vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a)
                            : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                        : ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                            ? (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                               & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                            : (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                               | vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b))))
                : ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                    ? ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                        ? ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                            ? VL_SHIFTRS_III(32,32,5, vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a, 
                                             (0x1fU 
                                              & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b))
                            : (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                               >> (0x1fU & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)))
                        : ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                            ? (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                               ^ vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                            : (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                               < vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)))
                    : ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                        ? ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                            ? VL_LTS_III(32, vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a, vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                            : (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                               << (0x1fU & vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)))
                        : ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                            ? (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                               - vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)
                            : (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a 
                               + vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b)))));
    }
    if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__mem_read)))) {
        if (vlSelf->computer__DOT__cpu__DOT__mem_write) {
            if ((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__lsu_wmask))) {
                if ((2U & vlSelf->computer__DOT__cpu__DOT__alu_result)) {
                    if ((1U & vlSelf->computer__DOT__cpu__DOT__alu_result)) {
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 8U;
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                            = (vlSelf->computer__DOT__cpu__DOT__rs2_data 
                               << 0x18U);
                    } else {
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 4U;
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                            = (0xff0000U & (vlSelf->computer__DOT__cpu__DOT__rs2_data 
                                            << 0x10U));
                    }
                } else if ((1U & vlSelf->computer__DOT__cpu__DOT__alu_result)) {
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 2U;
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                        = (0xff00U & (vlSelf->computer__DOT__cpu__DOT__rs2_data 
                                      << 8U));
                } else {
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 1U;
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                        = (0xffU & vlSelf->computer__DOT__cpu__DOT__rs2_data);
                }
            } else if ((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__lsu_wmask))) {
                if ((2U & vlSelf->computer__DOT__cpu__DOT__alu_result)) {
                    if ((2U & vlSelf->computer__DOT__cpu__DOT__alu_result)) {
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 0xcU;
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                            = (vlSelf->computer__DOT__cpu__DOT__rs2_data 
                               << 0x10U);
                    }
                } else {
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 3U;
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                        = (0xffffU & vlSelf->computer__DOT__cpu__DOT__rs2_data);
                }
            } else if ((0xfU == (IData)(vlSelf->computer__DOT__cpu__DOT__lsu_wmask))) {
                vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 0xfU;
                vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg 
                    = vlSelf->computer__DOT__cpu__DOT__rs2_data;
            } else {
                vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = 0U;
                vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg = 0U;
            }
        }
    }
    vlSelf->computer__DOT__cpu__DOT__wb_data = (((IData)(vlSelf->computer__DOT__cpu__DOT__jal_en) 
                                                 | (IData)(vlSelf->computer__DOT__cpu__DOT__jalr_en))
                                                 ? 
                                                ((IData)(4U) 
                                                 + vlSelf->computer__DOT__cpu__DOT__pc)
                                                 : 
                                                ((IData)(vlSelf->computer__DOT__cpu__DOT__mem_to_reg)
                                                  ? vlSelf->computer__DOT__cpu__DOT__load_data
                                                  : vlSelf->computer__DOT__cpu__DOT__alu_result));
}

VL_ATTR_COLD void Vcomputer___024root___eval_stl(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_stl\n"); );
    // Body
    if (vlSelf->__VstlTriggered.at(0U)) {
        Vcomputer___024root___stl_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__ico(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VicoTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VicoTriggered.at(0U)) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__act(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VactTriggered.at(0U)) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge clock)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__nba(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VnbaTriggered.at(0U)) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge clock)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vcomputer___024root___ctor_var_reset(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clock = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__io_slave_arvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__io_slave_arready = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__io_slave_rdata = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__io_slave_rresp = VL_RAND_RESET_I(2);
    vlSelf->computer__DOT__io_slave_rvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__io_slave_size = VL_RAND_RESET_I(2);
    vlSelf->computer__DOT__io_slave_awvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__io_slave_wvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__io_slave_awready = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__io_slave_wready = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__io_slave_bresp = VL_RAND_RESET_I(2);
    vlSelf->computer__DOT__io_slave_bvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__pc = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__inst_valid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__rs1_addr = VL_RAND_RESET_I(5);
    vlSelf->computer__DOT__cpu__DOT__rs2_addr = VL_RAND_RESET_I(5);
    vlSelf->computer__DOT__cpu__DOT__rd_addr = VL_RAND_RESET_I(5);
    vlSelf->computer__DOT__cpu__DOT__rs1_data = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__rs2_data = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__wb_data = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__reg_write = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__imm = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__alu_op = VL_RAND_RESET_I(4);
    vlSelf->computer__DOT__cpu__DOT__mem_read = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__mem_write = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__alu_src = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__mem_to_reg = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__branch = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__jal_en = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__jalr_en = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ebreak_en = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ecall_en = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__mret_en = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__auipc_flag = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__is_csr_op = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__lsu_wmask = VL_RAND_RESET_I(4);
    vlSelf->computer__DOT__cpu__DOT__alu_result = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ecall_taken = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ecall_target = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__mret_taken = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__mret_target = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__load_data = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__funct3 = VL_RAND_RESET_I(3);
    vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__io_ifu_rready = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_arvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_rready = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__io_lsu_bready = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = VL_RAND_RESET_I(3);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state = VL_RAND_RESET_I(3);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state = VL_RAND_RESET_I(2);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state = VL_RAND_RESET_I(2);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode = VL_RAND_RESET_I(7);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7 = VL_RAND_RESET_I(7);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 32; ++__Vi0) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0 = 0;
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0 = 0;
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg = VL_RAND_RESET_I(32);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag = VL_RAND_RESET_I(1);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg = VL_RAND_RESET_I(4);
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg = VL_RAND_RESET_I(32);
    vlSelf->__Vtableidx1 = 0;
    vlSelf->__Vtrigrprev__TOP__clock = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
