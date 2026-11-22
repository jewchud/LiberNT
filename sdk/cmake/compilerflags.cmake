
# remove_target_compile_options
#  Remove one option from the target COMPILE_OPTIONS property,
#  previously added through add_compile_options
function(remove_target_compile_option _module _option)
    get_target_property(_options ${_module} COMPILE_OPTIONS)
    list(REMOVE_ITEM _options ${_option})
    set_target_properties(${_module} PROPERTIES COMPILE_OPTIONS "${_options}")
endfunction()

# Raise compute-heavy targets past the Release -O2 default. MSVC Release
# already uses /Ox. Target options follow directory -O2, so -O3 wins.
function(reactos_optimize_for_speed)
    if(NOT CMAKE_BUILD_TYPE STREQUAL "Release" OR MSVC)
        return()
    endif()
    foreach(_module ${ARGN})
        target_compile_options(${_module} PRIVATE -O3)
    endforeach()
endfunction()
