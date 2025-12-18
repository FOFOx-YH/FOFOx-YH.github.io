@echo off
set DATETIME=%date% %time%

echo Git add...
git add .

echo Git commit...
git commit -m "update %DATETIME%"

echo Git pull --rebase...
git pull --rebase origin main

echo Git push...
git push origin main

echo Deploy MkDocs...
python -m mkdocs gh-deploy --force

echo Done!
pause
