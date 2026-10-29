@echo off
setlocal EnableExtensions DisableDelayedExpansion
chcp 65001 >nul
pushd "%~dp0"
where /q python
if errorlevel 1 (
    echo Python 3.12 or later is required. Install Python and add it to PATH.
    popd
    pause
    exit /b 1
)
python -B -X utf8 tools\rebuild.py %*
set "rebuild_exit=%errorlevel%"
popd
if "%~1"=="" pause
exit /b %rebuild_exit%
