-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.1 (lin64) Build 1846317 Fri Apr 14 18:54:47 MDT 2017
-- Date        : Fri Dec 28 06:57:34 2018
-- Host        : ubuntu running 64-bit Ubuntu 16.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axi_uartlite_0_sim_netlist.vhdl
-- Design      : axi_uartlite_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_baudrate is
  port (
    en_16x_Baud : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_baudrate;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_baudrate is
  signal EN_16x_Baud_i_1_n_0 : STD_LOGIC;
  signal count : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \count[0]_i_1_n_0\ : STD_LOGIC;
  signal \count[1]_i_1_n_0\ : STD_LOGIC;
  signal \count[2]_i_1_n_0\ : STD_LOGIC;
  signal \count[3]_i_1_n_0\ : STD_LOGIC;
  signal \count[4]_i_1_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of EN_16x_Baud_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \count[0]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[1]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \count[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \count[4]_i_1\ : label is "soft_lutpair10";
begin
EN_16x_Baud_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => count(3),
      I1 => count(1),
      I2 => count(0),
      I3 => count(4),
      I4 => count(2),
      O => EN_16x_Baud_i_1_n_0
    );
EN_16x_Baud_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => EN_16x_Baud_i_1_n_0,
      Q => en_16x_Baud,
      R => SR(0)
    );
\count[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F0F0F0E"
    )
        port map (
      I0 => count(2),
      I1 => count(4),
      I2 => count(0),
      I3 => count(1),
      I4 => count(3),
      O => \count[0]_i_1_n_0\
    );
\count[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => count(1),
      I1 => count(0),
      O => \count[1]_i_1_n_0\
    );
\count[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAA5AAA4"
    )
        port map (
      I0 => count(2),
      I1 => count(4),
      I2 => count(0),
      I3 => count(1),
      I4 => count(3),
      O => \count[2]_i_1_n_0\
    );
\count[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAA9"
    )
        port map (
      I0 => count(3),
      I1 => count(1),
      I2 => count(0),
      I3 => count(2),
      O => \count[3]_i_1_n_0\
    );
\count[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA9"
    )
        port map (
      I0 => count(4),
      I1 => count(2),
      I2 => count(0),
      I3 => count(1),
      I4 => count(3),
      O => \count[4]_i_1_n_0\
    );
\count_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \count[0]_i_1_n_0\,
      Q => count(0),
      R => SR(0)
    );
\count_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \count[1]_i_1_n_0\,
      Q => count(1),
      R => SR(0)
    );
\count_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \count[2]_i_1_n_0\,
      Q => count(2),
      R => SR(0)
    );
\count_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \count[3]_i_1_n_0\,
      Q => count(3),
      R => SR(0)
    );
\count_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \count[4]_i_1_n_0\,
      Q => count(4),
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync is
  port (
    p_26_out : out STD_LOGIC;
    scndry_out : out STD_LOGIC;
    start_Edge_Detected : in STD_LOGIC;
    EN_16x_Baud_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rx : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync is
  signal s_level_out_d1_cdc_to : STD_LOGIC;
  signal s_level_out_d2 : STD_LOGIC;
  signal s_level_out_d3 : STD_LOGIC;
  signal \^scndry_out\ : STD_LOGIC;
  attribute ASYNC_REG : boolean;
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is std.standard.true;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is "FDR";
  attribute box_type : string;
  attribute box_type of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is std.standard.true;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is "FDR";
  attribute box_type of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is std.standard.true;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is "FDR";
  attribute box_type of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\ : label is "PRIMITIVE";
  attribute ASYNC_REG of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is std.standard.true;
  attribute XILINX_LEGACY_PRIM of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is "FDR";
  attribute box_type of \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\ : label is "PRIMITIVE";
begin
  scndry_out <= \^scndry_out\;
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => rx,
      Q => s_level_out_d1_cdc_to,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_level_out_d1_cdc_to,
      Q => s_level_out_d2,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_level_out_d2,
      Q => s_level_out_d3,
      R => '0'
    );
\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => s_level_out_d3,
      Q => \^scndry_out\,
      R => '0'
    );
\SERIAL_TO_PARALLEL[1].fifo_din[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE00CE00"
    )
        port map (
      I0 => \^scndry_out\,
      I1 => start_Edge_Detected,
      I2 => EN_16x_Baud_reg,
      I3 => s_axi_aresetn,
      I4 => \in\(0),
      O => p_26_out
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f is
  port (
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    fifo_full_p1 : out STD_LOGIC;
    tx_Start0 : out STD_LOGIC;
    reset_TX_FIFO_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    fifo_Read : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ : in STD_LOGIC;
    tx_Buffer_Full : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ : in STD_LOGIC;
    tx_Data_Enable_reg : in STD_LOGIC;
    tx_DataBits : in STD_LOGIC;
    tx_Start : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f is
  signal \FIFO_Full_i_2__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.cnt_i[3]_i_2__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.cnt_i[4]_i_3__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.cnt_i[4]_i_4__0_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^ss\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal addr_i_p1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[1]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[3]_i_2__0\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[4]_i_3__0\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[4]_i_4__0\ : label is "soft_lutpair19";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
  SS(0) <= \^ss\(0);
FIFO_Full_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004090000"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      I1 => \^q\(0),
      I2 => \^q\(4),
      I3 => fifo_Read,
      I4 => \^q\(3),
      I5 => \FIFO_Full_i_2__0_n_0\,
      O => fifo_full_p1
    );
\FIFO_Full_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      O => \FIFO_Full_i_2__0_n_0\
    );
\INFERRED_GEN.cnt_i[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB4BBBB444B4444"
    )
        port map (
      I0 => \^q\(4),
      I1 => fifo_Read,
      I2 => tx_Buffer_Full,
      I3 => Bus_RNW_reg,
      I4 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      I5 => \^q\(0),
      O => addr_i_p1(0)
    );
\INFERRED_GEN.cnt_i[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA9A65AA"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(4),
      I2 => fifo_Read,
      I3 => \^q\(0),
      I4 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      O => addr_i_p1(1)
    );
\INFERRED_GEN.cnt_i[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4FF0B00FFBF0040"
    )
        port map (
      I0 => \^q\(4),
      I1 => fifo_Read,
      I2 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      I3 => \^q\(0),
      I4 => \^q\(2),
      I5 => \^q\(1),
      O => addr_i_p1(2)
    );
\INFERRED_GEN.cnt_i[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA6AAAAAA9AAAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(2),
      I3 => \INFERRED_GEN.cnt_i[3]_i_2__0_n_0\,
      I4 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      I5 => \^q\(0),
      O => addr_i_p1(3)
    );
\INFERRED_GEN.cnt_i[3]_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^q\(4),
      I1 => fifo_Read,
      O => \INFERRED_GEN.cnt_i[3]_i_2__0_n_0\
    );
\INFERRED_GEN.cnt_i[4]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_TX_FIFO_reg,
      I1 => s_axi_aresetn,
      O => \^ss\(0)
    );
\INFERRED_GEN.cnt_i[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0FAFAF003F0F0"
    )
        port map (
      I0 => \INFERRED_GEN.cnt_i[4]_i_3__0_n_0\,
      I1 => fifo_Read,
      I2 => \^q\(4),
      I3 => \INFERRED_GEN.cnt_i[4]_i_4__0_n_0\,
      I4 => \^q\(0),
      I5 => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      O => addr_i_p1(4)
    );
\INFERRED_GEN.cnt_i[4]_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \^q\(3),
      I1 => fifo_Read,
      I2 => \^q\(2),
      I3 => \^q\(1),
      O => \INFERRED_GEN.cnt_i[4]_i_3__0_n_0\
    );
\INFERRED_GEN.cnt_i[4]_i_4__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(3),
      O => \INFERRED_GEN.cnt_i[4]_i_4__0_n_0\
    );
\INFERRED_GEN.cnt_i_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(0),
      Q => \^q\(0),
      S => \^ss\(0)
    );
\INFERRED_GEN.cnt_i_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(1),
      Q => \^q\(1),
      S => \^ss\(0)
    );
\INFERRED_GEN.cnt_i_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(2),
      Q => \^q\(2),
      S => \^ss\(0)
    );
\INFERRED_GEN.cnt_i_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(3),
      Q => \^q\(3),
      S => \^ss\(0)
    );
\INFERRED_GEN.cnt_i_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(4),
      Q => \^q\(4),
      S => \^ss\(0)
    );
tx_Start_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F02"
    )
        port map (
      I0 => tx_Data_Enable_reg,
      I1 => \^q\(4),
      I2 => tx_DataBits,
      I3 => tx_Start,
      O => tx_Start0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f_2 is
  port (
    SS : out STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_full_p1 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 4 downto 0 );
    Interrupt0 : out STD_LOGIC;
    reset_RX_FIFO_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : in STD_LOGIC;
    Bus_RNW_reg_reg : in STD_LOGIC;
    fifo_Write : in STD_LOGIC;
    FIFO_Full_reg : in STD_LOGIC;
    valid_rx : in STD_LOGIC;
    rx_Data_Present_Pre : in STD_LOGIC;
    enable_interrupts : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[4]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_Buffer_Empty_Pre : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f_2 : entity is "cntr_incr_decr_addn_f";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f_2;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f_2 is
  signal FIFO_Full_i_2_n_0 : STD_LOGIC;
  signal \INFERRED_GEN.cnt_i[4]_i_4_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.cnt_i[4]_i_5__0_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.cnt_i[4]_i_6_n_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \^ss\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal addr_i_p1 : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of FIFO_Full_i_2 : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[2]_i_1__0\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[4]_i_4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[4]_i_5__0\ : label is "soft_lutpair17";
begin
  Q(4 downto 0) <= \^q\(4 downto 0);
  SS(0) <= \^ss\(0);
\FIFO_Full_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000009040000"
    )
        port map (
      I0 => \INFERRED_GEN.cnt_i[4]_i_6_n_0\,
      I1 => \^q\(0),
      I2 => \^q\(4),
      I3 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      I4 => \^q\(3),
      I5 => FIFO_Full_i_2_n_0,
      O => fifo_full_p1
    );
FIFO_Full_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(2),
      O => FIFO_Full_i_2_n_0
    );
\INFERRED_GEN.cnt_i[0]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F70808F7"
    )
        port map (
      I0 => Bus_RNW_reg,
      I1 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      I2 => \^q\(4),
      I3 => \INFERRED_GEN.cnt_i[4]_i_6_n_0\,
      I4 => \^q\(0),
      O => addr_i_p1(0)
    );
\INFERRED_GEN.cnt_i[1]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAA6A5595AAAA"
    )
        port map (
      I0 => \^q\(1),
      I1 => Bus_RNW_reg,
      I2 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      I3 => \^q\(4),
      I4 => \^q\(0),
      I5 => \INFERRED_GEN.cnt_i[4]_i_6_n_0\,
      O => addr_i_p1(1)
    );
\INFERRED_GEN.cnt_i[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FE017F80"
    )
        port map (
      I0 => \^q\(0),
      I1 => Bus_RNW_reg_reg,
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \INFERRED_GEN.cnt_i[4]_i_6_n_0\,
      O => addr_i_p1(2)
    );
\INFERRED_GEN.cnt_i[3]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F0E178F0F0F0"
    )
        port map (
      I0 => \^q\(0),
      I1 => Bus_RNW_reg_reg,
      I2 => \^q\(3),
      I3 => \^q\(1),
      I4 => \^q\(2),
      I5 => \INFERRED_GEN.cnt_i[4]_i_6_n_0\,
      O => addr_i_p1(3)
    );
\INFERRED_GEN.cnt_i[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => reset_RX_FIFO_reg,
      I1 => s_axi_aresetn,
      O => \^ss\(0)
    );
\INFERRED_GEN.cnt_i[4]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F0F4F4F00AF0F0"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      I1 => \INFERRED_GEN.cnt_i[4]_i_4_n_0\,
      I2 => \^q\(4),
      I3 => \INFERRED_GEN.cnt_i[4]_i_5__0_n_0\,
      I4 => \^q\(0),
      I5 => \INFERRED_GEN.cnt_i[4]_i_6_n_0\,
      O => addr_i_p1(4)
    );
\INFERRED_GEN.cnt_i[4]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(3),
      O => \INFERRED_GEN.cnt_i[4]_i_4_n_0\
    );
\INFERRED_GEN.cnt_i[4]_i_5__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(3),
      O => \INFERRED_GEN.cnt_i[4]_i_5__0_n_0\
    );
\INFERRED_GEN.cnt_i[4]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => fifo_Write,
      I1 => FIFO_Full_reg,
      I2 => valid_rx,
      O => \INFERRED_GEN.cnt_i[4]_i_6_n_0\
    );
\INFERRED_GEN.cnt_i_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(0),
      Q => \^q\(0),
      S => \^ss\(0)
    );
\INFERRED_GEN.cnt_i_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(1),
      Q => \^q\(1),
      S => \^ss\(0)
    );
\INFERRED_GEN.cnt_i_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(2),
      Q => \^q\(2),
      S => \^ss\(0)
    );
\INFERRED_GEN.cnt_i_reg[3]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(3),
      Q => \^q\(3),
      S => \^ss\(0)
    );
\INFERRED_GEN.cnt_i_reg[4]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => addr_i_p1(4),
      Q => \^q\(4),
      S => \^ss\(0)
    );
Interrupt_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1010F010"
    )
        port map (
      I0 => rx_Data_Present_Pre,
      I1 => \^q\(4),
      I2 => enable_interrupts,
      I3 => \INFERRED_GEN.cnt_i_reg[4]_0\(0),
      I4 => tx_Buffer_Empty_Pre,
      O => Interrupt0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f is
  port (
    mux_Out : out STD_LOGIC;
    p_4_in : in STD_LOGIC;
    \mux_sel_reg[2]\ : in STD_LOGIC;
    \mux_sel_reg[0]\ : in STD_LOGIC;
    fifo_wr : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aclk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f is
  signal fifo_DOut : STD_LOGIC_VECTOR ( 0 to 7 );
  signal serial_Data_i_2_n_0 : STD_LOGIC;
  signal serial_Data_i_3_n_0 : STD_LOGIC;
  signal serial_Data_i_4_n_0 : STD_LOGIC;
  signal serial_Data_i_5_n_0 : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][0]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name : string;
  attribute srl_name of \INFERRED_GEN.data_reg[15][0]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][0]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][1]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][1]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][1]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][2]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][2]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][2]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][3]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][3]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][3]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][4]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][4]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][4]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][5]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][5]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][5]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][6]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][6]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][6]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][7]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][7]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][7]_srl16 ";
begin
\INFERRED_GEN.data_reg[15][0]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => s_axi_wdata(0),
      Q => fifo_DOut(7)
    );
\INFERRED_GEN.data_reg[15][1]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => s_axi_wdata(1),
      Q => fifo_DOut(6)
    );
\INFERRED_GEN.data_reg[15][2]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => s_axi_wdata(2),
      Q => fifo_DOut(5)
    );
\INFERRED_GEN.data_reg[15][3]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => s_axi_wdata(3),
      Q => fifo_DOut(4)
    );
\INFERRED_GEN.data_reg[15][4]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => s_axi_wdata(4),
      Q => fifo_DOut(3)
    );
\INFERRED_GEN.data_reg[15][5]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => s_axi_wdata(5),
      Q => fifo_DOut(2)
    );
\INFERRED_GEN.data_reg[15][6]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => s_axi_wdata(6),
      Q => fifo_DOut(1)
    );
\INFERRED_GEN.data_reg[15][7]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => s_axi_wdata(7),
      Q => fifo_DOut(0)
    );
serial_Data_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => serial_Data_i_2_n_0,
      I1 => serial_Data_i_3_n_0,
      I2 => serial_Data_i_4_n_0,
      I3 => serial_Data_i_5_n_0,
      O => mux_Out
    );
serial_Data_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44400040"
    )
        port map (
      I0 => \mux_sel_reg[2]\,
      I1 => p_4_in,
      I2 => fifo_DOut(2),
      I3 => \mux_sel_reg[0]\,
      I4 => fifo_DOut(6),
      O => serial_Data_i_2_n_0
    );
serial_Data_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"88800080"
    )
        port map (
      I0 => \mux_sel_reg[0]\,
      I1 => \mux_sel_reg[2]\,
      I2 => fifo_DOut(5),
      I3 => p_4_in,
      I4 => fifo_DOut(7),
      O => serial_Data_i_3_n_0
    );
serial_Data_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44400040"
    )
        port map (
      I0 => \mux_sel_reg[0]\,
      I1 => \mux_sel_reg[2]\,
      I2 => fifo_DOut(1),
      I3 => p_4_in,
      I4 => fifo_DOut(3),
      O => serial_Data_i_4_n_0
    );
serial_Data_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000A000C"
    )
        port map (
      I0 => fifo_DOut(4),
      I1 => fifo_DOut(0),
      I2 => p_4_in,
      I3 => \mux_sel_reg[2]\,
      I4 => \mux_sel_reg[0]\,
      O => serial_Data_i_5_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f_3 is
  port (
    \out\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    valid_rx : in STD_LOGIC;
    FIFO_Full_reg : in STD_LOGIC;
    fifo_Write : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 0 to 7 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_aclk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f_3 : entity is "dynshreg_f";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f_3;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f_3 is
  signal fifo_wr : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][0]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name : string;
  attribute srl_name of \INFERRED_GEN.data_reg[15][0]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][0]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][1]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][1]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][1]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][2]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][2]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][2]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][3]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][3]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][3]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][4]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][4]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][4]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][5]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][5]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][5]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][6]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][6]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][6]_srl16 ";
  attribute srl_bus_name of \INFERRED_GEN.data_reg[15][7]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15] ";
  attribute srl_name of \INFERRED_GEN.data_reg[15][7]_srl16\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][7]_srl16 ";
begin
\INFERRED_GEN.data_reg[15][0]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => \in\(7),
      Q => \out\(0)
    );
\INFERRED_GEN.data_reg[15][0]_srl16_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => valid_rx,
      I1 => FIFO_Full_reg,
      I2 => fifo_Write,
      O => fifo_wr
    );
\INFERRED_GEN.data_reg[15][1]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => \in\(6),
      Q => \out\(1)
    );
\INFERRED_GEN.data_reg[15][2]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => \in\(5),
      Q => \out\(2)
    );
\INFERRED_GEN.data_reg[15][3]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => \in\(4),
      Q => \out\(3)
    );
\INFERRED_GEN.data_reg[15][4]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => \in\(3),
      Q => \out\(4)
    );
\INFERRED_GEN.data_reg[15][5]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => \in\(2),
      Q => \out\(5)
    );
\INFERRED_GEN.data_reg[15][6]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => \in\(1),
      Q => \out\(6)
    );
\INFERRED_GEN.data_reg[15][7]_srl16\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => Q(0),
      A1 => Q(1),
      A2 => Q(2),
      A3 => Q(3),
      CE => fifo_wr,
      CLK => s_axi_aclk,
      D => \in\(0),
      Q => \out\(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f is
  port (
    p_20_out : out STD_LOGIC;
    \SERIAL_TO_PARALLEL[2].fifo_din_reg[2]\ : out STD_LOGIC;
    p_17_out : out STD_LOGIC;
    p_14_out : out STD_LOGIC;
    p_11_out : out STD_LOGIC;
    p_8_out : out STD_LOGIC;
    p_5_out : out STD_LOGIC;
    p_2_out : out STD_LOGIC;
    status_reg_reg0 : out STD_LOGIC;
    fifo_Write0 : out STD_LOGIC;
    stop_Bit_Position_reg : out STD_LOGIC;
    frame_err_ocrd_reg : out STD_LOGIC;
    running_reg : out STD_LOGIC;
    en_16x_Baud : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 0 to 7 );
    start_Edge_Detected : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    stop_Bit_Position_reg_0 : in STD_LOGIC;
    scndry_out : in STD_LOGIC;
    clr_Status : in STD_LOGIC;
    status_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    valid_rx : in STD_LOGIC;
    frame_err_ocrd : in STD_LOGIC;
    running_reg_0 : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f is
  signal \INFERRED_GEN.data_reg[14][0]_srl15_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg[15]\ : STD_LOGIC;
  signal \^serial_to_parallel[2].fifo_din_reg[2]\ : STD_LOGIC;
  signal recycle : STD_LOGIC;
  signal \status_reg[1]_i_2_n_0\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \INFERRED_GEN.data_reg[14][0]_srl15\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/DELAY_16_I/INFERRED_GEN.data_reg[14] ";
  attribute srl_name : string;
  attribute srl_name of \INFERRED_GEN.data_reg[14][0]_srl15\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_RX_I/DELAY_16_I/INFERRED_GEN.data_reg[14][0]_srl15 ";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \INFERRED_GEN.data_reg[14][0]_srl15_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \SERIAL_TO_PARALLEL[8].fifo_din[8]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of fifo_Write_i_1 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of frame_err_ocrd_i_1 : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of running_i_1 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \status_reg[1]_i_2\ : label is "soft_lutpair15";
begin
  \SERIAL_TO_PARALLEL[2].fifo_din_reg[2]\ <= \^serial_to_parallel[2].fifo_din_reg[2]\;
\INFERRED_GEN.data_reg[14][0]_srl15\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => en_16x_Baud,
      CLK => s_axi_aclk,
      D => recycle,
      Q => \INFERRED_GEN.data_reg[14][0]_srl15_n_0\
    );
\INFERRED_GEN.data_reg[14][0]_srl15_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4440"
    )
        port map (
      I0 => stop_Bit_Position_reg_0,
      I1 => valid_rx,
      I2 => \INFERRED_GEN.data_reg[15]\,
      I3 => start_Edge_Detected,
      O => recycle
    );
\INFERRED_GEN.data_reg[15][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => \INFERRED_GEN.data_reg[14][0]_srl15_n_0\,
      Q => \INFERRED_GEN.data_reg[15]\,
      R => '0'
    );
\SERIAL_TO_PARALLEL[2].fifo_din[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A000C00"
    )
        port map (
      I0 => \in\(1),
      I1 => \in\(0),
      I2 => start_Edge_Detected,
      I3 => s_axi_aresetn,
      I4 => \^serial_to_parallel[2].fifo_din_reg[2]\,
      O => p_20_out
    );
\SERIAL_TO_PARALLEL[3].fifo_din[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A000C00"
    )
        port map (
      I0 => \in\(2),
      I1 => \in\(1),
      I2 => start_Edge_Detected,
      I3 => s_axi_aresetn,
      I4 => \^serial_to_parallel[2].fifo_din_reg[2]\,
      O => p_17_out
    );
\SERIAL_TO_PARALLEL[4].fifo_din[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A000C00"
    )
        port map (
      I0 => \in\(3),
      I1 => \in\(2),
      I2 => start_Edge_Detected,
      I3 => s_axi_aresetn,
      I4 => \^serial_to_parallel[2].fifo_din_reg[2]\,
      O => p_14_out
    );
\SERIAL_TO_PARALLEL[5].fifo_din[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A000C00"
    )
        port map (
      I0 => \in\(4),
      I1 => \in\(3),
      I2 => start_Edge_Detected,
      I3 => s_axi_aresetn,
      I4 => \^serial_to_parallel[2].fifo_din_reg[2]\,
      O => p_11_out
    );
\SERIAL_TO_PARALLEL[6].fifo_din[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A000C00"
    )
        port map (
      I0 => \in\(5),
      I1 => \in\(4),
      I2 => start_Edge_Detected,
      I3 => s_axi_aresetn,
      I4 => \^serial_to_parallel[2].fifo_din_reg[2]\,
      O => p_8_out
    );
\SERIAL_TO_PARALLEL[7].fifo_din[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A000C00"
    )
        port map (
      I0 => \in\(6),
      I1 => \in\(5),
      I2 => start_Edge_Detected,
      I3 => s_axi_aresetn,
      I4 => \^serial_to_parallel[2].fifo_din_reg[2]\,
      O => p_5_out
    );
\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0A000C00"
    )
        port map (
      I0 => \in\(7),
      I1 => \in\(6),
      I2 => start_Edge_Detected,
      I3 => s_axi_aresetn,
      I4 => \^serial_to_parallel[2].fifo_din_reg[2]\,
      O => p_2_out
    );
\SERIAL_TO_PARALLEL[8].fifo_din[8]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => en_16x_Baud,
      I1 => \INFERRED_GEN.data_reg[15]\,
      I2 => stop_Bit_Position_reg_0,
      O => \^serial_to_parallel[2].fifo_din_reg[2]\
    );
fifo_Write_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[15]\,
      I1 => en_16x_Baud,
      I2 => stop_Bit_Position_reg_0,
      I3 => scndry_out,
      O => fifo_Write0
    );
frame_err_ocrd_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00FF0080"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg[15]\,
      I1 => en_16x_Baud,
      I2 => stop_Bit_Position_reg_0,
      I3 => scndry_out,
      I4 => frame_err_ocrd,
      O => frame_err_ocrd_reg
    );
running_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFFFA0A0"
    )
        port map (
      I0 => start_Edge_Detected,
      I1 => \INFERRED_GEN.data_reg[15]\,
      I2 => en_16x_Baud,
      I3 => stop_Bit_Position_reg_0,
      I4 => running_reg_0,
      O => running_reg
    );
\status_reg[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0F000200"
    )
        port map (
      I0 => \status_reg[1]_i_2_n_0\,
      I1 => scndry_out,
      I2 => clr_Status,
      I3 => s_axi_aresetn,
      I4 => status_reg(0),
      O => status_reg_reg0
    );
\status_reg[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => stop_Bit_Position_reg_0,
      I1 => en_16x_Baud,
      I2 => \INFERRED_GEN.data_reg[15]\,
      O => \status_reg[1]_i_2_n_0\
    );
stop_Bit_Position_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2CCC"
    )
        port map (
      I0 => \in\(7),
      I1 => stop_Bit_Position_reg_0,
      I2 => en_16x_Baud,
      I3 => \INFERRED_GEN.data_reg[15]\,
      O => stop_Bit_Position_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f__parameterized0\ is
  port (
    tx_Data_Enable_reg : out STD_LOGIC;
    en_16x_Baud : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    tx_Data_Enable_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f__parameterized0\ : entity is "dynshreg_i_f";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f__parameterized0\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f__parameterized0\ is
  signal \INFERRED_GEN.data_reg[14][0]_srl15_n_0\ : STD_LOGIC;
  signal \INFERRED_GEN.data_reg_n_0_[15][0]\ : STD_LOGIC;
  attribute srl_bus_name : string;
  attribute srl_bus_name of \INFERRED_GEN.data_reg[14][0]_srl15\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/MID_START_BIT_SRL16_I/INFERRED_GEN.data_reg[14] ";
  attribute srl_name : string;
  attribute srl_name of \INFERRED_GEN.data_reg[14][0]_srl15\ : label is "U0/\UARTLITE_CORE_I/UARTLITE_TX_I/MID_START_BIT_SRL16_I/INFERRED_GEN.data_reg[14][0]_srl15 ";
begin
\INFERRED_GEN.data_reg[14][0]_srl15\: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0001"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => en_16x_Baud,
      CLK => s_axi_aclk,
      D => \INFERRED_GEN.data_reg_n_0_[15][0]\,
      Q => \INFERRED_GEN.data_reg[14][0]_srl15_n_0\
    );
\INFERRED_GEN.data_reg[15][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => \INFERRED_GEN.data_reg[14][0]_srl15_n_0\,
      Q => \INFERRED_GEN.data_reg_n_0_[15][0]\,
      R => '0'
    );
tx_Data_Enable_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => \INFERRED_GEN.data_reg_n_0_[15][0]\,
      I1 => tx_Data_Enable_reg_0,
      I2 => en_16x_Baud,
      O => tx_Data_Enable_reg
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f is
  port (
    ce_expnd_i_3 : out STD_LOGIC;
    \bus2ip_addr_i_reg[2]\ : in STD_LOGIC;
    start2 : in STD_LOGIC;
    \bus2ip_addr_i_reg[3]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f is
begin
CS: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \bus2ip_addr_i_reg[2]\,
      I1 => start2,
      I2 => \bus2ip_addr_i_reg[3]\,
      O => ce_expnd_i_3
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f__parameterized1\ is
  port (
    ce_expnd_i_1 : out STD_LOGIC;
    \bus2ip_addr_i_reg[3]\ : in STD_LOGIC;
    start2 : in STD_LOGIC;
    \bus2ip_addr_i_reg[2]\ : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f__parameterized1\ : entity is "pselect_f";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f__parameterized1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f__parameterized1\ is
begin
CS: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => \bus2ip_addr_i_reg[3]\,
      I1 => start2,
      I2 => \bus2ip_addr_i_reg[2]\,
      O => ce_expnd_i_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder is
  port (
    tx_Buffer_Empty_Pre_reg : out STD_LOGIC;
    \s_axi_rresp_i_reg[1]\ : out STD_LOGIC;
    enable_interrupts_reg : out STD_LOGIC;
    ip2bus_error : out STD_LOGIC;
    fifo_wr : out STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[2]\ : out STD_LOGIC;
    D : out STD_LOGIC_VECTOR ( 7 downto 0 );
    \INFERRED_GEN.cnt_i_reg[2]_0\ : out STD_LOGIC;
    \state_reg[1]\ : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arready : out STD_LOGIC;
    FIFO_Full_reg : out STD_LOGIC;
    reset_TX_FIFO : out STD_LOGIC;
    reset_RX_FIFO : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    bus2ip_rdce : out STD_LOGIC_VECTOR ( 0 to 0 );
    enable_interrupts_reg_0 : out STD_LOGIC;
    tx_Buffer_Empty_Pre_reg_0 : out STD_LOGIC;
    s_axi_rvalid_i_reg : out STD_LOGIC;
    s_axi_bvalid_i_reg : out STD_LOGIC;
    \s_axi_bresp_i_reg[1]\ : out STD_LOGIC;
    rx_Data_Present_Pre_reg : out STD_LOGIC;
    start2 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    tx_Buffer_Full : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_Buffer_Full : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    enable_interrupts : in STD_LOGIC;
    status_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    \state_reg[1]_0\ : in STD_LOGIC;
    \state_reg[1]_1\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_arvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 2 downto 0 );
    \state_reg[0]\ : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_rvalid_i_reg_0 : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bvalid_i_reg_0 : in STD_LOGIC;
    s_axi_bresp : in STD_LOGIC_VECTOR ( 0 to 0 );
    bus2ip_rnw_i : in STD_LOGIC;
    \bus2ip_addr_i_reg[3]\ : in STD_LOGIC;
    \bus2ip_addr_i_reg[2]\ : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder is
  signal Bus_RNW_reg_i_1_n_0 : STD_LOGIC;
  signal \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\ : STD_LOGIC;
  signal \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\ : STD_LOGIC;
  signal ce_expnd_i_0 : STD_LOGIC;
  signal ce_expnd_i_1 : STD_LOGIC;
  signal ce_expnd_i_2 : STD_LOGIC;
  signal ce_expnd_i_3 : STD_LOGIC;
  signal cs_ce_clr : STD_LOGIC;
  signal \^enable_interrupts_reg\ : STD_LOGIC;
  signal \^ip2bus_error\ : STD_LOGIC;
  signal \^s_axi_arready\ : STD_LOGIC;
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_rresp_i_reg[1]\ : STD_LOGIC;
  signal \^tx_buffer_empty_pre_reg\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of Bus_RNW_reg_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[1].ce_out_i[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[3]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[4]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \INFERRED_GEN.cnt_i[4]_i_5\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \INFERRED_GEN.data_reg[15][0]_srl16_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of clr_Status_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of enable_interrupts_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of reset_RX_FIFO_i_1 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of reset_TX_FIFO_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of s_axi_arready_INST_0 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \s_axi_rdata_i[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \s_axi_rresp_i[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of s_axi_wready_INST_0 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of tx_Buffer_Empty_Pre_i_1 : label is "soft_lutpair6";
begin
  enable_interrupts_reg <= \^enable_interrupts_reg\;
  ip2bus_error <= \^ip2bus_error\;
  s_axi_arready <= \^s_axi_arready\;
  s_axi_awready <= \^s_axi_awready\;
  \s_axi_rresp_i_reg[1]\ <= \^s_axi_rresp_i_reg[1]\;
  tx_Buffer_Empty_Pre_reg <= \^tx_buffer_empty_pre_reg\;
Bus_RNW_reg_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => bus2ip_rnw_i,
      I1 => start2,
      I2 => \^enable_interrupts_reg\,
      O => Bus_RNW_reg_i_1_n_0
    );
Bus_RNW_reg_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Bus_RNW_reg_i_1_n_0,
      Q => \^enable_interrupts_reg\,
      R => '0'
    );
\GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => start2,
      D => ce_expnd_i_3,
      Q => \^s_axi_rresp_i_reg[1]\,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[1].ce_out_i[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => start2,
      I1 => \bus2ip_addr_i_reg[2]\,
      I2 => \bus2ip_addr_i_reg[3]\,
      O => ce_expnd_i_2
    );
\GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => start2,
      D => ce_expnd_i_2,
      Q => \^tx_buffer_empty_pre_reg\,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => start2,
      D => ce_expnd_i_1,
      Q => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      R => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFEFFFF"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I1 => \^tx_buffer_empty_pre_reg\,
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^s_axi_rresp_i_reg[1]\,
      I4 => s_axi_aresetn,
      O => cs_ce_clr
    );
\GEN_BKEND_CE_REGISTERS[3].ce_out_i[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \bus2ip_addr_i_reg[3]\,
      I1 => start2,
      I2 => \bus2ip_addr_i_reg[2]\,
      O => ce_expnd_i_0
    );
\GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => start2,
      D => ce_expnd_i_0,
      Q => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      R => cs_ce_clr
    );
\INFERRED_GEN.cnt_i[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => \^enable_interrupts_reg\,
      I1 => \^s_axi_rresp_i_reg[1]\,
      I2 => Q(0),
      O => \INFERRED_GEN.cnt_i_reg[2]_0\
    );
\INFERRED_GEN.cnt_i[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \^s_axi_rresp_i_reg[1]\,
      I1 => \^enable_interrupts_reg\,
      O => FIFO_Full_reg
    );
\INFERRED_GEN.cnt_i[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => \^tx_buffer_empty_pre_reg\,
      I1 => \^enable_interrupts_reg\,
      I2 => tx_Buffer_Full,
      O => \INFERRED_GEN.cnt_i_reg[2]\
    );
\INFERRED_GEN.data_reg[15][0]_srl16_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => tx_Buffer_Full,
      I1 => \^enable_interrupts_reg\,
      I2 => \^tx_buffer_empty_pre_reg\,
      O => fifo_wr
    );
\MEM_DECODE_GEN[0].PER_CE_GEN[0].MULTIPLE_CES_THIS_CS_GEN.CE_I\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f
     port map (
      \bus2ip_addr_i_reg[2]\ => \bus2ip_addr_i_reg[2]\,
      \bus2ip_addr_i_reg[3]\ => \bus2ip_addr_i_reg[3]\,
      ce_expnd_i_3 => ce_expnd_i_3,
      start2 => start2
    );
\MEM_DECODE_GEN[0].PER_CE_GEN[2].MULTIPLE_CES_THIS_CS_GEN.CE_I\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pselect_f__parameterized1\
     port map (
      \bus2ip_addr_i_reg[2]\ => \bus2ip_addr_i_reg[2]\,
      \bus2ip_addr_i_reg[3]\ => \bus2ip_addr_i_reg[3]\,
      ce_expnd_i_1 => ce_expnd_i_1,
      start2 => start2
    );
clr_Status_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I1 => \^enable_interrupts_reg\,
      O => bus2ip_rdce(0)
    );
enable_interrupts_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => s_axi_wdata(2),
      I1 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I2 => \^enable_interrupts_reg\,
      I3 => enable_interrupts,
      O => enable_interrupts_reg_0
    );
reset_RX_FIFO_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^enable_interrupts_reg\,
      I1 => s_axi_wdata(1),
      I2 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      O => reset_RX_FIFO
    );
reset_TX_FIFO_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => \^enable_interrupts_reg\,
      I1 => s_axi_wdata(0),
      I2 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      O => reset_TX_FIFO
    );
rx_Data_Present_Pre_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"002A"
    )
        port map (
      I0 => s_axi_aresetn,
      I1 => \^s_axi_rresp_i_reg[1]\,
      I2 => \^enable_interrupts_reg\,
      I3 => Q(0),
      O => rx_Data_Present_Pre_reg
    );
s_axi_arready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0E0"
    )
        port map (
      I0 => \^s_axi_rresp_i_reg[1]\,
      I1 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I2 => \^enable_interrupts_reg\,
      I3 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I4 => \^tx_buffer_empty_pre_reg\,
      O => \^s_axi_arready\
    );
\s_axi_bresp_i[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB08"
    )
        port map (
      I0 => \^ip2bus_error\,
      I1 => \state_reg[1]_1\(1),
      I2 => \state_reg[1]_1\(0),
      I3 => s_axi_bresp(0),
      O => \s_axi_bresp_i_reg[1]\
    );
s_axi_bvalid_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08FF0808"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => \state_reg[1]_1\(1),
      I2 => \state_reg[1]_1\(0),
      I3 => s_axi_bready,
      I4 => s_axi_bvalid_i_reg_0,
      O => s_axi_bvalid_i_reg
    );
\s_axi_rdata_i[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"5C005000"
    )
        port map (
      I0 => Q(0),
      I1 => \out\(0),
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^enable_interrupts_reg\,
      I4 => \^s_axi_rresp_i_reg[1]\,
      O => D(0)
    );
\s_axi_rdata_i[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AC00A000"
    )
        port map (
      I0 => rx_Buffer_Full,
      I1 => \out\(1),
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^enable_interrupts_reg\,
      I4 => \^s_axi_rresp_i_reg[1]\,
      O => D(1)
    );
\s_axi_rdata_i[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AC00A000"
    )
        port map (
      I0 => \INFERRED_GEN.cnt_i_reg[4]\(0),
      I1 => \out\(2),
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^enable_interrupts_reg\,
      I4 => \^s_axi_rresp_i_reg[1]\,
      O => D(2)
    );
\s_axi_rdata_i[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AC00A000"
    )
        port map (
      I0 => tx_Buffer_Full,
      I1 => \out\(3),
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^enable_interrupts_reg\,
      I4 => \^s_axi_rresp_i_reg[1]\,
      O => D(3)
    );
\s_axi_rdata_i[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AC00A000"
    )
        port map (
      I0 => enable_interrupts,
      I1 => \out\(4),
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^enable_interrupts_reg\,
      I4 => \^s_axi_rresp_i_reg[1]\,
      O => D(4)
    );
\s_axi_rdata_i[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AC00A000"
    )
        port map (
      I0 => status_reg(0),
      I1 => \out\(5),
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^enable_interrupts_reg\,
      I4 => \^s_axi_rresp_i_reg[1]\,
      O => D(5)
    );
\s_axi_rdata_i[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AC00A000"
    )
        port map (
      I0 => status_reg(1),
      I1 => \out\(6),
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^enable_interrupts_reg\,
      I4 => \^s_axi_rresp_i_reg[1]\,
      O => D(6)
    );
\s_axi_rdata_i[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => \^s_axi_rresp_i_reg[1]\,
      I1 => \^enable_interrupts_reg\,
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \out\(7),
      O => D(7)
    );
\s_axi_rresp_i[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0880088"
    )
        port map (
      I0 => \^tx_buffer_empty_pre_reg\,
      I1 => tx_Buffer_Full,
      I2 => \^s_axi_rresp_i_reg[1]\,
      I3 => \^enable_interrupts_reg\,
      I4 => Q(0),
      O => \^ip2bus_error\
    );
s_axi_rvalid_i_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08FF0808"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \state_reg[1]_1\(0),
      I2 => \state_reg[1]_1\(1),
      I3 => s_axi_rready,
      I4 => s_axi_rvalid_i_reg_0,
      O => s_axi_rvalid_i_reg
    );
s_axi_wready_INST_0: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg\,
      I1 => \^tx_buffer_empty_pre_reg\,
      I2 => \GEN_BKEND_CE_REGISTERS[2].ce_out_i_reg\,
      I3 => \^s_axi_rresp_i_reg[1]\,
      I4 => \^enable_interrupts_reg\,
      O => \^s_axi_awready\
    );
\state[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CEFFCEFC"
    )
        port map (
      I0 => \^s_axi_awready\,
      I1 => \state_reg[0]\,
      I2 => \state_reg[1]_1\(0),
      I3 => \state_reg[1]_1\(1),
      I4 => s_axi_arvalid,
      O => \state_reg[1]\(0)
    );
\state[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CEFCCEFCCEFFCEFC"
    )
        port map (
      I0 => \^s_axi_arready\,
      I1 => \state_reg[1]_0\,
      I2 => \state_reg[1]_1\(1),
      I3 => \state_reg[1]_1\(0),
      I4 => s_axi_wvalid,
      I5 => s_axi_arvalid,
      O => \state_reg[1]\(1)
    );
tx_Buffer_Empty_Pre_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8088"
    )
        port map (
      I0 => \INFERRED_GEN.cnt_i_reg[4]\(0),
      I1 => s_axi_aresetn,
      I2 => \^enable_interrupts_reg\,
      I3 => \^tx_buffer_empty_pre_reg\,
      O => tx_Buffer_Empty_Pre_reg_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f is
  port (
    tx_Buffer_Full : out STD_LOGIC;
    mux_Out : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_Start0 : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    p_4_in : in STD_LOGIC;
    \mux_sel_reg[2]\ : in STD_LOGIC;
    \mux_sel_reg[0]\ : in STD_LOGIC;
    reset_TX_FIFO_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    fifo_Read : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ : in STD_LOGIC;
    tx_Data_Enable_reg : in STD_LOGIC;
    tx_DataBits : in STD_LOGIC;
    tx_Start : in STD_LOGIC;
    fifo_wr : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f is
  signal CNTR_INCR_DECR_ADDN_F_I_n_2 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_3 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_4 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_5 : STD_LOGIC;
  signal TX_FIFO_Reset : STD_LOGIC;
  signal fifo_full_p1 : STD_LOGIC;
  signal \^tx_buffer_full\ : STD_LOGIC;
begin
  tx_Buffer_Full <= \^tx_buffer_full\;
CNTR_INCR_DECR_ADDN_F_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      Q(4) => Q(0),
      Q(3) => CNTR_INCR_DECR_ADDN_F_I_n_2,
      Q(2) => CNTR_INCR_DECR_ADDN_F_I_n_3,
      Q(1) => CNTR_INCR_DECR_ADDN_F_I_n_4,
      Q(0) => CNTR_INCR_DECR_ADDN_F_I_n_5,
      SS(0) => TX_FIFO_Reset,
      fifo_Read => fifo_Read,
      fifo_full_p1 => fifo_full_p1,
      reset_TX_FIFO_reg => reset_TX_FIFO_reg,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      tx_Buffer_Full => \^tx_buffer_full\,
      tx_DataBits => tx_DataBits,
      tx_Data_Enable_reg => tx_Data_Enable_reg,
      tx_Start => tx_Start,
      tx_Start0 => tx_Start0
    );
DYNSHREG_F_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f
     port map (
      Q(3) => CNTR_INCR_DECR_ADDN_F_I_n_2,
      Q(2) => CNTR_INCR_DECR_ADDN_F_I_n_3,
      Q(1) => CNTR_INCR_DECR_ADDN_F_I_n_4,
      Q(0) => CNTR_INCR_DECR_ADDN_F_I_n_5,
      fifo_wr => fifo_wr,
      mux_Out => mux_Out,
      \mux_sel_reg[0]\ => \mux_sel_reg[0]\,
      \mux_sel_reg[2]\ => \mux_sel_reg[2]\,
      p_4_in => p_4_in,
      s_axi_aclk => s_axi_aclk,
      s_axi_wdata(7 downto 0) => s_axi_wdata(7 downto 0)
    );
FIFO_Full_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => fifo_full_p1,
      Q => \^tx_buffer_full\,
      R => TX_FIFO_Reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f_1 is
  port (
    \status_reg_reg[2]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    Interrupt0 : out STD_LOGIC;
    \status_reg_reg[2]_0\ : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    reset_RX_FIFO_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : in STD_LOGIC;
    Bus_RNW_reg_reg : in STD_LOGIC;
    valid_rx : in STD_LOGIC;
    fifo_Write : in STD_LOGIC;
    rx_Data_Present_Pre : in STD_LOGIC;
    enable_interrupts : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_Buffer_Empty_Pre : in STD_LOGIC;
    status_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    clr_Status : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 0 to 7 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f_1 : entity is "srl_fifo_rbu_f";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f_1;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f_1 is
  signal CNTR_INCR_DECR_ADDN_F_I_n_3 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_4 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_5 : STD_LOGIC;
  signal CNTR_INCR_DECR_ADDN_F_I_n_6 : STD_LOGIC;
  signal RX_FIFO_Reset : STD_LOGIC;
  signal fifo_full_p1 : STD_LOGIC;
  signal \^status_reg_reg[2]\ : STD_LOGIC;
begin
  \status_reg_reg[2]\ <= \^status_reg_reg[2]\;
CNTR_INCR_DECR_ADDN_F_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cntr_incr_decr_addn_f_2
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      Bus_RNW_reg_reg => Bus_RNW_reg_reg,
      FIFO_Full_reg => \^status_reg_reg[2]\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      \INFERRED_GEN.cnt_i_reg[4]_0\(0) => \INFERRED_GEN.cnt_i_reg[4]\(0),
      Interrupt0 => Interrupt0,
      Q(4) => Q(0),
      Q(3) => CNTR_INCR_DECR_ADDN_F_I_n_3,
      Q(2) => CNTR_INCR_DECR_ADDN_F_I_n_4,
      Q(1) => CNTR_INCR_DECR_ADDN_F_I_n_5,
      Q(0) => CNTR_INCR_DECR_ADDN_F_I_n_6,
      SS(0) => RX_FIFO_Reset,
      enable_interrupts => enable_interrupts,
      fifo_Write => fifo_Write,
      fifo_full_p1 => fifo_full_p1,
      reset_RX_FIFO_reg => reset_RX_FIFO_reg,
      rx_Data_Present_Pre => rx_Data_Present_Pre,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      tx_Buffer_Empty_Pre => tx_Buffer_Empty_Pre,
      valid_rx => valid_rx
    );
DYNSHREG_F_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_f_3
     port map (
      FIFO_Full_reg => \^status_reg_reg[2]\,
      Q(3) => CNTR_INCR_DECR_ADDN_F_I_n_3,
      Q(2) => CNTR_INCR_DECR_ADDN_F_I_n_4,
      Q(1) => CNTR_INCR_DECR_ADDN_F_I_n_5,
      Q(0) => CNTR_INCR_DECR_ADDN_F_I_n_6,
      fifo_Write => fifo_Write,
      \in\(0 to 7) => \in\(0 to 7),
      \out\(7 downto 0) => \out\(7 downto 0),
      s_axi_aclk => s_axi_aclk,
      valid_rx => valid_rx
    );
FIFO_Full_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => fifo_full_p1,
      Q => \^status_reg_reg[2]\,
      R => RX_FIFO_Reset
    );
\status_reg[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000EA00"
    )
        port map (
      I0 => status_reg(0),
      I1 => fifo_Write,
      I2 => \^status_reg_reg[2]\,
      I3 => s_axi_aresetn,
      I4 => clr_Status,
      O => \status_reg_reg[2]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment is
  port (
    tx_Buffer_Empty_Pre_reg : out STD_LOGIC;
    \s_axi_rresp_i_reg[1]_0\ : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    enable_interrupts_reg : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_wr : out STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[2]\ : out STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[2]_0\ : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    FIFO_Full_reg : out STD_LOGIC;
    reset_TX_FIFO : out STD_LOGIC;
    reset_RX_FIFO : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    bus2ip_rdce : out STD_LOGIC_VECTOR ( 0 to 0 );
    enable_interrupts_reg_0 : out STD_LOGIC;
    tx_Buffer_Empty_Pre_reg_0 : out STD_LOGIC;
    rx_Data_Present_Pre_reg : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bus2ip_reset : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    tx_Buffer_Full : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_Buffer_Full : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    enable_interrupts : in STD_LOGIC;
    status_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment is
  signal I_DECODER_n_15 : STD_LOGIC;
  signal I_DECODER_n_16 : STD_LOGIC;
  signal I_DECODER_n_25 : STD_LOGIC;
  signal I_DECODER_n_26 : STD_LOGIC;
  signal I_DECODER_n_27 : STD_LOGIC;
  signal SIn_DBus : STD_LOGIC_VECTOR ( 0 to 7 );
  signal \bus2ip_addr_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i[3]_i_2_n_0\ : STD_LOGIC;
  signal \bus2ip_addr_i_reg_n_0_[2]\ : STD_LOGIC;
  signal \bus2ip_addr_i_reg_n_0_[3]\ : STD_LOGIC;
  signal bus2ip_rnw_i : STD_LOGIC;
  signal bus2ip_rnw_i_i_1_n_0 : STD_LOGIC;
  signal ip2bus_error : STD_LOGIC;
  signal rst : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \^s_axi_bvalid\ : STD_LOGIC;
  signal s_axi_rdata_i : STD_LOGIC;
  signal \^s_axi_rvalid\ : STD_LOGIC;
  signal start2 : STD_LOGIC;
  signal start2_i_1_n_0 : STD_LOGIC;
  signal state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \state[0]_i_2_n_0\ : STD_LOGIC;
  signal \state[1]_i_2_n_0\ : STD_LOGIC;
  signal \state[1]_i_3_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \bus2ip_addr_i[3]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of start2_i_1 : label is "soft_lutpair9";
begin
  s_axi_bresp(0) <= \^s_axi_bresp\(0);
  s_axi_bvalid <= \^s_axi_bvalid\;
  s_axi_rvalid <= \^s_axi_rvalid\;
I_DECODER: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_address_decoder
     port map (
      D(7) => SIn_DBus(0),
      D(6) => SIn_DBus(1),
      D(5) => SIn_DBus(2),
      D(4) => SIn_DBus(3),
      D(3) => SIn_DBus(4),
      D(2) => SIn_DBus(5),
      D(1) => SIn_DBus(6),
      D(0) => SIn_DBus(7),
      FIFO_Full_reg => FIFO_Full_reg,
      \INFERRED_GEN.cnt_i_reg[2]\ => \INFERRED_GEN.cnt_i_reg[2]\,
      \INFERRED_GEN.cnt_i_reg[2]_0\ => \INFERRED_GEN.cnt_i_reg[2]_0\,
      \INFERRED_GEN.cnt_i_reg[4]\(0) => \INFERRED_GEN.cnt_i_reg[4]\(0),
      Q(0) => Q(0),
      \bus2ip_addr_i_reg[2]\ => \bus2ip_addr_i_reg_n_0_[2]\,
      \bus2ip_addr_i_reg[3]\ => \bus2ip_addr_i_reg_n_0_[3]\,
      bus2ip_rdce(0) => bus2ip_rdce(0),
      bus2ip_rnw_i => bus2ip_rnw_i,
      enable_interrupts => enable_interrupts,
      enable_interrupts_reg => enable_interrupts_reg,
      enable_interrupts_reg_0 => enable_interrupts_reg_0,
      fifo_wr => fifo_wr,
      ip2bus_error => ip2bus_error,
      \out\(7 downto 0) => \out\(7 downto 0),
      reset_RX_FIFO => reset_RX_FIFO,
      reset_TX_FIFO => reset_TX_FIFO,
      rx_Buffer_Full => rx_Buffer_Full,
      rx_Data_Present_Pre_reg => rx_Data_Present_Pre_reg,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awready => s_axi_awready,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => \^s_axi_bresp\(0),
      \s_axi_bresp_i_reg[1]\ => I_DECODER_n_27,
      s_axi_bvalid_i_reg => I_DECODER_n_26,
      s_axi_bvalid_i_reg_0 => \^s_axi_bvalid\,
      s_axi_rready => s_axi_rready,
      \s_axi_rresp_i_reg[1]\ => \s_axi_rresp_i_reg[1]_0\,
      s_axi_rvalid_i_reg => I_DECODER_n_25,
      s_axi_rvalid_i_reg_0 => \^s_axi_rvalid\,
      s_axi_wdata(2 downto 0) => s_axi_wdata(2 downto 0),
      s_axi_wvalid => \state[1]_i_3_n_0\,
      start2 => start2,
      \state_reg[0]\ => \state[0]_i_2_n_0\,
      \state_reg[1]\(1) => I_DECODER_n_15,
      \state_reg[1]\(0) => I_DECODER_n_16,
      \state_reg[1]_0\ => \state[1]_i_2_n_0\,
      \state_reg[1]_1\(1 downto 0) => state(1 downto 0),
      status_reg(1 downto 0) => status_reg(1 downto 0),
      tx_Buffer_Empty_Pre_reg => tx_Buffer_Empty_Pre_reg,
      tx_Buffer_Empty_Pre_reg_0 => tx_Buffer_Empty_Pre_reg_0,
      tx_Buffer_Full => tx_Buffer_Full
    );
\bus2ip_addr_i[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => s_axi_awaddr(0),
      I1 => \bus2ip_addr_i[3]_i_2_n_0\,
      I2 => s_axi_araddr(0),
      I3 => start2_i_1_n_0,
      I4 => \bus2ip_addr_i_reg_n_0_[2]\,
      O => \bus2ip_addr_i[2]_i_1_n_0\
    );
\bus2ip_addr_i[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => s_axi_awaddr(1),
      I1 => \bus2ip_addr_i[3]_i_2_n_0\,
      I2 => s_axi_araddr(1),
      I3 => start2_i_1_n_0,
      I4 => \bus2ip_addr_i_reg_n_0_[3]\,
      O => \bus2ip_addr_i[3]_i_1_n_0\
    );
\bus2ip_addr_i[3]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => state(1),
      I1 => state(0),
      I2 => s_axi_arvalid,
      O => \bus2ip_addr_i[3]_i_2_n_0\
    );
\bus2ip_addr_i_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bus2ip_addr_i[2]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg_n_0_[2]\,
      R => rst
    );
\bus2ip_addr_i_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \bus2ip_addr_i[3]_i_1_n_0\,
      Q => \bus2ip_addr_i_reg_n_0_[3]\,
      R => rst
    );
bus2ip_rnw_i_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF7000000F0"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_wvalid,
      I2 => s_axi_arvalid,
      I3 => state(0),
      I4 => state(1),
      I5 => bus2ip_rnw_i,
      O => bus2ip_rnw_i_i_1_n_0
    );
bus2ip_rnw_i_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_rnw_i_i_1_n_0,
      Q => bus2ip_rnw_i,
      R => rst
    );
rst_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_reset,
      Q => rst,
      R => '0'
    );
\s_axi_bresp_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_27,
      Q => \^s_axi_bresp\(0),
      R => rst
    );
s_axi_bvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_26,
      Q => \^s_axi_bvalid\,
      R => rst
    );
\s_axi_rdata_i[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => state(0),
      I1 => state(1),
      O => s_axi_rdata_i
    );
\s_axi_rdata_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => SIn_DBus(7),
      Q => s_axi_rdata(0),
      R => rst
    );
\s_axi_rdata_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => SIn_DBus(6),
      Q => s_axi_rdata(1),
      R => rst
    );
\s_axi_rdata_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => SIn_DBus(5),
      Q => s_axi_rdata(2),
      R => rst
    );
\s_axi_rdata_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => SIn_DBus(4),
      Q => s_axi_rdata(3),
      R => rst
    );
\s_axi_rdata_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => SIn_DBus(3),
      Q => s_axi_rdata(4),
      R => rst
    );
\s_axi_rdata_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => SIn_DBus(2),
      Q => s_axi_rdata(5),
      R => rst
    );
\s_axi_rdata_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => SIn_DBus(1),
      Q => s_axi_rdata(6),
      R => rst
    );
\s_axi_rdata_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => SIn_DBus(0),
      Q => s_axi_rdata(7),
      R => rst
    );
\s_axi_rresp_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => s_axi_rdata_i,
      D => ip2bus_error,
      Q => s_axi_rresp(0),
      R => rst
    );
s_axi_rvalid_i_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_25,
      Q => \^s_axi_rvalid\,
      R => rst
    );
start2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000000F8"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_wvalid,
      I2 => s_axi_arvalid,
      I3 => state(0),
      I4 => state(1),
      O => start2_i_1_n_0
    );
start2_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => start2_i_1_n_0,
      Q => start2,
      R => rst
    );
\state[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002A2A2A"
    )
        port map (
      I0 => state(0),
      I1 => \^s_axi_rvalid\,
      I2 => s_axi_rready,
      I3 => s_axi_bready,
      I4 => \^s_axi_bvalid\,
      O => \state[0]_i_2_n_0\
    );
\state[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"002A2A2A"
    )
        port map (
      I0 => state(1),
      I1 => \^s_axi_rvalid\,
      I2 => s_axi_rready,
      I3 => s_axi_bready,
      I4 => \^s_axi_bvalid\,
      O => \state[1]_i_2_n_0\
    );
\state[1]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => s_axi_awvalid,
      I1 => s_axi_wvalid,
      O => \state[1]_i_3_n_0\
    );
\state_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_16,
      Q => state(0),
      R => rst
    );
\state_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => I_DECODER_n_15,
      Q => state(1),
      R => rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f is
  port (
    tx_Buffer_Full : out STD_LOGIC;
    mux_Out : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    tx_Start0 : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    p_4_in : in STD_LOGIC;
    \mux_sel_reg[2]\ : in STD_LOGIC;
    \mux_sel_reg[0]\ : in STD_LOGIC;
    reset_TX_FIFO_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    fifo_Read : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ : in STD_LOGIC;
    tx_Data_Enable_reg : in STD_LOGIC;
    tx_DataBits : in STD_LOGIC;
    tx_Start : in STD_LOGIC;
    fifo_wr : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f is
begin
I_SRL_FIFO_RBU_F: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      Q(0) => Q(0),
      fifo_Read => fifo_Read,
      fifo_wr => fifo_wr,
      mux_Out => mux_Out,
      \mux_sel_reg[0]\ => \mux_sel_reg[0]\,
      \mux_sel_reg[2]\ => \mux_sel_reg[2]\,
      p_4_in => p_4_in,
      reset_TX_FIFO_reg => reset_TX_FIFO_reg,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_wdata(7 downto 0) => s_axi_wdata(7 downto 0),
      tx_Buffer_Full => tx_Buffer_Full,
      tx_DataBits => tx_DataBits,
      tx_Data_Enable_reg => tx_Data_Enable_reg,
      tx_Start => tx_Start,
      tx_Start0 => tx_Start0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f_0 is
  port (
    \status_reg_reg[2]\ : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    Interrupt0 : out STD_LOGIC;
    \status_reg_reg[2]_0\ : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    reset_RX_FIFO_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : in STD_LOGIC;
    Bus_RNW_reg_reg : in STD_LOGIC;
    valid_rx : in STD_LOGIC;
    fifo_Write : in STD_LOGIC;
    rx_Data_Present_Pre : in STD_LOGIC;
    enable_interrupts : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_Buffer_Empty_Pre : in STD_LOGIC;
    status_reg : in STD_LOGIC_VECTOR ( 0 to 0 );
    clr_Status : in STD_LOGIC;
    \in\ : in STD_LOGIC_VECTOR ( 0 to 7 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f_0 : entity is "srl_fifo_f";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f_0;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f_0 is
begin
I_SRL_FIFO_RBU_F: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_rbu_f_1
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      Bus_RNW_reg_reg => Bus_RNW_reg_reg,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      \INFERRED_GEN.cnt_i_reg[4]\(0) => \INFERRED_GEN.cnt_i_reg[4]\(0),
      Interrupt0 => Interrupt0,
      Q(0) => Q(0),
      clr_Status => clr_Status,
      enable_interrupts => enable_interrupts,
      fifo_Write => fifo_Write,
      \in\(0 to 7) => \in\(0 to 7),
      \out\(7 downto 0) => \out\(7 downto 0),
      reset_RX_FIFO_reg => reset_RX_FIFO_reg,
      rx_Data_Present_Pre => rx_Data_Present_Pre,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      status_reg(0) => status_reg(0),
      \status_reg_reg[2]\ => \status_reg_reg[2]\,
      \status_reg_reg[2]_0\ => \status_reg_reg[2]_0\,
      tx_Buffer_Empty_Pre => tx_Buffer_Empty_Pre,
      valid_rx => valid_rx
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif is
  port (
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ : out STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : out STD_LOGIC;
    s_axi_rresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    Bus_RNW_reg : out STD_LOGIC;
    s_axi_rvalid : out STD_LOGIC;
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 0 to 0 );
    fifo_wr : out STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[2]\ : out STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[2]_0\ : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    FIFO_Full_reg : out STD_LOGIC;
    reset_TX_FIFO : out STD_LOGIC;
    reset_RX_FIFO : out STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    bus2ip_rdce : out STD_LOGIC_VECTOR ( 0 to 0 );
    enable_interrupts_reg : out STD_LOGIC;
    tx_Buffer_Empty_Pre_reg : out STD_LOGIC;
    rx_Data_Present_Pre_reg : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    bus2ip_reset : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    tx_Buffer_Full : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : in STD_LOGIC_VECTOR ( 7 downto 0 );
    rx_Buffer_Full : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    enable_interrupts : in STD_LOGIC;
    status_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_araddr : in STD_LOGIC_VECTOR ( 1 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif is
begin
I_SLAVE_ATTACHMENT: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_slave_attachment
     port map (
      FIFO_Full_reg => FIFO_Full_reg,
      \INFERRED_GEN.cnt_i_reg[2]\ => \INFERRED_GEN.cnt_i_reg[2]\,
      \INFERRED_GEN.cnt_i_reg[2]_0\ => \INFERRED_GEN.cnt_i_reg[2]_0\,
      \INFERRED_GEN.cnt_i_reg[4]\(0) => \INFERRED_GEN.cnt_i_reg[4]\(0),
      Q(0) => Q(0),
      bus2ip_rdce(0) => bus2ip_rdce(0),
      bus2ip_reset => bus2ip_reset,
      enable_interrupts => enable_interrupts,
      enable_interrupts_reg => Bus_RNW_reg,
      enable_interrupts_reg_0 => enable_interrupts_reg,
      fifo_wr => fifo_wr,
      \out\(7 downto 0) => \out\(7 downto 0),
      reset_RX_FIFO => reset_RX_FIFO,
      reset_TX_FIFO => reset_TX_FIFO,
      rx_Buffer_Full => rx_Buffer_Full,
      rx_Data_Present_Pre_reg => rx_Data_Present_Pre_reg,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(1 downto 0) => s_axi_araddr(1 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(1 downto 0) => s_axi_awaddr(1 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => s_axi_bresp(0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(7 downto 0) => s_axi_rdata(7 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => s_axi_rresp(0),
      \s_axi_rresp_i_reg[1]_0\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(2 downto 0) => s_axi_wdata(2 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      status_reg(1 downto 0) => status_reg(1 downto 0),
      tx_Buffer_Empty_Pre_reg => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      tx_Buffer_Empty_Pre_reg_0 => tx_Buffer_Empty_Pre_reg,
      tx_Buffer_Full => tx_Buffer_Full
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_rx is
  port (
    \status_reg_reg[2]\ : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    status_reg_reg0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    Interrupt0 : out STD_LOGIC;
    \status_reg_reg[2]_0\ : out STD_LOGIC;
    \out\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    en_16x_Baud : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    clr_Status : in STD_LOGIC;
    status_reg : in STD_LOGIC_VECTOR ( 1 downto 0 );
    reset_RX_FIFO_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : in STD_LOGIC;
    Bus_RNW_reg_reg : in STD_LOGIC;
    rx_Data_Present_Pre : in STD_LOGIC;
    enable_interrupts : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    tx_Buffer_Empty_Pre : in STD_LOGIC;
    rx : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_rx;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_rx is
  signal DELAY_16_I_n_1 : STD_LOGIC;
  signal DELAY_16_I_n_10 : STD_LOGIC;
  signal DELAY_16_I_n_11 : STD_LOGIC;
  signal DELAY_16_I_n_12 : STD_LOGIC;
  signal RX_D2 : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal fifo_Write : STD_LOGIC;
  signal fifo_Write0 : STD_LOGIC;
  signal fifo_din : STD_LOGIC_VECTOR ( 1 to 8 );
  signal frame_err_ocrd : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_14_out : STD_LOGIC;
  signal p_17_out : STD_LOGIC;
  signal p_20_out : STD_LOGIC;
  signal p_26_out : STD_LOGIC;
  signal p_2_out : STD_LOGIC;
  signal p_5_out : STD_LOGIC;
  signal p_8_out : STD_LOGIC;
  signal running_reg_n_0 : STD_LOGIC;
  signal rx_1 : STD_LOGIC;
  signal rx_2 : STD_LOGIC;
  signal rx_3 : STD_LOGIC;
  signal rx_4 : STD_LOGIC;
  signal rx_5 : STD_LOGIC;
  signal rx_6 : STD_LOGIC;
  signal rx_7 : STD_LOGIC;
  signal rx_8 : STD_LOGIC;
  signal rx_9 : STD_LOGIC;
  signal start_Edge_Detected : STD_LOGIC;
  signal start_Edge_Detected0 : STD_LOGIC;
  signal start_Edge_Detected_i_2_n_0 : STD_LOGIC;
  signal stop_Bit_Position_reg_n_0 : STD_LOGIC;
  signal valid_rx : STD_LOGIC;
  signal valid_rx_i_1_n_0 : STD_LOGIC;
begin
  SR(0) <= \^sr\(0);
DELAY_16_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f
     port map (
      \SERIAL_TO_PARALLEL[2].fifo_din_reg[2]\ => DELAY_16_I_n_1,
      clr_Status => clr_Status,
      en_16x_Baud => en_16x_Baud,
      fifo_Write0 => fifo_Write0,
      frame_err_ocrd => frame_err_ocrd,
      frame_err_ocrd_reg => DELAY_16_I_n_11,
      \in\(0 to 7) => fifo_din(1 to 8),
      p_11_out => p_11_out,
      p_14_out => p_14_out,
      p_17_out => p_17_out,
      p_20_out => p_20_out,
      p_2_out => p_2_out,
      p_5_out => p_5_out,
      p_8_out => p_8_out,
      running_reg => DELAY_16_I_n_12,
      running_reg_0 => running_reg_n_0,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      scndry_out => RX_D2,
      start_Edge_Detected => start_Edge_Detected,
      status_reg(0) => status_reg(1),
      status_reg_reg0 => status_reg_reg0,
      stop_Bit_Position_reg => DELAY_16_I_n_10,
      stop_Bit_Position_reg_0 => stop_Bit_Position_reg_n_0,
      valid_rx => valid_rx
    );
INPUT_DOUBLE_REGS3: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_cdc_sync
     port map (
      EN_16x_Baud_reg => DELAY_16_I_n_1,
      \in\(0) => fifo_din(1),
      p_26_out => p_26_out,
      rx => rx,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      scndry_out => RX_D2,
      start_Edge_Detected => start_Edge_Detected
    );
Interrupt_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_axi_aresetn,
      O => \^sr\(0)
    );
\SERIAL_TO_PARALLEL[1].fifo_din_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_26_out,
      Q => fifo_din(1),
      R => '0'
    );
\SERIAL_TO_PARALLEL[2].fifo_din_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_20_out,
      Q => fifo_din(2),
      R => '0'
    );
\SERIAL_TO_PARALLEL[3].fifo_din_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_17_out,
      Q => fifo_din(3),
      R => '0'
    );
\SERIAL_TO_PARALLEL[4].fifo_din_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_14_out,
      Q => fifo_din(4),
      R => '0'
    );
\SERIAL_TO_PARALLEL[5].fifo_din_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_11_out,
      Q => fifo_din(5),
      R => '0'
    );
\SERIAL_TO_PARALLEL[6].fifo_din_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_8_out,
      Q => fifo_din(6),
      R => '0'
    );
\SERIAL_TO_PARALLEL[7].fifo_din_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_5_out,
      Q => fifo_din(7),
      R => '0'
    );
\SERIAL_TO_PARALLEL[8].fifo_din_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => p_2_out,
      Q => fifo_din(8),
      R => '0'
    );
SRL_FIFO_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f_0
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      Bus_RNW_reg_reg => Bus_RNW_reg_reg,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      \INFERRED_GEN.cnt_i_reg[4]\(0) => \INFERRED_GEN.cnt_i_reg[4]\(0),
      Interrupt0 => Interrupt0,
      Q(0) => Q(0),
      clr_Status => clr_Status,
      enable_interrupts => enable_interrupts,
      fifo_Write => fifo_Write,
      \in\(0 to 7) => fifo_din(1 to 8),
      \out\(7 downto 0) => \out\(7 downto 0),
      reset_RX_FIFO_reg => reset_RX_FIFO_reg,
      rx_Data_Present_Pre => rx_Data_Present_Pre,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      status_reg(0) => status_reg(0),
      \status_reg_reg[2]\ => \status_reg_reg[2]\,
      \status_reg_reg[2]_0\ => \status_reg_reg[2]_0\,
      tx_Buffer_Empty_Pre => tx_Buffer_Empty_Pre,
      valid_rx => valid_rx
    );
fifo_Write_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => fifo_Write0,
      Q => fifo_Write,
      R => \^sr\(0)
    );
frame_err_ocrd_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => DELAY_16_I_n_11,
      Q => frame_err_ocrd,
      R => \^sr\(0)
    );
running_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => DELAY_16_I_n_12,
      Q => running_reg_n_0,
      R => \^sr\(0)
    );
rx_1_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => RX_D2,
      Q => rx_1,
      R => \^sr\(0)
    );
rx_2_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => rx_1,
      Q => rx_2,
      R => \^sr\(0)
    );
rx_3_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => rx_2,
      Q => rx_3,
      R => \^sr\(0)
    );
rx_4_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => rx_3,
      Q => rx_4,
      R => \^sr\(0)
    );
rx_5_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => rx_4,
      Q => rx_5,
      R => \^sr\(0)
    );
rx_6_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => rx_5,
      Q => rx_6,
      R => \^sr\(0)
    );
rx_7_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => rx_6,
      Q => rx_7,
      R => \^sr\(0)
    );
rx_8_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => rx_7,
      Q => rx_8,
      R => \^sr\(0)
    );
rx_9_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => rx_8,
      Q => rx_9,
      R => \^sr\(0)
    );
start_Edge_Detected_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => rx_8,
      I1 => rx_2,
      I2 => start_Edge_Detected_i_2_n_0,
      I3 => rx_3,
      I4 => rx_1,
      I5 => frame_err_ocrd,
      O => start_Edge_Detected0
    );
start_Edge_Detected_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => rx_5,
      I1 => rx_7,
      I2 => rx_9,
      I3 => running_reg_n_0,
      I4 => rx_6,
      I5 => rx_4,
      O => start_Edge_Detected_i_2_n_0
    );
start_Edge_Detected_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => en_16x_Baud,
      D => start_Edge_Detected0,
      Q => start_Edge_Detected,
      R => \^sr\(0)
    );
stop_Bit_Position_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => DELAY_16_I_n_10,
      Q => stop_Bit_Position_reg_n_0,
      R => \^sr\(0)
    );
valid_rx_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => start_Edge_Detected,
      I1 => fifo_Write,
      I2 => valid_rx,
      O => valid_rx_i_1_n_0
    );
valid_rx_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => valid_rx_i_1_n_0,
      Q => valid_rx,
      R => \^sr\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_tx is
  port (
    tx_Buffer_Full : out STD_LOGIC;
    tx : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    s_axi_aclk : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    en_16x_Baud : in STD_LOGIC;
    reset_TX_FIFO_reg : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ : in STD_LOGIC;
    fifo_wr : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_tx;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_tx is
  signal MID_START_BIT_SRL16_I_n_0 : STD_LOGIC;
  signal TX0 : STD_LOGIC;
  signal fifo_Read : STD_LOGIC;
  signal fifo_Read0 : STD_LOGIC;
  signal mux_Out : STD_LOGIC;
  signal \mux_sel[0]_i_1_n_0\ : STD_LOGIC;
  signal \mux_sel[1]_i_1_n_0\ : STD_LOGIC;
  signal \mux_sel[2]_i_1_n_0\ : STD_LOGIC;
  signal \mux_sel_reg_n_0_[0]\ : STD_LOGIC;
  signal \mux_sel_reg_n_0_[2]\ : STD_LOGIC;
  signal p_4_in : STD_LOGIC;
  signal serial_Data : STD_LOGIC;
  signal tx_DataBits : STD_LOGIC;
  signal tx_DataBits0 : STD_LOGIC;
  signal tx_Data_Enable_reg_n_0 : STD_LOGIC;
  signal tx_Start : STD_LOGIC;
  signal tx_Start0 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mux_sel[0]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \mux_sel[1]_i_1\ : label is "soft_lutpair20";
begin
MID_START_BIT_SRL16_I: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dynshreg_i_f__parameterized0\
     port map (
      en_16x_Baud => en_16x_Baud,
      s_axi_aclk => s_axi_aclk,
      tx_Data_Enable_reg => MID_START_BIT_SRL16_I_n_0,
      tx_Data_Enable_reg_0 => tx_Data_Enable_reg_n_0
    );
SRL_FIFO_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_srl_fifo_f
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      Q(0) => Q(0),
      fifo_Read => fifo_Read,
      fifo_wr => fifo_wr,
      mux_Out => mux_Out,
      \mux_sel_reg[0]\ => \mux_sel_reg_n_0_[0]\,
      \mux_sel_reg[2]\ => \mux_sel_reg_n_0_[2]\,
      p_4_in => p_4_in,
      reset_TX_FIFO_reg => reset_TX_FIFO_reg,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_wdata(7 downto 0) => s_axi_wdata(7 downto 0),
      tx_Buffer_Full => tx_Buffer_Full,
      tx_DataBits => tx_DataBits,
      tx_Data_Enable_reg => tx_Data_Enable_reg_n_0,
      tx_Start => tx_Start,
      tx_Start0 => tx_Start0
    );
TX_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"31"
    )
        port map (
      I0 => tx_DataBits,
      I1 => tx_Start,
      I2 => serial_Data,
      O => TX0
    );
TX_reg: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => TX0,
      Q => tx,
      S => SR(0)
    );
fifo_Read_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0100"
    )
        port map (
      I0 => \mux_sel_reg_n_0_[0]\,
      I1 => \mux_sel_reg_n_0_[2]\,
      I2 => p_4_in,
      I3 => tx_Data_Enable_reg_n_0,
      O => fifo_Read0
    );
fifo_Read_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => fifo_Read0,
      Q => fifo_Read,
      R => SR(0)
    );
\mux_sel[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E1F0F1F0"
    )
        port map (
      I0 => p_4_in,
      I1 => \mux_sel_reg_n_0_[2]\,
      I2 => \mux_sel_reg_n_0_[0]\,
      I3 => tx_Data_Enable_reg_n_0,
      I4 => tx_DataBits,
      O => \mux_sel[0]_i_1_n_0\
    );
\mux_sel[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"99AAABAA"
    )
        port map (
      I0 => p_4_in,
      I1 => \mux_sel_reg_n_0_[2]\,
      I2 => \mux_sel_reg_n_0_[0]\,
      I3 => tx_Data_Enable_reg_n_0,
      I4 => tx_DataBits,
      O => \mux_sel[1]_i_1_n_0\
    );
\mux_sel[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7777888C"
    )
        port map (
      I0 => tx_DataBits,
      I1 => tx_Data_Enable_reg_n_0,
      I2 => \mux_sel_reg_n_0_[0]\,
      I3 => p_4_in,
      I4 => \mux_sel_reg_n_0_[2]\,
      O => \mux_sel[2]_i_1_n_0\
    );
\mux_sel_reg[0]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \mux_sel[0]_i_1_n_0\,
      Q => \mux_sel_reg_n_0_[0]\,
      S => SR(0)
    );
\mux_sel_reg[1]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \mux_sel[1]_i_1_n_0\,
      Q => p_4_in,
      S => SR(0)
    );
\mux_sel_reg[2]\: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \mux_sel[2]_i_1_n_0\,
      Q => \mux_sel_reg_n_0_[2]\,
      S => SR(0)
    );
serial_Data_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => mux_Out,
      Q => serial_Data,
      R => SR(0)
    );
tx_DataBits_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0F08"
    )
        port map (
      I0 => tx_Start,
      I1 => tx_Data_Enable_reg_n_0,
      I2 => fifo_Read,
      I3 => tx_DataBits,
      O => tx_DataBits0
    );
tx_DataBits_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => tx_DataBits0,
      Q => tx_DataBits,
      R => SR(0)
    );
tx_Data_Enable_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => MID_START_BIT_SRL16_I_n_0,
      Q => tx_Data_Enable_reg_n_0,
      R => SR(0)
    );
tx_Start_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => tx_Start0,
      Q => tx_Start,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_core is
  port (
    status_reg : out STD_LOGIC_VECTOR ( 1 downto 0 );
    bus2ip_reset : out STD_LOGIC;
    rx_Buffer_Full : out STD_LOGIC;
    tx_Buffer_Full : out STD_LOGIC;
    tx : out STD_LOGIC;
    interrupt : out STD_LOGIC;
    enable_interrupts : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    FIFO_Full_reg : out STD_LOGIC_VECTOR ( 0 to 0 );
    \out\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axi_aclk : in STD_LOGIC;
    reset_TX_FIFO : in STD_LOGIC;
    reset_RX_FIFO : in STD_LOGIC;
    bus2ip_rdce : in STD_LOGIC_VECTOR ( 0 to 0 );
    \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]\ : in STD_LOGIC;
    \INFERRED_GEN.cnt_i_reg[4]\ : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ : in STD_LOGIC;
    Bus_RNW_reg : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ : in STD_LOGIC;
    \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : in STD_LOGIC;
    Bus_RNW_reg_reg : in STD_LOGIC;
    rx : in STD_LOGIC;
    fifo_wr : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_core;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_core is
  signal Interrupt0 : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal UARTLITE_RX_I_n_5 : STD_LOGIC;
  signal \^bus2ip_reset\ : STD_LOGIC;
  signal clr_Status : STD_LOGIC;
  signal en_16x_Baud : STD_LOGIC;
  signal \^enable_interrupts\ : STD_LOGIC;
  signal reset_RX_FIFO_reg_n_0 : STD_LOGIC;
  signal reset_TX_FIFO_reg_n_0 : STD_LOGIC;
  signal rx_Data_Present_Pre : STD_LOGIC;
  signal \^status_reg\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal status_reg_reg0 : STD_LOGIC;
  signal tx_Buffer_Empty_Pre : STD_LOGIC;
begin
  Q(0) <= \^q\(0);
  bus2ip_reset <= \^bus2ip_reset\;
  enable_interrupts <= \^enable_interrupts\;
  status_reg(1 downto 0) <= \^status_reg\(1 downto 0);
BAUD_RATE_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_baudrate
     port map (
      SR(0) => \^bus2ip_reset\,
      en_16x_Baud => en_16x_Baud,
      s_axi_aclk => s_axi_aclk
    );
Interrupt_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => Interrupt0,
      Q => interrupt,
      R => \^bus2ip_reset\
    );
UARTLITE_RX_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_rx
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      Bus_RNW_reg_reg => Bus_RNW_reg_reg,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\,
      \INFERRED_GEN.cnt_i_reg[4]\(0) => \^q\(0),
      Interrupt0 => Interrupt0,
      Q(0) => FIFO_Full_reg(0),
      SR(0) => \^bus2ip_reset\,
      clr_Status => clr_Status,
      en_16x_Baud => en_16x_Baud,
      enable_interrupts => \^enable_interrupts\,
      \out\(7 downto 0) => \out\(7 downto 0),
      reset_RX_FIFO_reg => reset_RX_FIFO_reg_n_0,
      rx => rx,
      rx_Data_Present_Pre => rx_Data_Present_Pre,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      status_reg(1 downto 0) => \^status_reg\(1 downto 0),
      status_reg_reg0 => status_reg_reg0,
      \status_reg_reg[2]\ => rx_Buffer_Full,
      \status_reg_reg[2]_0\ => UARTLITE_RX_I_n_5,
      tx_Buffer_Empty_Pre => tx_Buffer_Empty_Pre
    );
UARTLITE_TX_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_tx
     port map (
      Bus_RNW_reg => Bus_RNW_reg,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ => \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\,
      Q(0) => \^q\(0),
      SR(0) => \^bus2ip_reset\,
      en_16x_Baud => en_16x_Baud,
      fifo_wr => fifo_wr,
      reset_TX_FIFO_reg => reset_TX_FIFO_reg_n_0,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_wdata(7 downto 0) => s_axi_wdata(7 downto 0),
      tx => tx,
      tx_Buffer_Full => tx_Buffer_Full
    );
clr_Status_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => bus2ip_rdce(0),
      Q => clr_Status,
      R => \^bus2ip_reset\
    );
enable_interrupts_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]\,
      Q => \^enable_interrupts\,
      R => \^bus2ip_reset\
    );
reset_RX_FIFO_reg: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => reset_RX_FIFO,
      Q => reset_RX_FIFO_reg_n_0,
      S => \^bus2ip_reset\
    );
reset_TX_FIFO_reg: unisim.vcomponents.FDSE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => reset_TX_FIFO,
      Q => reset_TX_FIFO_reg_n_0,
      S => \^bus2ip_reset\
    );
rx_Data_Present_Pre_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\,
      Q => rx_Data_Present_Pre,
      R => '0'
    );
\status_reg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => status_reg_reg0,
      Q => \^status_reg\(1),
      R => '0'
    );
\status_reg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => s_axi_aclk,
      CE => '1',
      D => UARTLITE_RX_I_n_5,
      Q => \^status_reg\(0),
      R => '0'
    );
tx_Buffer_Empty_Pre_reg: unisim.vcomponents.FDRE
     port map (
      C => s_axi_aclk,
      CE => '1',
      D => \INFERRED_GEN.cnt_i_reg[4]\,
      Q => tx_Buffer_Empty_Pre,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx : out STD_LOGIC
  );
  attribute C_BAUDRATE : integer;
  attribute C_BAUDRATE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is 115200;
  attribute C_DATA_BITS : integer;
  attribute C_DATA_BITS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is 8;
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is "artix7";
  attribute C_ODD_PARITY : integer;
  attribute C_ODD_PARITY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is 0;
  attribute C_S_AXI_ACLK_FREQ_HZ : integer;
  attribute C_S_AXI_ACLK_FREQ_HZ of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is 50000000;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is 4;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is 32;
  attribute C_USE_PARITY : integer;
  attribute C_USE_PARITY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is 0;
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite : entity is "yes";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite is
  signal \<const0>\ : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_11 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_16 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_17 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_18 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_8 : STD_LOGIC;
  signal AXI_LITE_IPIF_I_n_9 : STD_LOGIC;
  signal \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\ : STD_LOGIC;
  signal \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ : STD_LOGIC;
  signal \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ : STD_LOGIC;
  signal \UARTLITE_RX_I/rx_Data_Empty\ : STD_LOGIC;
  signal \UARTLITE_TX_I/fifo_wr\ : STD_LOGIC;
  signal bus2ip_rdce : STD_LOGIC_VECTOR ( 1 to 1 );
  signal bus2ip_reset : STD_LOGIC;
  signal enable_interrupts : STD_LOGIC;
  signal reset_RX_FIFO : STD_LOGIC;
  signal reset_TX_FIFO : STD_LOGIC;
  signal rx_Buffer_Full : STD_LOGIC;
  signal rx_Data : STD_LOGIC_VECTOR ( 0 to 7 );
  signal \^s_axi_awready\ : STD_LOGIC;
  signal \^s_axi_bresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal \^s_axi_rdata\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^s_axi_rresp\ : STD_LOGIC_VECTOR ( 1 to 1 );
  signal status_reg : STD_LOGIC_VECTOR ( 1 to 2 );
  signal tx_Buffer_Empty : STD_LOGIC;
  signal tx_Buffer_Full : STD_LOGIC;
begin
  s_axi_awready <= \^s_axi_awready\;
  s_axi_bresp(1) <= \^s_axi_bresp\(1);
  s_axi_bresp(0) <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7 downto 0) <= \^s_axi_rdata\(7 downto 0);
  s_axi_rresp(1) <= \^s_axi_rresp\(1);
  s_axi_rresp(0) <= \<const0>\;
  s_axi_wready <= \^s_axi_awready\;
AXI_LITE_IPIF_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_lite_ipif
     port map (
      Bus_RNW_reg => \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\,
      FIFO_Full_reg => AXI_LITE_IPIF_I_n_11,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ => \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ => \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      \INFERRED_GEN.cnt_i_reg[2]\ => AXI_LITE_IPIF_I_n_8,
      \INFERRED_GEN.cnt_i_reg[2]_0\ => AXI_LITE_IPIF_I_n_9,
      \INFERRED_GEN.cnt_i_reg[4]\(0) => tx_Buffer_Empty,
      Q(0) => \UARTLITE_RX_I/rx_Data_Empty\,
      bus2ip_rdce(0) => bus2ip_rdce(1),
      bus2ip_reset => bus2ip_reset,
      enable_interrupts => enable_interrupts,
      enable_interrupts_reg => AXI_LITE_IPIF_I_n_16,
      fifo_wr => \UARTLITE_TX_I/fifo_wr\,
      \out\(7) => rx_Data(0),
      \out\(6) => rx_Data(1),
      \out\(5) => rx_Data(2),
      \out\(4) => rx_Data(3),
      \out\(3) => rx_Data(4),
      \out\(2) => rx_Data(5),
      \out\(1) => rx_Data(6),
      \out\(0) => rx_Data(7),
      reset_RX_FIFO => reset_RX_FIFO,
      reset_TX_FIFO => reset_TX_FIFO,
      rx_Buffer_Full => rx_Buffer_Full,
      rx_Data_Present_Pre_reg => AXI_LITE_IPIF_I_n_18,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(1 downto 0) => s_axi_araddr(3 downto 2),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(1 downto 0) => s_axi_awaddr(3 downto 2),
      s_axi_awready => \^s_axi_awready\,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(0) => \^s_axi_bresp\(1),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(7 downto 0) => \^s_axi_rdata\(7 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(0) => \^s_axi_rresp\(1),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(2) => s_axi_wdata(4),
      s_axi_wdata(1 downto 0) => s_axi_wdata(1 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      status_reg(1) => status_reg(1),
      status_reg(0) => status_reg(2),
      tx_Buffer_Empty_Pre_reg => AXI_LITE_IPIF_I_n_17,
      tx_Buffer_Full => tx_Buffer_Full
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
UARTLITE_CORE_I: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_uartlite_core
     port map (
      Bus_RNW_reg => \I_SLAVE_ATTACHMENT/I_DECODER/Bus_RNW_reg\,
      Bus_RNW_reg_reg => AXI_LITE_IPIF_I_n_9,
      FIFO_Full_reg(0) => \UARTLITE_RX_I/rx_Data_Empty\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\ => \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]\ => AXI_LITE_IPIF_I_n_18,
      \GEN_BKEND_CE_REGISTERS[0].ce_out_i_reg[0]_0\ => AXI_LITE_IPIF_I_n_11,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\ => \I_SLAVE_ATTACHMENT/I_DECODER/GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg\,
      \GEN_BKEND_CE_REGISTERS[1].ce_out_i_reg[1]\ => AXI_LITE_IPIF_I_n_8,
      \GEN_BKEND_CE_REGISTERS[3].ce_out_i_reg[3]\ => AXI_LITE_IPIF_I_n_16,
      \INFERRED_GEN.cnt_i_reg[4]\ => AXI_LITE_IPIF_I_n_17,
      Q(0) => tx_Buffer_Empty,
      bus2ip_rdce(0) => bus2ip_rdce(1),
      bus2ip_reset => bus2ip_reset,
      enable_interrupts => enable_interrupts,
      fifo_wr => \UARTLITE_TX_I/fifo_wr\,
      interrupt => interrupt,
      \out\(7) => rx_Data(0),
      \out\(6) => rx_Data(1),
      \out\(5) => rx_Data(2),
      \out\(4) => rx_Data(3),
      \out\(3) => rx_Data(4),
      \out\(2) => rx_Data(5),
      \out\(1) => rx_Data(6),
      \out\(0) => rx_Data(7),
      reset_RX_FIFO => reset_RX_FIFO,
      reset_TX_FIFO => reset_TX_FIFO,
      rx => rx,
      rx_Buffer_Full => rx_Buffer_Full,
      s_axi_aclk => s_axi_aclk,
      s_axi_aresetn => s_axi_aresetn,
      s_axi_wdata(7 downto 0) => s_axi_wdata(7 downto 0),
      status_reg(1) => status_reg(1),
      status_reg(0) => status_reg(2),
      tx => tx,
      tx_Buffer_Full => tx_Buffer_Full
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    rx : in STD_LOGIC;
    tx : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_uartlite_0,axi_uartlite,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axi_uartlite,Vivado 2017.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute C_BAUDRATE : integer;
  attribute C_BAUDRATE of U0 : label is 115200;
  attribute C_DATA_BITS : integer;
  attribute C_DATA_BITS of U0 : label is 8;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "artix7";
  attribute C_ODD_PARITY : integer;
  attribute C_ODD_PARITY of U0 : label is 0;
  attribute C_S_AXI_ACLK_FREQ_HZ : integer;
  attribute C_S_AXI_ACLK_FREQ_HZ of U0 : label is 50000000;
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of U0 : label is 4;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of U0 : label is 32;
  attribute C_USE_PARITY : integer;
  attribute C_USE_PARITY of U0 : label is 0;
  attribute downgradeipidentifiedwarnings of U0 : label is "yes";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axi_uartlite
     port map (
      interrupt => interrupt,
      rx => rx,
      s_axi_aclk => s_axi_aclk,
      s_axi_araddr(3 downto 0) => s_axi_araddr(3 downto 0),
      s_axi_aresetn => s_axi_aresetn,
      s_axi_arready => s_axi_arready,
      s_axi_arvalid => s_axi_arvalid,
      s_axi_awaddr(3 downto 0) => s_axi_awaddr(3 downto 0),
      s_axi_awready => s_axi_awready,
      s_axi_awvalid => s_axi_awvalid,
      s_axi_bready => s_axi_bready,
      s_axi_bresp(1 downto 0) => s_axi_bresp(1 downto 0),
      s_axi_bvalid => s_axi_bvalid,
      s_axi_rdata(31 downto 0) => s_axi_rdata(31 downto 0),
      s_axi_rready => s_axi_rready,
      s_axi_rresp(1 downto 0) => s_axi_rresp(1 downto 0),
      s_axi_rvalid => s_axi_rvalid,
      s_axi_wdata(31 downto 0) => s_axi_wdata(31 downto 0),
      s_axi_wready => s_axi_wready,
      s_axi_wstrb(3 downto 0) => s_axi_wstrb(3 downto 0),
      s_axi_wvalid => s_axi_wvalid,
      tx => tx
    );
end STRUCTURE;
