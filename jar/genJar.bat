@echo off

del "%~dp0\custom_spider.jar"
rd /s/q "%~dp0\Smali_classes"

java -jar "%~dp0\3rd\baksmali-2.5.2.jar" d "%~dp0\..\app\build\intermediates\dex\release\minifyReleaseWithR8\classes.dex" -o "%~dp0\Smali_classes"

rd /s/q "%~dp0\spider.jar\smali\com\github\catvod\spider"

if not exist "%~dp0\spider.jar\smali\com\github\catvod\" md "%~dp0\spider.jar\smali\com\github\catvod\"

move "%~dp0\Smali_classes\com\github\catvod\spider" "%~dp0\spider.jar\smali\com\github\catvod\"

rd /s/q "%~dp0\Smali_classes"

java -jar "%~dp0\3rd\apktool_2.4.1.jar" b "%~dp0\spider.jar" -c

move "%~dp0\spider.jar\dist\dex.jar" "%~dp0\custom_spider.jar"

rd /s/q "%~dp0\spider.jar\smali\com\github\catvod\spider"

rd /s/q "%~dp0\spider.jar\build"
rd /s/q "%~dp0\spider.jar\dist"