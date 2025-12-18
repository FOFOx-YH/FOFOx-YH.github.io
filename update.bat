@echo off
REM -------------------------------
REM 自动更新博客 + 部署 MkDocs
REM -------------------------------

REM 获取当前时间作为 commit 信息
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set YYYY=%%c
    set MM=%%a
    set DD=%%b
)
for /f "tokens=1-2 delims=:." %%a in ("%time%") do (
    set HH=%%a
    set MIN=%%b
)
set DATETIME=%YYYY%-%MM%-%DD% %HH%:%MIN%

echo ----------------------------------------
echo Git add all changes...
git add .

echo ----------------------------------------
echo Git commit with timestamp...
git commit -m "update %DATETIME%"

echo ----------------------------------------
echo Pull latest changes and rebase...
git pull --rebase origin main

echo ----------------------------------------
echo Push to GitHub...
git push origin main

echo ----------------------------------------
echo Build MkDocs site...
python -m mkdocs build

echo ----------------------------------------
echo Deploy MkDocs to GitHub Pages...
python -m mkdocs gh-deploy --force

echo ----------------------------------------
echo Blog update and deploy completed at %DATETIME%!
pause
