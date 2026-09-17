library IEEE;
use IEEE.std_logic_1164.all;

-- =========================
-- ENTITY
-- =========================
entity Seq_Detector is 
  port ( Clock, Reset, Din : in std_logic ; 
         ERR : out std_logic);
end entity;

-- =========================
-- ARCHITECTURE
-- =========================  
architecture Seq_Detector_arch of Seq_Detector is 
  --Declarations
  subtype State_Type of std_Logic; 
  -- defining states using binary encoding 
  constant Start: State_Type    := '000';
  constant D0_IS_1: State_Type  := '001';
  constant D1_IS_1: State_Type  := '010';
  constant D0_NOT_1: State_Type := '011';
  constant D1_NOT_1: State_Type := '100';

  --define signals for next_state and current_state for State Memory connecting to next_state_logic and output_logic
 signal next_state, current_state : State_Type;

end architecture; 
  

