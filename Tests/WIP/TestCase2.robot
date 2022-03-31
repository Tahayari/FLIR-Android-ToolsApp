*** Settings ***
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Resources/OtherApps/MyFilesApp.robot
Resource            ../../Resources/Locators.robot
Resource            ../../Resources/Pages/LibraryPage.robot
Resource            ../../Utils/Setup_Test_Folder.robot

*** Test Cases ***
TestCase2
    ${testFolderName}     Set Variable    Test Folder
    # Create a new folder           ${testFolderName}
    ${folderAlreadyExists}        Run Keyword And Return Status        Create a new folder           ${testFolderName}
    Log To Console    status is.... ${folderAlreadyExists}