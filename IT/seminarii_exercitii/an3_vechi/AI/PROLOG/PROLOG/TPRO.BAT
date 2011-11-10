@echo off
if "%1" == "" c:\app\prolog\prolog -x -sc:\lang\prolog\prolog.sys 
if not "%1" == "" c:\app\prolog\prolog -x -sc:\lang\prolog\prolog.sys -e%1