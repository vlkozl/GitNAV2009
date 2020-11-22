@echo off

REM Create folders structure for NAV 2009 repository for all object types
REM USAGE:
REM Required parameter: local repository path, like C:\Repos\Cronus

mkdir %1\App
mkdir %1\App\Table
mkdir %1\App\Form
mkdir %1\App\Report
mkdir %1\App\Dataport
mkdir %1\App\Codeunit
mkdir %1\App\XMLport
mkdir %1\App\Page
mkdir %1\App\Menu
mkdir %1\Tools
mkdir %1\Tools\CMD
mkdir %1\Tools\ProjectData

echo Subfolders created for %1
