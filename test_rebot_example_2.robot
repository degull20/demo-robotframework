*** Settings ***
Documentation    Example test case for Add with height and width keyword.
Library          BuiltIn

*** Keywords ***
Add  height and width
    [Arguments]    ${num1}    ${num2}    ${height}    ${width}
    ${sum} =    Evaluate    ${num1} + ${num2}
    Log    The sum of ${num1} and ${num2} is ${sum}, with height=${height} and width=${width}.

*** Test Cases ***
Test Add  height and width keyword
    [Documentation]    Verify that the Add  height and width keyword works correctly.
    [Tags]             smoke
    Add  height and width    3    4    5    10
    Add  height and width    2    2    15    20
    Add  height and width    0    0    0    0
