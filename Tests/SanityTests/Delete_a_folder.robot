*** Settings ***
Documentation       Create a new folder with a random 7 character string. Then delete it
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/Locators.robot
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Resources/Pages/LibraryPage.robot

*** Test Cases ***
Delete a folder
    [Documentation]                     Creates a new folder with a random name of 7 characters and then deletes it
    [Tags]                              Sanity
    ${folderName}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${folderName}"]
    Create A New Folder                 ${folderName}
    Delete a file or folder             ${folderName}