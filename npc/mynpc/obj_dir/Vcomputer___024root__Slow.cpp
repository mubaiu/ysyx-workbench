// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcomputer.h for the primary calling header

#include "Vcomputer__pch.h"
#include "Vcomputer__Syms.h"
#include "Vcomputer___024root.h"

void Vcomputer___024root___ctor_var_reset(Vcomputer___024root* vlSelf);

Vcomputer___024root::Vcomputer___024root(Vcomputer__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vcomputer___024root___ctor_var_reset(this);
}

void Vcomputer___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vcomputer___024root::~Vcomputer___024root() {
}
