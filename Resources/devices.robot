*** Settings ***
Resource    ../Resources/android-res.robot

*** Variables ***
${DEVICES-REFRESH-BUTTON}               id=${APP-ID}:id/fsiv_sync
${DEVICES-DEVICEDISCOVERED-LIST}        //android.widget.TextView[@resource-id="${APP-ID}:id/tv_camera_name"]
${DEVICES-DESTFOLDER-TITLE}             //android.widget.TextView[@text="Select folder"]
${DEVICES-DESTFOLDER-IMPORT-BUTTON}     //android.widget.TextView[@resource-id="${APP-ID}:id/tv_proceed_button"]
${DEVICES-DESTFOLDER-FOLDER-LIST}       //android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"]
${DEVICES-IMPORTSTARTED-TOAST}          //android.widget.TextView[@text="Import started"]

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
    Wait Until Page Contains Element    ${DEVICES-IMPORT-BUTTON}    10
    Click Element                       ${DEVICES-IMPORT-BUTTON}
    Wait Until Page Contains Element    ${DEVICES-DESTFOLDER-TITLE}
    Scroll Up And Down In Search For Element    ${DEVICES-DESTFOLDER-FOLDER-LIST}\[@text="${DEST-FOLDER-NAME}"]
    Tap                                 ${DEVICES-DESTFOLDER-FOLDER-LIST}\[@text="${DEST-FOLDER-NAME}"]
    Tap                                 ${DEVICES-DESTFOLDER-IMPORT-BUTTON}
    Wait Until Element Is Visible       ${DEVICES-IMPORTSTARTED-TOAST}
    Sleep                               30s   #wait for a couple of files to be imported               