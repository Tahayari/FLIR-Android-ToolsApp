*** Settings ***
Library     AppiumLibrary
Library     String

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

*** Keywords ***
Launch ToolsAndroid
    open application    http://localhost:4723/wd/hub    platformName=Android   noReset=true    autoGrantPermissions=false    appPackage=${APP-ID}    appActivity=${APP-ACTIVITY}   automationName=UIAutomator2

Allow Storage Permission
    Wait Until Page Contains Element     ${ANDROID-STORAGE-ALLOW-BUTTON}
    Tap                                  ${ANDROID-STORAGE-ALLOW-BUTTON}
    Wait Until Page Contains Element     ${NAVIGATION-LIBRARY-BUTTON}

Allow Location Permission
    Wait Until Page Contains Element     ${ANDROID-LOCATION-ALLOW-BUTTON}
    Tap                                  ${ANDROID-LOCATION-ALLOW-BUTTON}