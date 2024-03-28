----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:33 03/28/2024 
-- Design Name: 
-- Module Name:    controller - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
    Port ( M : in  STD_LOGIC_VECTOR (4 downto 1);
           N : in  STD_LOGIC_VECTOR (4 downto 1);
           R : out  STD_LOGIC_VECTOR (8 downto 1);
           START : in  STD_LOGIC;
           DONE : out  STD_LOGIC);
end controller;

architecture Behavioral of controller is

begin


end Behavioral;

