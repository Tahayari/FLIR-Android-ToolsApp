*** Settings ***
Library         String
Resource        Config.robot
Resource        Locators.robot

*** Variables ***

#*** ANDROID VARIABLES***
${ANDROID-STORAGE-ALLOW-BUTTON}         id=com.android.permissioncontroller:id/permission_allow_button
${ANDROID-STORAGE-DENY-BUTTON}          id=com.android.permissioncontroller:id/permission_deny_button
${ANDROID-LOCATION-ALLOW-BUTTON}        id=com.android.permissioncontroller:id/permission_allow_foreground_only_button
${ANDROID-LOCATION-DENY-BUTTON}         id=com.android.permissioncontroller:id/permission_deny_button
${ANDROID-SHARE-TOOLSAPP-PROD}          //android.widget.TextView[@text="FLIR Tools"]
${ANDROID-SHARE-TOOLSAPP-DEBUG}         //android.widget.TextView[@text="FLIR Tools Debug"]

*** Keywords ***
Launch ToolsAndroid
    open application    http://localhost:${ANDROID-SERVER-PORT}/wd/hub    platformName=Android   noReset=true    autoGrantPermissions=false    appPackage=${APP-ID}    appActivity=${APP-ACTIVITY}   automationName=UIAutomator2

Launch MyFilesApp
    open application    http://localhost:${ANDROID-SERVER-PORT}/wd/hub    platformName=Android   noReset=true    autoGrantPermissions=true    appPackage=${MYFILES-APP-ID}    appActivity=${MYFILES-APP-ACTIVITY}   automationName=UIAutomator2

Allow Storage Permission
    Wait Until Page Contains Element     ${ANDROID-STORAGE-ALLOW-BUTTON}
    Tap                                  ${ANDROID-STORAGE-ALLOW-BUTTON}
    Wait Until Page Contains Element     ${NAVIGATION-LIBRARY-BUTTON}

Allow Location Permission
    Wait Until Page Contains Element     ${ANDROID-LOCATION-ALLOW-BUTTON}
    Tap                                  ${ANDROID-LOCATION-ALLOW-BUTTON}

Navigate to Library Tab
    Tap                                  ${NAVIGATION-LIBRARY-BUTTON}
    Wait Until Page Contains Element     ${LIBRARY-MYFILES-TITLE}
    Log                                  "Navigated to the Library Tab"

Navigate to Devices Tab
    Tap                                  ${NAVIGATION-DEVICES-BUTTON}
    Wait Until Page Contains Element     ${DEVICES-REFRESH-BUTTON}
    Log                                  "Navigated to the Devices Tab"

Navigate to Settings Tab
    Tap                                  ${NAVIGATION-SETTINGS-BUTTON}
    Wait Until Page Contains Element     ${SETTINGS-TITLE}
    Log                                  "Navigated to the Settings Tab"

Scroll Up And Down In Search For Element
    [Arguments]        ${FOLDERNAME-XPATH}
    ${result}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${FOLDERNAME-XPATH}
    IF    "${result}" == "False"
        ${result}=    Run Keyword And Return Status    Wait Until Keyword Succeeds         5x    200ms    Scroll Down If Element Not Found    ${FOLDERNAME-XPATH}
    END
    IF    "${result}" == "False"
        Wait Until Keyword Succeeds         5x    200ms    Scroll Up If Element Not Found    ${FOLDERNAME-XPATH}
    END

Skip Tutorial
    Tap                                  ${ONBOARDING-NEXT-BUTTON}
    Tap                                  ${ONBOARDING-NEXT-BUTTON}
    Tap                                  ${ONBOARDING-NEXT-BUTTON}
    Tap                                  ${ONBOARDING-NEXT-BUTTON}
    Tap                                  ${ONBOARDING-NEXT-BUTTON}

Skip First Time Open
    Skip Tutorial
    Allow Storage Permission
    Tap                                  ${NAVIGATION-DEVICES-BUTTON}
    Allow Location Permission
    Dismiss Meterlink Support Notification
    Dismiss Meterlink Support Notification  #existing bug that displays the Meterlink notification twice when the app is opened for the first time
    Tap                                  ${NAVIGATION-LIBRARY-BUTTON}