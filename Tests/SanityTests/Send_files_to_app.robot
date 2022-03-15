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
    ${firstFolderXpath}    Set Variable    xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_items"]/android.widget.FrameLayout)[1]
    ${firstFileXpath}      Set Variable    xpath=(//android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"])[1]

    Launch MyFilesApp
    Navigate to Local Images Test Folder
    ${noOfFilesSentFromMyFiles}                 Send Test Images To Tools App
    Wait Until Page Contains Element            ${LIBRARY-MYFILES-TITLE}
    Scroll Up And Down In Search For Element    ${LIBRARY-SHAREDIMPORT-FOLDER}
    Tap                                         ${LIBRARY-SHAREDIMPORT-FOLDER}
    SortBy Name
    OrderBy Descending
    #Tap on the first folder
    Wait Until Page Contains Element    ${firstFolderXpath}
    Tap                                 ${firstFolderXpath}
    Wait Until Page Contains Element    ${firstFileXpath}
    #Select All
    ${noOfFilesSelected}        Select All
    #compare the number of images    
    Should Be Equal   ${noOfFilesSentFromMyFiles}    ${noOfFilesSelected}    msg=Selected files were imported successfully into the app
    Tap               ${LIBRARY-INFOTOOLBAR-CLOSE-BUTTON}
    #return to root folder?