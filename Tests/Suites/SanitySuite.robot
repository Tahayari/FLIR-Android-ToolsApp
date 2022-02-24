*** Settings ***
Documentation       Contains Sanity Tests for the FLIR Tools Android app
Library             DateTime
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/Locators.robot
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Resources/Pages/LibraryPage.robot
Resource            ../../Resources/Pages/DevicesPage.robot

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

Delete a folder
    [Tags]                              Sanity
    ${folderName}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${folderName}"]
    Create A New Folder                 ${folderName}
    Delete a file or folder             ${folderName}

Import files from the first detected camera
    [Tags]                              Sanity
    ${current-date}                                 Get Current Date    result_format=%Y-%m-%d %H-%M-%S.%f
    ${import-destination-foldername}                Set Variable        Import Folder ${current-date}
    Create a new folder                             ${import-destination-foldername}
    Navigate to Devices Tab
    Import files to a destination folder            ${import-destination-foldername}

Take a snapshot from a streaming camera
    [Documentation]                       Take a snapshot from the first camera that's discovered in the Devices Page
    [Tags]                                Sanity
    Navigate To Devices Tab
    ${StreamButton}=     Set Variable   xpath=(//android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_stream"])[1]
    Wait Until Page Contains Element      ${StreamButton}          30
    Tap                                   ${StreamButton}
    Page Should Contain Element           ${STREAM-SNAPSHOT-BUTTON}
    Sleep                                 5s                   #wait a bit so that the camera starts to stream
    Take A Snapshot
    Tap                                   ${STREAM-BACK-BUTTON}
    Page Should Contain Element           ${DEVICES-REFRESH-BUTTON}
    Navigate To Library Tab