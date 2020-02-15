# Finite state machine in vhdl
The state will change if the i_change is equal on and the i_clock has a rising edge.
 The output o_output will be equal 0 except when the state is D, it is then 1.

## cases
```vhdl
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
```