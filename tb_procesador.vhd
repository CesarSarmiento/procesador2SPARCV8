--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:36:37 04/24/2016
-- Design Name:   
-- Module Name:   /home/yengomez/Documents/procesadorImmediatos/tb_procesador.vhd
-- Project Name:  procesadorImmediatos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: procesadorMonocicloImmediatos
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
 
ENTITY tb_procesador IS
END tb_procesador;
 
ARCHITECTURE behavior OF tb_procesador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT procesadorMonocicloImmediatos
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         salidaAlu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal salidaAlu : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: procesadorMonocicloImmediatos PORT MAP (
          reset => reset,
          clk => clk,
          salidaAlu => salidaAlu
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
      wait for 100 ns;	
		reset<='0';

      wait;
   end process;

END;
