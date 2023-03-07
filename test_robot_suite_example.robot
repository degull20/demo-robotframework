*** Settings ***
Library           Math

*** Test Cases ***
Calculate cutoff frequency
    [Documentation]  Verify that the cutoff frequency of the 
    low pass filter is calculated correctly.
    [Tags]  low_pass_filter
    
    Given resistor value is 100
    And capacitor value is 1uF
    When calculating cutoff frequency
    Then cutoff frequency should be approximately 1591.55 Hz
    
Input signal selected if input frequency is lower than cutoff frequency
    [Documentation]  Verify that input signal is selected when the input 
     frequency with respect to capacitor
     is lower than the calculated cutoff frequency.

    [Tags]  low_pass_filter
    Given resistor value is 100
    And capacitor value is 1uF
    And input frequency is 1000
    When testing input signal
    Then input signal should not be attenuated

Input signal attenuated if input frequency is greater than cutoff frequency
    [Documentation]  Verify that input signal is attenuated when the input 
    frequency with respect to capacitor is greater than the calculated 
    cutoff frequency.

    [Tags]  low_pass_filter
    Given resistor value is 100
    And capacitor value is 1uF
    And input frequency is 2000
    When testing input signal
    Then input signal should be attenuated

*** Keywords ***
Given resistor value is ${resistor_value}
    Set Test Variable  ${R}  ${resistor_value}

Given capacitor value is ${capacitor_value}
    Set Test Variable  ${C}  ${capacitor_value}

Given input frequency is ${input_frequency}
    Set Test Variable  ${f}  ${input_frequency}

When calculating cutoff frequency
    ${cutoff_frequency}=  Divide  1  Multiply  2  Multiply  pi  ${R}  ${C}
    Set Test Variable  ${Fc}  ${cutoff_frequency}

Then cutoff frequency should be approximately ${expected_cutoff_frequency}
    Should Be True  ${expected_cutoff_frequency}-1  <  ${Fc}  <  ${expected_cutoff_frequency}+1
    
When testing input signal
    ${w}=  Multiply  2  Multiply  pi  ${f}
    ${Xc}=  Divide  1  Multiply  2  Multiply  pi  ${C}  ${f}
    ${Rc}=  Divide  ${R}  ${Xc}
    ${Vout_over_Vin}=  Divide  ${Rc}  Add  ${Rc}  ${R}
    
Then input signal should not be attenuated
    Should Be True  ${Vout_over_Vin} > 0.9

Then input signal should be attenuated
    Should Be True  ${Vout_over_Vin} < 0.1
