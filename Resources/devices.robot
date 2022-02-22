*** Settings ***
Resource    ../Resources/common.robot

*** Variables ***
${DEVICES-REFRESH-BUTTON}               id=${APP-ID}:id/fsiv_sync
${DEVICES-DEVICEDISCOVERED-LIST}        //android.widget.TextView[@resource-id="${APP-ID}:id/tv_camera_name"]
${DEVICES-DESTFOLDER-TITLE}             //android.widget.TextView[@text="Select folder"]
${DEVICES-DESTFOLDER-IMPORT-BUTTON}     //android.widget.TextView[@resource-id="${APP-ID}:id/tv_proceed_button"]
${DEVICES-DESTFOLDER-FOLDER-LIST}       //android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"]
${DEVICES-IMPORTSTARTED-TOAST}          //android.widget.TextView[@text="Import started"]
${DEVICES-IMPORTFINISHED-TOAST}         //android.widget.TextView[@text="Import finished"]

#***SELECT FILES FROM CAMERA WINDOW***
${DEVICES-CAMERADIR-WINDOW}             //androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/com.flir.tools:id/rv_camera_files_to_select"]
${DEVICES-CAMERADIR-NEXT-BUTTON}        id=${APP-ID}:id/iv_next

# *** METERLINK SUPPORT WINDOW***
${METERLINK-MESSAGE}                    //android.widget.TextView[@text="Currently we do not support Meterlink devices."]
${METERLINK-DONTDISPLAY-CHECKBOX}       id=${APP-ID}:id/do_not_show_dialog_again_checkbox
${METERLINK-OK-BUTTON}                  //android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_verify_buttons_container"]//android.widget.Button

*** Keywords ***
Dismiss Meterlink Support Notification
    Wait Until Page Contains Element     ${METERLINK-MESSAGE}
    Tap                                  ${METERLINK-DONTDISPLAY-CHECKBOX}
    Tap                                  ${METERLINK-OK-BUTTON}

Import files to a destination folder
    #import files from the first camera that's detected
    [Arguments]                         ${DEST-FOLDER-NAME}
    ${DEVICES-IMPORT-BUTTON}=           Set Variable             xpath=(//android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_import"])[1]
    ${FIRST-IMAGE}=                     Set Variable             xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_camera_files_to_select"]/android.widget.FrameLayout)[1]
    ${SECOND-IMAGE}=                    Set Variable             xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_camera_files_to_select"]/android.widget.FrameLayout)[2]
    ${THIRD-IMAGE}=                     Set Variable             xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_camera_files_to_select"]/android.widget.FrameLayout)[3]
    Wait Until Page Contains Element    ${DEVICES-IMPORT-BUTTON}    10
    Click Element                       ${DEVICES-IMPORT-BUTTON}
    Wait Until Page Contains Element    ${FIRST-IMAGE}              10
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
#    Sleep                               30s   #wait for a couple of files to be imported