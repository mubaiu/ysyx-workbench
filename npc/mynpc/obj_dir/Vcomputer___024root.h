// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vcomputer.h for the primary calling header

#ifndef VERILATED_VCOMPUTER___024ROOT_H_
#define VERILATED_VCOMPUTER___024ROOT_H_  // guard

#include "verilated.h"


class Vcomputer__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vcomputer___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        VL_IN8(clock,0,0);
        VL_IN8(reset,0,0);
        CData/*0:0*/ computer__DOT__io_slave_arready;
        CData/*1:0*/ computer__DOT__io_slave_rresp;
        CData/*0:0*/ computer__DOT__io_slave_rvalid;
        CData/*1:0*/ computer__DOT__io_slave_size;
        CData/*0:0*/ computer__DOT__io_slave_awready;
        CData/*0:0*/ computer__DOT__io_slave_wready;
        CData/*1:0*/ computer__DOT__io_slave_bresp;
        CData/*0:0*/ computer__DOT__io_slave_bvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__inst_valid;
        CData/*4:0*/ computer__DOT__cpu__DOT__rs1_addr;
        CData/*4:0*/ computer__DOT__cpu__DOT__rs2_addr;
        CData/*4:0*/ computer__DOT__cpu__DOT__rd_addr;
        CData/*0:0*/ computer__DOT__cpu__DOT__reg_write;
        CData/*3:0*/ computer__DOT__cpu__DOT__alu_op;
        CData/*0:0*/ computer__DOT__cpu__DOT__mem_read;
        CData/*0:0*/ computer__DOT__cpu__DOT__mem_write;
        CData/*0:0*/ computer__DOT__cpu__DOT__alu_src;
        CData/*0:0*/ computer__DOT__cpu__DOT__branch;
        CData/*0:0*/ computer__DOT__cpu__DOT__jal_en;
        CData/*0:0*/ computer__DOT__cpu__DOT__jalr_en;
        CData/*0:0*/ computer__DOT__cpu__DOT__ebreak_en;
        CData/*0:0*/ computer__DOT__cpu__DOT__ecall_en;
        CData/*0:0*/ computer__DOT__cpu__DOT__mret_en;
        CData/*0:0*/ computer__DOT__cpu__DOT__auipc_flag;
        CData/*0:0*/ computer__DOT__cpu__DOT__is_csr_op;
        CData/*3:0*/ computer__DOT__cpu__DOT__lsu_wmask;
        CData/*2:0*/ computer__DOT__cpu__DOT__funct3;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_ifu_arvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_ifu_rready;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_lsu_arvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_lsu_rready;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_lsu_awvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_lsu_wvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_lsu_bready;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_clint_arready;
        CData/*0:0*/ computer__DOT__cpu__DOT__io_clint_rvalid;
        CData/*1:0*/ computer__DOT__cpu__DOT__io_clint_rresp;
        CData/*2:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__next_state;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ar_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__ifu_r_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_r_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__aw_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__w_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__lsu_b_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_arvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_arvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_awvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_master_wvalid;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__is_clint_access;
        CData/*2:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__state;
        CData/*2:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__next_state;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__r_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__b_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__clint_r_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_handshake;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__ar_ready;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__read_req;
        CData/*6:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__opcode;
        CData/*6:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__funct7;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IDU__DOT__idu_ready_reg;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__ecall_taken;
    };
    struct {
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mret_taken;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_0;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__mem_to_reg;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__lsu_ready_reg;
        CData/*0:0*/ computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__load_flag;
        CData/*3:0*/ computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wstrb_reg;
        CData/*0:0*/ computer__DOT__sdram__DOT__ar_handshake;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __VicoFirstIteration;
        CData/*0:0*/ __Vtrigprevexpr___TOP__clock__0;
        CData/*0:0*/ __VactContinue;
        SData/*10:0*/ __Vtableidx1;
        IData/*31:0*/ computer__DOT__io_slave_rdata;
        IData/*31:0*/ computer__DOT__cpu__DOT__pc;
        IData/*31:0*/ computer__DOT__cpu__DOT__rs1_data;
        IData/*31:0*/ computer__DOT__cpu__DOT__rs2_data;
        IData/*31:0*/ computer__DOT__cpu__DOT__imm;
        IData/*31:0*/ computer__DOT__cpu__DOT__load_data;
        IData/*31:0*/ computer__DOT__cpu__DOT__io_clint_rdata;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__dnpc_reg;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_IFU__DOT__inst_reg;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_lsu_rdata;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_Arbiter__DOT__io_clint_araddr;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__read_addr;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__rd_data;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__i;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__alu_result;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_a;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__operand_b;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mstatus;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mepc;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcause;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mtvec;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycle;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mcycleh;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__mvendorid;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT__marchid;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_EXU__DOT____VdfgRegularize_haeb391f3_0_1;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__addr_reg;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__store_data_reg;
        IData/*31:0*/ computer__DOT__cpu__DOT__ysyx_25010003_LSU__DOT__io_lsu_wdata_reg;
        IData/*31:0*/ __VactIterCount;
        QData/*63:0*/ computer__DOT__cpu__DOT__ysyx_25010003_CLINT__DOT__mtime;
        VlUnpacked<IData/*31:0*/, 32> computer__DOT__cpu__DOT__ysyx_25010003_REG__DOT__registers;
        VlUnpacked<CData/*0:0*/, 3> __Vm_traceActivity;
    };
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vcomputer__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vcomputer___024root(Vcomputer__Syms* symsp, const char* v__name);
    ~Vcomputer___024root();
    VL_UNCOPYABLE(Vcomputer___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
