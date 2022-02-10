*** Settings ***
Resource    ../Resources/android-res.robot

*** Variables ***
# *** METERLINK SUPPORT WINDOW***
${METERLINK-MESSAGE}                    //android.widget.TextView[@text="Currently we do not support Meterlink devices."]
${METERLINK-DONTDISPLAY-CHECKBOX}       id=${APP-ID}:id/do_not_show_dialog_again_checkbox
${METERLINK-OK-BUTTON}                  //android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_verify_buttons_container"]//android.widget.Button

*** Keywords ***
Dismiss Meterlink Support Notification
    Wait Until Page Contains Element     ${METERLINK-MESSAGE}
    Tap                                  ${METERLINK-DONTDISPLAY-CHECKBOX}
    Tap                                  ${METERLINK-OK-BUTTON}