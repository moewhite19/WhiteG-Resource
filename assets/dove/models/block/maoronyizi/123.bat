@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set /p userDir=请输入用户目录名称: 
set /p itemType=请输入物品类型: 
set /p startNum=请输入序号起始数字: 

set "outputFile=1.txt"
del "%outputFile%" 2>nul

for %%F in (*.json) do (
    echo File: %%F
    set "fileName=%%~nF"
    echo { >> "%outputFile%"
    echo     "predicate": { >> "%outputFile%"
    echo         "custom_model_data": !startNum! >> "%outputFile%"
    echo     }, >> "%outputFile%"
    echo     "model": "!userDir!:!itemType!/!fileName!" >> "%outputFile%"
    echo }, >> "%outputFile%"

    set /a startNum+=1
)

echo 生成的内容已保存至 %outputFile%
