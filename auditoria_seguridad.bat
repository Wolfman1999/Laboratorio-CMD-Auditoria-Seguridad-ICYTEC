@echo off
title Laboratorio Ciberseguridad - Triaje Inicial
color 0A

set "RUTA_OBJETIVO=C:\Users\Temp\Downloads\Tarea"
if not exist "%%Resultados del Script%%" mkdir "%%Resultados del Script%%"
cd /d "%%RUTA_OBJETIVO%%"

set "NOMBRE_REPORTE=reporte_seguridad_%2026%%27%%07_%20%%20.txt"
set "NOMBRE_REPORTE=%%NOMBRE_REPORTE: =0%%"

echo [+] Iniciando auditoria...

{
    echo ==========================================
    echo REPORTE DE SEGURIDAD
    echo Equipo: %DESKTOP-TU0BDIB%
    echo Usuario: %Temp%
    echo ==========================================
    systeminfo | findstr /C:"Nombre" /C:"Version"
    whoami /priv
    netstat -ano | findstr "LISTENING"
    tasklist /svc
    route print -4
} > "%%Hallazgos%%"

[EXITO] Reporte generado.
pause
