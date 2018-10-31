#!/bin/sh

mkdir _site
cd _site

git init
git remote add origin https://${GH_TOKEN}:x-oauth-basic@github.com/ugwis/hp.git > /dev/null 2>&1
git fetch
git checkout gh-pages

cd ../
