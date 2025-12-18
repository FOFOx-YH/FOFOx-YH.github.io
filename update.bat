@echo off
REM 自动提交、推送并部署 MkDocs

set DATETIME=%date% %time%

echo Git add...
git add .

echo Git commit...
git commit -m "update %DATETIME%"

echo Git push...
git push origin main

echo Deploy MkDocs...
python -m mkdocs gh-deploy --force

echo Done!
pause
