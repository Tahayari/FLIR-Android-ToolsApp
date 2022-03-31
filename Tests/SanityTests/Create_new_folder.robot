*** Settings ***
Documentation       Create a new folder with a random 7 character string. Verify if it was created successfully in the Library
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/Pages/LibraryPage.robot

*** Test Cases ***
Create a new folder
    [Documentation]                     Creates a new folder with a random name of 7 characters
    [Tags]                              Sanity
    ${FOLDERNAME}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${FOLDERNAME}"]
    Create A New Folder                 ${FOLDERNAME}