*** Settings ***
Library             AppiumLibrary
Library             String
Resource            ../../Resources/common.robot
Resource            ../../Resources/library.robot
Documentation       Create a new folder with a random 7 character string. Rename it to some other random string.

*** Test Cases ***
Rename a folder
    [Tags]                              Sanity
    Launch ToolsAndroid
    ${FOLDERNAME}=                      Generate Random String      7
    ${NEW-FOLDERNAME}=                  Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${FOLDERNAME}"]
    Create A New Folder                 ${FOLDERNAME}
    Open Options Menu For File/Folder   ${FOLDERNAME}
    Tap                                 ${LIBRARY-OPTIONS-RENAME}
    Wait Until Page Contains Element    ${LIBRARY-RENAME-TITLE}     7
    Input Text                          ${LIBRARY-FILEFOLDERNAME-FIELD}     ${NEW-FOLDERNAME}
    Tap                                 ${LIBRARY-SAVE-BUTTON}
    Wait Until Element Is Visible       ${LIBRARY-RENAME-TOAST}
    Close Application