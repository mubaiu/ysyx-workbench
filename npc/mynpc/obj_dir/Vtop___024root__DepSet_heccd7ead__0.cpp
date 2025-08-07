// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vtop___024root.h"

void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__intake_TOP(IData/*31:0*/ pc, IData/*31:0*/ &intake__Vfuncrtn);
void Vtop___024root____Vdpiimwrap_top__DOT__idu__DOT__invalid_inst_TOP(IData/*31:0*/ thispc);
void Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__ebreak_TOP();
void Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ &vaddr_read__Vfuncrtn);
void Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_write_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ data);

VL_INLINE_OPT void Vtop___024root___ico_sequent__TOP__0(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___ico_sequent__TOP__0\n"); );
    // Body
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
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 1U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__41__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__41__Vfuncout;
        } else if ((5U == (7U & (vlSelf->top__DOT__inst_out 
                                 >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 2U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__42__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__42__Vfuncout;
        } else if ((1U == (7U & (vlSelf->top__DOT__inst_out 
                                 >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 2U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__43__Vfuncout);
            vlSelf->top__DOT__lsu__DOT__temp_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__43__Vfuncout;
            vlSelf->top__DOT__load_data = (((- (IData)(
                                                       (1U 
                                                        & (vlSelf->top__DOT__lsu__DOT__temp_data 
                                                           >> 0xfU)))) 
                                            << 0x10U) 
                                           | (0xffffU 
                                              & vlSelf->top__DOT__lsu__DOT__temp_data));
        } else {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 4U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__44__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__44__Vfuncout;
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

void Vtop___024root___eval_ico(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_ico\n"); );
    // Body
    if (vlSelf->__VicoTriggered.at(0U)) {
        Vtop___024root___ico_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
}

void Vtop___024root___eval_act(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_act\n"); );
}

void Vtop___024root____Vdpiimwrap_top__DOT__set_callfunc_TOP();
void Vtop___024root____Vdpiimwrap_top__DOT__set_retfunc_TOP();
void Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__set_reg_value_TOP(IData/*31:0*/ idx, IData/*31:0*/ val);
void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_snpc_TOP(IData/*31:0*/ pc);
void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_dnpc_TOP(IData/*31:0*/ pc);
void Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_pc_TOP(IData/*31:0*/ pc);

VL_INLINE_OPT void Vtop___024root___nba_sequent__TOP__0(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__0\n"); );
    // Init
    CData/*4:0*/ __Vdlyvdim0__top__DOT__reg_file__DOT__registers__v0;
    __Vdlyvdim0__top__DOT__reg_file__DOT__registers__v0 = 0;
    IData/*31:0*/ __Vdlyvval__top__DOT__reg_file__DOT__registers__v0;
    __Vdlyvval__top__DOT__reg_file__DOT__registers__v0 = 0;
    CData/*0:0*/ __Vdlyvset__top__DOT__reg_file__DOT__registers__v0;
    __Vdlyvset__top__DOT__reg_file__DOT__registers__v0 = 0;
    CData/*0:0*/ __Vdlyvset__top__DOT__reg_file__DOT__registers__v1;
    __Vdlyvset__top__DOT__reg_file__DOT__registers__v1 = 0;
    // Body
    if (vlSelf->top__DOT__jal_en) {
        Vtop___024root____Vdpiimwrap_top__DOT__set_callfunc_TOP();
    }
    if (vlSelf->top__DOT__jalr_en) {
        Vtop___024root____Vdpiimwrap_top__DOT__set_retfunc_TOP();
    }
    __Vdlyvset__top__DOT__reg_file__DOT__registers__v0 = 0U;
    __Vdlyvset__top__DOT__reg_file__DOT__registers__v1 = 0U;
    if (vlSelf->rst) {
        if (((IData)(vlSelf->top__DOT__reg_write) & 
             (0U != (0xfU & (vlSelf->top__DOT__inst_out 
                             >> 7U))))) {
            Vtop___024root____Vdpiimwrap_top__DOT__reg_file__DOT__set_reg_value_TOP(
                                                                                (0xfU 
                                                                                & (vlSelf->top__DOT__inst_out 
                                                                                >> 7U)), vlSelf->top__DOT__wb_data);
            __Vdlyvval__top__DOT__reg_file__DOT__registers__v0 
                = vlSelf->top__DOT__wb_data;
            __Vdlyvset__top__DOT__reg_file__DOT__registers__v0 = 1U;
            __Vdlyvdim0__top__DOT__reg_file__DOT__registers__v0 
                = (0xfU & (vlSelf->top__DOT__inst_out 
                           >> 7U));
        }
    } else {
        vlSelf->top__DOT__reg_file__DOT__i = 0x10U;
        __Vdlyvset__top__DOT__reg_file__DOT__registers__v1 = 1U;
    }
    if (__Vdlyvset__top__DOT__reg_file__DOT__registers__v0) {
        vlSelf->top__DOT__reg_file__DOT__registers[__Vdlyvdim0__top__DOT__reg_file__DOT__registers__v0] 
            = __Vdlyvval__top__DOT__reg_file__DOT__registers__v0;
    }
    if (__Vdlyvset__top__DOT__reg_file__DOT__registers__v1) {
        vlSelf->top__DOT__reg_file__DOT__registers[0U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[1U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[2U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[3U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[4U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[5U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[6U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[7U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[8U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[9U] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[0xaU] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[0xbU] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[0xcU] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[0xdU] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[0xeU] = 0U;
        vlSelf->top__DOT__reg_file__DOT__registers[0xfU] = 0U;
    }
    if (vlSelf->rst) {
        vlSelf->top__DOT__ifu__DOT__mdnpc = vlSelf->top__DOT__ifu__DOT__dnpc;
        vlSelf->top__DOT__exu__DOT__mcause = 0U;
        vlSelf->top__DOT__exu__DOT__mstatus = 0x1800U;
        vlSelf->top__DOT__exu__DOT__mtvec = 0U;
        vlSelf->top__DOT__ifu__DOT__pc_ff = vlSelf->pc;
        vlSelf->top__DOT__ifu__DOT__msnpc = ((IData)(4U) 
                                             + vlSelf->pc);
        vlSelf->top__DOT__exu__DOT__mepc = 0U;
    } else {
        vlSelf->top__DOT__ifu__DOT__mdnpc = 0x80000004U;
        if (vlSelf->top__DOT__ecall_en) {
            vlSelf->top__DOT__exu__DOT__mcause = 0x11U;
            vlSelf->top__DOT__exu__DOT__mepc = vlSelf->pc;
        } else if (vlSelf->top__DOT__is_csr_op) {
            if ((0x300U != (0xfffU & vlSelf->top__DOT__imm))) {
                if ((0x341U != (0xfffU & vlSelf->top__DOT__imm))) {
                    if ((0x342U == (0xfffU & vlSelf->top__DOT__imm))) {
                        vlSelf->top__DOT__exu__DOT__mcause 
                            = vlSelf->top__DOT__rs1_data;
                    }
                }
                if ((0x341U == (0xfffU & vlSelf->top__DOT__imm))) {
                    vlSelf->top__DOT__exu__DOT__mepc 
                        = vlSelf->top__DOT__rs1_data;
                }
            }
        }
        if ((1U & (~ (IData)(vlSelf->top__DOT__ecall_en)))) {
            if (vlSelf->top__DOT__is_csr_op) {
                if ((0x300U == (0xfffU & vlSelf->top__DOT__imm))) {
                    vlSelf->top__DOT__exu__DOT__mstatus 
                        = vlSelf->top__DOT__rs1_data;
                }
                if ((0x300U != (0xfffU & vlSelf->top__DOT__imm))) {
                    if ((0x341U != (0xfffU & vlSelf->top__DOT__imm))) {
                        if ((0x342U != (0xfffU & vlSelf->top__DOT__imm))) {
                            if ((0x305U == (0xfffU 
                                            & vlSelf->top__DOT__imm))) {
                                vlSelf->top__DOT__exu__DOT__mtvec 
                                    = vlSelf->top__DOT__rs1_data;
                            }
                        }
                    }
                }
            }
        }
        vlSelf->top__DOT__ifu__DOT__pc_ff = 0x80000000U;
        vlSelf->top__DOT__ifu__DOT__msnpc = 0x80000004U;
    }
    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_snpc_TOP(vlSelf->top__DOT__ifu__DOT__msnpc);
    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_dnpc_TOP(vlSelf->top__DOT__ifu__DOT__mdnpc);
    Vtop___024root____Vdpiimwrap_top__DOT__ifu__DOT__set_pc_TOP(vlSelf->top__DOT__ifu__DOT__pc_ff);
    vlSelf->pc = ((IData)(vlSelf->rst) ? vlSelf->top__DOT__ifu__DOT__dnpc
                   : 0x80000000U);
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
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 1U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__41__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__41__Vfuncout;
        } else if ((5U == (7U & (vlSelf->top__DOT__inst_out 
                                 >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 2U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__42__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__42__Vfuncout;
        } else if ((1U == (7U & (vlSelf->top__DOT__inst_out 
                                 >> 0xcU)))) {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 2U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__43__Vfuncout);
            vlSelf->top__DOT__lsu__DOT__temp_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__43__Vfuncout;
            vlSelf->top__DOT__load_data = (((- (IData)(
                                                       (1U 
                                                        & (vlSelf->top__DOT__lsu__DOT__temp_data 
                                                           >> 0xfU)))) 
                                            << 0x10U) 
                                           | (0xffffU 
                                              & vlSelf->top__DOT__lsu__DOT__temp_data));
        } else {
            Vtop___024root____Vdpiimwrap_top__DOT__lsu__DOT__vaddr_read_TOP(vlSelf->top__DOT__alu_result, 4U, vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__44__Vfuncout);
            vlSelf->top__DOT__load_data = vlSelf->__Vfunc_top__DOT__lsu__DOT__vaddr_read__44__Vfuncout;
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

void Vtop___024root___eval_nba(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_nba\n"); );
    // Body
    if (vlSelf->__VnbaTriggered.at(0U)) {
        Vtop___024root___nba_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[2U] = 1U;
    }
}

void Vtop___024root___eval_triggers__ico(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__ico(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
void Vtop___024root___eval_triggers__act(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__nba(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

void Vtop___024root___eval(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval\n"); );
    // Init
    CData/*0:0*/ __VicoContinue;
    VlTriggerVec<1> __VpreTriggered;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    vlSelf->__VicoIterCount = 0U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        __VicoContinue = 0U;
        Vtop___024root___eval_triggers__ico(vlSelf);
        if (vlSelf->__VicoTriggered.any()) {
            __VicoContinue = 1U;
            if (VL_UNLIKELY((0x64U < vlSelf->__VicoIterCount))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__ico(vlSelf);
#endif
                VL_FATAL_MT("vsrc/top.v", 1, "", "Input combinational region did not converge.");
            }
            vlSelf->__VicoIterCount = ((IData)(1U) 
                                       + vlSelf->__VicoIterCount);
            Vtop___024root___eval_ico(vlSelf);
        }
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        __VnbaContinue = 0U;
        vlSelf->__VnbaTriggered.clear();
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            vlSelf->__VactContinue = 0U;
            Vtop___024root___eval_triggers__act(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                    Vtop___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("vsrc/top.v", 1, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U) 
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.set(vlSelf->__VactTriggered);
                Vtop___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("vsrc/top.v", 1, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            Vtop___024root___eval_nba(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
void Vtop___024root___eval_debug_assertions(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelf->rst & 0xfeU))) {
        Verilated::overWidthError("rst");}
}
#endif  // VL_DEBUG
