@echo off
title Model Tools: By CrankySupertoon
echo.
echo #1 - Convert .egg's to .bam's
echo #2 - Convert .bam's to .egg's
echo.

:selection
choice /c 12 /n /m "Pick! [1,2]
if errorlevel 2 goto decompile

:compile
if exist *.bam (
choice /c YN /n /m "BAM Files already exist! Are you sure you want to overwrite them? [Y,N]
if errorlevel 2 goto kill
)
cls
echo Compiling .egg files, this may take a while.
for %%f in (*.egg) do ("egg2bam.exe" -o "%%~df%%~pf%%~nf.bam" "%%f")
echo All files extracted.
goto kill

:decompile
if exist *.egg (
choice /c YN /n /m "EGG Files already exist! Are you sure you want to overwrite them? [Y,N]
if errorlevel 2 goto kill
)
cls
echo Decompling .bam files, this may take a while.
for %%f in (*.bam) do ("bam2egg.exe" -o "%%~df%%~pf%%~nf.egg" "%%f")
echo All files extracted.
goto kill

:kill
PAUSE
EXIT