git checkout -b gh-pages
git rm -rf .
git commit -am "First commit to gh-pages branch"
git push origin gh-pages
git checkout master
git push origin `git subtree split --prefix output gh-pages`:gh-pages --force

# make `_sites`
bundle exec jekyll build
git subtree push --prefix _site origin gh-pages


git checkout master
git subtree split --prefix _site -b gh-pages
git push -f origin gh-pages:gh-pages
git branch -D gh-pages

