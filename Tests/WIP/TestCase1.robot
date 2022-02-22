*** Settings ***
Library             AppiumLibrary
Library             String
Library             DateTime
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/common.robot
Resource            ../../Resources/library.robot

*** Test Cases ***
Import TC
    ${current-date}                     Get Current Date    result_format=
    ${IMPORT-DESTINATION-FOLDERNAME}    Set Variable    Import Folder + ${current-date}
    Create a new folder                 ${IMPORT-DESTINATION-FOLDERNAME}
    Navigate to Devices Tab
    ${SETTINGS-IMPORT-BUTTON}=          Set Variable             xpath=(//android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_import"])[1]
    Wait Until Page Contains Element    ${SETTINGS-IMPORT-BUTTON}    10
    Click Element                       ${SETTINGS-IMPORT-BUTTON}
    Wait Until Page Contains Element    ${DEVICES-DESTFOLDER-TITLE}
    Tap                                 ${DEVICES-DESTFOLDER-FOLDER-LIST}\[@text="${IMPORT-DESTINATION-FOLDERNAME}"]
    Tap                                 ${DEVICES-DESTFOLDER-IMPORT-BUTTON}
    Wait Until Element Is Visible       ${DEVICES-IMPORTSTARTED-TOAST}                         