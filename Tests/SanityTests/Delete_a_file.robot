*** Settings ***
Documentation       Create a new folder with a random 7 character string. Then delete it
Resource            ../../Resources/Locators.robot

*** Test Cases ***
Delete a folder
    [Tags]                              Sanity
    ${folderName}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${folderName}"]
    Create A New Folder                 ${folderName}
    Delete a file or folder             ${folderName}