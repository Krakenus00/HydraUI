#[[

╔═════════════════════════════════════════════╗
║    Copyright © 2022 Mykhailo Mushynskyi     ║
╟─────────────────────────────────────────────╢
║  This work is licensed under a MIT License  ║
╚═════════════════════════════════════════════╝

]]

set(HydraUI_SrcDir ${CMAKE_CURRENT_LIST_DIR}/Source)

# Including dependencies
if(Standalone)
    set(SDK_Type STATIC)
    include(${CMAKE_CURRENT_LIST_DIR}/Modules/MythSDK/MythSDKConfig.cmake)
endif()

set(HydraIO_SrcDir ${HydraUI_SrcDir}/IO)
set(HydraIO_Files
    ${HydraIO_SrcDir}/Keyboard.cpp
    ${HydraIO_SrcDir}/Keyboard.h
    ${HydraIO_SrcDir}/Mouse.cpp
    ${HydraIO_SrcDir}/Mouse.h
)

set(HydraGUI_SrcDir ${HydraUI_SrcDir}/GUI)
set(HydraGUI_Files
    ${HydraGUI_SrcDir}/Window.cpp
    ${HydraGUI_SrcDir}/Window.h
)

add_library(HydraIO SHARED ${HydraIO_Files})
set_target_properties(HydraIO PROPERTIES
    FOLDER HydraUI
)
include_sdk(HydraIO)

add_library(HydraGUI SHARED ${HydraIO_Files})
set_target_properties(HydraGUI PROPERTIES
    FOLDER HydraUI
)
include_sdk(HydraGUI)


function(include_hydraIO Target)
    target_link_libraries(${Target} HydraIO)
    target_include_directories(${Target} PRIVATE ${HydraIO_SrcDir})
endfunction()

function(include_hydraGUI Target)
    target_link_libraries(${Target} HydraGUI)
    target_include_directories(${Target} PRIVATE ${HydraGUI_SrcDir})
endfunction()
