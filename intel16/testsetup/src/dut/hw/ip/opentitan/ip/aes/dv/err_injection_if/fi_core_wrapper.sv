// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0


//wrapper module to avoid having to know/write out the path from tb to bind


module fi_core_wrapper
  import uvm_pkg::*;
  import aes_env_pkg::*;
  import aes_pkg::*;
  #( parameter string IfName = "vif"
  ) (
    input logic      clk_i,
    input logic      rst_ni,
    input aes_ctrl_e aes_ctrl_cs
  );

  // declare interface
  fi_core_if  fi_if (.*);
  initial begin
    uvm_config_db#(virtual fi_core_if)::set(null, "*", "aes_core_fi_vif", fi_if);
  end
endmodule
