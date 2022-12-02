-- OUT_DIR and INT_DIR must be defined in the top-most premake file before including this file

project "spdlog"
    language "C++"

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
        "SPDLOG_COMPILED_LIB"
    }

    filter "system:windows"
		kind "SharedLib"
        systemversion "latest"
        cppdialect "C++11"
		defines
		{
			"SPDLOG_SHARED_LIB",
			"spdlog_EXPORTS"
		}

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
