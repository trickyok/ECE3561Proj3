--------------------------------------------------------------------------------
-- Company: Boeing
-- Engineer: Gage Farmer, Chloe Oh
--
-- Create Date:   23:20:20 04/22/2024
-- Design Name:   test bench for system controller
-- Module Name:   /home/gage/Documents/ECE3561Proj3/ECE3561Proj3/test.vhd
-- Project Name:  ECE3561Proj3
-- Target Device:  msp4206969
-- 
-- VHDL Test Bench Created by ISE for module: controller
-- 
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
--
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--
-- Gage here, I'm an idiot and didn't use Chloe's revised system controller code 
-- to make this, and it's 11:49pm so I don't think there's a whole lot of time 
-- to do it, so this is what you get.
-- If there's more time tomorrow to fix any issues and turn it in a bit late,
-- I'll be sure to do that.
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164. ALL;
use IEEE.STD_LOGIC_ARITH. ALL;
use IEEE.STD_LOGIC_UNSIGNED. ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controller
    PORT(
         CLK : IN  std_logic;
         M : IN  std_logic_vector(3 downto 0);
         N : IN  std_logic_vector(3 downto 0);
         ST : IN  std_logic;
         DONE : OUT  std_logic;
         R : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal M : std_logic_vector(3 downto 0) := (others => '0');
   signal N : std_logic_vector(3 downto 0) := (others => '0');
   signal ST : std_logic := '0';

 	--Outputs
   signal DONE : std_logic;
   signal R : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          CLK => CLK,
          M => M,
          N => N,
          ST => ST,
          DONE => DONE,
          R => R
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;


entity testmult is
end testmult;

architecture test1 of testmult is
	component mult4X4
		port (CLK: in std_logic;
				M: in std_logic_vector(3 downto 0) := (others => '0');
				N: in std_logic_vector(3 downto 0) := (others => '0');
				ST: in std_logic;
				DONE: out std_logic;
				R: out std_logic_vector(7 downto 0));
				
end component;

	constant Z: integer:= 6;
	type arr is array(1 to Z) of std_logic_vector(3 downto 0);
	constant Narr: arr:= ("1011", "1101", "0001", "1000", "1111", "1101");
	constant Marr: arr:= ("1101", "1011", "0001", "1000", "1111","0000");
	signal CLK: std_logic = '0';
	signal ST DONE: std_logic;
	signal M, N: std_logic_vector(3 downto 0);
	signal R: std_logic_vector(7 downto 0);

begin
	mult1: mult4X4 port map(CLK, M, N, ST, DONE, R);
	CLK <= not CLK after 10 ns; -- clock has 20 ns period
	process
		begin
			for i in 1 to Z loop
				N <= Mcandarr(i);
				M <= Mplierarr(i);
				ST <= '1';
				wait until CLK = '1' and CLK'event;
				ST <= '0';
				wait until DONE = '1' ;
				wait until CLK = '1' and CLK'event;
			end loop;
	end process;
	
end test1




END;
