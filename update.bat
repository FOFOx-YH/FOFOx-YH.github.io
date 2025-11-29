@echo off
git add .
git commit -m "update"
git push origin main
python -m mkdocs gh-deploy --force
echo Done
pause