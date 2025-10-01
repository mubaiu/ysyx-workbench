// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcomputer.h for the primary calling header

#include "verilated.h"
#include "verilated_dpi.h"

#include "Vcomputer___024root.h"

extern const VlUnpacked<CData/*1:0*/, 256> Vcomputer__ConstPool__TABLE_h8742e4d4_0;
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__invalid_inst_TOP(IData/*31:0*/ thispc);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP();

VL_INLINE_OPT void Vcomputer___024root___ico_sequent__TOP__0(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___ico_sequent__TOP__0\n"); );
    // Body
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

void Vcomputer___024root___eval_ico(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_ico\n"); );
    // Body
    if (vlSelf->__VicoTriggered.at(0U)) {
        Vcomputer___024root___ico_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
}

void Vcomputer___024root___eval_act(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_act\n"); );
}

void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_callfunc_TOP();
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_retfunc_TOP();
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_snpc_TOP(IData/*31:0*/ pc);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_dnpc_TOP(IData/*31:0*/ pc);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_pc_TOP(IData/*31:0*/ pc);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__set_reg_value_TOP(IData/*31:0*/ idx, IData/*31:0*/ val);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_write_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ data);
void Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_read_TOP(IData/*31:0*/ addr, IData/*31:0*/ len, IData/*31:0*/ &vaddr_read__Vfuncrtn);

VL_INLINE_OPT void Vcomputer___024root___nba_sequent__TOP__0(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___nba_sequent__TOP__0\n"); );
    // Init
    IData/*31:0*/ __Vfunc_computer__DOT__sdram__DOT__vaddr_read__40__Vfuncout;
    __Vfunc_computer__DOT__sdram__DOT__vaddr_read__40__Vfuncout = 0;
    IData/*31:0*/ __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg = 0;
    CData/*0:0*/ __Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0;
    __Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0 = 0;
    CData/*4:0*/ __Vdlyvdim0__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16;
    __Vdlyvdim0__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 0;
    IData/*31:0*/ __Vdlyvval__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16;
    __Vdlyvval__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 0;
    CData/*0:0*/ __Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16;
    __Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 0;
    IData/*31:0*/ __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle = 0;
    IData/*31:0*/ __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh = 0;
    // Body
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh 
        = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh;
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle 
        = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle;
    if (vlSelf->computer__DOT__cpu__DOT__jal_en) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_callfunc_TOP();
    }
    if (vlSelf->computer__DOT__cpu__DOT__jalr_en) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__set_retfunc_TOP();
    }
    __Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0 = 0U;
    __Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 0U;
    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_snpc_TOP(
                                                                                ((IData)(4U) 
                                                                                + vlSelf->computer__DOT__cpu__DOT__pc));
    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_dnpc_TOP(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg);
    Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__set_pc_TOP(vlSelf->computer__DOT__cpu__DOT__pc);
    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg 
        = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg;
    if (vlSelf->reset) {
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle = 0U;
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh = 0U;
    } else {
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh 
            = (IData)(((1ULL + (((QData)((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh)) 
                                 << 0x20U) | (QData)((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle)))) 
                       >> 0x20U));
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle 
            = ((IData)(1U) + vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle);
    }
    if (vlSelf->reset) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i = 0x10U;
        __Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0 = 1U;
    } else if ((((IData)(vlSelf->computer__DOT__cpu__DOT__reg_write) 
                 | (IData)(vlSelf->computer__DOT__cpu__DOT__mem_to_reg)) 
                & (0U != (IData)(vlSelf->computer__DOT__cpu__DOT__rd_addr)))) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__set_reg_value_TOP(vlSelf->computer__DOT__cpu__DOT__rd_addr, vlSelf->computer__DOT__cpu__DOT__wb_data);
        __Vdlyvval__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 
            = vlSelf->computer__DOT__cpu__DOT__wb_data;
        __Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 = 1U;
        __Vdlyvdim0__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16 
            = vlSelf->computer__DOT__cpu__DOT__rd_addr;
    }
    if ((1U & (~ (IData)(vlSelf->reset)))) {
        if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
            if ((1U & (~ ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                          >> 1U)))) {
                if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                    if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
                        vlSelf->computer__DOT__cpu__DOT__io_lsu_rready = 1U;
                        vlSelf->computer__DOT__cpu__DOT__io_lsu_arvalid = 0U;
                    }
                    if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake)))) {
                        if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake) {
                            if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake) {
                                vlSelf->computer__DOT__cpu__DOT__io_lsu_bready = 1U;
                                vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid = 0U;
                            }
                            vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid = 0U;
                        }
                    }
                }
            }
        } else if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
            if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake)))) {
                    if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake) {
                        vlSelf->computer__DOT__cpu__DOT__io_lsu_rready = 0U;
                    }
                    if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake)))) {
                        if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake) {
                            vlSelf->computer__DOT__cpu__DOT__io_lsu_bready = 0U;
                        }
                    }
                }
            }
            if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                if (vlSelf->computer__DOT__cpu__DOT__mem_read) {
                    vlSelf->computer__DOT__cpu__DOT__io_lsu_arvalid = 1U;
                }
                if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__mem_read)))) {
                    if (vlSelf->computer__DOT__cpu__DOT__mem_write) {
                        vlSelf->computer__DOT__cpu__DOT__io_lsu_awvalid = 1U;
                        vlSelf->computer__DOT__cpu__DOT__io_lsu_wvalid = 1U;
                    }
                }
            }
        }
    }
    if (vlSelf->computer__DOT__cpu__DOT__mem_read) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag = 1U;
    } else if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__mem_write)))) {
        if (vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid) {
            vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag = 0U;
        }
    }
    if (vlSelf->reset) {
        __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg = 0x80000004U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid = 0x79737978U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid = 0x17d9f53U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg = 1U;
        vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid = 0U;
        vlSelf->computer__DOT__cpu__DOT__io_ifu_rready = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus = 0x1800U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec = 0x80000004U;
        vlSelf->computer__DOT__cpu__DOT__inst_valid = 0U;
    } else {
        if ((1U & (~ ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                      >> 2U)))) {
            if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                    __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg 
                        = ((IData)(vlSelf->computer__DOT__cpu__DOT__mret_taken)
                            ? vlSelf->computer__DOT__cpu__DOT__mret_target
                            : ((IData)(vlSelf->computer__DOT__cpu__DOT__ecall_taken)
                                ? vlSelf->computer__DOT__cpu__DOT__ecall_target
                                : (((~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)) 
                                    & (((IData)(vlSelf->computer__DOT__cpu__DOT__branch) 
                                        & (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                            >> 3U) 
                                           & ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                               ? ((2U 
                                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                    ? 
                                                   (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                    >= vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                    : 
                                                   (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                    < vlSelf->computer__DOT__cpu__DOT__rs2_data))
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                    ? 
                                                   VL_GTES_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                    : 
                                                   VL_LTS_III(32, vlSelf->computer__DOT__cpu__DOT__rs1_data, vlSelf->computer__DOT__cpu__DOT__rs2_data)))
                                               : (((IData)(vlSelf->computer__DOT__cpu__DOT__alu_op) 
                                                   >> 1U) 
                                                  & ((1U 
                                                      & (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op))
                                                      ? 
                                                     (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                      != vlSelf->computer__DOT__cpu__DOT__rs2_data)
                                                      : 
                                                     (vlSelf->computer__DOT__cpu__DOT__rs1_data 
                                                      == vlSelf->computer__DOT__cpu__DOT__rs2_data)))))) 
                                       | (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0)))
                                    ? ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg)
                                        ? 0U : ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h826bb330__0)
                                                 ? 
                                                (((0U 
                                                   == (IData)(vlSelf->computer__DOT__cpu__DOT__alu_op)) 
                                                  & ((IData)(vlSelf->computer__DOT__cpu__DOT__alu_src) 
                                                     & (IData)(vlSelf->computer__DOT__cpu__DOT__jal_en)))
                                                  ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0
                                                  : 
                                                 (0xfffffffeU 
                                                  & (vlSelf->computer__DOT__cpu__DOT__imm 
                                                     + vlSelf->computer__DOT__cpu__DOT__rs1_data)))
                                                 : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgTmp_h8a6dd3c2__0))
                                    : ((IData)(4U) 
                                       + vlSelf->computer__DOT__cpu__DOT__pc))));
                    vlSelf->computer__DOT__cpu__DOT__inst_valid = 1U;
                    vlSelf->computer__DOT__cpu__DOT__inst_valid = 0U;
                } else {
                    vlSelf->computer__DOT__cpu__DOT__inst_valid = 0U;
                    if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake) {
                        vlSelf->computer__DOT__cpu__DOT__inst_valid = 1U;
                    }
                }
                if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                    if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake) {
                        vlSelf->computer__DOT__cpu__DOT__io_ifu_rready = 0U;
                    }
                }
            } else {
                if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                    if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
                        vlSelf->computer__DOT__cpu__DOT__io_ifu_rready = 1U;
                    }
                }
                vlSelf->computer__DOT__cpu__DOT__inst_valid = 0U;
            }
            if ((1U & (~ ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                          >> 1U)))) {
                if ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                    vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid = 1U;
                    if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
                        vlSelf->computer__DOT__cpu__DOT__io_ifu_arvalid = 0U;
                    }
                }
            }
        }
        if (((IData)(vlSelf->computer__DOT__cpu__DOT__mem_read) 
             | (IData)(vlSelf->computer__DOT__cpu__DOT__mem_write))) {
            vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg = 0U;
        } else if (vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid) {
            vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg = 1U;
        }
        if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ecall_en)))) {
            if (vlSelf->computer__DOT__cpu__DOT__is_csr_op) {
                if ((0x300U == vlSelf->computer__DOT__cpu__DOT__imm)) {
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus 
                        = vlSelf->computer__DOT__cpu__DOT__rs1_data;
                }
                if ((0x300U != vlSelf->computer__DOT__cpu__DOT__imm)) {
                    if ((0x341U != vlSelf->computer__DOT__cpu__DOT__imm)) {
                        if ((0x342U != vlSelf->computer__DOT__cpu__DOT__imm)) {
                            if ((0x305U == vlSelf->computer__DOT__cpu__DOT__imm)) {
                                vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec 
                                    = vlSelf->computer__DOT__cpu__DOT__rs1_data;
                            }
                        }
                    }
                }
            }
        }
        if (vlSelf->computer__DOT__cpu__DOT__ecall_en) {
            vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause = 0xbU;
        } else if (vlSelf->computer__DOT__cpu__DOT__is_csr_op) {
            if ((0x300U != vlSelf->computer__DOT__cpu__DOT__imm)) {
                if ((0x341U != vlSelf->computer__DOT__cpu__DOT__imm)) {
                    if ((0x342U == vlSelf->computer__DOT__cpu__DOT__imm)) {
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause 
                            = vlSelf->computer__DOT__cpu__DOT__rs1_data;
                    }
                }
            }
        }
    }
    if (vlSelf->reset) {
        vlSelf->computer__DOT__io_slave_awready = 1U;
        vlSelf->computer__DOT__io_slave_wready = 1U;
        vlSelf->computer__DOT__io_slave_bresp = 0U;
        vlSelf->computer__DOT__io_slave_bvalid = 0U;
    } else if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake) {
        vlSelf->computer__DOT__io_slave_awready = 0U;
        if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake) {
            Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_write_TOP(
                                                                                ((3U 
                                                                                == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                                                 ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg
                                                                                 : 0U), 
                                                                                ((0U 
                                                                                == (IData)(vlSelf->computer__DOT__io_slave_size))
                                                                                 ? 1U
                                                                                 : 
                                                                                ((1U 
                                                                                == (IData)(vlSelf->computer__DOT__io_slave_size))
                                                                                 ? 2U
                                                                                 : 
                                                                                ((2U 
                                                                                == (IData)(vlSelf->computer__DOT__io_slave_size))
                                                                                 ? 4U
                                                                                 : 0U))), 
                                                                                ((3U 
                                                                                == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                                                 ? vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg
                                                                                 : 0U));
            vlSelf->computer__DOT__io_slave_wready = 0U;
            vlSelf->computer__DOT__io_slave_bvalid = 1U;
        }
    } else if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake) {
        vlSelf->computer__DOT__io_slave_bvalid = 0U;
        vlSelf->computer__DOT__io_slave_wready = 1U;
        vlSelf->computer__DOT__io_slave_awready = 1U;
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle 
        = __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle;
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh 
        = __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh;
    if (__Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v0) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[1U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[2U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[3U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[4U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[5U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[6U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[7U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[8U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[9U] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0xaU] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0xbU] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0xcU] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0xdU] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0xeU] = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[0xfU] = 0U;
    }
    if (__Vdlyvset__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers[__Vdlyvdim0__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16] 
            = __Vdlyvval__computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers__v16;
    }
    if (vlSelf->reset) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc = 0U;
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg = 0U;
    } else {
        if (vlSelf->computer__DOT__cpu__DOT__ecall_en) {
            vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc 
                = vlSelf->computer__DOT__cpu__DOT__pc;
        } else if (vlSelf->computer__DOT__cpu__DOT__is_csr_op) {
            if ((0x300U != vlSelf->computer__DOT__cpu__DOT__imm)) {
                if ((0x341U == vlSelf->computer__DOT__cpu__DOT__imm)) {
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc 
                        = vlSelf->computer__DOT__cpu__DOT__rs1_data;
                }
            }
        }
        if ((1U & (~ ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                      >> 2U)))) {
            if ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state))) {
                if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                    if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake) {
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg 
                            = vlSelf->computer__DOT__io_slave_rdata;
                    }
                }
            }
        }
    }
    if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__mem_read)))) {
        if (vlSelf->computer__DOT__cpu__DOT__mem_write) {
            vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg 
                = vlSelf->computer__DOT__cpu__DOT__rs2_data;
        }
    }
    if (vlSelf->reset) {
        vlSelf->computer__DOT__io_slave_arready = 1U;
        vlSelf->computer__DOT__io_slave_rdata = 0U;
        vlSelf->computer__DOT__io_slave_rresp = 0U;
        vlSelf->computer__DOT__io_slave_rvalid = 0U;
    } else if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__vaddr_read_TOP(
                                                                                (0xfffffffcU 
                                                                                & ((1U 
                                                                                == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state))
                                                                                 ? vlSelf->computer__DOT__cpu__DOT__pc
                                                                                 : vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg)), 4U, __Vfunc_computer__DOT__sdram__DOT__vaddr_read__40__Vfuncout);
        vlSelf->computer__DOT__io_slave_rvalid = 1U;
        vlSelf->computer__DOT__io_slave_arready = 0U;
        vlSelf->computer__DOT__io_slave_rdata = __Vfunc_computer__DOT__sdram__DOT__vaddr_read__40__Vfuncout;
    } else if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake) {
        vlSelf->computer__DOT__io_slave_rvalid = 0U;
        vlSelf->computer__DOT__io_slave_arready = 1U;
    }
    if ((1U & (~ (IData)(vlSelf->reset)))) {
        if (((IData)(vlSelf->computer__DOT__cpu__DOT__mem_read) 
             | (IData)(vlSelf->computer__DOT__cpu__DOT__mem_write))) {
            vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg 
                = vlSelf->computer__DOT__cpu__DOT__alu_result;
        }
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state 
        = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state;
    if (vlSelf->reset) {
        vlSelf->computer__DOT__cpu__DOT__pc = 0x80000000U;
    } else if ((1U & (~ ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                         >> 2U)))) {
        if ((1U & (~ ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state) 
                      >> 1U)))) {
            if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state)))) {
                vlSelf->computer__DOT__cpu__DOT__pc 
                    = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg;
            }
        }
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg 
        = __Vdly__computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg;
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
    vlSelf->computer__DOT__cpu__DOT__mem_to_reg = ((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid) 
                                                   & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag));
    if (vlSelf->reset) {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 1U;
    } else if ((4U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state))) {
        if ((1U & (~ ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state) 
                      >> 1U)))) {
            if ((1U & (~ (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state)))) {
                if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake) {
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 2U;
                } else if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake) {
                    if (vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake) {
                        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 2U;
                    }
                } else {
                    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state = 4U;
                }
            }
        }
    } else {
        vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state 
            = ((2U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state))
                ? ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state))
                    ? ((IData)(vlSelf->computer__DOT__cpu__DOT__mem_read)
                        ? 4U : ((IData)(vlSelf->computer__DOT__cpu__DOT__mem_write)
                                 ? 4U : 0U)) : ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake)
                                                 ? 3U
                                                 : 
                                                ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake)
                                                  ? 0U
                                                  : 
                                                 ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake)
                                                   ? 0U
                                                   : 2U))))
                : ((1U & (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state))
                    ? ((IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake)
                        ? 2U : 1U) : 1U));
    }
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake 
        = ((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rready) 
           & (IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_rvalid));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake 
        = ((IData)(vlSelf->computer__DOT__cpu__DOT__io_lsu_bready) 
           & ((3U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
              & (IData)(vlSelf->computer__DOT__io_slave_bvalid)));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake 
        = ((IData)(vlSelf->computer__DOT__io_slave_wready) 
           & (IData)(vlSelf->computer__DOT__io_slave_wvalid));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake 
        = ((IData)(vlSelf->computer__DOT__io_slave_awready) 
           & (IData)(vlSelf->computer__DOT__io_slave_awvalid));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake 
        = ((IData)(vlSelf->computer__DOT__cpu__DOT__io_ifu_rready) 
           & ((1U == (IData)(vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state)) 
              & (IData)(vlSelf->computer__DOT__io_slave_rvalid)));
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake 
        = ((IData)(vlSelf->computer__DOT__io_slave_arready) 
           & (IData)(vlSelf->computer__DOT__io_slave_arvalid));
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
    vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__state 
        = vlSelf->computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state;
    if (vlSelf->computer__DOT__cpu__DOT__ebreak_en) {
        Vcomputer___024root____Vdpiimwrap_computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__ebreak_TOP();
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

void Vcomputer___024root___eval_nba(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_nba\n"); );
    // Body
    if (vlSelf->__VnbaTriggered.at(0U)) {
        Vcomputer___024root___nba_sequent__TOP__0(vlSelf);
        vlSelf->__Vm_traceActivity[2U] = 1U;
    }
}

void Vcomputer___024root___eval_triggers__ico(Vcomputer___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__ico(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG
void Vcomputer___024root___eval_triggers__act(Vcomputer___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__act(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vcomputer___024root___dump_triggers__nba(Vcomputer___024root* vlSelf);
#endif  // VL_DEBUG

void Vcomputer___024root___eval(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval\n"); );
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
        Vcomputer___024root___eval_triggers__ico(vlSelf);
        if (vlSelf->__VicoTriggered.any()) {
            __VicoContinue = 1U;
            if (VL_UNLIKELY((0x64U < vlSelf->__VicoIterCount))) {
#ifdef VL_DEBUG
                Vcomputer___024root___dump_triggers__ico(vlSelf);
#endif
                VL_FATAL_MT("vsrc/computer.v", 1, "", "Input combinational region did not converge.");
            }
            vlSelf->__VicoIterCount = ((IData)(1U) 
                                       + vlSelf->__VicoIterCount);
            Vcomputer___024root___eval_ico(vlSelf);
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
            Vcomputer___024root___eval_triggers__act(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                    Vcomputer___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("vsrc/computer.v", 1, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U) 
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.set(vlSelf->__VactTriggered);
                Vcomputer___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
                Vcomputer___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("vsrc/computer.v", 1, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            Vcomputer___024root___eval_nba(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
void Vcomputer___024root___eval_debug_assertions(Vcomputer___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vcomputer__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcomputer___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
