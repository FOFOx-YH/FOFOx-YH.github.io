@echo off
chcp 65001 > nul
echo ===== 博客更新脚本 =====

:: 1. 添加文件
echo 步骤1: 添加文件到Git...
git add . 2>nul
if %errorlevel% neq 0 (
    echo 错误: git add 失败
    goto :error
)

:: 2. 提交更改
echo 步骤2: 提交更改...
git commit -m "更新: %date% %time%" 2>nul
if %errorlevel% neq 0 (
    echo 提示: 没有更改需要提交 或 提交失败
)

:: 3. 推送更改
echo 步骤3: 推送到GitHub...
git push origin main 2>nul
if %errorlevel% neq 0 (
    echo 推送失败，尝试拉取远程更新...
    git pull origin main --no-edit 2>nul
    git push origin main 2>nul
)

:: 4. 部署网站
echo 步骤4: 部署网站...
python -m mkdocs gh-deploy --force 2>nul
if %errorlevel% neq 0 (
    echo 错误: 部署失败
    goto :error
)

echo ===== 更新成功完成! =====
echo 请访问: https://luckyiheng.com
pause
exit /b 0

:error
echo ===== 更新过程中出现错误 =====
pause
exit /b 1