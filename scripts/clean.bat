@echo off
echo ==============================================
echo   Cleaning Visual Studio files...
echo ==============================================

:: Delete solution and project files
del /s /q "*.sln"
del /s /q "*.vcxproj"
del /s /q "*.vcxproj.filters"
del /s /q "*.vcxproj.user"

:: Delete .vs (hidden) folder
for /d /r %%d in (.vs) do (
    if exist "%%d" (
        echo Deleting folder %%d
        rmdir /s /q "%%d"
    )
)

:: Got to root directory (terraria-clone\scripts -> terraria-clone)
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

echo ==============================================
echo   Done!
echo ==============================================
pause