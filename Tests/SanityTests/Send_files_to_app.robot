*** Settings ***
Documentation       Send files from local storage and send them to the app. Files location should be in /FLIR/Test Images
# Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Resources/OtherApps/MyFilesApp.robot
Resource            ../../Resources/Locators.robot
Resource            ../../Resources/Pages/LibraryPage.robot

*** Test Cases ***
Send files from local storage to Tools app
    [Documentation]       Send files from local storage and send them to the app. Files location should be in /FLIR/Test Images
    [Tags]                                      Sanity
    Launch MyFilesApp
    Navigate to the Test Folder
    ${noOfFilesSentFromMyFiles}                 Send Test Images To Tools App
    Wait Until Page Contains Element            ${LIBRARY-MYFILES-TITLE}
    Scroll Up And Down In Search For Element    ${LIBRARY-SHAREDIMPORT-FOLDER}
    Tap                                         ${LIBRARY-SHAREDIMPORT-FOLDER}
    SortBy Name
    OrderBy Descending
    #Tap on the first folder
    Tap        xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_items"]/android.widget.FrameLayout)[1]
    #Select All
    ${noOfFilesSelected}        Select All
    #compare the number of images    
    Log To Console    ${noOfFilesSentFromMyFiles}
    Log To Console    ${noOfFilesSelected}
    Should Be Equal   ${noOfFilesSentFromMyFiles}    ${noOfFilesSelected}    msg=Selected files were imported successfully into the app
    Tap               ${LIBRARY-INFOTOOLBAR-CLOSE-BUTTON}
    #return to root folder?