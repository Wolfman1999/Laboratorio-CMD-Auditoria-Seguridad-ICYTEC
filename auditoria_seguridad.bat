@echo off
title Auditoria de Seguridad - Soporte TI
color 0A

:: 1. CONFIGURACIÓN DE RUTA
set "RUTA_OBJETIVO=%USERPROFILE%\Downloads"
if not exist "%RUTA_OBJETIVO%" mkdir "%RUTA_OBJETIVO%"
cd /d "%RUTA_OBJETIVO%"

:: 2. NOMBRE DEL ARCHIVO (Simplificado al máximo)
set "NOMBRE_REPORTE=reporte_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%.txt"
set "NOMBRE_REPORTE=%NOMBRE_REPORTE: =0%"
set "NOMBRE_REPORTE=%NOMBRE_REPORTE::=-%"

echo [+] Iniciando auditoría...
echo [+] Guardando en: %NOMBRE_REPORTE%

:: 3. EJECUCIÓN SEGURA
:: Ejecutamos comando por comando agregando al archivo (>>) en lugar de bloque único
echo ========================================== > "%NOMBRE_REPORTE%"
echo REPORTE DE SEGURIDAD - WINDOWS CMD >> "%NOMBRE_REPORTE%"
echo Fecha: %date% %time% >> "%NOMBRE_REPORTE%"
echo Equipo: %COMPUTERNAME% >> "%NOMBRE_REPORTE%"
echo Usuario: %USERNAME% >> "%NOMBRE_REPORTE%"
echo ========================================== >> "%NOMBRE_REPORTE%"
echo. >> "%NOMBRE_REPORTE%"

echo --- [1] SISTEMA --- >> "%NOMBRE_REPORTE%"
systeminfo | findstr /C:"Nombre" /C:"Version" /C:"BIOS" >> "%NOMBRE_REPORTE%" 2>&1
echo. >> "%NOMBRE_REPORTE%"

echo --- [2] PRIVILEGIOS --- >> "%NOMBRE_REPORTE%"
whoami /priv >> "%NOMBRE_REPORTE%" 2>&1
echo. >> "%NOMBRE_REPORTE%"

echo --- [3] RED (PUERTOS) --- >> "%NOMBRE_REPORTE%"
netstat -ano | findstr "LISTENING" >> "%NOMBRE_REPORTE%" 2>&1
echo. >> "%NOMBRE_REPORTE%"

echo --- [4] PROCESOS --- >> "%NOMBRE_REPORTE%"
tasklist /svc >> "%NOMBRE_REPORTE%" 2>&1
echo. >> "%NOMBRE_REPORTE%"

echo --- [5] RUTAS --- >> "%NOMBRE_REPORTE%"
route print -4 >> "%NOMBRE_REPORTE%" 2>&1
echo. >> "%NOMBRE_REPORTE%"

echo ========================================== >> "%NOMBRE_REPORTE%"
echo FIN DEL REPORTE >> "%NOMBRE_REPORTE%"
echo =====================================   