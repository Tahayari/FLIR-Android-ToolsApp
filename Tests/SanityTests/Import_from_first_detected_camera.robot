*** Settings ***
Documentation       Import the first 3 files from the first detected camera
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/Pages/LibraryPage.robot
Resource            ../../Resources/Pages/DevicesPage.robot
Library             DateTime

*** Test Cases ***
Import files from the first detected camera
    [Documentation]                             Import the first 3 files from the first detected camera
    [Tags]                                      Sanity
    ${current-date}                                 Get Current Date    result_format=%Y-%m-%d %H-%M-%S.%f
    ${import-destination-foldername}                Set Variable        Import Folder ${current-date}
    Create a new folder                             ${import-destination-foldername}
    Navigate to Devices Tab
    Import files to a destination folder            ${import-destination-foldername}