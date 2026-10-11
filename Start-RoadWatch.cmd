@echo off
setlocal
cd /d "%~dp0"
title RoadWatch - Keep this window open
set "RW_NODE=%~dp0runtime\node.exe"
if exist "%RW_NODE%" goto run
where node >nul 2>nul
if not errorlevel 1 (
  set "RW_NODE=node"
  goto run
)
echo The portable runtime is missing. Extract the COMPLETE RoadWatch ZIP,
echo including the runtime folder, then run this launcher again.
pause
exit /b 1
:run
echo Starting RoadWatch. Open http://127.0.0.1:4173/ in your browser.
echo Keep this window open while using RoadWatch. Close it to stop.
"%RW_NODE%" "%~dp0serve.mjs"
pause
