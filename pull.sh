#!/bin/sh

mkdir _site
cd _site

git remote add origin https://${GH_TOKEN}:x-oauth-basic@github.com/ugwis/hp.git > /dev/null 2>&1
git pull origin gh-pages

cd ../
