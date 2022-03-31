*** Settings ***
Documentation    This page contains the locators of Elements used throughout the Android app from all of the pages
Resource         Config.robot
Library          AppiumLibrary


*** Variables ***
#---------------------------------------------------------------------------------------------------------------
#-----------------------------------***    LIBRARY PAGE    ***--------------------------------------------------
#---------------------------------------------------------------------------------------------------------------

${LIBRARY-MYFILES-TITLE}                //android.widget.FrameLayout[@content-desc="Library"]
${LIBRARY-ADDFOLDER-BUTTON}             id=${APP-ID}:id/iv_toolbar_add       #same id as the More options button when files are selected
${LIBRARY-SAVE-BUTTON}                  //android.widget.TextView[@text="Save"]
${LIBRARY-NEWFOLDER-TITLE}              //android.widget.TextView[@text="New folder"]
${LIBRARY-RENAME-TITLE}                 //android.widget.TextView[@text="Rename"]
${LIBRARY-FILEFOLDERNAME-FIELD}         id=${APP-ID}:id/et_file_folder_name
${LIBRARY-CREATEFOLDER-BUTTON}          id=${APP-ID}:id/tv_proceed_button    #same id as Move/Copy/Import button in the Move/Copy/Import select destination folder
${LIBRARY-FILESANDFOLDERS-LIST}         id=${APP-ID}:id/rv_items
${LIBRARY-SHAREDIMPORT-FOLDER}          //android.widget.TextView[@text="shared import"]

${LIBRARY-INFOTOOLBAR-SELECTEDFILES}    id=${APP-ID}:id/tv_selected_count
${LIBRARY-INFOTOOLBAR-DELETE-BUTTON}    id=${APP-ID}:id/iv_delete_select
${LIBRARY-INFOTOOLBAR-CLOSE-BUTTON}     id=${APP-ID}:id/iv_close_select


#***FILE/FOLDER OPTIONS CONTEXT MENU***
${LIBRARY-OPTIONS-DETAILS}              id=${APP-ID}:id/action_details
${LIBRARY-OPTIONS-SEND}                 id=${APP-ID}:id/action_send
${LIBRARY-OPTIONS-COPY}                 id=${APP-ID}:id/action_copy
${LIBRARY-OPTIONS-MOVE}                 id=${APP-ID}:id/action_move
${LIBRARY-OPTIONS-RENAME}               id=${APP-ID}:id/action_rename
${LIBRARY-OPTIONS-DELETE}               id=${APP-ID}:id/action_delete
${LIBRARY-OPTIONS-CLOSE}                id=${APP-ID}:id/action_close        #generic close button. This id is also in the SortBy menu. Inform DEVs to make a unique one
${LIBRARY-OPTIONS-SELECT-ALL}           //android.widget.TextView[@text="Select all"]

# ***DIALOG WINDOWS***
${DELETE-DIALOG-TITLE}                  //android.widget.TextView[@text="Delete"]
${DELETE-DIALOG-DELETE-BUTTON}          //android.widget.Button[@text="Delete"]

# ***SORTING TOOLBAR***
${LIBRARY-SORT-TOOLBAR}                 id=${APP-ID}:id/tv_toolbar_sort
${LIBRARY-SORTBY-NAME}                  //android.widget.TextView[@text="Name"]
${LIBRARY-SORTBY-MODIFIED}              //android.widget.TextView[@text="Modified Date"]
${LIBRARY-SORTBY-SIZE}                  //android.widget.TextView[@text="Size"]
${LIBRARY-SORTBY-ASC}                   //android.widget.TextView[@text="Ascending"]
${LIBRARY-SORTBY-DESC}                  //android.widget.TextView[@text="Descending"]
${LIBRARY-SORTBY-NAME-TICK}             id=${APP-ID}:id/iv_sort_name_checkmark
${LIBRARY-SORTBY-MODIFIED-TICK}         id=${APP-ID}:id/iv_sort_modified_date_checkmark

#***TOAST MESSAGES***
${LIBRARY-RENAME-SUCCESS-TOAST}         //android.widget.TextView[@text="Folder renamed"]
${LIBRARY-DELETE-SUCCESS-TOAST}         //*[contains(@text,"successfully deleted")]
${LIBRARY-MOVE-SUCCESS-TOAST}           //android.widget.TextView[contains(@text,"successfully moved.")]
${LIBRARY-COPY-SUCCESS-TOAST}           //android.widget.TextView[contains(@text,"Entity successfully copied.")]
${LIBRARY-CREATEFOLDER-FAIL-TOAST}      //android.widget.TextView[contains(@text,"already exist")] 

#*** ONBOARDING PAGE***
${ONBOARDING-NEXT-BUTTON}               id=${APP-ID}:id/tvNext

# ***COPY/MOVE/IMPORT SELECT DESTINATION FOLDER WINDOW*** 
${LIBRARY-SELECT-DESTFOLDER-TITLE}             //android.widget.TextView[@text="Select folder"]      #for both MOVE and COPY
${LIBRARY-SELECT-DESTFOLDER-MOVE-BUTTON}       //android.widget.TextView[@resource-id="${APP-ID}:id/tv_proceed_button"][@text="Move"]
${LIBRARY-SELECT-DESTFOLDER-COPY-BUTTON}       //android.widget.TextView[@resource-id="${APP-ID}:id/tv_proceed_button"][@text="Copy"]

#---------------------------------------------------------------------------------------------------------------
#-----------------------------------***    IMAGE DETAILS PAGE    ***--------------------------------------------
#---------------------------------------------------------------------------------------------------------------

${IMGDETAILS-DETAILS-BUTTON}            id=${APP-ID}:id/btnFlirDetails
${IMGDETAILS-NOTES-BUTTON}              id=${APP-ID}:id/btnFlirNotes
${IMGDETAILS-MEASUREMENTS-BUTTON}       id=${APP-ID}:id/btnFlirMeasurements
${IMGDETAILS-LOCATION-BUTTON}           id=${APP-ID}:id/btnFlirLocation

# ***NOTES PAGE***
${IMGDETAILS-NOTES-PAGE-TITLE}          //android.widget.TextView[@text="Notes"]
${IMGDETAILS-NOTES-PAGE-CLOSE-BUTTON}   id=${APP-ID}:id/iv_close_button
${IMGDETAILS-NOTES-PAGE-EDIT-BUTTON}    //android.widget.TextView[@resource-id="${APP-ID}:id/tv_proceed_button"][@text="Edit"]
${IMGDETAILS-NOTES-PAGE-TEXTAREA}       id=${APP-ID}:id/et_notes
${IMGDETAILS-NOTES-PAGE-SAVE-BUTTON}    //android.widget.TextView[@resource-id="${APP-ID}:id/tv_proceed_button"][@text="Save"]

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
${DEVICES-CAMERADIR-WINDOW}             //androidx.recyclerview.widget.RecyclerView[@resource-id="${APP-ID}:id/${APP-ID}:id/rv_camera_files_to_select"]
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
