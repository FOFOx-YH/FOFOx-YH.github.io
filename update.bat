@echo off
chcp 65001 > nul
echo 开始更新博客...
git add .
git commit -m "Auto update %date% %time%"
git push origin main
python -m mkdocs gh-deploy --force
echo 更新完成！
pause