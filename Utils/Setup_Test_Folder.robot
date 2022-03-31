*** Settings ***
Resource        ../Resources/Config.robot
Resource        ../Resources/UserDefinedKeywords.robot
Resource        ../Resources/OtherApps/MyFilesApp.robot
Resource        ../Resources/Locators.robot
Resource        ../Resources/Pages/LibraryPage.robot

*** Variables ***
${testFolderName}       Test Folder
${testFolderXpath}      xpath=//android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"][@text="${testFolderName}"]

*** Keywords ***
Setup Test Folder
    [Documentation]     Navigate to Test Folder that contains test images. If it doesn't exist, import images and navigate to it
    ${folderWasCreated}        Run Keyword And Return Status    Create a new folder           ${testFolderName}

    IF    '${folderWasCreated}' == 'False'
        Go Back
        # Wait Until Page Contains Element    ${testFolderXpath}
        Scroll Up And Down In Search For Element    ${testFolderXpath}
        Tap                                 ${testFolderXpath}
    ELSE
        Upload local images to the app
        Select All
        Tap                                 ${LIBRARY-ADDFOLDER-BUTTON}
        Wait Until Page Contains Element    ${LIBRARY-OPTIONS-MOVE}
        Tap                                 ${LIBRARY-OPTIONS-MOVE}
        Scroll Up And Down In Search For Element    ${testFolderXpath}
        Tap                                 ${testFolderXpath}
        Sleep     1.5s
        Tap                                 ${LIBRARY-CREATEFOLDER-BUTTON}
        Wait Until Page Contains Element    ${LIBRARY-MOVE-SUCCESS-TOAST}
    END

Upload local images to the app
    ${firstFolderXpath}    Set Variable    xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_items"]/android.widget.FrameLayout)[1]
    ${firstFileXpath}      Set Variable    xpath=(//android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"])[1]

    Launch MyFilesApp
    Navigate to Local Images Test Folder
    Send test images to Tools app
    Wait Until Page Contains Element            ${LIBRARY-MYFILES-TITLE}
    Scroll Up And Down In Search For Element    ${LIBRARY-SHAREDIMPORT-FOLDER}
    Tap                                         ${LIBRARY-SHAREDIMPORT-FOLDER}
    SortBy Name
    OrderBy Descending
    Wait Until Page Contains Element            ${firstFolderXpath}
    Tap                                         ${firstFolderXpath}
    Wait Until Page Contains Element            ${firstFileXpath}