@echo off
chcp 65001 > nul
echo ===== 强制清理部署 =====

echo 1. 删除构建缓存...
rmdir /s /q site 2>nul

echo 2. 清理 Git 缓存...
git rm -r --cached . 2>nul
git add .

echo 3. 强制提交...
git commit -m "强制清理缓存" || echo 无更改可提交

echo 4. 强制推送...
git push -f origin main

echo 5. 清理并重新部署...
python -m mkdocs build --clean
python -m mkdocs gh-deploy --force --clean

echo ===== 清理完成! =====
echo 现在应该完全清除了背景
pause