*** Settings ***
Library             AppiumLibrary
Resource            ../Resources/android-res.robot

*** Variables ***
${FOLDERNAME}                           new folder 123
${FOLDERNAME-XPATH}                     //android.widget.TextView[@text="${FOLDERNAME}"]

*** Test Cases ***
Create a new folder
    Launch ToolsAndroid
    # Skip First Time Open

    tap                                 ${LIBRARY-ADDFOLDER-BUTTON}
    wait until page contains element    ${LIBRARY-NEWFOLDER-TITLE}
    input text                          ${LIBRARY-FOLDERNAME-FIELD}     ${FOLDERNAME}
    tap                                 ${LIBRARY-CREATEFOLDER-BUTTON}
    Wait Until Page Contains Element    ${NAVIGATION-LIBRARY-BUTTON}
    Wait Until Keyword Succeeds         10x    200ms    Scroll Down If Element Not Found    ${FOLDERNAME-XPATH}

Just a test
    Launch ToolsAndroid
    Wait Until Keyword Succeeds    10x    200ms    Scroll Down If Element Not Found    ${FOLDERNAME-XPATH}
    Log    Found the folder!