*** Settings ***
Library    DateTime

*** Test Cases ***
TestCase2
    ${variable 1}    Get Current Date
    ${variable 2}    Set Variable        this is a string
    ${variable}      Set Variable    ${variable 1} + ${variable 2}
    Log To Console   ${variable} 