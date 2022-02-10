*** Settings ***
Library             AppiumLibrary
Library             String
Resource            ../Resources/android-res.robot
Documentation    Create a new folder with a random name
Library          AppiumLibrary

*** Variables ***
${FOLDERNAME}                           new folder 123
${FOLDERNAME-XPATH}                     //android.widget.TextView[@text="${FOLDERNAME}"]

*** Test Cases ***
Create a new folder
    Launch ToolsAndroid
    Tap                                 ${LIBRARY-ADDFOLDER-BUTTON}
    Wait Until Page Contains Element    ${LIBRARY-NEWFOLDER-TITLE}
    Input Text                          ${LIBRARY-FOLDERNAME-FIELD}     ${FOLDERNAME}
    Tap                                 ${LIBRARY-CREATEFOLDER-BUTTON}
    Wait Until Page Contains Element    ${NAVIGATION-LIBRARY-BUTTON}
    Wait Until Keyword Succeeds         5x    200ms    Scroll Down If Element Not Found    ${FOLDERNAME-XPATH}