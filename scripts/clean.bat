@echo off

:: Delete solution and project files recursively
for /r %%f in (*.sln *.vcxproj *.vcxproj.filters *.vcxproj.user) do (
    echo Deleting %%f
    del /q "%%f"
)

:: Delete all .vs folders
for /d /r %%d in (.vs) do (
    echo Deleting folder %%d
    attrib -h -s "%%d" >nul 2>&1
    rmdir /s /q "%%d"
)

:: Go to root directory (terraria-clone\scripts -> terraria-clone)
cd ..

:: Delete bin & bin-int (intermediates) folders
if exist "bin" (
    echo Deleting root bin folder
    rmdir /s /q "bin"
)
if exist "bin-int" (
    echo Deleting root bin-int folder
    rmdir /s /q "bin-int"
)
