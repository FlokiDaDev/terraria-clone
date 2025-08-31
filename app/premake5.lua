project "app"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++23"
    staticruntime "on"
    links { "engine" }

    targetdir("../bin/" .. outputdir .. "/%{prj.name}")
    objdir("../bin-int/" .. outputdir .. "/%{prj.name}")

    flags = { "MultiProcessorCompile" }
    buildoptions "/utf-8"

    files {
        "src/**.h",
        "src/**.hpp",
        "src/**.cpp"
    }
    excludes { "premake5.lua" }

    local vcpkg_root     = os.getenv("VCPKG_ROOT") or "C:/dev/vcpkg"
    local triplet        = "x64-windows-static"
    local vcpkg_inc      = vcpkg_root .. "/installed/" .. triplet .. "/include"
    local vcpkg_lib      = vcpkg_root .. "/installed/" .. triplet .. "/lib"
    local vcpkg_dbg_lib  = vcpkg_root .. "/installed/" .. triplet .. "/debug/lib"

    includedirs {
        "src",
        "../engine/src",
        vcpkg_inc
    }

    defines {
        "APPLICATION"
    }

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
            "spdlogd"
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
            "spdlog"
        }
