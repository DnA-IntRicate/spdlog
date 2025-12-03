--[[
    This file is tailored for including in the Intricate Engine build system

    Note: The following string variables must be defined before including this file in the inclusion hierarchy:
        OUT_DIR: The output target directory
        INT_DIR: The intermediate target directory
        SPDLOG_FMT_INCLUDE_DIR: The external include directory to use for the fmtlib/fmt repository.
                                If this wasn't defined prior to inclusion, it will default to the bundled version.
]]

project "spdlog"
    language "C++"
    kind "StaticLib"
    warnings "Off"

    debugdir (OUT_DIR)
    targetdir (OUT_DIR)
    objdir (INT_DIR)

    files
    {
        "include/**.h",
        "src/**.cpp"
    }

    includedirs
    {
        "include"
    }

    defines
    {
        "SPDLOG_COMPILED_LIB",
        "SPDLOG_WCHAR_TO_UTF8_SUPPORT"
    }

    buildoptions
    {
        "/utf-8"
    }

    if SPDLOG_FMT_INCLUDE_DIR then
        includedirs { "%{SPDLOG_FMT_INCLUDE_DIR}" }
        defines { "SPDLOG_FMT_EXTERNAL" }
    end

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++11"

    filter "system:linux"
        kind "StaticLib"
        systemversion "latest"
        cppdialect "gnu++11"

    filter "system:macosx"
        kind "StaticLib"
        systemversion "latest"
        cppdialect "gnu++11"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "Full"

    filter "configurations:Release"
        runtime "Release"
        symbols "Off"
        optimize "Full"
