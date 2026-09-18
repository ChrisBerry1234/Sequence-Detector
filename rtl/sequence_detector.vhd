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
  subtype State_Type of std_Logic_vector(2 downto 0); 
  -- defining states using binary encoding 
  constant Start: State_Type    := '000';
  constant D0_IS_1: State_Type  := '001';
  constant D1_IS_1: State_Type  := '010';
  constant D0_NOT_1: State_Type := '011';
  constant D1_NOT_1: State_Type := '100';

  --define signals for next_state and current_state for State Memory connecting to next_state_logic and output_logic
 signal next_state, current_state : State_Type;

 begin 

   STATE_MEMORY: process (Clock, Reset)
     begin 
       --Highest Priority
       if Reset = '0' then 
         current_state <= Start;
       elsif rising_edge(Clock)
       end if;
     end process;


  NEXT_STATE_LOGIC: process (Din, current_state)
         begin
           --FSM Traversal, Must Know what state we are currently in
           case(current_state) is 
               when(Start) =>
                   if (Din = '1') then 
                     next_state <= D0_IS_1;
                   else
                     next_state <= D0_NOT_1;
                   end if;
  
               when(D0_IS_1) =>
                    if(Din = '1') then 
                      next_state <= D1_IS_1;
                    else 
                      next_state <= D1_NOT_1;
                    end if;
  
               when(D1_IS_1) =>
                   if(Din = '1') then 
                     next_state <= Start;  -- sequence complete or reset path
  
              when(D0_NOT_1) =>
                   --regardless of input, just traverse to next state
                     next_state <= D1_NOT_1;
  
              when(D1_NOT_1) =>
                     next_state <= Start;
        end case; 
      end process; 


  
               

                  
             

   

end architecture; 


  

