# make `_sites`
bundle exec jekyll build
git subtree push --prefix _site origin gh-pages


git checkout master
git subtree split --prefix _site -b gh-pages
git push -f origin gh-pages:gh-pages
git branch -D gh-pages

