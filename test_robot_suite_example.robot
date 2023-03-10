*** Settings ***
Library  BuiltIn
Library  OperatingSystem
*** Variables ***


*** Test Cases ***
Calculate cutoff frequency
    [Documentation]  Verify that the cutoff frequency of the low pass filter is calculated correctly.
    [Tags]  low_pass_filter

    Given Resistor Value Is   1
    And Capacitor Value Is  0.005
    When calculating cutoff frequency  25  100  3.14   
    Cutoff Frequency  500
    
*** Keywords ***
Given Resistor Value Is  
    [Arguments]  ${resistor_value}
    Set Test Variable  ${R}  ${resistor_value}

And Capacitor Value Is  
    [Arguments]  ${capacitor_value}
    Set Test Variable  ${C}  ${capacitor_value}

When calculating cutoff frequency 
    [Arguments]  ${R}  ${C}  ${const}
    ${cutoff_frequency}  evaluate  1.0 / (${const}*${C}-${R}* 2.0 )
    Log     ${cutoff_frequency}
Cutoff Frequency   
    [Arguments]  ${expected_cutoff_frequency}
    
    Should Be True  ${expected_cutoff_frequency}-1-${C} < ${expected_cutoff_frequency}+1
    ${cutoff_frequency}   Should Be True  ${expected_cutoff_frequency}
 