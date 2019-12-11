# Install 블로그

조용진의 블로그이며 이전 쓰던 README.md 파일은 documentation/jekflix.md 입니다

설치 및 자세한 사용방법이 나와있으니 참고해주시기 바랍니다.

## init this project

``` bash
$ git clone https://github.com/drake-jin/blog
$ git clone https://github.com/drake-jin/drake-jin.github.io
$ gem install bundler -v '< 2'
$ bundle install
$ yarn install
$ gulp
```

## project start

``` bash
$ gulp
```

## project deploy

``` bash
$ cd ${blog_project_home}
$ ./deploy "${message}"
```

## project module

``` bash
$ ./initpost.sh -h
```

``` bash
$ ./initdraft.sh -h
```

## Author

[Thiago Rossener](https://www.rossener.com/) based on [Cards Jekyll Template](https://github.com/willianjusten/cards-jekyll-template).