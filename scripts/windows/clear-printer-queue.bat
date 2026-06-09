@echo off
chcp 65001 >nul
echo ========================================
echo Windows 打印队列缓存清理工具
echo ========================================
echo.
echo 注意：本操作会删除当前电脑上所有未完成的打印任务。
echo 请确认需要清空打印队列后再继续。
echo.
pause

echo.
echo 正在停止 Print Spooler 服务...
net stop spooler

echo.
echo 正在清空 Windows 打印缓存...
del /Q /F %systemroot%\System32\spool\PRINTERS\*.*

echo.
echo 正在启动 Print Spooler 服务...
net start spooler

echo.
echo ========================================
echo 打印队列缓存清理完成。
echo 请重新打开打印队列并打印测试页。
echo ========================================
echo.
pause
