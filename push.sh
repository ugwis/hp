#!/bin/sh

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

git checkout -b gh-pages
git add *
git commit -m "Travis build: $TRAVIS_BUILD_NUMBER"

git remote add origin https://${GH_TOKEN}:x-oauth-basic@github.com/ugwis/hp.git > /dev/null 2>&1
git push --quiet --set-upstream origin gh-pages
