*** Settings ***
Library  BuiltIn
Library  OperatingSystem


*** Test Cases ***
Calculate cutoff frequency
    [Documentation]  Verify that the cutoff frequency of the low pass filter is calculated correctly.
    [Tags]  low_pass_filter

    Given Resistor Value Is  100
    And Capacitor Value Is  1uF
    When calculating cutoff frequency
    Then cutoff frequency Divide should be approximately 1591.55 Hz
    
*** Keywords ***
Given Resistor Value Is  
    [Arguments]  ${resistor_value}
    Set Test Variable  ${R}  ${resistor_value}

And Capacitor Value Is  
    [Arguments]  ${capacitor_value}
    Set Test Variable  ${C}  ${capacitor_value}

When calculating cutoff frequency
    ${cutoff_frequency}=  Divide  1.0  Multiply  2.0  Multiply  pi  ${R}  ${C}
    Set Test Variable  ${Fc}  ${cutoff_frequency}

Then cutoff frequency should be approximately 
    [Arguments]  ${expected_cutoff_frequency}
    Should Be True  ${expected_cutoff_frequency}-1  <  ${Fc}  <  ${expected_cutoff_frequency}+1
 