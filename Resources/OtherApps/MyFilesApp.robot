*** Settings ***
Library         AppiumLibrary
Resource        ../../Resources/Config.robot
Resource        ../../Resources/UserDefinedKeywords.robot

*** Variables ***
${MYFILES-INTERNALSTORAGE-BUTTON}           //android.widget.TextView[@text="Internal storage"]
${MYFILES-FOLDERVIEW-FLIR-FOLDER}           //android.widget.TextView[@text="FLIR"]
${MYFILES-FOLDERVIEW-TESTIMAGES-FOLDER}     //android.widget.TextView[@text="Test Images"]
${MYFILES-FOLDERVIEW-TESTIMAGES-ITEMSLIST}  //android.widget.LinearLayout[@resource-id="com.sec.android.app.myfiles:id/file_detail_list_item"]
${MYFILES-FOLDERVIEW-TESTIMAGES-SELECTALL-CHECKBOX}      id=com.sec.android.app.myfiles:id/actionbar_select_checkbox
${MYFILES-FOLDERVIEW-TESTIMAGES-SHARE-BUTTON}            //android.widget.Button[@content-desc="Share selected files"]


*** Keywords ***
Navigate to the Test Folder
    Tap                                 ${MYFILES-INTERNALSTORAGE-BUTTON}
    Wait Until Page Contains Element    ${MYFILES-FOLDERVIEW-FLIR-FOLDER}
    Tap                                 ${MYFILES-FOLDERVIEW-FLIR-FOLDER}
    Wait Until Page Contains Element    ${MYFILES-FOLDERVIEW-TESTIMAGES-FOLDER}
    Tap                                 ${MYFILES-FOLDERVIEW-TESTIMAGES-FOLDER}
    Wait Until Page Contains Element    xpath=(${MYFILES-FOLDERVIEW-TESTIMAGES-ITEMSLIST})[1]

Send test images to Tools app
    LongPress                           xpath=(${MYFILES-FOLDERVIEW-TESTIMAGES-ITEMSLIST})[1]
    Wait Until Page Contains Element    ${MYFILES-FOLDERVIEW-TESTIMAGES-SELECTALL-CHECKBOX}
    Tap                                 ${MYFILES-FOLDERVIEW-TESTIMAGES-SELECTALL-CHECKBOX}
    Tap                                 ${MYFILES-FOLDERVIEW-TESTIMAGES-SHARE-BUTTON}
    Tap                                 ${ANDROID-SHARE-TOOLSAPP-DEBUG}
#    IF  '${APP-ID}'=='${PROD-APP-ID}'
#        Wait Until Page Contains Element    ${ANDROID-SHARE-TOOLSAPP-PROD}
#        Tap                                 ${ANDROID-SHARE-TOOLSAPP-PROD}
#    ELSE IF     '${APP-ID}'=='${DEBUG-APP-ID}'
#        Wait Until Page Contains Element    ${ANDROID-SHARE-TOOLSAPP-DEBUG}
#        Tap                                 ${ANDROID-SHARE-TOOLSAPP-DEBUG}
#    END