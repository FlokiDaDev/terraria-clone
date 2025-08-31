project "engine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    staticruntime "on"

    targetdir("../bin/" .. outputdir .. "/%{prj.name}")
    objdir("../bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/Engine/**.h",
        "src/Engine/**.hpp",
        "src/Engine/**.cpp"
    }
    excludes { "premake5.lua" }

    local vcpkg_root     = os.getenv("VCPKG_ROOT") or "C:/dev/vcpkg"
    local triplet        = "x64-windows-static"
    local vcpkg_inc      = vcpkg_root .. "/installed/" .. triplet .. "/include"
    local vcpkg_lib      = vcpkg_root .. "/installed/" .. triplet .. "/lib"
    local vcpkg_dbg_lib  = vcpkg_root .. "/installed/" .. triplet .. "/debug/lib"

    includedirs {
        "src/Engine",
        vcpkg_inc
    }

    pchheader "PCH.h"
    pchsource "src/Engine/PCH.cpp"

    flags = { "MultiProcessorCompile" }
    buildoptions "/utf-8"

    filter { "configurations:dbg" }
    buildoptions {
        "/MTd",
        "/MP"
    }
    runtime "Debug"
    symbols "on"
    defines {
        "DEBUG"
    }
    libdirs {
        vcpkg_dbg_lib
    }
    links {
            "opengl32",
            "glad",
            "glfw3",
            "fmtd",
            "spdlogd",
            "glm"
    }

    filter { "configurations:rel" }
    buildoptions {
        "/MT",
        "/MP"
    }
    runtime "Release"
    optimize "on"
    defines {
        "NDEBUG"
    }
    libdirs {
        vcpkg_lib
    }
    links {
            "opengl32",
            "glad",
            "glfw3",
            "fmt",
            "spdlog",
            "glm"
    }