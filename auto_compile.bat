@echo off


set versions=6.6.7;6.6.9;6.7.0;6.7.1;6.7.2;6.7.7

for %%i in (%versions%) do (
    if exist dst\%%i\win32 (
        rem
    ) else (
        mkdir dst\%%i\win32
    )

    if exist dst\%%i\win64 (
        rem
    ) else (
        mkdir dst\%%i\win64
    )
)


for %%j in (Win32, x64) do (

    cmake -S . -B build -G "Visual Studio 17 2022" -A %%j
    cmake --build build --config Release --clean-first
    rmdir /s /q build

    for /d %%i in (6.*) do (
        if exist %%i\Release (
            echo %%i
            if "%%j" equ "Win32" (
                echo "win32"
                copy %%i\Release\thostmduserapi_se.dll dst\%%i\win32
            ) else (
                echo "x64"
                copy %%i\Release\thostmduserapi_se.dll dst\%%i\win64
            )

            rmdir /s /q %%i\Release
        )
    )
)

pause


