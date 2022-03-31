*** Settings ***
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/UserDefinedKeywords.robot

*** Test Cases ***
Just for Test
    [Documentation]     Move first file from the Test Folder to a newly created folder       
    [Tags]              Sanity
    ${destinationFolder}               Generate Random String     7
    Create a new folder                ${destinationFolder}
    Setup Test Folder
    ${fileNameXpath}    Set Variable    xpath=(//android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"])[1]
    Wait Until Page Contains Element    ${fileNameXpath}
    ${fileName}    Get Text        ${fileNameXpath}
    Copy File To Destination Folder    ${fileName}    ${destinationFolder}