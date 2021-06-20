@REM Build for Visual Studio compiler. Run your copy of vcvars32.bat or vcvarsall.bat to setup command-line compiler.
@REM Important: to build on 32-bit systems, the DX12 backends needs '#define ImTextureID ImU64', so we pass it here.
@set OUT_DIR=Debug
@set OUT_EXE=ShadowEngine
@set INCLUDES=/Ilibs\imgui /Ilibs\imgui\backends /I "%WindowsSdkDir%Include\um" /I "%WindowsSdkDir%Include\shared"
@set SOURCES=main.cpp libs\imgui\backends\imgui_impl_dx12.cpp libs\imgui\backends\imgui_impl_win32.cpp libs\imgui\imgui*.cpp
@set LIBS=d3d12.lib d3dcompiler.lib dxgi.lib
mkdir Debug
cl /nologo /Zi /MD %INCLUDES% /D ImTextureID=ImU64 /D UNICODE /D _UNICODE %SOURCES% /Fe%OUT_DIR%/%OUT_EXE%.exe /Fo%OUT_DIR%/ /link %LIBS%
