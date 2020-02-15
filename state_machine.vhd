library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity state_machine is
    port(
        i_clock: in std_logic;
        i_change: in std_logic;
        i_reset: in std_logic;

        o_output: out std_logic
    );
end;

architecture rtl of state_machine is
    type state_types is (A, B, C, D);
    signal state: state_types;

    begin
    process(i_clock, i_reset)
    begin
        if i_reset = '1' then state <= A;

        elsif rising_edge(i_clock) then
            case state is
                when A =>
                    if i_change = '1' then 
                        state <= B;
                    end if;
                when B =>
                    if i_change = '1' then 
                        state <= C;
                    end if;
                when C =>
                    if i_change = '1' then 
                        state <= D;
                    end if;
                when D =>
                    if i_change = '1' then 
                        state <= A;
                    end if;
                when others =>
                    state <= A;

            end case;
        end if;
    end process;

    o_output <= '1' when state = D else '0';
    
    
end architecture rtl;
