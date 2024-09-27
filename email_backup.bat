@echo off

set backupTempDir=<Dir>
::set temp backup dir path (with a \ at the end) without "" because it breaks the tar utility, does not support spaces for the same reason

set backupFileOutputDir=<Dir>
::set backup .tar.gz file output dir path (with a \ at the end) without "" because it breaks the tar utility, does not support spaces for the same reason

set mailStorageDir=<Dir>
::set email dir path (with a \ at the end) without "" because it breaks the tar utility, does not support spaces for the same reason

if not exist "%backupTempDir%" mkdir "%backupTempDir%"

xcopy "%mailStorageDir%*.*" "%backupTempDir%" /E /H /Y

cd "%backupTempDir%"

del "%backupFileOutputDir%Email_Backup.tar.gz.old"

ren "%backupFileOutputDir%Email_Backup.tar.gz" "Email_Backup.tar.gz.old"

del /f /q "%backupFileOutputDir%Email_Backup.tar.gz"

tar -cf "%backupFileOutputDir%Email_Backup.tar.gz" ".\*.*"

timeout /t 600 

rmdir /s /q "%backupTempDir%"
