@echo off
echo 开始更新博客...
git add .
git commit -m "自动更新 %date% %time%"
git push origin main
python -m mkdocs gh-deploy --force
echo 更新完成！
pause