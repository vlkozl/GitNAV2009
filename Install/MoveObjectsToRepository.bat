@echo off

REM USAGE:
REM First parameter: source folder
REM Second parameter: target folder

SET FromPath=%1
SET ToPath=%2

forfiles /p %FromPath% /m COD*.txt /c "cmd /c move @path %ToPath%\App\Codeunit\@file"
forfiles /p %FromPath% /m TAB*.txt /c "cmd /c move @path %ToPath%\App\Table\@file"
forfiles /p %FromPath% /m FOR*.txt /c "cmd /c move @path %ToPath%\App\Form\@file"
forfiles /p %FromPath% /m REP*.txt /c "cmd /c move @path %ToPath%\App\Report\@file"
forfiles /p %FromPath% /m XML*.txt /c "cmd /c move @path %ToPath%\App\XMLport\@file"
forfiles /p %FromPath% /m DAT*.txt /c "cmd /c move @path %ToPath%\App\Dataport\@file"
forfiles /p %FromPath% /m MEN*.txt /c "cmd /c move @path %ToPath%\App\Menu\@file"