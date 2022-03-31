*** Settings ***
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/UserDefinedKeywords.robot

*** Test Cases ***
Just for Test
    [Documentation]        Adds a note to the first image from Test Folder
    [Tags]                 Sanity
    ${firstFileXpath}      Set Variable    xpath=(//android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"])[1]
    ${noteString}          Set Variable    This is a sample of a Note...
    Setup Test Folder
    Scroll Up And Down In Search For Element     ${firstFileXpath}
    Tap                                 ${firstFileXpath}
    Wait Until Page Contains Element    ${IMGDETAILS-DETAILS-BUTTON}
    Tap                                 ${IMGDETAILS-NOTES-BUTTON}
    Wait Until Page Contains Element    ${IMGDETAILS-NOTES-PAGE-TITLE}
    Tap                                 ${IMGDETAILS-NOTES-PAGE-EDIT-BUTTON}
    Input Text    ${IMGDETAILS-NOTES-PAGE-TEXTAREA}    ${noteString}
    Tap                                 ${IMGDETAILS-NOTES-PAGE-SAVE-BUTTON}
    Page Should Contain Element         ${IMGDETAILS-NOTES-PAGE-EDIT-BUTTON}