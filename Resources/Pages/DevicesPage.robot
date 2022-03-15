*** Settings ***
Documentation   This page conains sser defined keywords that are specific to the Devices page only
Resource        ../../Resources/UserDefinedKeywords.robot

*** Keywords ***
Dismiss Meterlink Support Notification
    [Documentation]        Dimisses the Meterlinks not supported Notification when the user first navigates to the Devices page(provided the app is freshly installed)
    Wait Until Page Contains Element     ${METERLINK-MESSAGE}
    Tap                                  ${METERLINK-DONTDISPLAY-CHECKBOX}
    Tap                                  ${METERLINK-OK-BUTTON}

Import files to a destination folder
    [Documentation]                     Import files from the first camera that's detected in the Devices page
    [Arguments]                         ${DEST-FOLDER-NAME}
    ${DEVICES-IMPORT-BUTTON}=           Set Variable             xpath=(//android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_import"])[1]
    ${FIRST-IMAGE}=                     Set Variable             xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_camera_files_to_select"]/android.widget.FrameLayout)[1]
    ${SECOND-IMAGE}=                    Set Variable             xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_camera_files_to_select"]/android.widget.FrameLayout)[2]
    ${THIRD-IMAGE}=                     Set Variable             xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_camera_files_to_select"]/android.widget.FrameLayout)[3]
    Wait Until Page Contains Element    ${DEVICES-IMPORT-BUTTON}    10
    Click Element                       ${DEVICES-IMPORT-BUTTON}
    Wait Until Page Does Not Contain Element  ${DEVICES-DESTFOLDER-LOADING-WINDOW}  10
    Wait Until Page Contains Element    ${FIRST-IMAGE}    10
    Tap                                 ${FIRST-IMAGE}
    Tap                                 ${SECOND-IMAGE}
    Tap                                 ${THIRD-IMAGE}
    Tap                                 ${DEVICES-CAMERADIR-NEXT-BUTTON}
    Wait Until Page Contains Element    ${DEVICES-DESTFOLDER-TITLE}
    Scroll Up And Down In Search For Element    ${DEVICES-DESTFOLDER-FOLDER-LIST}\[@text="${DEST-FOLDER-NAME}"]
    Tap                                 ${DEVICES-DESTFOLDER-FOLDER-LIST}\[@text="${DEST-FOLDER-NAME}"]
    Tap                                 ${DEVICES-DESTFOLDER-IMPORT-BUTTON}
    Wait Until Element Is Visible       ${DEVICES-IMPORTSTARTED-TOAST}
    Wait Until Element Is Visible       ${DEVICES-IMPORTFINISHED-TOAST}     30

Connect to camera
    [Documentation]                 Connects to the first camera that's detected
    ${DEVICES-CONNECT-BUTTON}=      Set Variable    xpath=(//android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_stream"])[1]