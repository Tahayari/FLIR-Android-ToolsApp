*** Variables ***
# *** APP VARIABLES ***
${PROD-APP-ID}                          com.flir.tools
${DEBUG-APP-ID}                         com.flir.tools.debug
${APP-ID}                               ${DEBUG-APP-ID}                     #SET which app to test. PROD or DEBUG build
${APP-ACTIVITY}                         com.flir.cloudlib.ui.FlirCloudActivity

#***ANDROID CAPABILITIES***
${ANDROID-SERVER-PORT}                  4724

#*** NAVIGATION BAR***
${NAVIGATION-LIBRARY-BUTTON}            id=${APP-ID}:id/btnFlirLibrary
${NAVIGATION-DEVICES-BUTTON}            id=${APP-ID}:id/btnFlirDevices
${NAVIGATION-SETTINGS-BUTTON}           id=${APP-ID}:id/btnFlirSettings