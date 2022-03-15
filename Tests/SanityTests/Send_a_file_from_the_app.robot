*** Settings ***
Documentation       Send/share a file from the app's Library
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Resources/OtherApps/MyFilesApp.robot
Resource            ../../Resources/Locators.robot
Resource            ../../Resources/Pages/LibraryPage.robot
Resource            ../../Utils/Setup_Test_Folder.robot

*** Test Cases ***
Send files from local storage to Tools app
    [Tags]                                      Sanity
    [Documentation]                             Send/share a file from the app's Library
    ${firstFolderXpath}    Set Variable    xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_items"]/android.widget.FrameLayout)[1]
    ${firstFileXpath}      Set Variable    xpath=(//android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"])[1]
    ${androidContentPanelId}   Set Variable     id=android:id/contentPanel

    Setup Test Folder
    #Get the name of the first file
    Wait Until Page Contains Element            ${firstFileXpath}
    ${fileName}        Get Text                 ${firstFileXpath}
    #Open More options
    Open Options Menu For File/Folder           ${filename}
    #Tap on the Send button
    Tap                                         ${LIBRARY-OPTIONS-SEND}
    Page Should Contain Element                 ${androidContentPanelId}
    Go Back