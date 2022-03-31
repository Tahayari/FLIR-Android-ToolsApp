*** Settings ***
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Utils/Setup_Test_Folder.robot

*** Test Cases ***
Just for Test
    ${filename}  Set Variable     GPS_France.jpg
    ${destinationFolder}          Generate Random String     7
    Create a new folder           ${destinationFolder}
    Setup Test Folder
    Copy File To Destination Folder    ${filename}    ${destinationFolder}