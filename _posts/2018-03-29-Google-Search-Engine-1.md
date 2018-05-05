---
layout: post
title: "Google Search Enging 에 대해서 알아보자-1"
description: SEO meta[title, keyword, description] 끝 아냐?
image: 'https://i.imgur.com/HAd72ov.png'
category: 'seo'
tags:
- seo
- pagerank
twitter_text: Google Search Enging 에 대해서 알아보자
introduction: SEO meta[title, keyword, description] 끝 아냐? 라고 말했었지만... 왜 우리 웹페이지는 pagerank가 밀리고 있는거야?
---

### 주의

이 블로그의 내용은 대단히 주관적인 내용이 가득합니다.
그리고 `양질의 글`을 읽었지만 `똥글`이 나오는건 제 미숙함 때문입니다.
그럼에도 불구하고 피드백 많이 주신다면 자세히 조사하여 반영하도록 하겠습니다.
또한.. 가능한 링크로 올려놓은 자료들은 반드시 열어보시기 바랍니다. 분명 도움이 될 것입니다.
(- -)(_ _)


# Intro

개발직군 관점에서 바라보았을 때, SEO를 구축하고 관리하기 위한 내용을 다룹니다.

# SEO란?
Search Engine Optiomization 검색 엔진 최적화라고 한다. 말 그대로 웹 서비스를 검색창에 노출시키기위한 최적의 상태로 만들어주는 작업을 SEO라 한다.

# 검색엔진 종류

1. 로봇형 검색엔진: 크롤러, 스파이더라고 불리는 프로그램이 링크를 타고 모든 사이트의 자료수집하는 형태의 검색엔진. (구글, 빙, 바이두, 얀덱스)
2. 디렉토리형(카테고리 검색): 사이트맵을 직접 제출해서 인덱싱 하는 방식

Google은 둘 다 지원한다.

# SEO가 이루어지는 대강의 원리

1. 사이트맵을 제출하거나(카테고리형 인덱싱), 자연스럽게 구글 크롤러가 읽어갈 때까지 기다리는 방식(로봇형 인덱싱)
2. 로봇형 인덱싱의 경우 웹페이지의 내용을 읽고, 또 다른 url이 존재하면 그 url에 들어가서 재귀적으로 계속해서 탐색한다.
3. 카테고리형 인덱싱은 제출한 사이트맵에 대한 내용만을 탐색하여 검색결과를 생산해낸다.
4. 구글 검색엔진은 javascript렌더링을 한 결과값을 가져간다고 알려져있지만, 일부 검색엔진, 크롤러만 그럴뿐 전부가 그러지는 않는다.(2018년 5월 5일 작성일 기준)(즉, 렌더링 안시키고 그냥 가져갈 수 도 있다. 렌더링 해준다는 소리는 믿지않는게 정신건강에 좋다. 일부만해준다.)

그래도 혹시 도전해볼 다른 용자들은 한번쯤은 도전해보는것이 좋을지도 모른다.
- [관련 링크](https://www.hobo-web.co.uk/javascript-seo/)

# SEO, PageRank 작업 시에...

1. SPA를 운영하는 서비스의 경우 서버사이드렌더링을 별도로 구축해서 SEO에 등록하자.
2. javascript를 렌더링해준다는 소문은 가급적 믿지말자. 수 많은 크롤러에서 일부만 렌더링을 해준다는 소리이다.
3. `<title />` 태그는 글이 노출될 떄마다, 글 내용에 따라 바꿔서 렌더링 될 수 있도록 한다.
4. `<meta name="description" content="${내용}" />` 검색결과에 대한 요약으로 작성하고 너무 길지 않도록 한다.
5. `<meta name="keyword" content="${[키,워,드, ...rest]}">` 키워드의 선정은 이미 선점해있는곳의 키워드 선택은 가급적 피하라. 피할 수 없다면 양보 못하는것 몇개만 쓰고, 사용자들이 실제로 어떻게 접속하는지 검색 키워드를 보고 의사결정에 보탬이 되어라. (Google Analytics에서 유입 키워드를 열람할 수 있다.) 내용과 제목에 없는 키워드를 사용할 경우, 키워드는 지양해야한다. SEO가 중요한 서비스의 경우 형태소 분석기를 이용하여 글 내용에서 많이 사용된 명사를 추출하여 keyword에 내용을 채우기도 한다. (정 이미 선점된 키워드를 어떻게든 남에게서 우위를 탈환하겠다 하면.. pagerank를 올려주는 용역업체가 또 있다. 정말.. 별별 인력들이 다 있다.)
6. 키워드는 `<title>`과 `<meta name="description" con...>` 그리고 본문의 내용에 있는것으로 해야한다. 없는것을 선택했다면, PageRank에 우위를 선점하지 못할 수 도 있다. 그리고 keyword가 먹히지 않을 수 도 있다.
7. 노출될 url의 게시글의 이름을 한글, 숫자, (특수문자 포함) 으로만 이루어진 url은 가급적 피하라. 구글은 불필요한 매개변수로 이해할 수 있다.
> http://${url}/board/hello-my-name-is-drakejin // 이런 url을 권장하는 이야기.
8. 4xx, 5xx 에러 페이지가 나타나더라도 정상적으로 렌더링 되는 url로 되돌아 갈 수 있는 페이지를 만들어야 한다. 
9. `<a>Click here</a>`와 같이 Click Here라는 앵커는 가급적 자제해야한다. `<a href="url">내용</a>` 구글 크롤러는 페이지 내의 url도 탐색하기 때문에 a 태그 내부의 내용을 제목으로 쓰는 일도 있으며 Click Here나 여기에 같은 명시적이지 않은 이름은 크롤러 뿐만 아니라 서비스 이용에도 방해가 된다. 차라리 그런것을 쓸 바에 javascript로 처리해라
10. `<img src="url" alt="이미지">` 최적화된 이미지를 사용하고, 이미지의 제목은 alt에 작성할 수 있도록 한다. (구글 봇이 이해하기 쉬운형태 임)
11. `<h1/> ~ <h6>`태그가 제목이 될 수 있다. 그저 글 씨를 키우는 용도로 쓰지 않는것이 좋다.(경험상...)
12. `<link rel="nofollow"/>`와 robots.txt의 사용에 유의해야 한다. nofollow는 특정 링크를 크롤링 못하게 막는것이다.
13. 웹페이지를 모바일 최적화에 고려해야한다. 모바일을 위한 구글봇 ‘Googlebot-Mobile’을 포함한 모든 User-agent의 접근을 허용하라.(모바일 관련 설정을 건드릴 수 없는 티스토리 이하 블로그는 해당 사항 없음이다.) desktop에서의 검색결과와 mobile에서의 검색결과가 가끔 다른데, 이는 모바일최적화의 여부와 user-agent에 대한 내용이다.
14. https, http 둘 다 혼용해서 사용할 수 있도록 한다.
15. 가끔가다 정말 노출 안하고 못배기는 1순위 링크를 급하게 당장 올려야겠다. 싶다면.. 편법이 있다. 서비스의 모든 웹 페이지에다가 이런 소스코드를 붙여보자. 이는 9번 방법을 활용한것이다. 페이지 내에서 해당 문서로 접근하는 경우는 어디에도 없었으며, 강제로 sitemaps.xml을 만들어 제출해도 읽어오질 못해서 이런 방법을 선택해보았다. 제법 잘 작동 한다.

> <a style="display:none" src="문서의 url"> ${문서의 제목} </a>

![pdf, pptx 문서를 강제로 노출시키기](https://i.imgur.com/Gmot0ng.png)


- [많이 참고한 jjangbong님의 블로그](http://jjambong.com/658)

# PageRank시 주의해야할 점

1. 어떤 내용으로 해당 url을 검색엔진에 노출시킬 것이며, 내용은 노출시켰을때하고 큰 괴리가 없는지 확인해야한다. (노출된 내용과 초기 렌더링 된 url과의 내용이 맞지 않으면, 이탈률이 높아지게 된다. 그렇게 된다면 PageRank에서 떨어진다. 두 세 번째 페이지로 밀리게된다.)
2. 4xx 5xx status를 뱉지만, 정상적으로 웹페이지를 출력하는것은 읽지 않는다. (구글의 경우 존재하지 않는다고 판단)
3. 시간대비 클릭 수 (click-through rate), 이탈률, 초기 렌더링 디자인 최적화에서 하위권에 속할경우 페이지 랭크에서 떨어진다.

- [page rank의 원리](https://sungmooncho.com/2012/08/26/pagerank/)
- [Do bounce rates affect a site’s search engine ranking?](https://searchenginewatch.com/2016/05/04/do-bounce-rates-affect-a-sites-search-engine-ranking/)
- [10 Reasons Your Website Can Have a High Bounce Rate](https://www.searchenginejournal.com/10-reasons-website-can-high-bounce-rate/182260/)

# SEO에 노출된 내 서비스의 page rank의 점수는?

[구글 page rank checker](https://www.prchecker.info/check_page_rank.php)

# sitemap.xml 작성방법[참고](https://www.sitemaps.org/protocol.html)

``` xml
<?xml version="1.0" encoding="UTF-8"?>

<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc>http://www.example.com/</loc>
        <lastmod>2005-01-01</lastmod>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>
</urlset>
```

# pdf 및 pptx 파일도 SEO로?

1. pdf및 pptx 파일도 seo로 할때에는 주의사항이 있다.
2. 글(텍스트)를 가급적 이미지로 하지말것. 
3. pdf및 pptx에 title과 description을 적어주는곳이 분명히 있으니 반드시 찾아서 해당 내용에 대해서 작성 할 것
4. pdf및 pptx에 작성해놓은 title에 따라 파일명도 똑같이 바꿔준다.
5. `<a src="문서위치">파일명(문서 제목)</a>`이 반드시 지켜질 수 있도록 한다.
6. SEO에 노출때에는 description의 경우는 파일에 적어둔 description을 따라가거나 문서의 내용을 따라간다.
7. 반드시 페이지 내에 해당 파일에 대한 링킹(앵커)로 연결이 되어있어야 한다.
8. 7번 과정이 이루어진 상태에서 크롤링이 된다면 해당 문서는 드디어 검색엔진에 노출이 될 수 있게 된다.

# 글을 작성하고 난 후기.

나는 무엇을 말하고 싶었던 걸까.
그냥 SEO작업 하는데 사실 작동방식이야 title과 meta tag 장난질이 전부인줄만 알았지.. 저렇게까지 할줄은 꿈에도 몰랐었다.
업무 겪으면서 `극대노`한적이 이미 열 손가락을 넘어섰다.


### 깨알 지식

1. 딥링크: 일반적으로 사용하고 있는 url 복사 및 클릭 이동이 딥링크
2. 다이나믹 링크(지연된 딥 링크): (구글에서 제공하는 주로 Firebase관리자 모드에서 UTM 파라미터까지 설정 가능한 동적링크라 합니다) 안드로이드, 앱, 웹 접속사용자 환경에 따라 안드로이드의 링크, 앱서비스의 링크, 웹 접속자의 링크를 띄울 수 있다.

> 예를 들자면 모바일의 브라우저에서 이것 저것 탐색하다가 특정 게시글이 마음에 들어 클릭했더니 함께 제공하는 서비스의 url을 클릭했을 때, 설치된 앱이 열리면서 해당 url로 바로 넘어가는 기능! 또는 푸쉬에서 알람이 왔는데 단순히 앱이켜지는게 아닌 해당 푸쉬에 관련된 게시글이 나타나게 하기! 이런것들이 가능하다.


# 참고자료

1. https://moz.com/blog/seo-meta-tags
2. [seo에서 우위를 점하기 위한 Google 알고리즘의 기본](http://www.aun-korea.com/%E3%80%903%ED%8E%B8%E3%80%91seo%EC%97%90%EC%84%9C-%EC%9A%B0%EC%9C%84%EB%A5%BC-%EC%A0%90%ED%95%98%EA%B8%B0-%EC%9C%84%ED%95%9Cgoogle-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98%EC%9D%98-%EA%B8%B0%EB%B3%B8/)




투자의 우선순위 
  - 모든 투자 의향은 접수하고 모아라
    1. 최고 좋은 VC 투자
    2. VC투자
    3. 엔젤/엑셀러레이터
    4. 전략적 투자(기업 투자, 제휴 투자)
    5. 기타 기관(SBI)