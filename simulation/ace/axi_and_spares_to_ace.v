`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Francesco Ciraolo
// 
// Create Date: 20/02/2025 04:11:32 PM
// Design Name: 
// Module Name: axi_and_spares_to_ace
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


module axi_and_spares_to_ace # (
        parameter integer   ADDR_WIDTH              = 44 ,
        parameter integer   DATA_WIDTH              = 128,
        parameter integer   ID_WIDTH                = 6  ,
        parameter integer   USER_WIDTH              = 6
    )(
        // AC channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ACADDR" *)
        input      [    ADDR_WIDTH-1:0] ace_master_acaddr                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ACPROT" *)
        input      [               2:0] ace_master_acprot                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ACREADY" *)
        output                          ace_master_acready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ACSNOOP" *)
        input      [               3:0] ace_master_acsnoop                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ACVALID" *)
        input                           ace_master_acvalid                  ,
        // CR channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master CRREADY" *)
        input                           ace_master_crready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master CRRESP" *)
        output reg [               4:0] ace_master_crresp                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master CRVALID" *)
        output reg                      ace_master_crvalid                  ,
        // CD channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master CDDATA" *)
        output     [    DATA_WIDTH-1:0] ace_master_cddata                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master CDLAST" *)
        output                          ace_master_cdlast                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master CDREADY" *)
        input                           ace_master_cdready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master CDVALID" *)
        output                          ace_master_cdvalid                  ,
        // AR channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARADDR" *)
        output reg [    ADDR_WIDTH-1:0] ace_master_araddr                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARBAR" *)
        output reg [               1:0] ace_master_arbar                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARBURST" *)
        output reg [               1:0] ace_master_arburst                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARCACHE" *)
        output reg [               3:0] ace_master_arcache                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARDOMAIN" *)
        output reg [               1:0] ace_master_ardomain                 ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARID" *)
        output reg [  ID_WIDTH - 1 : 0] ace_master_arid                     ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARLEN" *)
        output reg [               7:0] ace_master_arlen                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARLOCK" *)
        output reg                      ace_master_arlock                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARPROT" *)
        output reg [               2:0] ace_master_arprot                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARQOS" *)
        output reg [               3:0] ace_master_arqos                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARREADY" *)
        input                           ace_master_arready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARREGION" *)
        output reg [               3:0] ace_master_arregion                 ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARSIZE" *)
        output reg [               2:0] ace_master_arsize                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARSNOOP" *)
        output reg [               3:0] ace_master_arsnoop                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARUSER" *)
        output reg [USER_WIDTH > 0 ? USER_WIDTH-1 : 1:0] ace_master_aruser         ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master ARVALID" *)
        output reg                      ace_master_arvalid                  ,
        // AW channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWADDR" *)
        output     [    ADDR_WIDTH-1:0] ace_master_awaddr                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWBAR" *)
        output     [               1:0] ace_master_awbar                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWBURST" *)
        output     [               1:0] ace_master_awburst                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWCACHE" *)
        output     [               3:0] ace_master_awcache                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWDOMAIN" *)
        output     [               1:0] ace_master_awdomain                 ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWID" *)
        output     [  ID_WIDTH - 1 : 0] ace_master_awid                     ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWLEN" *)
        output     [               7:0] ace_master_awlen                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWLOCK" *)
        output                          ace_master_awlock                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWPROT" *)
        output     [               2:0] ace_master_awprot                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWQOS" *)
        output     [               3:0] ace_master_awqos                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWREADY" *)
        input                           ace_master_awready                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWREGION" *)
        output     [               3:0] ace_master_awregion                 ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWSIZE" *)
        output     [               2:0] ace_master_awsize                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWSNOOP" *)
        output     [               2:0] ace_master_awsnoop                  ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWUSER" *)
        output     [              15:0] ace_master_awuser                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master AWVALID" *)
        output                          ace_master_awvalid                  ,
        // B channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master BID" *)
        input      [  ID_WIDTH - 1 : 0] ace_master_bid                      ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master BREADY" *)
        output                          ace_master_bready                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master BRESP" *)
        input      [               1:0] ace_master_bresp                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master BUSER" *)
        input  [USER_WIDTH - 1 : 0] ace_master_buser          ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master BVALID" *)
        input                           ace_master_bvalid                   ,
        // R channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master RACK" *)
        output reg                      ace_master_rack                     ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master RDATA" *)
        input      [    DATA_WIDTH-1:0] ace_master_rdata                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master RID" *)
        input      [  ID_WIDTH - 1 : 0] ace_master_rid                      ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master RLAST" *)
        input                           ace_master_rlast                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master RREADY" *)
        output                          ace_master_rready                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master RRESP" *)
        input      [               3:0] ace_master_rresp                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master RUSER" *)
        input  [USER_WIDTH - 1 : 0] ace_master_ruser          ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master RVALID" *)
        input                           ace_master_rvalid                   ,
        // W channel
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master WACK" *)
        output reg                      ace_master_wack                     ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master WDATA" *)
        output     [    DATA_WIDTH-1:0] ace_master_wdata                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master WLAST" *)
        output                          ace_master_wlast                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master WREADY" *)
        input                           ace_master_wready                   ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master WSTRB" *)
        output     [(DATA_WIDTH/8)-1:0] ace_master_wstrb                    ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master WUSER" *)
        output [USER_WIDTH - 1 : 0] ace_master_wuser          ,
        (* X_INTERFACE_INFO = "xilinx.com:interface:acemm:1.0 ace_master WVALID" *)
        output                          ace_master_wvalid,

        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARADDR" *)
        input  [      ADDR_WIDTH-1:0] axi_slave_araddr,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARBURST" *)
        input  [                 1:0] axi_slave_arburst,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARCACHE" *)
        input  [                 3:0] axi_slave_arcache,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARID" *)
        input  [        ID_WIDTH-1:0] axi_slave_arid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARLEN" *)
        input  [                 7:0] axi_slave_arlen,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARLOCK" *)
        input   axi_slave_arlock,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARPROT" *)
        input  [                 2:0] axi_slave_arprot,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARQOS" *)
        input  [                 3:0] axi_slave_arqos,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARREADY" *)
        output   axi_slave_arready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARREGION" *)
        input  [                 1:0] axi_slave_arregion,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARSIZE" *)
        input  [                 2:0] axi_slave_arsize,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARUSER" *)
        input  [(USER_WIDTH > 0 ? USER_WIDTH : 1) -1:0] axi_slave_aruser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave ARVALID" *)
        input   axi_slave_arvalid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWADDR" *)
        input  [      ADDR_WIDTH-1:0] axi_slave_awaddr,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWBURST" *)
        input  [                 1:0] axi_slave_awburst,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWCACHE" *)
        input  [                 3:0] axi_slave_awcache,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWID" *)
        input  [        ID_WIDTH-1:0] axi_slave_awid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWLEN" *)
        input  [                 7:0] axi_slave_awlen,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWLOCK" *)
        input   axi_slave_awlock,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWPROT" *)
        input  [                 2:0] axi_slave_awprot,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWQOS" *)
        input  [                 3:0] axi_slave_awqos,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWREADY" *)
        output   axi_slave_awready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWREGION" *)
        input  [                 1:0] axi_slave_awregion,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWSIZE" *)
        input  [                 2:0] axi_slave_awsize,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWUSER" *)
        input  [                15:0] axi_slave_awuser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave AWVALID" *)
        input   axi_slave_awvalid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave BID" *)
        output  [        ID_WIDTH-1:0] axi_slave_bid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave BREADY" *)
        input   axi_slave_bready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave BRESP" *)
        output  [                 1:0] axi_slave_bresp,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave BUSER" *)
        output  [(USER_WIDTH > 0 ? USER_WIDTH : 1) -1:0] axi_slave_buser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave BVALID" *)
        output   axi_slave_bvalid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave RDATA" *)
        output  [      DATA_WIDTH-1:0] axi_slave_rdata,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave RID" *)
        output  [        ID_WIDTH-1:0] axi_slave_rid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave RLAST" *)
        output   axi_slave_rlast,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave RREADY" *)
        input   axi_slave_rready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave RRESP" *)
        output  [                 3:0] axi_slave_rresp,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave RUSER" *)
        output  [(USER_WIDTH > 0 ? USER_WIDTH : 1) -1:0] axi_slave_ruser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave RVALID" *)
        output   axi_slave_rvalid,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave WDATA" *)
        input  [      DATA_WIDTH-1:0] axi_slave_wdata,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave WLAST" *)
        input   axi_slave_wlast,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave WREADY" *)
        output   axi_slave_wready,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave WSTRB" *)
        input  [  (DATA_WIDTH/8)-1:0] axi_slave_wstrb,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave WUSER" *)
        input  [(USER_WIDTH > 0 ? USER_WIDTH : 1) -1:0] axi_slave_wuser,
        (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi_slave WVALID" *)
        input   axi_slave_wvalid,
        
        output  wire [ADDR_WIDTH-1:0]      acaddr,
        output  wire [2:0]                 acprot,
        input wire                       acready,
        output  wire [3:0]                 acsnoop,
        output  wire                       acvalid,
        output  wire                       crready,
        input wire [4:0]                 crresp,
        input wire                       crvalid,
        input wire [DATA_WIDTH-1:0]      cddata,
        input wire                       cdlast,
        output  wire                       cdready,
        input wire                       cdvalid,
        input wire [1:0]                 arbar,
        input wire [1:0]                 ardomain,
        input wire [3:0]                 arregion,
        input wire [3:0]                 arsnoop,
        input wire [1:0]                 awbar,
        input wire [1:0]                 awdomain,
        input wire [3:0]                 awregion,
        input wire [2:0]                 awsnoop,
        input wire                       rack,
        input wire                       wack,
        input wire [5:0]                 wid
    );
    
    assign ace_master_awid = axi_slave_awid;
    assign ace_master_awaddr = axi_slave_awaddr;
    assign ace_master_awlen = axi_slave_awlen;
    assign ace_master_awsize = axi_slave_awsize;
    assign ace_master_awburst = axi_slave_awburst;
    assign ace_master_awlock = axi_slave_awlock;
    assign ace_master_awcache = axi_slave_awcache;
    assign ace_master_awprot = axi_slave_awprot;
    assign ace_master_awqos = axi_slave_awqos;
    assign ace_master_awuser = axi_slave_awuser;
    assign ace_master_awvalid = axi_slave_awvalid;
    assign axi_slave_awready = ace_master_awready;
    assign ace_master_wdata = axi_slave_wdata;
    assign ace_master_wstrb = axi_slave_wstrb;
    assign ace_master_wlast = axi_slave_wlast;
    assign ace_master_wuser = axi_slave_wuser;
    assign ace_master_wvalid = axi_slave_wvalid;
    assign axi_slave_wready = ace_master_wready;
    assign axi_slave_bid = ace_master_bid;
    assign axi_slave_bresp = ace_master_bresp;
    assign axi_slave_buser = ace_master_buser;
    assign axi_slave_bvalid = ace_master_bvalid;
    assign ace_master_bready = axi_slave_bready;
    assign ace_master_arid = axi_slave_arid;
    assign ace_master_araddr = axi_slave_araddr;
    assign ace_master_arlen = axi_slave_arlen;
    assign ace_master_arsize = axi_slave_arsize;
    assign ace_master_arburst = axi_slave_arburst;
    assign ace_master_arlock = axi_slave_arlock;
    assign ace_master_arcache = axi_slave_arcache;
    assign ace_master_arprot = axi_slave_arprot;
    assign ace_master_arqos = axi_slave_arqos;
    assign ace_master_aruser = axi_slave_aruser;
    assign ace_master_arvalid = axi_slave_arvalid;
    assign axi_slave_arready = ace_master_arready;
    assign axi_slave_rid = ace_master_rid;
    assign axi_slave_rdata = ace_master_rdata;
    assign axi_slave_rresp = ace_master_rresp;
    assign axi_slave_rlast = ace_master_rlast;
    assign axi_slave_ruser = ace_master_ruser;
    assign axi_slave_rvalid = ace_master_rvalid;
    assign ace_master_rready = axi_slave_rready;
    
    assign acaddr = ace_master_acaddr;
    assign acprot = ace_master_acprot;
    assign ace_master_acready = acready;
    assign acsnoop = ace_master_acsnoop;
    assign acvalid = ace_master_acvalid;
    assign crready = ace_master_crready;
    assign ace_master_crresp = crresp;
    assign ace_master_crvalid = crvalid;
    assign ace_master_cddata = cddata;
    assign ace_master_cdlast = cdlast;
    assign cdready = ace_master_cdready;
    assign ace_master_cdvalid = cdvalid;
    assign ace_master_arbar = arbar;
    assign ace_master_ardomain = ardomain;
    assign ace_master_arregion = arregion;
    assign ace_master_arsnoop = arsnoop;
    assign ace_master_awbar = awbar;
    assign ace_master_awdomain = awdomain;
    assign ace_master_awregion = awregion;
    assign ace_master_awsnoop = awsnoop;
    assign ace_master_rack = rack;
    assign ace_master_wack = wack;
endmodule
