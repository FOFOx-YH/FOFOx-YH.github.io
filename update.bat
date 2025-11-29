@echo off
chcp 65001 > nul
echo ===== 博客更新脚本 =====

:: 移除时间中的冒号
set "safe_time=%time::=-%"

echo 步骤1: 添加文件到Git...
git add .

echo 步骤2: 提交更改...
git commit -m "更新: %date% %safe_time%"

echo 步骤3: 推送到GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo 推送失败，尝试拉取远程更新...
    git pull origin main --no-edit
    git push origin main
)

echo 步骤4: 部署网站...
python -m mkdocs gh-deploy --force

echo ===== 更新成功完成! =====
echo 请访问: https://luckyiheng.com
pause