workspace "terraria-clone"
    architecture "x64"
    configurations {
        "dbg",
        "rel"
    }
    startproject "app"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

include "engine"
include "app"

newaction {
    trigger = "clean",
    description = "Remove all binaries and intermediate binaries/project files.",
    execute = function()
        print("Removing binaries..")
        os.rmdir("./bin")
        print("Removing intermediate binaries...")
        os.rmdir("./bin-int")
        print("Removing project files...")
        os.rmdir("./.vs")
        os.rmdir("./**.sln")
        os.rmdir("./**.vcxproj")
        os.rmdir("./**.vcxproj.filters")
        os.rmdir("./**.vcxproj.user")
        print("Done")
    end
}

newaction {
    trigger = "clean-int",
    description = "Remove all intermediate binaries/.",
    execute = function()
        print("Removing intermediate binaries...")
        os.rmdir("./bin-int")
        print("Done")
    end
}
