*** Settings ***
Suite Setup         Launch ToolsAndroid
Suite Teardown      Close Application
Resource            ../../Resources/UserDefinedKeywords.robot
Resource            ../../Resources/OtherApps/MyFilesApp.robot
Resource            ../../Resources/Locators.robot
Resource            ../../Resources/Pages/LibraryPage.robot

*** Test Cases ***
Just for Test
    # SortBy Name
    # SortBy Modified Date
    # OrderBy Descending
    OrderBy Ascending