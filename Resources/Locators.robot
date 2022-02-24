*** Settings ***
Documentation    This page contains the locators of Elements used throughout the Android app from all of the pages
Resource         Config.robot
Library          AppiumLibrary


*** Variables ***
#---------------------------------------------------------------------------------------------------------------
#-----------------------------------***    LIBRARY PAGE    ***--------------------------------------------------
#---------------------------------------------------------------------------------------------------------------

${LIBRARY-MYFILES-TITLE}                //android.widget.FrameLayout[@content-desc="Library"]
${LIBRARY-ADDFOLDER-BUTTON}             id=${APP-ID}:id/iv_toolbar_add
${LIBRARY-SAVE-BUTTON}                  //android.widget.TextView[@text="Save"]
${LIBRARY-NEWFOLDER-TITLE}              //android.widget.TextView[@text="New folder"]
${LIBRARY-RENAME-TITLE}                 //android.widget.TextView[@text="Rename"]
${LIBRARY-FILEFOLDERNAME-FIELD}         id=${APP-ID}:id/et_file_folder_name
${LIBRARY-CREATEFOLDER-BUTTON}          id=${APP-ID}:id/tv_proceed_button
${LIBRARY-FILESANDFOLDERS-LIST}         id=${APP-ID}:id/rv_items

#***FILE/FOLDER OPTIONS CONTEXT MENU***
${LIBRARY-OPTIONS-DETAILS}              id=${APP-ID}:id/action_details
${LIBRARY-OPTIONS-COPY}                 id=${APP-ID}:id/action_copy
${LIBRARY-OPTIONS-MOVE}                 id=${APP-ID}:id/action_move
${LIBRARY-OPTIONS-RENAME}               id=${APP-ID}:id/action_rename
${LIBRARY-OPTIONS-DELETE}               id=${APP-ID}:id/action_delete
${LIBRARY-OPTIONS-CLOSE}                id=${APP-ID}:id/action_close

# ***DIALOG WINDOWS***
${DELETE-DIALOG-TITLE}                  //android.widget.TextView[@text="Delete"]
${DELETE-DIALOG-DELETE-BUTTON}          //android.widget.Button[@text="Delete"]

#***TOAST MESSAGES***
${LIBRARY-RENAME-SUCCESS-TOAST}         //android.widget.TextView[@text="Folder renamed"]
${LIBRARY-DELETE-SUCCESS-TOAST}         //*[contains(@text,"successfully deleted")]

#*** ONBOARDING PAGE***
${ONBOARDING-NEXT-BUTTON}               id=${APP-ID}:id/tvNext

#---------------------------------------------------------------------------------------------------------------
#-----------------------------------***    DEVICES PAGE    ***--------------------------------------------------
#---------------------------------------------------------------------------------------------------------------

${DEVICES-REFRESH-BUTTON}               id=${APP-ID}:id/fsiv_sync
${DEVICES-DEVICEDISCOVERED-LIST}        //android.widget.TextView[@resource-id="${APP-ID}:id/tv_camera_name"]
${DEVICES-DESTFOLDER-TITLE}             //android.widget.TextView[@text="Select folder"]
${DEVICES-DESTFOLDER-IMPORT-BUTTON}     //android.widget.TextView[@resource-id="${APP-ID}:id/tv_proceed_button"]
${DEVICES-DESTFOLDER-FOLDER-LIST}       //android.widget.TextView[@resource-id="${APP-ID}:id/tv_file_name"]
${DEVICES-DESTFOLDER-LOADING-WINDOW}    //android.widget.TextView[contains(@text,"Reading files from camera")]
${DEVICES-IMPORTSTARTED-TOAST}          //android.widget.TextView[@text="Import started"]
${DEVICES-IMPORTFINISHED-TOAST}         //android.widget.TextView[@text="Import finished"]

#***SELECT FILES FROM CAMERA WINDOW***
${DEVICES-CAMERADIR-WINDOW}             //androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/com.flir.tools:id/rv_camera_files_to_select"]
${DEVICES-CAMERADIR-NEXT-BUTTON}        id=${APP-ID}:id/iv_next

# *** METERLINK SUPPORT WINDOW***
${METERLINK-MESSAGE}                    //android.widget.TextView[@text="Currently we do not support Meterlink devices."]
${METERLINK-DONTDISPLAY-CHECKBOX}       id=${APP-ID}:id/do_not_show_dialog_again_checkbox
${METERLINK-OK-BUTTON}                  //android.widget.LinearLayout[@resource-id="${APP-ID}:id/ll_verify_buttons_container"]//android.widget.Button


#---------------------------------------------------------------------------------------------------------------
#-----------------------------------***    SETTINGS PAGE    ***-------------------------------------------------
#---------------------------------------------------------------------------------------------------------------

${SETTINGS-TITLE}                       //android.widget.FrameLayout[@content-desc="Settings"]


#---------------------------------------------------------------------------------------------------------------
#-----------------------------------***    STREAM PAGE    ***---------------------------------------------------
#---------------------------------------------------------------------------------------------------------------
${STREAM-SNAPSHOT-BUTTON}               id=${APP-ID}:id/rlRecordButtonPhoto
${STREAM-LOADING-WINDOW}                //android.widget.TextView[@text="Taking snapshot"]
${STREAM-IMPORTSUCCESS-TOAST}           //android.widget.TextView[contains(@text,"Image stored into Snapshots/")]
${STREAM-BACK-BUTTON}                   id=${APP-ID}:id/fsiv_sync
