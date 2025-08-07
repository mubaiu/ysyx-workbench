// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop___024root.h"

VL_ATTR_COLD void Vtop___024root___eval_static(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_static\n"); );
}

VL_ATTR_COLD void Vtop___024root___eval_initial(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_initial\n"); );
    // Body
    vlSelf->__Vtrigrprev__TOP__clk = vlSelf->clk;
}

VL_ATTR_COLD void Vtop___024root___eval_final(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_final\n"); );
}

VL_ATTR_COLD void Vtop___024root___eval_triggers__stl(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__stl(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD void Vtop___024root___eval_stl(Vtop___024root* vlSelf);

VL_ATTR_COLD void Vtop___024root___eval_settle(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_settle\n"); );
    // Init
    CData/*0:0*/ __VstlContinue;
    // Body
    vlSelf->__VstlIterCount = 0U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        __VstlContinue = 0U;
        Vtop___024root___eval_triggers__stl(vlSelf);
        if (vlSelf->__VstlTriggered.any()) {
            __VstlContinue = 1U;
            if (VL_UNLIKELY((0x64U < vlSelf->__VstlIterCount))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__stl(vlSelf);
#endif
                VL_FATAL_MT("vsrc/top.v", 1, "", "Settle region did not converge.");
            }
            vlSelf->__VstlIterCount = ((IData)(1U) 
                                       + vlSelf->__VstlIterCount);
            Vtop___024root___eval_stl(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__stl(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VstlTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VstlTriggered.at(0U)) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_snpc_TOP(IData/*31:0*/ pc);
void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_dnpc_TOP(IData/*31:0*/ pc);
void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_pc_TOP(IData/*31:0*/ pc);
void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__intake_TOP(IData/*31:0*/ pc, IData/*31:0*/ &intake__Vfuncrtn);
void Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(IData/*31:0*/ thispc);
void Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__ebreak_TOP();
void Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ &vaddr_read__Vfuncrtn);
void Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_write_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ data);

VL_ATTR_COLD void Vtop___024root___stl_sequent__TOP__0(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___stl_sequent__TOP__0\n"); );
    // Body
    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_snpc_TOP(vlSelf->top__DOT__ifu__DOT__msnpc);
    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_dnpc_TOP(vlSelf->top__DOT__ifu__DOT__mdnpc);
    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_pc_TOP(vlSelf->top__DOT__ifu__DOT__pc_ff);
    if (vlSelf->rst) {
        Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__intake_TOP(vlSelf->pc, vlSelf->__Vfunc_top__DOT__ifu__DOT__intake__2__Vfuncout);
        vlSelf->top__DOT__inst_out = vlSelf->__Vfunc_top__DOT__ifu__DOT__intake__2__Vfuncout;
    } else {
        Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__intake_TOP(0x80000000U, vlSelf->__Vfunc_top__DOT__ifu__DOT__intake__3__Vfuncout);
        vlSelf->top__DOT__inst_out = vlSelf->__Vfunc_top__DOT__ifu__DOT__intake__3__Vfuncout;
    }
    if (vlSelf->rst) {
        vlSelf->top__DOT__rs1_data = ((0U == (0xfU 
                                              & (vlSelf->top__DOT__inst_out 
                                                 >> 0xfU)))
                                       ? 0U : vlSelf->top__DOT__reg_file__DOT__registers
                                      [(0xfU & (vlSelf->top__DOT__inst_out 
                                                >> 0xfU))]);
        vlSelf->top__DOT__rs2_data = ((0U == (0xfU 
                                              & (vlSelf->top__DOT__inst_out 
                                                 >> 0x14U)))
                                       ? 0U : vlSelf->top__DOT__reg_file__DOT__registers
                                      [(0xfU & (vlSelf->top__DOT__inst_out 
                                                >> 0x14U))]);
    } else {
        vlSelf->top__DOT__rs1_data = 0U;
        vlSelf->top__DOT__rs2_data = 0U;
    }
    vlSelf->top__DOT__alu_op = 0U;
    vlSelf->top__DOT__mem_read = 0U;
    vlSelf->top__DOT__mem_write = 0U;
    vlSelf->top__DOT__reg_write = 0U;
    vlSelf->top__DOT__alu_src = 0U;
    vlSelf->top__DOT__auipc_flag = 0U;
    vlSelf->top__DOT__ecall_en = 0U;
    vlSelf->top__DOT__ebreak_en = 0U;
    vlSelf->top__DOT__mret_en = 0U;
    vlSelf->top__DOT__mem_to_reg = 0U;
    vlSelf->top__DOT__branch = 0U;
    vlSelf->top__DOT__jal_en = 0U;
    vlSelf->top__DOT__jalr_en = 0U;
    vlSelf->top__DOT__imm = 0U;
    vlSelf->top__DOT__is_csr_op = 0U;
    if ((0x40U & vlSelf->top__DOT__inst_out)) {
        if ((0x20U & vlSelf->top__DOT__inst_out)) {
            if ((0x10U & vlSelf->top__DOT__inst_out)) {
                if ((8U & vlSelf->top__DOT__inst_out)) {
                    if ((1U & (~ (IData)(vlSelf->rst)))) {
                        Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                    }
                } else if ((4U & vlSelf->top__DOT__inst_out)) {
                    if ((1U & (~ (IData)(vlSelf->rst)))) {
                        Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                    }
                } else if ((2U & vlSelf->top__DOT__inst_out)) {
                    if ((1U & vlSelf->top__DOT__inst_out)) {
                        if ((0U == (7U & (vlSelf->top__DOT__inst_out 
                                          >> 0xcU)))) {
                            if ((0U == (vlSelf->top__DOT__inst_out 
                                        >> 0x14U))) {
                                vlSelf->top__DOT__ecall_en = 1U;
                            } else if ((1U == (vlSelf->top__DOT__inst_out 
                                               >> 0x14U))) {
                                vlSelf->top__DOT__ebreak_en = 1U;
                            } else if ((0x302U == (vlSelf->top__DOT__inst_out 
                                                   >> 0x14U))) {
                                vlSelf->top__DOT__mret_en = 1U;
                            } else {
                                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                            }
                        }
                        if ((1U == (7U & (vlSelf->top__DOT__inst_out 
                                          >> 0xcU)))) {
                            vlSelf->top__DOT__reg_write = 1U;
                            vlSelf->top__DOT__is_csr_op = 1U;
                            vlSelf->top__DOT__alu_op = 0xcU;
                            vlSelf->top__DOT__imm = 
                                (vlSelf->top__DOT__inst_out 
                                 >> 0x14U);
                        } else if ((2U == (7U & (vlSelf->top__DOT__inst_out 
                                                 >> 0xcU)))) {
                            vlSelf->top__DOT__reg_write = 1U;
                            vlSelf->top__DOT__is_csr_op 
                                = (0U != (0xfU & (vlSelf->top__DOT__inst_out 
                                                  >> 0xfU)));
                            vlSelf->top__DOT__alu_op = 0xcU;
                            vlSelf->top__DOT__imm = 
                                (vlSelf->top__DOT__inst_out 
                                 >> 0x14U);
                        } else {
                            Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                        }
                    } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                        Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                    }
                } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                }
            } else if ((8U & vlSelf->top__DOT__inst_out)) {
                if ((4U & vlSelf->top__DOT__inst_out)) {
                    if ((2U & vlSelf->top__DOT__inst_out)) {
                        if ((1U & vlSelf->top__DOT__inst_out)) {
                            vlSelf->top__DOT__reg_write = 1U;
                            vlSelf->top__DOT__jal_en = 1U;
                            vlSelf->top__DOT__alu_src = 1U;
                            vlSelf->top__DOT__alu_op = 0U;
                            vlSelf->top__DOT__imm = 
                                (((- (IData)((vlSelf->top__DOT__inst_out 
                                              >> 0x1fU))) 
                                  << 0x14U) | ((0xff000U 
                                                & vlSelf->top__DOT__inst_out) 
                                               | ((0x800U 
                                                   & (vlSelf->top__DOT__inst_out 
                                                      >> 9U)) 
                                                  | (0x7feU 
                                                     & (vlSelf->top__DOT__inst_out 
                                                        >> 0x14U)))));
                        } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                            Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                        }
                    } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                        Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                    }
                } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                }
            } else if ((4U & vlSelf->top__DOT__inst_out)) {
                if ((2U & vlSelf->top__DOT__inst_out)) {
                    if ((1U & vlSelf->top__DOT__inst_out)) {
                        vlSelf->top__DOT__reg_write = 1U;
                        vlSelf->top__DOT__jalr_en = 1U;
                        vlSelf->top__DOT__alu_src = 1U;
                        vlSelf->top__DOT__alu_op = 0U;
                        vlSelf->top__DOT__imm = (((- (IData)(
                                                             (vlSelf->top__DOT__inst_out 
                                                              >> 0x1fU))) 
                                                  << 0xcU) 
                                                 | (vlSelf->top__DOT__inst_out 
                                                    >> 0x14U));
                    } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                        Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                    }
                } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                }
            } else if ((2U & vlSelf->top__DOT__inst_out)) {
                if ((1U & vlSelf->top__DOT__inst_out)) {
                    vlSelf->top__DOT__branch = 1U;
                    vlSelf->top__DOT__alu_src = 0U;
                    if ((0x4000U & vlSelf->top__DOT__inst_out)) {
                        vlSelf->top__DOT__alu_op = 
                            ((0x2000U & vlSelf->top__DOT__inst_out)
                              ? ((0x1000U & vlSelf->top__DOT__inst_out)
                                  ? 0xfU : 0xeU) : 
                             ((0x1000U & vlSelf->top__DOT__inst_out)
                               ? 0xdU : 0xcU));
                    } else if ((0x2000U & vlSelf->top__DOT__inst_out)) {
                        Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                    } else {
                        vlSelf->top__DOT__alu_op = 
                            ((0x1000U & vlSelf->top__DOT__inst_out)
                              ? 0xbU : 0xaU);
                    }
                    vlSelf->top__DOT__imm = (((- (IData)(
                                                         (vlSelf->top__DOT__inst_out 
                                                          >> 0x1fU))) 
                                              << 0xcU) 
                                             | ((0x800U 
                                                 & (vlSelf->top__DOT__inst_out 
                                                    << 4U)) 
                                                | ((0x7e0U 
                                                    & (vlSelf->top__DOT__inst_out 
                                                       >> 0x14U)) 
                                                   | (0x1eU 
                                                      & (vlSelf->top__DOT__inst_out 
                                                         >> 7U)))));
                } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                }
            } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
            }
        } else if ((1U & (~ (IData)(vlSelf->rst)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
        }
    } else if ((0x20U & vlSelf->top__DOT__inst_out)) {
        if ((0x10U & vlSelf->top__DOT__inst_out)) {
            if ((8U & vlSelf->top__DOT__inst_out)) {
                if ((1U & (~ (IData)(vlSelf->rst)))) {
                    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                }
            } else if ((4U & vlSelf->top__DOT__inst_out)) {
                if ((2U & vlSelf->top__DOT__inst_out)) {
                    if ((1U & vlSelf->top__DOT__inst_out)) {
                        vlSelf->top__DOT__reg_write = 1U;
                        vlSelf->top__DOT__alu_op = 0xaU;
                        vlSelf->top__DOT__alu_src = 1U;
                        vlSelf->top__DOT__imm = (0xfffff000U 
                                                 & vlSelf->top__DOT__inst_out);
                    } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                        Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                    }
                } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                }
            } else if ((2U & vlSelf->top__DOT__inst_out)) {
                if ((1U & vlSelf->top__DOT__inst_out)) {
                    vlSelf->top__DOT__reg_write = 1U;
                    vlSelf->top__DOT__alu_src = 0U;
                    vlSelf->top__DOT__alu_op = ((0x4000U 
                                                 & vlSelf->top__DOT__inst_out)
                                                 ? 
                                                ((0x2000U 
                                                  & vlSelf->top__DOT__inst_out)
                                                  ? 
                                                 ((0x1000U 
                                                   & vlSelf->top__DOT__inst_out)
                                                   ? 9U
                                                   : 8U)
                                                  : 
                                                 ((0x1000U 
                                                   & vlSelf->top__DOT__inst_out)
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (vlSelf->top__DOT__inst_out 
                                                     >> 0x19U))
                                                    ? 6U
                                                    : 7U)
                                                   : 5U))
                                                 : 
                                                ((0x2000U 
                                                  & vlSelf->top__DOT__inst_out)
                                                  ? 
                                                 ((0x1000U 
                                                   & vlSelf->top__DOT__inst_out)
                                                   ? 4U
                                                   : 3U)
                                                  : 
                                                 ((0x1000U 
                                                   & vlSelf->top__DOT__inst_out)
                                                   ? 2U
                                                   : 
                                                  ((0U 
                                                    == 
                                                    (vlSelf->top__DOT__inst_out 
                                                     >> 0x19U))
                                                    ? 0U
                                                    : 1U))));
                } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                }
            } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
            }
        } else if ((8U & vlSelf->top__DOT__inst_out)) {
            if ((1U & (~ (IData)(vlSelf->rst)))) {
                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
            }
        } else if ((4U & vlSelf->top__DOT__inst_out)) {
            if ((1U & (~ (IData)(vlSelf->rst)))) {
                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
            }
        } else if ((2U & vlSelf->top__DOT__inst_out)) {
            if ((1U & vlSelf->top__DOT__inst_out)) {
                vlSelf->top__DOT__alu_src = 1U;
                vlSelf->top__DOT__mem_write = 1U;
                vlSelf->top__DOT__alu_op = 0U;
                vlSelf->top__DOT__imm = (((- (IData)(
                                                     (vlSelf->top__DOT__inst_out 
                                                      >> 0x1fU))) 
                                          << 0xcU) 
                                         | ((0xfe0U 
                                             & (vlSelf->top__DOT__inst_out 
                                                >> 0x14U)) 
                                            | (0x1fU 
                                               & (vlSelf->top__DOT__inst_out 
                                                  >> 7U))));
            } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
            }
        } else if ((1U & (~ (IData)(vlSelf->rst)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
        }
    } else if ((0x10U & vlSelf->top__DOT__inst_out)) {
        if ((8U & vlSelf->top__DOT__inst_out)) {
            if ((1U & (~ (IData)(vlSelf->rst)))) {
                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
            }
        } else if ((4U & vlSelf->top__DOT__inst_out)) {
            if ((2U & vlSelf->top__DOT__inst_out)) {
                if ((1U & vlSelf->top__DOT__inst_out)) {
                    vlSelf->top__DOT__reg_write = 1U;
                    vlSelf->top__DOT__alu_op = 0U;
                    vlSelf->top__DOT__auipc_flag = 1U;
                    vlSelf->top__DOT__alu_src = 1U;
                    vlSelf->top__DOT__imm = (0xfffff000U 
                                             & vlSelf->top__DOT__inst_out);
                } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                    Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
                }
            } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
            }
        } else if ((2U & vlSelf->top__DOT__inst_out)) {
            if ((1U & vlSelf->top__DOT__inst_out)) {
                vlSelf->top__DOT__imm = (((- (IData)(
                                                     (vlSelf->top__DOT__inst_out 
                                                      >> 0x1fU))) 
                                          << 0xcU) 
                                         | (vlSelf->top__DOT__inst_out 
                                            >> 0x14U));
                vlSelf->top__DOT__reg_write = 1U;
                vlSelf->top__DOT__alu_src = 1U;
                vlSelf->top__DOT__alu_op = ((0x4000U 
                                             & vlSelf->top__DOT__inst_out)
                                             ? ((0x2000U 
                                                 & vlSelf->top__DOT__inst_out)
                                                 ? 
                                                ((0x1000U 
                                                  & vlSelf->top__DOT__inst_out)
                                                  ? 9U
                                                  : 8U)
                                                 : 
                                                ((0x1000U 
                                                  & vlSelf->top__DOT__inst_out)
                                                  ? 
                                                 ((0U 
                                                   == 
                                                   (vlSelf->top__DOT__inst_out 
                                                    >> 0x19U))
                                                   ? 6U
                                                   : 7U)
                                                  : 5U))
                                             : ((0x2000U 
                                                 & vlSelf->top__DOT__inst_out)
                                                 ? 
                                                ((0x1000U 
                                                  & vlSelf->top__DOT__inst_out)
                                                  ? 
                                                 ((0U 
                                                   == vlSelf->top__DOT__imm)
                                                   ? 0xbU
                                                   : 4U)
                                                  : 3U)
                                                 : 
                                                ((0x1000U 
                                                  & vlSelf->top__DOT__inst_out)
                                                  ? 2U
                                                  : 0U)));
            } else if ((1U & (~ (IData)(vlSelf->rst)))) {
                Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
            }
        } else if ((1U & (~ (IData)(vlSelf->rst)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
        }
    } else if ((8U & vlSelf->top__DOT__inst_out)) {
        if ((1U & (~ (IData)(vlSelf->rst)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
        }
    } else if ((4U & vlSelf->top__DOT__inst_out)) {
        if ((1U & (~ (IData)(vlSelf->rst)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
        }
    } else if ((2U & vlSelf->top__DOT__inst_out)) {
        if ((1U & vlSelf->top__DOT__inst_out)) {
            vlSelf->top__DOT__reg_write = 1U;
            vlSelf->top__DOT__alu_src = 1U;
            vlSelf->top__DOT__mem_read = 1U;
            vlSelf->top__DOT__mem_to_reg = 1U;
            vlSelf->top__DOT__alu_op = 0U;
            vlSelf->top__DOT__imm = (((- (IData)((vlSelf->top__DOT__inst_out 
                                                  >> 0x1fU))) 
                                      << 0xcU) | (vlSelf->top__DOT__inst_out 
                                                  >> 0x14U));
        } else if ((1U & (~ (IData)(vlSelf->rst)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
        }
    } else if ((1U & (~ (IData)(vlSelf->rst)))) {
        Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(vlSelf->pc);
    }
    vlSelf->ram_wdata = vlSelf->top__DOT__rs2_data;
    if (vlSelf->top__DOT__ebreak_en) {
        Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__ebreak_TOP();
    }
    vlSelf->ram_we = vlSelf->top__DOT__mem_write;
    vlSelf->top__DOT__ecall_taken = 0U;
    vlSelf->top__DOT__ecall_target = 0U;
    if (vlSelf->top__DOT__ecall_en) {
        vlSelf->top__DOT__ecall_taken = 1U;
        vlSelf->top__DOT__ecall_target = vlSelf->top__DOT__exu__DOT__mtvec;
    }
    vlSelf->top__DOT__mret_taken = 0U;
    vlSelf->top__DOT__mret_target = 0U;
    vlSelf->top__DOT__exu__DOT____VdfgTmp_h826bb330__0 
        = ((IData)(vlSelf->top__DOT__jal_en) | (IData)(vlSelf->top__DOT__jalr_en));
    vlSelf->top__DOT__exu__DOT__operand_a = (((IData)(vlSelf->top__DOT__auipc_flag) 
                                              | (IData)(vlSelf->top__DOT__jal_en))
                                              ? vlSelf->pc
                                              : vlSelf->top__DOT__rs1_data);
    vlSelf->top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0 
        = (vlSelf->pc + vlSelf->top__DOT__imm);
    if (vlSelf->top__DOT__mret_en) {
        vlSelf->top__DOT__mret_taken = 1U;
        vlSelf->top__DOT__mret_target = vlSelf->top__DOT__exu__DOT__mepc;
        vlSelf->top__DOT__ifu__DOT__dnpc = vlSelf->top__DOT__mret_target;
    } else {
        vlSelf->top__DOT__ifu__DOT__dnpc = ((IData)(vlSelf->top__DOT__ecall_taken)
                                             ? vlSelf->top__DOT__ecall_target
                                             : ((((IData)(vlSelf->top__DOT__branch) 
                                                  & (((IData)(vlSelf->top__DOT__alu_op) 
                                                      >> 3U) 
                                                     & ((4U 
                                                         & (IData)(vlSelf->top__DOT__alu_op))
                                                         ? 
                                                        ((2U 
                                                          & (IData)(vlSelf->top__DOT__alu_op))
                                                          ? 
                                                         ((1U 
                                                           & (IData)(vlSelf->top__DOT__alu_op))
                                                           ? 
                                                          (vlSelf->top__DOT__rs1_data 
                                                           >= vlSelf->top__DOT__rs2_data)
                                                           : 
                                                          (vlSelf->top__DOT__rs1_data 
                                                           < vlSelf->top__DOT__rs2_data))
                                                          : 
                                                         ((1U 
                                                           & (IData)(vlSelf->top__DOT__alu_op))
                                                           ? 
                                                          VL_GTES_III(32, vlSelf->top__DOT__rs1_data, vlSelf->top__DOT__rs2_data)
                                                           : 
                                                          VL_LTS_III(32, vlSelf->top__DOT__rs1_data, vlSelf->top__DOT__rs2_data)))
                                                         : 
                                                        (((IData)(vlSelf->top__DOT__alu_op) 
                                                          >> 1U) 
                                                         & ((1U 
                                                             & (IData)(vlSelf->top__DOT__alu_op))
                                                             ? 
                                                            (vlSelf->top__DOT__rs1_data 
                                                             != vlSelf->top__DOT__rs2_data)
                                                             : 
                                                            (vlSelf->top__DOT__rs1_data 
                                                             == vlSelf->top__DOT__rs2_data)))))) 
                                                 | (IData)(vlSelf->top__DOT__exu__DOT____VdfgTmp_h826bb330__0))
                                                 ? 
                                                ((IData)(vlSelf->top__DOT__exu__DOT____VdfgTmp_h826bb330__0)
                                                  ? 
                                                 (((0U 
                                                    == (IData)(vlSelf->top__DOT__alu_op)) 
                                                   & ((IData)(vlSelf->top__DOT__alu_src) 
                                                      & (IData)(vlSelf->top__DOT__jal_en)))
                                                   ? vlSelf->top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0
                                                   : 
                                                  (0xfffffffeU 
                                                   & (vlSelf->top__DOT__imm 
                                                      + vlSelf->top__DOT__rs1_data)))
                                                  : vlSelf->top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0)
                                                 : 
                                                ((IData)(4U) 
                                                 + vlSelf->pc)));
    }
    vlSelf->top__DOT__exu__DOT__operand_b = ((IData)(vlSelf->top__DOT__alu_src)
                                              ? vlSelf->top__DOT__imm
                                              : vlSelf->top__DOT__rs2_data);
    vlSelf->top__DOT__alu_result = ((8U & (IData)(vlSelf->top__DOT__alu_op))
                                     ? ((4U & (IData)(vlSelf->top__DOT__alu_op))
                                         ? ((2U & (IData)(vlSelf->top__DOT__alu_op))
                                             ? 0U : 
                                            ((1U & (IData)(vlSelf->top__DOT__alu_op))
                                              ? 0U : 
                                             ((0x300U 
                                               == vlSelf->top__DOT__imm)
                                               ? vlSelf->top__DOT__exu__DOT__mstatus
                                               : ((0x341U 
                                                   == vlSelf->top__DOT__imm)
                                                   ? vlSelf->top__DOT__exu__DOT__mepc
                                                   : 
                                                  ((0x342U 
                                                    == vlSelf->top__DOT__imm)
                                                    ? vlSelf->top__DOT__exu__DOT__mcause
                                                    : 
                                                   ((0x305U 
                                                     == vlSelf->top__DOT__imm)
                                                     ? vlSelf->top__DOT__exu__DOT__mtvec
                                                     : 0U))))))
                                         : ((2U & (IData)(vlSelf->top__DOT__alu_op))
                                             ? ((1U 
                                                 & (IData)(vlSelf->top__DOT__alu_op))
                                                 ? 
                                                (0U 
                                                 == vlSelf->top__DOT__exu__DOT__operand_a)
                                                 : vlSelf->top__DOT__exu__DOT__operand_b)
                                             : ((1U 
                                                 & (IData)(vlSelf->top__DOT__alu_op))
                                                 ? 
                                                (vlSelf->top__DOT__exu__DOT__operand_a 
                                                 & vlSelf->top__DOT__exu__DOT__operand_b)
                                                 : 
                                                (vlSelf->top__DOT__exu__DOT__operand_a 
                                                 | vlSelf->top__DOT__exu__DOT__operand_b))))
                                     : ((4U & (IData)(vlSelf->top__DOT__alu_op))
                                         ? ((2U & (IData)(vlSelf->top__DOT__alu_op))
                                             ? ((1U 
                                                 & (IData)(vlSelf->top__DOT__alu_op))
                                                 ? 
                                                VL_SHIFTRS_III(32,32,5, vlSelf->top__DOT__exu__DOT__operand_a, 
                                                               (0x1fU 
                                                                & vlSelf->top__DOT__exu__DOT__operand_b))
                                                 : 
                                                (vlSelf->top__DOT__exu__DOT__operand_a 
                                                 >> 
                                                 (0x1fU 
                                                  & vlSelf->top__DOT__exu__DOT__operand_b)))
                                             : ((1U 
                                                 & (IData)(vlSelf->top__DOT__alu_op))
                                                 ? 
                                                (vlSelf->top__DOT__exu__DOT__operand_a 
                                                 ^ vlSelf->top__DOT__exu__DOT__operand_b)
                                                 : 
                                                (vlSelf->top__DOT__exu__DOT__operand_a 
                                                 < vlSelf->top__DOT__exu__DOT__operand_b)))
                                         : ((2U & (IData)(vlSelf->top__DOT__alu_op))
                                             ? ((1U 
                                                 & (IData)(vlSelf->top__DOT__alu_op))
                                                 ? 
                                                VL_LTS_III(32, vlSelf->top__DOT__exu__DOT__operand_a, vlSelf->top__DOT__exu__DOT__operand_b)
                                                 : 
                                                (vlSelf->top__DOT__exu__DOT__operand_a 
                                                 << 
                                                 (0x1fU 
                                                  & vlSelf->top__DOT__exu__DOT__operand_b)))
                                             : ((1U 
                                                 & (IData)(vlSelf->top__DOT__alu_op))
                                                 ? 
                                                (vlSelf->top__DOT__exu__DOT__operand_a 
                                                 - vlSelf->top__DOT__exu__DOT__operand_b)
                                                 : 
                                                (vlSelf->top__DOT__exu__DOT__operand_a 
                                                 + vlSelf->top__DOT__exu__DOT__operand_b)))));
    vlSelf->ram_addr = vlSelf->top__DOT__alu_result;
    if (vlSelf->top__DOT__mem_read) {
        vlSelf->top__DOT__lsu__DOT__temp_data = 0U;
        if ((4U == (7U & (vlSelf->top__DOT__inst_out 
                          >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 1U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__42__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__42__Vfuncout;
        } else if ((5U == (7U & (vlSelf->top__DOT__inst_out 
                                 >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 2U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__43__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__43__Vfuncout;
        } else if ((1U == (7U & (vlSelf->top__DOT__inst_out 
                                 >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 2U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__44__Vfuncout);
            vlSelf->top__DOT__lsu__DOT__temp_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__44__Vfuncout;
            vlSelf->top__DOT__load_data = (((- (IData)(
                                                       (1U 
                                                        & (vlSelf->top__DOT__lsu__DOT__temp_data 
                                                           >> 0xfU)))) 
                                            << 0x10U) 
                                           | (0xffffU 
                                              & vlSelf->top__DOT__lsu__DOT__temp_data));
        } else {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 4U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__45__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__45__Vfuncout;
        }
    } else if (vlSelf->top__DOT__mem_write) {
        if ((0U == (7U & (vlSelf->top__DOT__inst_out 
                          >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_write_TOP(vlSelf->top__DOT__alu_result, 1U, vlSelf->top__DOT__rs2_data);
        } else if ((1U == (7U & (vlSelf->top__DOT__inst_out 
                                 >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_write_TOP(vlSelf->top__DOT__alu_result, 2U, vlSelf->top__DOT__rs2_data);
        } else {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_write_TOP(vlSelf->top__DOT__alu_result, 4U, vlSelf->top__DOT__rs2_data);
        }
        vlSelf->top__DOT__load_data = 0U;
    } else {
        vlSelf->top__DOT__load_data = 0U;
    }
    vlSelf->top__DOT__wb_data = (((IData)(vlSelf->top__DOT__jal_en) 
                                  | (IData)(vlSelf->top__DOT__jalr_en))
                                  ? ((IData)(4U) + vlSelf->pc)
                                  : ((IData)(vlSelf->top__DOT__mem_to_reg)
                                      ? vlSelf->top__DOT__load_data
                                      : vlSelf->top__DOT__alu_result));
}

VL_ATTR_COLD void Vtop___024root___eval_stl(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_stl\n"); );
    // Body
    if (vlSelf->__VstlTriggered.at(0U)) {
        Vtop___024root___stl_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[2U] = 1U;
        vlSelf->__Vm_traceActivity[1U] = 1U;
        vlSelf->__Vm_traceActivity[0U] = 1U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__ico\n"); );
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
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VactTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VactTriggered.at(0U)) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge clk)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__nba(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___dump_triggers__nba\n"); );
    // Body
    if ((1U & (~ (IData)(vlSelf->__VnbaTriggered.any())))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if (vlSelf->__VnbaTriggered.at(0U)) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge clk)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vtop___024root___ctor_var_reset(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->rst = VL_RAND_RESET_I(1);
    vlSelf->pc = VL_RAND_RESET_I(32);
    vlSelf->ram_we = VL_RAND_RESET_I(1);
    vlSelf->ram_addr = VL_RAND_RESET_I(32);
    vlSelf->ram_wdata = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__inst_out = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__rs1_data = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__rs2_data = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__wb_data = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__reg_write = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__imm = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__alu_op = VL_RAND_RESET_I(4);
    vlSelf->top__DOT__mem_read = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__mem_write = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__alu_src = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__mem_to_reg = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__branch = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__jal_en = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__jalr_en = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__ebreak_en = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__ecall_en = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__mret_en = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__auipc_flag = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__is_csr_op = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__alu_result = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__ecall_taken = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__ecall_target = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__mret_taken = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__mret_target = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__load_data = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__ifu__DOT__pc_ff = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__ifu__DOT__dnpc = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__ifu__DOT__msnpc = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__ifu__DOT__mdnpc = VL_RAND_RESET_I(32);
    for (int __Vi0 = 0; __Vi0 < 32; ++__Vi0) {
        vlSelf->top__DOT__reg_file__DOT__registers[__Vi0] = VL_RAND_RESET_I(32);
    }
    vlSelf->top__DOT__reg_file__DOT__i = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__exu__DOT__operand_a = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__exu__DOT__operand_b = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__exu__DOT__mstatus = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__exu__DOT__mepc = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__exu__DOT__mcause = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__exu__DOT__mtvec = VL_RAND_RESET_I(32);
    vlSelf->top__DOT__exu__DOT____VdfgTmp_h826bb330__0 = 0;
    vlSelf->top__DOT__exu__DOT____VdfgTmp_h8a6dd3c2__0 = 0;
    vlSelf->top__DOT__lsu__DOT__temp_data = VL_RAND_RESET_I(32);
    vlSelf->__Vfunc_top__DOT__ifu__DOT__intake__2__Vfuncout = 0;
    vlSelf->__Vfunc_top__DOT__ifu__DOT__intake__3__Vfuncout = 0;
    vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__42__Vfuncout = 0;
    vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__43__Vfuncout = 0;
    vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__44__Vfuncout = 0;
    vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__45__Vfuncout = 0;
    vlSelf->__Vtrigrprev__TOP__clk = VL_RAND_RESET_I(1);
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
