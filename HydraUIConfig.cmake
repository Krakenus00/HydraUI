#[[

╔═════════════════════════════════════════════╗
║    Copyright © 2022 Mykhailo Mushynskyi     ║
╟─────────────────────────────────────────────╢
║  This work is licensed under a MIT License  ║
╚═════════════════════════════════════════════╝

]]

# Source path
set(HydraUI_SrcDir ${CMAKE_CURRENT_LIST_DIR}/Source)

# Including dependencies
if(Standalone)
    set(SDK_Type STATIC)
    include(${CMAKE_CURRENT_LIST_DIR}/Modules/MythSDK/MythSDKConfig.cmake)
endif()

# IO files
set(HydraIO_SrcDir ${HydraUI_SrcDir}/IO)
set(HydraIO_Files
    ${HydraIO_SrcDir}/Keyboard.cpp
    ${HydraIO_SrcDir}/Keyboard.h
    ${HydraIO_SrcDir}/Mouse.cpp
    ${HydraIO_SrcDir}/Mouse.h
)

# GUI files
set(HydraGUI_SrcDir ${HydraUI_SrcDir}/GUI)
set(HydraGUI_Files
    ${HydraGUI_SrcDir}/Window.cpp
    ${HydraGUI_SrcDir}/Window.h
)

# Include files
set(Hydra_IncDir ${HydraUI_SrcDir}/Include)
set(Hydra_Includes
    ${Hydra_IncDir}/IKeyboard.h
    ${Hydra_IncDir}/IMouse.h
    ${Hydra_IncDir}/IWindow.h
)

# Create HydraIO target
add_library(HydraIO SHARED
    ${HydraIO_Files}
    ${Hydra_Includes}
)
set_target_properties(HydraIO PROPERTIES
    FOLDER HydraUI
)
include_sdk(HydraIO)

# Create HydraGUI target
add_library(HydraGUI SHARED
    ${HydraGUI_Files}
    ${Hydra_Includes}
)
set_target_properties(HydraGUI PROPERTIES
    FOLDER HydraUI
)
include_sdk(HydraGUI)

# Helper function to link HydraIO
function(include_hydraIO Target)
    target_link_libraries(${Target} HydraIO)
    target_include_directories(${Target} PRIVATE
        ${HydraIO_SrcDir}
        ${Hydra_IncDir}
    )
endfunction()

# Helper function to link HydraGUI
function(include_hydraGUI Target)
    target_link_libraries(${Target} HydraGUI)
    target_include_directories(${Target} PRIVATE
        ${HydraGUI_SrcDir}
        ${Hydra_IncDir}
    )
endfunction()
