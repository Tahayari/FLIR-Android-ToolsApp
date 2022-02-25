*** Settings ***
#Suite Setup         Launch ToolsAndroid
#Suite Teardown      Close Application
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Resources/OtherApps/MyFilesApp.robot
Resource            ../../Resources/Locators.robot

*** Test Cases ***
Open MyFiles app
    Launch MyFilesApp
    Navigate to the Test Folder
    Send Test Images To Tools App
    Wait Until Page Contains Element      ${LIBRARY-MYFILES-TITLE}
    #verify if files were sent in the correct folder?