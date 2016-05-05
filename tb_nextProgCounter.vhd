--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:00:16 04/18/2016
-- Design Name:   
-- Module Name:   /home/yengomez/Documents/procesadorImmediatos/tb_nextProgCounter.vhd
-- Project Name:  procesadorImmediatos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nextProgCounter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_nextProgCounter IS
END tb_nextProgCounter;
 
ARCHITECTURE behavior OF tb_nextProgCounter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nextProgCounter
    PORT(
         clk			: IN  std_logic;
         reset : IN  std_logic;
         direccion1 : IN  std_logic_vector(31 downto 0);
         direccion2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal direccion1 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal direccion2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nextProgCounter PORT MAP (
          clk => clk,
          reset => reset,
          direccion1 => direccion1,
          direccion2 => direccion2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset<='1';
      -- hold reset state for 100 ns.
      wait for 30 ns;
		reset<='0';
		direccion1 <=  x"00000010"; 
		wait for 30 ns;
		direccion1 <=  x"00000008";
		wait for 30 ns;
		direccion1 <=  x"00000005";

      wait;
   end process;

END;
