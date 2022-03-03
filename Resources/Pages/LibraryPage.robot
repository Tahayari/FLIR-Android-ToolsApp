*** Settings ***
Documentation   This page conains user defined keywords that are specific to the Library page only
Resource        ../../Resources/UserDefinedKeywords.robot
Library         String


*** Keywords ***
Scroll Down If Element Not Found
    [Arguments]                    ${ELEMENT-TO-BE-FOUND}
    Swipe Up                       ${LIBRARY-FILESANDFOLDERS-LIST}
    Page Should Contain Element    ${ELEMENT-TO-BE-FOUND}

Scroll Up If Element Not Found
    [Arguments]                    ${ELEMENT-TO-BE-FOUND}
    Swipe Down                     ${LIBRARY-FILESANDFOLDERS-LIST}
    Page Should Contain Element    ${ELEMENT-TO-BE-FOUND}

Swipe Up
    [Arguments]    ${LIST-ID}
    ${LIST-ID-SUBSTRING}    Get Substring    ${LIST-ID}    3    #remove the "id=" prefix from the element
    ${LIST-ID}=             Set Variable    ${LIST-ID-SUBSTRING}
    ${ELEMENT_SIZE}=        Get Element Size        id=${LIST-ID}
    ${ELEMENT_LOCATION}=    Get Element Location    id=${LIST-ID}
    ${START_X}=         Evaluate      ${ELEMENT_LOCATION['x']} + (${ELEMENT_SIZE['width']} * 0.5)
    ${START_Y}=         Evaluate      ${ELEMENT_LOCATION['y']} + (${ELEMENT_SIZE['height']} * 0.7)
    ${END_X}=           Evaluate      ${ELEMENT_LOCATION['x']} + (${ELEMENT_SIZE['width']} * 0.5)
    ${END_Y}=           Evaluate      ${ELEMENT_LOCATION['y']} + (${ELEMENT_SIZE['height']} * 0.3)
    Swipe               ${START_X}    ${START_Y}  ${END_X}  ${END_Y}  200
    Sleep  1

Swipe Down
    [Arguments]    ${LIST-ID}
    ${LIST-ID-SUBSTRING}    Get Substring    ${LIST-ID}    3    #remove the "id=" prefix from the element
    ${LIST-ID}=             Set Variable    ${LIST-ID-SUBSTRING}
    ${ELEMENT_SIZE}=        Get Element Size        id=${LIST-ID}
    ${ELEMENT_LOCATION}=    Get Element Location    id=${LIST-ID}
    ${START_X}=         Evaluate      ${ELEMENT_LOCATION['x']} + (${ELEMENT_SIZE['width']} * 0.5)
    ${START_Y}=         Evaluate      ${ELEMENT_LOCATION['y']} + (${ELEMENT_SIZE['height']} * 0.3)
    ${END_X}=           Evaluate      ${ELEMENT_LOCATION['x']} + (${ELEMENT_SIZE['width']} * 0.5)
    ${END_Y}=           Evaluate      ${ELEMENT_LOCATION['y']} + (${ELEMENT_SIZE['height']} * 0.7)
    Swipe               ${START_X}    ${START_Y}  ${END_X}  ${END_Y}  200
    Sleep  1

Create a new folder
    [Arguments]     ${FOLDERNAME}
    ${FOLDERNAME-XPATH}=                        Set Variable       //android.widget.TextView[@text="${FOLDERNAME}"]
    Tap                                         ${LIBRARY-ADDFOLDER-BUTTON}
    Wait Until Page Contains Element            ${LIBRARY-NEWFOLDER-TITLE}
    Input Text                                  ${LIBRARY-FILEFOLDERNAME-FIELD}     ${FOLDERNAME}
    Tap                                         ${LIBRARY-CREATEFOLDER-BUTTON}
    Wait Until Page Contains Element            ${NAVIGATION-LIBRARY-BUTTON}
    Scroll Up And Down In Search For Element    ${FOLDERNAME-XPATH}
    
Open Options Menu For File/Folder
    [Arguments]     ${FILENAME}
    ${OPTIONS-BUTTON-XPATH}=            Set Variable    //android.widget.TextView[@text="${FILENAME}"]//parent::android.view.ViewGroup//android.widget.FrameLayout[@resource-id="${APP-ID}:id/fl_option_menu"]
    Tap                                 ${OPTIONS-BUTTON-XPATH}
    Wait Until Page Contains Element    ${LIBRARY-OPTIONS-CLOSE}    7

Delete a file or folder
    [Arguments]                         ${FileName}
    Open Options Menu For File/Folder   ${FileName}
    Tap                                 ${LIBRARY-OPTIONS-DELETE}
    Wait Until Page Contains Element    ${DELETE-DIALOG-TITLE}
    Tap                                 ${DELETE-DIALOG-DELETE-BUTTON}
    Wait Until Page Contains Element    ${LIBRARY-DELETE-SUCCESS-TOAST}


SortBy Name
    [Documentation]                     Sort files/folders in the Library by Name
    Tap                                 ${LIBRARY-SORT-TOOLBAR}
    Wait Until Page Contains Element    ${LIBRARY-OPTIONS-CLOSE}
    ${status}     Run Keyword And Return Status   Element Should Be Visible    ${LIBRARY-SORTBY-NAME-TICK}
    IF    '${status}' == 'False'
        Wait Until Page Contains Element    ${LIBRARY-SORTBY-NAME}
        Tap                                 ${LIBRARY-SORTBY-NAME}
    ELSE 
        Tap                                 ${LIBRARY-OPTIONS-CLOSE}  #same id for the Close button
    END
    Wait Until Page Contains Element    ${LIBRARY-SORT-TOOLBAR}

SortBy Modified Date
    [Documentation]                     Sort files/folders in the Library by Modified Date
    Tap                                 ${LIBRARY-SORT-TOOLBAR}
    Wait Until Page Contains Element    ${LIBRARY-OPTIONS-CLOSE}
    ${status}     Run Keyword And Return Status   Element Should Be Visible    ${LIBRARY-SORTBY-MODIFIED-TICK}
    IF    '${status}' == 'False'
        Wait Until Page Contains Element    ${LIBRARY-SORTBY-MODIFIED}
        Tap                                 ${LIBRARY-SORTBY-MODIFIED}
    ELSE 
        Tap                                 ${LIBRARY-OPTIONS-CLOSE}  #same id for the Close button 
    END
    Wait Until Page Contains Element    ${LIBRARY-SORT-TOOLBAR}

OrderBy Ascending
    [Documentation]                     Order files/folders in the Library by ASCENDING Order
    Tap                                 ${LIBRARY-SORT-TOOLBAR}
    Wait Until Page Contains Element    ${LIBRARY-OPTIONS-CLOSE}
    ${status}    Run Keyword And Return Status    Element Should Be Visible    ${LIBRARY-SORTBY-ASC}
    IF    '${status}' == 'False'
        Wait Until Page Contains Element    ${LIBRARY-SORTBY-DESC}
        Tap                                 ${LIBRARY-SORTBY-DESC}
    ELSE 
        Tap                                 ${LIBRARY-OPTIONS-CLOSE}  #same id for the Close button
    END
    Wait Until Page Contains Element    ${LIBRARY-SORT-TOOLBAR}

OrderBy Descending
    [Documentation]                     Order files/folders in the Library by DESCENDING Order
    Tap                                 ${LIBRARY-SORT-TOOLBAR}
    Wait Until Page Contains Element    ${LIBRARY-OPTIONS-CLOSE}
    ${status}    Run Keyword And Return Status    Element Should Be Visible    ${LIBRARY-SORTBY-DESC}
    # Log To Console    Orderby DESC locator status is... ${status}
    IF    '${status}' == 'False'
        Wait Until Page Contains Element    ${LIBRARY-SORTBY-ASC}
        Tap                                 ${LIBRARY-SORTBY-ASC}
    ELSE 
        Tap                                 ${LIBRARY-OPTIONS-CLOSE}  #same id for the Close button
    END
    Wait Until Page Contains Element    ${LIBRARY-SORT-TOOLBAR}
Select All
    [Documentation]             Selects all of the files&folders in the current view and returns the total number of files selected
    ${firstElement}        Set Variable     xpath=(//androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/rv_items"]/android.widget.FrameLayout)[1]
    Long Press                  ${firstElement}
    Tap                         ${LIBRARY-ADDFOLDER-BUTTON}
    Wait Until Page Contains Element    ${LIBRARY-OPTIONS-SELECT-ALL}
    Tap                         ${LIBRARY-OPTIONS-SELECT-ALL}
    ${noOfFilesSelected}        Get Text    id=${APP-ID}:id/tv_selected_count
    ${noOfFilesSelected}        Remove String  ${noOfFilesSelected}     Items
    [Return]                    ${noOfFilesSelected}