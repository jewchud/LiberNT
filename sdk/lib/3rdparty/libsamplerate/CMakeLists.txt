
list(APPEND SOURCE
    samplerate.c
    src_linear.c
    src_sinc.c
    src_zoh.c
    precomp.h)

add_library(libsamplerate ${SOURCE})
add_dependencies(libsamplerate psdk)
reactos_optimize_for_speed(libsamplerate)
add_pch(libsamplerate precomp.h SOURCE)
