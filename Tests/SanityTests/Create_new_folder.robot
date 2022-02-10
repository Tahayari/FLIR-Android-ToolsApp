*** Settings ***
Library             AppiumLibrary
Library             String
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/android-res.robot
Resource            ../../Resources/library.robot
Documentation       Create a new folder with a random 7 character string. Verify if it was created successfully in the Library

*** Test Cases ***
Create a new folder
    [Tags]                              Sanity
    # Launch ToolsAndroid
    ${FOLDERNAME}=                      Generate Random String      7
    ${FOLDERNAME-XPATH}=                Set Variable       //android.widget.TextView[@text="${FOLDERNAME}"]
    Create A New Folder                 ${FOLDERNAME}
    # Close Application