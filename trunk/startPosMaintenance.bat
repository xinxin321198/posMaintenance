@call setpath.bat
taskkill /F /IM "java.exe"
cd posMaintenance
mvn tomcat:run
pause
