*** Settings ***
Library             AppiumLibrary
Library    String
Resource            ../Resources/android-res.robot

*** Variables ***
${FOLDERNAME}                           new folder 123
${FOLDERNAME-XPATH}                     //android.widget.TextView[@text="${FOLDERNAME}"]

*** Test Cases ***
Create a new folder
    Launch ToolsAndroid
    tap                                 ${LIBRARY-ADDFOLDER-BUTTON}
    wait until page contains element    ${LIBRARY-NEWFOLDER-TITLE}
    input text                          ${LIBRARY-FOLDERNAME-FIELD}     ${FOLDERNAME}
    tap                                 ${LIBRARY-CREATEFOLDER-BUTTON}
    Wait Until Page Contains Element    ${NAVIGATION-LIBRARY-BUTTON}
    Wait Until Keyword Succeeds         10x    200ms    Scroll Down If Element Not Found    ${FOLDERNAME-XPATH}

Just a test
    Launch ToolsAndroid
    Swipe Up        ${LIBRARY-FILESANDFOLDERS-LIST}
    Swipe Up        ${LIBRARY-FILESANDFOLDERS-LIST}
    Swipe Up        ${LIBRARY-FILESANDFOLDERS-LIST}
    Swipe Down      ${LIBRARY-FILESANDFOLDERS-LIST}
    Swipe Down      ${LIBRARY-FILESANDFOLDERS-LIST}