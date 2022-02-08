*** Settings ***
Library     AppiumLibrary
Library    String

*** Variables ***
# *** APP VARIABLES ***
${PROD-APP-ID}                          com.flir.tools
${DEBUG-APP-ID}                         com.flir.tools.debug
${APP-ID}                               ${DEBUG-APP-ID}                     #SET which app to test. PROD or DEBUG build
${APP-ACTIVITY}                         com.flir.cloudlib.ui.FlirCloudActivity

#*** ANDROID VARIABLES***
${ANDROID-STORAGE-ALLOW-BUTTON}         id=com.android.permissioncontroller:id/permission_allow_button
${ANDROID-STORAGE-DENY-BUTTON}          id=com.android.permissioncontroller:id/permission_deny_button
${ANDROID-LOCATION-ALLOW-BUTTON}        id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${ANDROID-LOCATION-DENY-BUTTON}         id=com.android.permissioncontroller:id/permission_deny_button

#*** NAVIGATION BAR***
${NAVIGATION-LIBRARY-BUTTON}            id=${APP-ID}:id/btnFlirLibrary
${NAVIGATION-DEVICES-BUTTON}            id=${APP-ID}:id/btnFlirDevices
${NAVIGATION-SETTINGS-BUTTON}           id=${APP-ID}:id/btnFlirSettings

#*** LIBRARY PAGE***
${LIBRARY-ADDFOLDER-BUTTON}             id=${APP-ID}:id/iv_toolbar_add
${LIBRARY-NEWFOLDER-TITLE}              //android.widget.TextView[@text="New folder"]
${LIBRARY-FOLDERNAME-FIELD}             id=${APP-ID}:id/et_file_folder_name
${LIBRARY-CREATEFOLDER-BUTTON}          id=${APP-ID}:id/tv_proceed_button
${LIBRARY-FILESANDFOLDERS-LIST}         id=${APP-ID}:id/rv_items

#*** ONBOARDING PAGE***
${ONBOARDING-NEXT-BUTTON}               id=${APP-ID}:id/tvNext

# *** METERLINK SUPPORT WINDOW***
${METERLINK-MESSAGE}                    //android.widget.TextView[@text="Currently we do not support Meterlink devices."]
${METERLINK-DONTDISPLAY-CHECKBOX}       id=${APP-ID}:id/do_not_show_dialog_again_checkbox
${METERLINK-OK-BUTTON}                  //android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_verify_buttons_container"]//android.widget.Button
*** Keywords ***
Launch ToolsAndroid
    open application    http://localhost:4723/wd/hub    platformName=Android   noReset=true    autoGrantPermissions=false    appPackage=${APP-ID}    appActivity=${APP-ACTIVITY}   automationName=Uiautomator2
    #CHECK IF THE APP IS OPENED FOR THE FIRST TIME
    # Wait Until Page Contains Element     ${NAVIGATION-LIBRARY-BUTTON}

Skip Tutorial
    Tap                                  ${ONBOARDING-NEXT-BUTTON}
    Tap                                  ${ONBOARDING-NEXT-BUTTON}
    Tap                                  ${ONBOARDING-NEXT-BUTTON}
    Tap                                  ${ONBOARDING-NEXT-BUTTON}
    Tap                                  ${ONBOARDING-NEXT-BUTTON}

Allow Storage Permission
    Wait Until Page Contains Element     ${ANDROID-STORAGE-ALLOW-BUTTON}
    Tap                                  ${ANDROID-STORAGE-ALLOW-BUTTON}
    Wait Until Page Contains Element     ${NAVIGATION-LIBRARY-BUTTON}

Allow Location Permission
    Wait Until Page Contains Element     ${ANDROID-LOCATION-ALLOW-BUTTON}
    Tap                                  ${ANDROID-LOCATION-ALLOW-BUTTON}

Dismiss Meterlink Support Notification
    Wait Until Page Contains Element     ${METERLINK-MESSAGE}
    Tap                                  ${METERLINK-DONTDISPLAY-CHECKBOX}
    Tap                                  ${METERLINK-OK-BUTTON}

Skip First Time Open
    Skip Tutorial
    Allow Storage Permission
    Tap                                  ${NAVIGATION-DEVICES-BUTTON}
    Allow Location Permission
    Dismiss Meterlink Support Notification
    Dismiss Meterlink Support Notification  #existing bug that displays the Meterlink notification twice when the app is opened for the first time
    Tap                                  ${NAVIGATION-LIBRARY-BUTTON}

Scroll Down If Element Not Found
    [Arguments]                    ${ELEMENT-TO-BE-FOUND}
    Swipe Up                       ${LIBRARY-FILESANDFOLDERS-LIST}        
    Page Should Contain Element    ${ELEMENT-TO-BE-FOUND}

Swipe Up
    [Arguments]    ${LIST-ID}
    ${LIST-ID-SUBSTRING}    Get Substring    ${LIST-ID}    3    #remove the id= prefix from the element
    ${LIST-ID}=    Set Variable    ${LIST-ID-SUBSTRING}    
    ${ELEMENT_SIZE}=        Get Element Size        id=${LIST-ID}
    ${ELEMENT_LOCATION}=    Get Element Location    id=${LIST-ID}
    ${START_X}=         Evaluate      ${ELEMENT_LOCATION['x']} + (${ELEMENT_SIZE['width']} * 0.5)
    ${START_Y}=         Evaluate      ${ELEMENT_LOCATION['y']} + (${ELEMENT_SIZE['height']} * 0.7)
    ${END_X}=           Evaluate      ${ELEMENT_LOCATION['x']} + (${ELEMENT_SIZE['width']} * 0.5)
    ${END_Y}=           Evaluate      ${ELEMENT_LOCATION['y']} + (${ELEMENT_SIZE['height']} * 0.3)
    Swipe               ${START_X}    ${START_Y}  ${END_X}  ${END_Y}  500
    Sleep  1

Swipe Down
    [Arguments]    ${LIST-ID}
    ${LIST-ID-SUBSTRING}    Get Substring    ${LIST-ID}    3    #remove the id= prefix from the element
    ${LIST-ID}=    Set Variable    ${LIST-ID-SUBSTRING}    
    ${ELEMENT_SIZE}=        Get Element Size        id=${LIST-ID}
    ${ELEMENT_LOCATION}=    Get Element Location    id=${LIST-ID}
    ${START_X}=         Evaluate      ${ELEMENT_LOCATION['x']} + (${ELEMENT_SIZE['width']} * 0.5)
    ${START_Y}=         Evaluate      ${ELEMENT_LOCATION['y']} + (${ELEMENT_SIZE['height']} * 0.3)
    ${END_X}=           Evaluate      ${ELEMENT_LOCATION['x']} + (${ELEMENT_SIZE['width']} * 0.5)
    ${END_Y}=           Evaluate      ${ELEMENT_LOCATION['y']} + (${ELEMENT_SIZE['height']} * 0.7)
    Swipe               ${START_X}    ${START_Y}  ${END_X}  ${END_Y}  500
    Sleep  1