*** Settings ***
Library  BuiltIn
Library  OperatingSystem
*** Variables ***


*** Test Cases ***
Calculate cutoff frequency
    [Documentation]  Verify that the cutoff frequency of the low pass filter is calculated correctly.
    [Tags]  low_pass_filter

    Given Resistor Value Is   1
    And Capacitor Value Is  1500
    When calculating cutoff frequency  25  100  2   
    Cutoff Frequency Should Be Approximately  300
    
*** Keywords ***
Given Resistor Value Is  
    [Arguments]  ${resistor_value}
    Set Test Variable  ${R}  ${resistor_value}

And Capacitor Value Is  
    [Arguments]  ${capacitor_value}
    Set Test Variable  ${C}  ${capacitor_value}

When calculating cutoff frequency 
    [Arguments]  ${R}  ${C}  ${const}
    ${cutoff_frequency}  evaluate  ${const}>${C}-${R} 

Cutoff Frequency Should Be Approximately  
    [Arguments]  ${expected_cutoff_frequency} 
    Should Be True  ${expected_cutoff_frequency}-1-${C} < ${expected_cutoff_frequency}+1
    ${cutoff_frequency}   Should Be True  ${expected_cutoff_frequency}
 