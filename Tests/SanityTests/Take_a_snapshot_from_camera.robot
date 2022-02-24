*** Settings ***
Documentation       Take a snapshot from the first detected camera
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/Locators.robot
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Resources/Pages/StreamPage.robot

*** Test Cases ***
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