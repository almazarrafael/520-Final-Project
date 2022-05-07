-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity Loop_loop_height_hbi_rom is 
    generic(
             dwidth     : integer := 8; 
             awidth     : integer := 8; 
             mem_size    : integer := 256
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          addr1      : in std_logic_vector(awidth-1 downto 0); 
          ce1       : in std_logic; 
          q1         : out std_logic_vector(dwidth-1 downto 0);
          addr2      : in std_logic_vector(awidth-1 downto 0); 
          ce2       : in std_logic; 
          q2         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of Loop_loop_height_hbi_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
signal addr1_tmp : std_logic_vector(awidth-1 downto 0); 
signal addr2_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem0 : mem_array := (
    0 => "00000000", 1 => "00001100", 2 => "00010001", 3 => "00010110", 
    4 => "00011001", 5 => "00011101", 6 => "00100000", 7 => "00100011", 
    8 => "00100101", 9 => "00101000", 10 => "00101010", 11 => "00101100", 
    12 => "00101111", 13 => "00110001", 14 => "00110011", 15 => "00110101", 
    16 => "00110111", 17 => "00111001", 18 => "00111010", 19 => "00111100", 
    20 => "00111110", 21 => "01000000", 22 => "01000001", 23 => "01000011", 
    24 => "01000101", 25 => "01000110", 26 => "01001000", 27 => "01001001", 
    28 => "01001011", 29 => "01001100", 30 => "01001110", 31 => "01001111", 
    32 => "01010000", 33 => "01010010", 34 => "01010011", 35 => "01010101", 
    36 => "01010110", 37 => "01010111", 38 => "01011001", 39 => "01011010", 
    40 => "01011011", 41 => "01011100", 42 => "01011110", 43 => "01011111", 
    44 => "01100000", 45 => "01100001", 46 => "01100010", 47 => "01100100", 
    48 => "01100101", 49 => "01100110", 50 => "01100111", 51 => "01101000", 
    52 => "01101001", 53 => "01101011", 54 => "01101100", 55 => "01101101", 
    56 => "01101110", 57 => "01101111", 58 => "01110000", 59 => "01110001", 
    60 => "01110010", 61 => "01110011", 62 => "01110100", 63 => "01110101", 
    64 => "01110110", 65 => "01110111", 66 => "01111000", 67 => "01111001", 
    68 => "01111010", 69 => "01111011", 70 => "01111100", 71 => "01111101", 
    72 => "01111110", 73 => "01111111", 74 => "10000000", 75 => "10000001", 
    76 => "10000010", 77 => "10000011", 78 => "10000100", 79 => "10000101", 
    80 => "10000110", 81 => "10000111", 82 => "10001000", 83 => "10001001", 
    84 => "10001010", 85 to 86=> "10001011", 87 => "10001100", 88 => "10001101", 
    89 => "10001110", 90 => "10001111", 91 => "10010000", 92 => "10010001", 
    93 to 94=> "10010010", 95 => "10010011", 96 => "10010100", 97 => "10010101", 
    98 => "10010110", 99 => "10010111", 100 to 101=> "10011000", 102 => "10011001", 
    103 => "10011010", 104 => "10011011", 105 => "10011100", 106 to 107=> "10011101", 
    108 => "10011110", 109 => "10011111", 110 => "10100000", 111 to 112=> "10100001", 
    113 => "10100010", 114 => "10100011", 115 => "10100100", 116 to 117=> "10100101", 
    118 => "10100110", 119 => "10100111", 120 => "10101000", 121 to 122=> "10101001", 
    123 => "10101010", 124 => "10101011", 125 to 126=> "10101100", 127 => "10101101", 
    128 => "10101110", 129 to 130=> "10101111", 131 => "10110000", 132 => "10110001", 
    133 to 134=> "10110010", 135 => "10110011", 136 => "10110100", 137 to 138=> "10110101", 
    139 => "10110110", 140 to 141=> "10110111", 142 => "10111000", 143 => "10111001", 
    144 to 145=> "10111010", 146 => "10111011", 147 to 148=> "10111100", 149 => "10111101", 
    150 => "10111110", 151 to 152=> "10111111", 153 => "11000000", 154 to 155=> "11000001", 
    156 => "11000010", 157 to 158=> "11000011", 159 => "11000100", 160 => "11000101", 
    161 to 162=> "11000110", 163 => "11000111", 164 to 165=> "11001000", 166 => "11001001", 
    167 to 168=> "11001010", 169 => "11001011", 170 to 171=> "11001100", 172 => "11001101", 
    173 to 174=> "11001110", 175 => "11001111", 176 to 177=> "11010000", 178 to 179=> "11010001", 
    180 => "11010010", 181 to 182=> "11010011", 183 => "11010100", 184 to 185=> "11010101", 
    186 => "11010110", 187 to 188=> "11010111", 189 => "11011000", 190 to 191=> "11011001", 
    192 to 193=> "11011010", 194 => "11011011", 195 to 196=> "11011100", 197 => "11011101", 
    198 to 199=> "11011110", 200 to 201=> "11011111", 202 => "11100000", 203 to 204=> "11100001", 
    205 to 206=> "11100010", 207 => "11100011", 208 to 209=> "11100100", 210 => "11100101", 
    211 to 212=> "11100110", 213 to 214=> "11100111", 215 => "11101000", 216 to 217=> "11101001", 
    218 to 219=> "11101010", 220 => "11101011", 221 to 222=> "11101100", 223 to 224=> "11101101", 
    225 to 226=> "11101110", 227 => "11101111", 228 to 229=> "11110000", 230 to 231=> "11110001", 
    232 => "11110010", 233 to 234=> "11110011", 235 to 236=> "11110100", 237 to 238=> "11110101", 
    239 => "11110110", 240 to 241=> "11110111", 242 to 243=> "11111000", 244 to 245=> "11111001", 
    246 => "11111010", 247 to 248=> "11111011", 249 to 250=> "11111100", 251 to 252=> "11111101", 
    253 to 254=> "11111110", 255 => "11111111" );
signal mem1 : mem_array := (
    0 => "00000000", 1 => "00001100", 2 => "00010001", 3 => "00010110", 
    4 => "00011001", 5 => "00011101", 6 => "00100000", 7 => "00100011", 
    8 => "00100101", 9 => "00101000", 10 => "00101010", 11 => "00101100", 
    12 => "00101111", 13 => "00110001", 14 => "00110011", 15 => "00110101", 
    16 => "00110111", 17 => "00111001", 18 => "00111010", 19 => "00111100", 
    20 => "00111110", 21 => "01000000", 22 => "01000001", 23 => "01000011", 
    24 => "01000101", 25 => "01000110", 26 => "01001000", 27 => "01001001", 
    28 => "01001011", 29 => "01001100", 30 => "01001110", 31 => "01001111", 
    32 => "01010000", 33 => "01010010", 34 => "01010011", 35 => "01010101", 
    36 => "01010110", 37 => "01010111", 38 => "01011001", 39 => "01011010", 
    40 => "01011011", 41 => "01011100", 42 => "01011110", 43 => "01011111", 
    44 => "01100000", 45 => "01100001", 46 => "01100010", 47 => "01100100", 
    48 => "01100101", 49 => "01100110", 50 => "01100111", 51 => "01101000", 
    52 => "01101001", 53 => "01101011", 54 => "01101100", 55 => "01101101", 
    56 => "01101110", 57 => "01101111", 58 => "01110000", 59 => "01110001", 
    60 => "01110010", 61 => "01110011", 62 => "01110100", 63 => "01110101", 
    64 => "01110110", 65 => "01110111", 66 => "01111000", 67 => "01111001", 
    68 => "01111010", 69 => "01111011", 70 => "01111100", 71 => "01111101", 
    72 => "01111110", 73 => "01111111", 74 => "10000000", 75 => "10000001", 
    76 => "10000010", 77 => "10000011", 78 => "10000100", 79 => "10000101", 
    80 => "10000110", 81 => "10000111", 82 => "10001000", 83 => "10001001", 
    84 => "10001010", 85 to 86=> "10001011", 87 => "10001100", 88 => "10001101", 
    89 => "10001110", 90 => "10001111", 91 => "10010000", 92 => "10010001", 
    93 to 94=> "10010010", 95 => "10010011", 96 => "10010100", 97 => "10010101", 
    98 => "10010110", 99 => "10010111", 100 to 101=> "10011000", 102 => "10011001", 
    103 => "10011010", 104 => "10011011", 105 => "10011100", 106 to 107=> "10011101", 
    108 => "10011110", 109 => "10011111", 110 => "10100000", 111 to 112=> "10100001", 
    113 => "10100010", 114 => "10100011", 115 => "10100100", 116 to 117=> "10100101", 
    118 => "10100110", 119 => "10100111", 120 => "10101000", 121 to 122=> "10101001", 
    123 => "10101010", 124 => "10101011", 125 to 126=> "10101100", 127 => "10101101", 
    128 => "10101110", 129 to 130=> "10101111", 131 => "10110000", 132 => "10110001", 
    133 to 134=> "10110010", 135 => "10110011", 136 => "10110100", 137 to 138=> "10110101", 
    139 => "10110110", 140 to 141=> "10110111", 142 => "10111000", 143 => "10111001", 
    144 to 145=> "10111010", 146 => "10111011", 147 to 148=> "10111100", 149 => "10111101", 
    150 => "10111110", 151 to 152=> "10111111", 153 => "11000000", 154 to 155=> "11000001", 
    156 => "11000010", 157 to 158=> "11000011", 159 => "11000100", 160 => "11000101", 
    161 to 162=> "11000110", 163 => "11000111", 164 to 165=> "11001000", 166 => "11001001", 
    167 to 168=> "11001010", 169 => "11001011", 170 to 171=> "11001100", 172 => "11001101", 
    173 to 174=> "11001110", 175 => "11001111", 176 to 177=> "11010000", 178 to 179=> "11010001", 
    180 => "11010010", 181 to 182=> "11010011", 183 => "11010100", 184 to 185=> "11010101", 
    186 => "11010110", 187 to 188=> "11010111", 189 => "11011000", 190 to 191=> "11011001", 
    192 to 193=> "11011010", 194 => "11011011", 195 to 196=> "11011100", 197 => "11011101", 
    198 to 199=> "11011110", 200 to 201=> "11011111", 202 => "11100000", 203 to 204=> "11100001", 
    205 to 206=> "11100010", 207 => "11100011", 208 to 209=> "11100100", 210 => "11100101", 
    211 to 212=> "11100110", 213 to 214=> "11100111", 215 => "11101000", 216 to 217=> "11101001", 
    218 to 219=> "11101010", 220 => "11101011", 221 to 222=> "11101100", 223 to 224=> "11101101", 
    225 to 226=> "11101110", 227 => "11101111", 228 to 229=> "11110000", 230 to 231=> "11110001", 
    232 => "11110010", 233 to 234=> "11110011", 235 to 236=> "11110100", 237 to 238=> "11110101", 
    239 => "11110110", 240 to 241=> "11110111", 242 to 243=> "11111000", 244 to 245=> "11111001", 
    246 => "11111010", 247 to 248=> "11111011", 249 to 250=> "11111100", 251 to 252=> "11111101", 
    253 to 254=> "11111110", 255 => "11111111" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem0 : signal is "block_rom";
attribute syn_rom_style of mem1 : signal is "block_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem0 : signal is "block";
attribute ROM_STYLE of mem1 : signal is "block";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

memory_access_guard_1: process (addr1) 
begin
      addr1_tmp <= addr1;
--synthesis translate_off
      if (CONV_INTEGER(addr1) > mem_size-1) then
           addr1_tmp <= (others => '0');
      else 
           addr1_tmp <= addr1;
      end if;
--synthesis translate_on
end process;

memory_access_guard_2: process (addr2) 
begin
      addr2_tmp <= addr2;
--synthesis translate_off
      if (CONV_INTEGER(addr2) > mem_size-1) then
           addr2_tmp <= (others => '0');
      else 
           addr2_tmp <= addr2;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem0(CONV_INTEGER(addr0_tmp)); 
        end if;
        if (ce1 = '1') then 
            q1 <= mem0(CONV_INTEGER(addr1_tmp)); 
        end if;
        if (ce2 = '1') then 
            q2 <= mem1(CONV_INTEGER(addr2_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity Loop_loop_height_hbi is
    generic (
        DataWidth : INTEGER := 8;
        AddressRange : INTEGER := 256;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address1 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce1 : IN STD_LOGIC;
        q1 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0);
        address2 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce2 : IN STD_LOGIC;
        q2 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of Loop_loop_height_hbi is
    component Loop_loop_height_hbi_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR;
            addr1 : IN STD_LOGIC_VECTOR;
            ce1 : IN STD_LOGIC;
            q1 : OUT STD_LOGIC_VECTOR;
            addr2 : IN STD_LOGIC_VECTOR;
            ce2 : IN STD_LOGIC;
            q2 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    Loop_loop_height_hbi_rom_U :  component Loop_loop_height_hbi_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0,
        addr1 => address1,
        ce1 => ce1,
        q1 => q1,
        addr2 => address2,
        ce2 => ce2,
        q2 => q2);

end architecture;

