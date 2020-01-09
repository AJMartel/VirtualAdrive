@echo off
@break off
@title Create a Virtual "A" drive
@color 0a
@cls

setlocal EnableDelayedExpansion

if not exist "C:\Users\%USERNAME%\Desktop\ADrive\" (
  mkdir "C:\Users\%USERNAME%\Desktop\ADrive\"
  if "!errorlevel!" EQU "0" (
    echo Folder created successfully.  
    timeout 1 > nul
    echo [.ShellClassInfo] > C:\Users\%USERNAME%\Desktop\ADrive\desktop.in
    echo IconResource=C:\WINDOWS\system32\SHELL32.dll,258 >> C:\Users\%USERNAME%\Desktop\ADrive\desktop.in
    echo [ViewState] >> C:\Users\%USERNAME%\Desktop\ADrive\desktop.in
    echo Mode= >> C:\Users\%USERNAME%\Desktop\ADrive\desktop.in
    echo Vid= >> C:\Users\%USERNAME%\Desktop\ADrive\desktop.in
    echo FolderType=Documents >> C:\Users\%USERNAME%\Desktop\ADrive\desktop.in
    move C:\Users\%USERNAME%\Desktop\ADrive\desktop.in C:\Users\%USERNAME%\Desktop\ADrive\desktop.ini
    attrib +s +h C:\Users\%USERNAME%\Desktop\ADrive\desktop.ini
    attrib +r "C:\Users\%USERNAME%\Desktop\ADrive"
    timeout 1 > nul   
  )
)

if exist "C:\Users\%USERNAME%\Desktop\ADrive\" (
  echo C:\Users\%USERNAME%\Desktop\ADrive AVAILABLE
  if not exist "A:\" (
    subst A: C:\Users\%USERNAME%\Desktop\ADrive
    if "!errorlevel!" EQU "0" (
      echo Virtual "A" drive created successfully.
    )
  ) else (
    echo Virtual "A" drive already exists.
  )
) else (
    echo C:\Users\%USERNAME%\Desktop\ADrive UNAVAILABLE
  )

timeout 5 > nul
exit
