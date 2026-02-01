// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vbitrev__Syms.h"


VL_ATTR_COLD void Vbitrev___024root__trace_init_sub__TOP__0(Vbitrev___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_init_sub__TOP__0\n"); );
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->declBit(c+7,0,"sck",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+8,0,"ss",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+9,0,"mosi",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+10,0,"miso",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("bitrev", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+7,0,"sck",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+8,0,"ss",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+9,0,"mosi",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+10,0,"miso",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+12,0,"IDLE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+13,0,"RECEIVE",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+14,0,"TRANSMIT",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::PARAMETER, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+1,0,"state",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 1,0);
    tracep->declBus(c+2,0,"bit_cnt",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 2,0);
    tracep->declBus(c+3,0,"rx_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBus(c+4,0,"tx_data",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+5,0,"miso_reg",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBus(c+6,0,"reversed_data_next",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1, 7,0);
    tracep->declBit(c+11,0,"test",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vbitrev___024root__trace_init_top(Vbitrev___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_init_top\n"); );
    // Body
    Vbitrev___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vbitrev___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void Vbitrev___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vbitrev___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vbitrev___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void Vbitrev___024root__trace_register(Vbitrev___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_register\n"); );
    // Body
    tracep->addConstCb(&Vbitrev___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&Vbitrev___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&Vbitrev___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&Vbitrev___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vbitrev___024root__trace_const_0_sub_0(Vbitrev___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vbitrev___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_const_0\n"); );
    // Init
    Vbitrev___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vbitrev___024root*>(voidSelf);
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vbitrev___024root__trace_const_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vbitrev___024root__trace_const_0_sub_0(Vbitrev___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_const_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullCData(oldp+12,(0U),2);
    bufp->fullCData(oldp+13,(1U),2);
    bufp->fullCData(oldp+14,(2U),2);
}

VL_ATTR_COLD void Vbitrev___024root__trace_full_0_sub_0(Vbitrev___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vbitrev___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_full_0\n"); );
    // Init
    Vbitrev___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vbitrev___024root*>(voidSelf);
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    Vbitrev___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vbitrev___024root__trace_full_0_sub_0(Vbitrev___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    if (false && vlSelf) {}  // Prevent unused
    Vbitrev__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vbitrev___024root__trace_full_0_sub_0\n"); );
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullCData(oldp+1,(vlSelf->bitrev__DOT__state),2);
    bufp->fullCData(oldp+2,(vlSelf->bitrev__DOT__bit_cnt),3);
    bufp->fullCData(oldp+3,(vlSelf->bitrev__DOT__rx_data),8);
    bufp->fullCData(oldp+4,(vlSelf->bitrev__DOT__tx_data),8);
    bufp->fullBit(oldp+5,(vlSelf->bitrev__DOT__miso_reg));
    bufp->fullCData(oldp+6,(vlSelf->bitrev__DOT__reversed_data_next),8);
    bufp->fullBit(oldp+7,(vlSelf->sck));
    bufp->fullBit(oldp+8,(vlSelf->ss));
    bufp->fullBit(oldp+9,(vlSelf->mosi));
    bufp->fullBit(oldp+10,(vlSelf->miso));
    bufp->fullBit(oldp+11,(vlSelf->bitrev__DOT__test));
}
