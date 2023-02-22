*** Settings ***
Documentation    Example test case for cutoff frequencies keywords
Library          BuiltIn

*** Keywords ***
Calculate  
    [Arguments]    ${resistor}    ${capacitor}        
    ${cutoff} =    Evaluate    ${resistor} / ${capacitor}
    Set Global Variable     ${cutoff} 
    Log    ${cutoff}
    Log    The sum of ${resistor} and ${capacitor} is ${cutoff}.

*** Test Cases ***
Test Case 1
    [Documentation]   Verify cutoff frequencies calculation
    [Tags]             smoke
    Calculate     30    0.5

Test OutPut_Input_Gain
    ${output}   Set Variable    60 
    should be true  ${output} and ${cutoff}  
    Log  The input ${output} is less than ${cutoff}

  
Test Resi_Cap_Values
    [Documentation]     Cal new resis and cap  gain changes

    ${resistor}     Set Variable    40
    Set Global Variable     ${resistor}

    ${capacitor}    Set Variable    70
    Set Global Variable     ${capacitor}

Test Circuit_Values
    
     ${new_resistor}    Set Variable  500
     ${new_capacitor}   Set Variable  0.5
     ${new_cutoff}      Set variable   60

     Run Keyword If   ${new_resistor}  >  and ${resistor}  Log new_resistor value greater than resistor value
     ...    Else If   ${resistor} < ${new_resistor}  Log resistor value less than new_resistor  
