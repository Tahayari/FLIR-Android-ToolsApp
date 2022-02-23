*** Settings ***
Documentation       Contains Sanity Tests for the FLIR Tools Android app
Library             DateTime
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            Locators.robot
Resource            ./Resources/UserDefinedKeywords.robot
Resource            ./Resources/Pages/LibraryPage.robot
Resource            ./Resources/Pages/DevicesPage.robot

*** Test Cases ***
Rename a folder
    [Tags]                              Sanity
    ${folderName}=                      Generate Random String      7
    ${newFolderName}=                   Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${folderName}"]
    Create A New Folder                 ${folderName}
    Open Options Menu For File/Folder   ${folderName}
    Tap                                 ${LIBRARY-OPTIONS-RENAME}
    Wait Until Page Contains Element    ${LIBRARY-RENAME-TITLE}     7
    Input Text                          ${LIBRARY-FILEFOLDERNAME-FIELD}     ${newFolderName}
    Tap                                 ${LIBRARY-SAVE-BUTTON}
    Wait Until Element Is Visible       ${LIBRARY-RENAME-SUCCESS-TOAST}

Create a new folder
    [Tags]                              Sanity
    ${folderName}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${folderName}"]
    Create A New Folder                 ${folderName}

Delete a file
    [Tags]                              Sanity
    ${folderName}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${folderName}"]
    Create A New Folder                 ${folderName}
    Delete a file or folder             ${folderName}

Import all files from the first detected camera
    ${current-date}                                 Get Current Date    result_format=%Y-%m-%d %H-%M-%S.%f
    ${import-destination-foldername}                Set Variable        Import Folder ${current-date}
    Create a new folder                             ${import-destination-foldername}
    Navigate to Devices Tab
    Import files to a destination folder            ${import-destination-foldername}