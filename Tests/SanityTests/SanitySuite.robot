*** Settings ***
Library             AppiumLibrary
Library             String
Library             DateTime
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/android-res.robot
Resource            ../../Resources/library.robot
Resource            ../../Resources/settings.robot

*** Test Cases ***
Rename a folder
    [Tags]                              Sanity
    ${FOLDERNAME}=                      Generate Random String      7
    ${NEW-FOLDERNAME}=                  Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${FOLDERNAME}"]
    Create A New Folder                 ${FOLDERNAME}
    Open Options Menu For File/Folder   ${FOLDERNAME}
    Tap                                 ${LIBRARY-OPTIONS-RENAME}
    Wait Until Page Contains Element    ${LIBRARY-RENAME-TITLE}     7
    Input Text                          ${LIBRARY-FILEFOLDERNAME-FIELD}     ${NEW-FOLDERNAME}
    Tap                                 ${LIBRARY-SAVE-BUTTON}
    Wait Until Element Is Visible       ${LIBRARY-RENAME-SUCCESS-TOAST}

Create a new folder
    [Tags]                              Sanity
    ${FOLDERNAME}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${FOLDERNAME}"]
    Create A New Folder                 ${FOLDERNAME}

Delete a file
    [Tags]                              Sanity
    ${FOLDERNAME}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${FOLDERNAME}"]
    Create A New Folder                 ${FOLDERNAME}
    Delete a file or folder             ${FOLDERNAME}

Import all files from the first detected camera
    ${current-date}                                 Get Current Date    result_format=%Y-%m-%d %H-%M-%S.%f
    ${import-destination-foldername}                Set Variable    Import Folder ${current-date}
    Create a new folder                             ${import-destination-foldername}
    Navigate to Devices Tab
    Import files to a destination folder            ${import-destination-foldername}  