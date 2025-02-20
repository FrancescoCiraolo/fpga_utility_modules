`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Francesco Ciraolo
// 
// Create Date: 01/24/2024 02:35:32 PM
// Design Name: 
// Module Name: ace_to_axi_and_spares
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ace_to_axi_and_spares # (
        parameter integer   ADDR_WIDTH              = 44 ,
        parameter integer   DATA_WIDTH              = 128,
        parameter integer   ID_WIDTH                = 6  ,
        parameter integer   USER_WIDTH              = 6
    )(
        // Ports of ACE Interface with PL
        // AC channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ACADDR" *)
        output      [    ADDR_WIDTH-1:0] ace_slave_acaddr                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ACPROT" *)
        output      [               2:0] ace_slave_acprot                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ACREADY" *)
        input                          ace_slave_acready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ACSNOOP" *)
        output      [               3:0] ace_slave_acsnoop                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ACVALID" *)
        output                           ace_slave_acvalid                  ,
        // CR channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave CRREADY" *)
        output                           ace_slave_crready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave CRRESP" *)
        input reg [               4:0] ace_slave_crresp                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave CRVALID" *)
        input reg                      ace_slave_crvalid                  ,
        // CD channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave CDDATA" *)
        input     [    DATA_WIDTH-1:0] ace_slave_cddata                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave CDLAST" *)
        input                          ace_slave_cdlast                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave CDREADY" *)
        output                           ace_slave_cdready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave CDVALID" *)
        input                          ace_slave_cdvalid                  ,
        // AR channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARADDR" *)
        input reg [    ADDR_WIDTH-1:0] ace_slave_araddr                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARBAR" *)
        input reg [               1:0] ace_slave_arbar                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARBURST" *)
        input reg [               1:0] ace_slave_arburst                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARCACHE" *)
        input reg [               3:0] ace_slave_arcache                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARDOMAIN" *)
        input reg [               1:0] ace_slave_ardomain                 ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARID" *)
        input reg [  ID_WIDTH - 1 : 0] ace_slave_arid                     ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARLEN" *)
        input reg [               7:0] ace_slave_arlen                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARLOCK" *)
        input reg                      ace_slave_arlock                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARPROT" *)
        input reg [               2:0] ace_slave_arprot                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARQOS" *)
        input reg [               3:0] ace_slave_arqos                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARREADY" *)
        output                           ace_slave_arready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARREGION" *)
        input reg [               3:0] ace_slave_arregion                 ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARSIZE" *)
        input reg [               2:0] ace_slave_arsize                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARSNOOP" *)
        input reg [               3:0] ace_slave_arsnoop                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARUSER" *)
        input reg [USER_WIDTH > 0 ? USER_WIDTH-1 : 1:0] ace_slave_aruser         ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave ARVALID" *)
        input reg                      ace_slave_arvalid                  ,
        // AW channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWADDR" *)
        input     [    ADDR_WIDTH-1:0] ace_slave_awaddr                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWBAR" *)
        input     [               1:0] ace_slave_awbar                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWBURST" *)
        input     [               1:0] ace_slave_awburst                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWCACHE" *)
        input     [               3:0] ace_slave_awcache                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWDOMAIN" *)
        input     [               1:0] ace_slave_awdomain                 ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWID" *)
        input     [  ID_WIDTH - 1 : 0] ace_slave_awid                     ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWLEN" *)
        input     [               7:0] ace_slave_awlen                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWLOCK" *)
        input                          ace_slave_awlock                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWPROT" *)
        input     [               2:0] ace_slave_awprot                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWQOS" *)
        input     [               3:0] ace_slave_awqos                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWREADY" *)
        output                           ace_slave_awready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWREGION" *)
        input     [               3:0] ace_slave_awregion                 ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWSIZE" *)
        input     [               2:0] ace_slave_awsize                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWSNOOP" *)
        input     [               2:0] ace_slave_awsnoop                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWUSER" *)
        input     [              15:0] ace_slave_awuser                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave AWVALID" *)
        input                          ace_slave_awvalid                  ,
        // B channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave BID" *)
        output      [  ID_WIDTH - 1 : 0] ace_slave_bid                      ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave BREADY" *)
        input                          ace_slave_bready                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave BRESP" *)
        output      [               1:0] ace_slave_bresp                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave BUSER" *)
        output  [USER_WIDTH - 1 : 0] ace_slave_buser          ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave BVALID" *)
        output                           ace_slave_bvalid                   ,
        // R channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave RACK" *)
        input reg                      ace_slave_rack                     ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave RDATA" *)
        output      [    DATA_WIDTH-1:0] ace_slave_rdata                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave RID" *)
        output      [  ID_WIDTH - 1 : 0] ace_slave_rid                      ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave RLAST" *)
        output                           ace_slave_rlast                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave RREADY" *)
        input                          ace_slave_rready                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave RRESP" *)
        output      [               3:0] ace_slave_rresp                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave RUSER" *)
        output  [USER_WIDTH - 1 : 0] ace_slave_ruser          ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave RVALID" *)
        output                           ace_slave_rvalid                   ,
        // W channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave WACK" *)
        input reg                      ace_slave_wack                     ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave WDATA" *)
        input     [    DATA_WIDTH-1:0] ace_slave_wdata                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave WLAST" *)
        input                          ace_slave_wlast                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave WREADY" *)
        output                           ace_slave_wready                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave WSTRB" *)
        input     [(DATA_WIDTH/8)-1:0] ace_slave_wstrb                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave WUSER" *)
        input [USER_WIDTH - 1 : 0] ace_slave_wuser          ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_slave WVALID" *)
        input                          ace_slave_wvalid,

        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARADDR" *)
        output  [      ADDR_WIDTH-1:0] axi_master_araddr,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARBURST" *)
        output  [                 1:0] axi_master_arburst,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARCACHE" *)
        output  [                 3:0] axi_master_arcache,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARID" *)
        output  [        ID_WIDTH-1:0] axi_master_arid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARLEN" *)
        output  [                 7:0] axi_master_arlen,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARLOCK" *)
        output   axi_master_arlock,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARPROT" *)
        output  [                 2:0] axi_master_arprot,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARQOS" *)
        output  [                 3:0] axi_master_arqos,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARREADY" *)
        input   axi_master_arready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARREGION" *)
        output  [                 1:0] axi_master_arregion,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARSIZE" *)
        output  [                 2:0] axi_master_arsize,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARUSER" *)
        output  [(USER_WIDTH > 0 ? USER_WIDTH : 1) -1:0] axi_master_aruser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master ARVALID" *)
        output   axi_master_arvalid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWADDR" *)
        output  [      ADDR_WIDTH-1:0] axi_master_awaddr,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWBURST" *)
        output  [                 1:0] axi_master_awburst,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWCACHE" *)
        output  [                 3:0] axi_master_awcache,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWID" *)
        output  [        ID_WIDTH-1:0] axi_master_awid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWLEN" *)
        output  [                 7:0] axi_master_awlen,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWLOCK" *)
        output   axi_master_awlock,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWPROT" *)
        output  [                 2:0] axi_master_awprot,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWQOS" *)
        output  [                 3:0] axi_master_awqos,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWREADY" *)
        input   axi_master_awready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWREGION" *)
        output  [                 1:0] axi_master_awregion,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWSIZE" *)
        output  [                 2:0] axi_master_awsize,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWUSER" *)
        output  [                15:0] axi_master_awuser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master AWVALID" *)
        output   axi_master_awvalid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master BID" *)
        input  [        ID_WIDTH-1:0] axi_master_bid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master BREADY" *)
        output   axi_master_bready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master BRESP" *)
        input  [                 1:0] axi_master_bresp,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master BUSER" *)
        input  [(USER_WIDTH > 0 ? USER_WIDTH : 1) -1:0] axi_master_buser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master BVALID" *)
        input   axi_master_bvalid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master RDATA" *)
        input  [      DATA_WIDTH-1:0] axi_master_rdata,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master RID" *)
        input  [        ID_WIDTH-1:0] axi_master_rid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master RLAST" *)
        input   axi_master_rlast,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master RREADY" *)
        output   axi_master_rready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master RRESP" *)
        input  [                 3:0] axi_master_rresp,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master RUSER" *)
        input  [(USER_WIDTH > 0 ? USER_WIDTH : 1) -1:0] axi_master_ruser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master RVALID" *)
        input   axi_master_rvalid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master WDATA" *)
        output  [      DATA_WIDTH-1:0] axi_master_wdata,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master WLAST" *)
        output   axi_master_wlast,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master WREADY" *)
        input   axi_master_wready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master WSTRB" *)
        output  [  (DATA_WIDTH/8)-1:0] axi_master_wstrb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master WUSER" *)
        output  [(USER_WIDTH > 0 ? USER_WIDTH : 1) -1:0] axi_master_wuser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_master WVALID" *)
        output   axi_master_wvalid,
        
        input  wire [ADDR_WIDTH-1:0]      acaddr,
        input  wire [2:0]                 acprot,
        output wire                       acready,
        input  wire [3:0]                 acsnoop,
        input  wire                       acvalid,
        input  wire                       crready,
        output wire [4:0]                 crresp,
        output wire                       crvalid,
        output wire [DATA_WIDTH-1:0]      cddata,
        output wire                       cdlast,
        input  wire                       cdready,
        output wire                       cdvalid,
        output wire [1:0]                 arbar,
        output wire [1:0]                 ardomain,
        output wire [3:0]                 arregion,
        output wire [3:0]                 arsnoop,
        output wire [1:0]                 awbar,
        output wire [1:0]                 awdomain,
        output wire [3:0]                 awregion,
        output wire [2:0]                 awsnoop,
        output wire                       rack,
        output wire                       wack,
        output wire [5:0]                 wid
    );
    
    assign axi_master_awid = ace_slave_awid;
    assign axi_master_awaddr = ace_slave_awaddr;
    assign axi_master_awlen = ace_slave_awlen;
    assign axi_master_awsize = ace_slave_awsize;
    assign axi_master_awburst = ace_slave_awburst;
    assign axi_master_awlock = ace_slave_awlock;
    assign axi_master_awcache = ace_slave_awcache;
    assign axi_master_awprot = ace_slave_awprot;
    assign axi_master_awqos = ace_slave_awqos;
    assign axi_master_awuser = ace_slave_awuser;
    assign axi_master_awvalid = ace_slave_awvalid;
    assign ace_slave_awready = axi_master_awready;
    assign axi_master_wdata = ace_slave_wdata;
    assign axi_master_wstrb = ace_slave_wstrb;
    assign axi_master_wlast = ace_slave_wlast;
    assign axi_master_wuser = ace_slave_wuser;
    assign axi_master_wvalid = ace_slave_wvalid;
    assign ace_slave_wready = axi_master_wready;
    assign ace_slave_bid = axi_master_bid;
    assign ace_slave_bresp = axi_master_bresp;
    assign ace_slave_buser = axi_master_buser;
    assign ace_slave_bvalid = axi_master_bvalid;
    assign axi_master_bready = ace_slave_bready;
    assign axi_master_arid = ace_slave_arid;
    assign axi_master_araddr = ace_slave_araddr;
    assign axi_master_arlen = ace_slave_arlen;
    assign axi_master_arsize = ace_slave_arsize;
    assign axi_master_arburst = ace_slave_arburst;
    assign axi_master_arlock = ace_slave_arlock;
    assign axi_master_arcache = ace_slave_arcache;
    assign axi_master_arprot = ace_slave_arprot;
    assign axi_master_arqos = ace_slave_arqos;
    assign axi_master_aruser = ace_slave_aruser;
    assign axi_master_arvalid = ace_slave_arvalid;
    assign ace_slave_arready = axi_master_arready;
    assign ace_slave_rid = axi_master_rid;
    assign ace_slave_rdata = axi_master_rdata;
    assign ace_slave_rresp = axi_master_rresp;
    assign ace_slave_rlast = axi_master_rlast;
    assign ace_slave_ruser = axi_master_ruser;
    assign ace_slave_rvalid = axi_master_rvalid;
    assign axi_master_rready = ace_slave_rready;
    
    assign ace_slave_acaddr = acaddr;
    assign ace_slave_acprot = acprot;
    assign acready = ace_slave_acready;
    assign ace_slave_acsnoop = acsnoop;
    assign ace_slave_acvalid = acvalid;
    assign ace_slave_crready = crready;
    assign crresp = ace_slave_crresp;
    assign crvalid = ace_slave_crvalid;
    assign cddata = ace_slave_cddata;
    assign cdlast = ace_slave_cdlast;
    assign ace_slave_cdready = cdready;
    assign cdvalid = ace_slave_cdvalid;
    assign arbar = ace_slave_arbar;
    assign ardomain = ace_slave_ardomain;
    assign arregion = ace_slave_arregion;
    assign arsnoop = ace_slave_arsnoop;
    assign awbar = ace_slave_awbar;
    assign awdomain = ace_slave_awdomain;
    assign awregion = ace_slave_awregion;
    assign awsnoop = ace_slave_awsnoop;
    assign rack = ace_slave_rack;
    assign wack = ace_slave_wack;
endmodule
