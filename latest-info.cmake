function(_pmm_changes version)
    if(PMM_VERSION VERSION_LESS version)
        message(STATUS "[pmm]  - Changes in ${version}:")
        foreach(change IN LISTS ARGN)
            message(STATUS "[pmm]     - ${change}")
        endforeach()
    endif()
endfunction()

set(PMM_LATEST_VERSION 0.3.0)

if(PMM_VERSION VERSION_LESS PMM_LATEST_VERSION AND NOT PMM_IGNORE_NEW_VERSION)
    message(STATUS "[pmm] You are using PMM version ${PMM_VERSION}. The latest is ${PMM_LATEST_VERSION}.")
    message(STATUS "[pmm] Changes since ${PMM_VERSION} include the following:")
    _pmm_changes(0.2.0
        "Automatic update checks"
        "CONAN uses the `cmake` generator and automatically defines imported targets"
        "SETTINGS for Conan"
        "OPTIONS for Conan"
        "BUILD for setting the Conan install '--build' option"
        )
    _pmm_changes(0.3.0
        "MSVC Support and Fixes"
        )
    message(STATUS "[pmm] To update, simply change the value of PMM_VERSION_INIT in pmm.cmake")
    message(STATUS "[pmm] You can disable these messages by setting PMM_IGNORE_NEW_VERSION to TRUE before including pmm.cmake")
endif()