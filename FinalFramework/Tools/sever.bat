@echo off

set clientUrl="https://n6bdo6uf3kz4zy4/svn/FirClient"
set serverPath="E:\workspace\ProjectOne\FirServer"
set serverUrl="https://n6bdo6uf3kz4zy4/svn/FirServer"
set editorUrl="https://n6bdo6uf3kz4zy4/svn/ClientEditor"
set toolPath="E:\workspace\ProjectOne\Tools\Bin"


set user="admin"
set passwd="admin888"

::���´��빤��
cd %serverPath%
if exist %serverPath% (
	svn up %serverPath% --username %user% --password %passwd% --force
) else (
	svn checkout %serverUrl%FirServer %serverPath% --username %user% --password %passwd% --force
)

::���·�������������Ĺ��ô���
rd/s /q %serverPath%\FirServer\Scripts\Common\
mkdir %serverPath%\FirServer\Scripts\Common\

svn export %clientUrl%/Assets/Scripts/Define/Protocal.cs %serverPath%/FirServer/Scripts/Common/Protocal.cs --username %user% --password %passwd% --force
svn export %clientUrl%/Assets/Scripts/Define/AppExtend.cs %serverPath%/FirServer/Scripts/Common/AppExtend.cs --username %user% --password %passwd% --force

rd/s /q %serverPath%\FirServer\Config\Mapdata\
mkdir %serverPath%\FirServer\Config\Mapdata\
svn export %editorUrl%/Assets/res/Maps/Data/ %serverPath%/FirServer/Config/Mapdata --username %user% --password %passwd% --force


echo "�������!"
pause  