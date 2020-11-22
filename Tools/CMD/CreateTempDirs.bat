@echo off

REM Creates 3 folders: NavTemp, NavTempCountry, NavTempUTF.
REM Called from Nav 2009 before any Import/Export operations.
REM NavTemp is not in use at the moment

SET NavTemp=%1NavTemp
SET NavTempCountry=%1NavTempCountry
SET NavTempUTF=%1NavTempUTF

IF EXIST %NavTemp% (echo Removing NavTemp... && rmdir %NavTemp% /Q /S)
mkdir %NavTemp%
echo NavTemp created

IF EXIST %NavTempCountry% (echo Removing NavTempCountry... && rmdir %NavTempCountry% /Q /S)
mkdir %NavTempCountry%
echo NavTempCountry created

IF EXIST %NavTempUTF% (echo Removing NavTempUTF... && rmdir %NavTempUTF% /Q /S)
mkdir %NavTempUTF%
echo NavTempUTF created
