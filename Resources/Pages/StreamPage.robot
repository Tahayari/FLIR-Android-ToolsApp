*** Settings ***
Documentation   This page conains sser defined keywords that are specific to the Streaming page only
Resource        ../../Resources/Locators.robot
Resource        ../../Resources/UserDefinedKeywords.robot

*** Keywords ***
Take a snapshot
    [Documentation]                     Tap on the Take a snapshot button while in the Stream page
    Tap                                 ${STREAM-SNAPSHOT-BUTTON}
    Wait Until Page Contains Element    ${STREAM-LOADING-WINDOW}
    Wait Until Page Contains Element    ${STREAM-IMPORTSUCCESS-TOAST}   30