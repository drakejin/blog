---
layout: post
title: "ReactJS 코드를 에디터에 쓰기 전에"
description: 시작하기전에 이론충이 한번 되어보는것은 어떠한지?
image: 'https://i.imgur.com/yRH0zfw.png'
category: 'reactjs'
tags:
- javascript
- react
twitter_text: ReactJS 코드를 에디터에 쓰기 전에
introduction: 시작하기전에 이론충이 한번 되어보는것은 어떠한지?
---

### 주의

이 블로그의 내용은 대단히 주관적인 내용이 가득합니다.
그리고 `양질의 글`을 읽었지만 `똥글`이 나오는건 제 미숙함 때문입니다. 
그럼에도 불구하고 피드백 많이 주신다면 자세히 조사하여 반영하도록 하겠습니다.
또한.. 가능한 링크로 올려놓은 자료들은 반드시 열어보시기 바랍니다. 분명 도움이 될 것입니다.
(- -)(_ _)

# React는 왜 존재하는가?

큰 SPA(Single Page Application) 또는 Dynamic UI 의 웹 페이지를 만들기 위해서 

> **We built React to solve one problem: building large applications with data that changes over time.**
> 출처 : https://github.com/mikrofusion/react/blob/38818189a518fe307681915995177f748e2115ba/docs/docs/01-why-react.md

**SPA: Single Page Application : 페이지 전환없이 서비스를 이용할 수 있는 애플리케이션 UI를 말한다. Dynamic UI의 성격이 강하다.

### 그럼 그 이전에는 큰 어플리케이션은 어떻게 만들었을까?

일반적으로 모든 웹페이지에서 서버와 통신하며 요청을 주고 받으면, 받은 데이터를 DOM 객체에 속성값, text들을 변화시키거나 새로 만들거나 제거하게 되로록 짰었다.
그리고 이 때 코드는 계속해서 DOM객체의 CRUD코드를 반복해서 코드를 짜 주어야 했다. 
그와 동시에 DOM객체에 대해 연산을 연속적으로 하게 됨에 따라 repaint, reflow 연산이 빈번해져 브라우저가 컴퓨터의 자원을 많이 소모하게 된다.
따라서 이전의 일반 DOM객체를 사용하여 SPA모델의 웹 어플리케이션을 만들경우에는 많은 개발 부채를 불러오게 된다.

페이스북의 React는 이 방법을 가상의 DOM 객체(Virtual DOM)를 이용해 이 문제를 해결하였다.

**reflow 와 repaint**: 밑에 자세히 설명하도록 하겠지만 
지금은 '`브라우저 레이아웃 렌더링` 중에 
연산할 때 리소스를 가장 많이 잡아먹는 연산' 이 정도만 알아두면 좋다. 

# 그렇다면 DOM하고 Virtual DOM은 뭘까?

### DOM 

여기서 말하는 `DOM`(Document Object Model)은 HTML,JS,CSS로 생성되는 것들을 말한다.
우리가 자주 보는 `<div>`, `<input>`, `<a>` 등의 것들이다. 

*이 글에서는 DOM을 `일반 DOM` 또는 `regular DOM`이라는 단어로 표기할것이다.*

### VirtualDOM

regular DOM의 추상화 개념을 활용한 새로운 또 다른 DOM 이다. 
이것은 빈번한 repaint와 reflow문제를 보안하였으며, Dynamic UI를 만들기 위해 적합한 기능들이 내장되어 있다.
그러므로 VirtualDOM은 SPA모델의 웹 어플리케이션 에서는 regular DOM 보다 최적의 성능을 발휘한다.

### DOM과 Virtual DOM 비교

|      구분      |  regular DOM  |         Virtual DOM         	|
|:-------------:|:-------------:|:----------------------------:|
|     성격       |     정적       |             동적              |
|    생명주기     |      부재      |             존재               |
|  성능:동적 웹    |    Defeat     |            Win               |
|  성능:정적 웹    |      Win      |     Defeat                  |
|  EventElement |      -        |     regular DOM하고 다름       |
|    추상화       |      -        | regular DOM에서 추상화 해옴     |


부가적인 내용:[https://github.com/FEDevelopers/tech.description/wiki/%EA%B0%80%EC%83%81-%EB%8F%94%EA%B3%BC-%EB%8F%94%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90](https://github.com/FEDevelopers/tech.description/wiki/%EA%B0%80%EC%83%81-%EB%8F%94%EA%B3%BC-%EB%8F%94%EC%9D%98-%EC%B0%A8%EC%9D%B4%EC%A0%90
)


### DOM은 느리기만한 애물단지..?

우선 DOM이 느리다라는 표현은 옳지 않다.
맨 위에 언급되었듯이 React의 존재는 대규모 SPA(또는 Dynamic UI)의 웹 페이지를 만들기 위해이며,
만약 Dynamic UI의 웹 애플리케이션이 아니라 소개페이지같은 이전의 트랜드 웹 애플리케이션이라면 당연히 regular(일반) DOM이 더 성능이 좋다.

즉, **상황에 따라 다르다**는것이다.

그런데, 왜 DOM에 대한 문제점을 설파할까?

현재의 regular DOM은 트랜드에 맞지 않는 성격을 갖고있기 때문이다. **regular DOM은 정적이다.**
(WEB 1.0)웹의 발전에 대한 게시글을 읽다보면 알고 있겠지만 초기에 웹은 정적이었고,
(WEB 2.0)서비스 로직이 들어가게 되면서 서버와 클라이언트는 대화를 할 수 있게 되었다.
(WEB 3.0)그리고 지금은 Client Machine하고 사용자가 대화를 한다.
초기 정적인 웹페이지에 맞게 설계된 regular DOM은 정적인 성격을 가진채 동적인 웹 어플리케이션에 사용되기 때문에 성능상에 문제가 발생하게 된다.

요즘 DOM이 사용되고 있는 트렌드(DOM이 애니메이션마냥 휘황찬란하게 바뀌는 상황)에서 현재의 DOM객체에 문제가 있기 때문이다. 
그 부분은 바로 `브라우저 레이아웃 엔진`에서 발생하며, repaint와 reflow연산작업의 빈번한 발생으로 UI/UX렌더링에 비교적 많은 리소스를 먹게되기 때문이다.

하지만 정확히 알기위해서는 반드시 이 [링크:(velopert blog)https://velopert.com/3236](https://velopert.com/3236)를 참조해보는것을 추천한다.

# Repaint 와 Reflow 는 무엇?

먼저 코드로 언제 repaint와 reflow가 발생하는지 알아보자.

``` js
var style = document.body.style; // 캐싱
style.padding = "20px"; // reflow, repaint
style.border = "10px solid red"; // reflow, repaint
style.color = "blue"; // repaint (레이아웃이변경되진않았기때문에 reflow 안함)
style.backgroundColor = "#ffa"; // repaint
style.fontSize = "1em"; // reflow, repaint!

document.body.appendChild(document.createTextNode('hello world!')); // reflow, repaint
```

> `repaint`는 색상이 변경되거나 글자의 내용이 바뀌었을 때 발생되는 연산이다.
> `reflow`는 하나의 DOM객체의 크기나 위치가 변경되엇 을 때(레이아웃의 변경작업), 다른 DOM객체들의 위치와 크기가 함께 변경하는것을 말한다.

***주의:** 
사실 브라우저는 생박보다 멍청하지 않다.
위에 코드로 설명해놓은 구간의 한줄 한줄 마다 repaint와 reflow가 발생하는것은 아니다. 
실제로는 style에 대한 작업이 더 없고 다른 연산으로 들어갈 때 `Batched DOM Update`가 발생하여 style변경에 대한 작업을 일괄적으로 처리하게 된다.
즉, 매 한 줄 마다 reapint, reflow연산을 하지 않는다는 것이다.

하지만 그 중에 한줄 한줄 강제로 reflow연산을 발생시키는 동작들이 부분있다.
그것은 바로 `Forced Reflow`라고 부르며 연산으로는 아래링크를 참조하길 바란다.

[https://gist.github.com/paulirish/5d52fb081b3570c81e3a](https://gist.github.com/paulirish/5d52fb081b3570c81e3a)


### 브라우저 레이아웃 엔진의 동작flow

우선 repaint와 reflow이 발생하는 구간이 어디인지 살펴보자

![browser layout engine](https://i.imgur.com/0XdloJi.png)

### 브라우저 레이아웃 엔진에 대한 성능튜닝 10가지

반드시 링크의 내용을 읽어보길 바란다.

출처 : [https://www.sitepoint.com/10-ways-minimize-reflows-improve-performance](https://www.sitepoint.com/10-ways-minimize-reflows-improve-performance/)

1. **배스트 프렉티스를 사용하라** 인라인태그 쓰지말기 table layout일 경우에는 `table-layout:fixed`를 사용하기
2. **숫자로 css규칙을 정하는걸 최소화 하라** The fewer rules you use, the quicker the reflow. You should also avoid complex CSS selectors where possible.
3. **DOM 트리의 depth를 최소화 하라**
4. **돔 트리에서 클래스의 변경을 최소화 하라**
5. **Flow에 관련된 복잡한 애니메이션은 최소화하라**
6. **DOM 객체를 안보이게 할거라면 제거하지말고 `display:none`을 이용하라**
7. **`Batched DOM Update`를 이용하라**
8. **영향받는 엘리먼트의 개수를 제한하라**
9. **매끄러운 퍼포먼스를 전과 후를 비교하라**
10. **repaint 이슈를 브라우저 툴을 이용하여 분석하라** Chrome의 timeline기능을 이용하여 `Paint` 및 `Repaint`를 확인하자

# Virtual DOM의 알고리즘

Virtual DOM의 특징은 앞서 언급했듯이 reflow 와 repaint를 줄여 Dynamic UI 웹 애플리케이션 일 때에 `브라우저 레이아웃 엔진`에 성능에 최적화를 시켜준다고 했다.
어떻게 이런 특징을 가질 수 있었을까? 조화(Reconciliation), 그리고 Smart Diffing Algorithm 이 바로 그 기능을 돕는다.

### Smart Diffing Algorithm, 그리고 조화,조정(Reconciliation)

render가 되었을 때 이 알고리즘이 등장하며, 이 알고리즘은 **render 되는 순간에 reflow와 repaint의 영향을 최소화 하여 어떻게 성능향상을 할 수 있을까?**에서 사작되었다.
render를 할 때마다 render를 할 때마다 render메서드 안에 선언해놓은 JSX태그들이 모두 새로 그려진다면 그만큼의 repaint와 reflow연산이 발생하게 된다.
하지만 이 알고리즘은 이전과 새로 그려질 태그들의 내용을 비교하여 변경된 부분만 새로 그려 repaint와 reflow연산을 줄여준다.
그렇다면, 이 알고리즘들은 무엇이며 react.js에서는 어떻게 동작하고 있을까?

### React Diffing Process

**Diffing Process**
![diffing process](https://i.imgur.com/QRtqIui.png)

Smart Diffing Algorithm은 렌더링되어 사용되고 있는 실제 regular DOM Tree와 React에서 쓰는 in-momery 안에있는 Virtual DOM Tree를 비교하는 알고리즘이다. 
최소한의 연산으로 수정작업이 요구되는 실제 돔 객체를 찾아서 수정 및 변경작업을 한다.
smart diffing algorithm은 Virtaul DOM Tree와 regular DOM Tree를 맵핑되어있고 어떤 DOM Node가 다른지 찾는다.
기존의 regular DOM Tree에서 탐색 알고리즘은 big-O(n^3)였지만 react 에서의 탐색 알고리즘은 big-O(n)이기 때문에 타 virtualDOM 보다 빠르다고 할 수 있다.
그리고 성능은 기존 트리비교(he state of the art algorithms을 이용)는 O(n^3)이라면 리엑트의 트리비교 알고리즘(Heuristic을 이용)은 O(n)의 비교를 한다. 


**Reconciliation Process**

Component render() — updating the Virtual DOM, running the diffing algorithm and finally updating the DOM
![Reconciliation Process](https://i.imgur.com/hy9Are6.png)

위 문서에서 빨간 점선은 모든 조하 단계는 현재노드에서 다음 자식 노드들애게 반복될것이다 위의 플로우차트는 Virtual DOM이 실제 DOM객체에 대하여 update가 발생하였을 때를 그렸다.
그리고 이 문서에서 말하는 Reconcile은 서로 다른 두 DOM Tree를 합쳐 하나의 실제로 반영될 DOM Tree를 만들어 내는 과정이다. 

*만약 위 그림에서 알려지지 않은 부분도 있지만 가급적 많은 부분을 그리려고 노력했다.*


### 참고문헌
1. Reconciliation에 대한 알고리즘 설명이 자세함: https://medium.com/@gethylgeorge/how-virtual-dom-and-diffing-works-in-react-6fc805f9f84e
2. Browser Layout Engine에 대한 설명 - Mozila: https://developer.mozilla.org/en-US/docs/Mozilla/Introduction_to_Layout_in_Mozilla
3. Browser Layout Engine에 대한 설명 - Others: http://taligarsiel.com/Projects/howbrowserswork1.htm#Parsing_general
4. D2의 React 적용하기 전에 읽어둘것: http://d2.naver.com/helloworld/9297403
5. 다른 Dynamic UI를 다루는 javascript framework가 궁금하다면? : http://teropa.info/blog/2015/03/02/change-and-its-detection-in-javascript-frameworks.html


### React에서 Virtual DOM의 중요성

> https://velopert.com/3236 복붙
>
> 업데이트: ugwe43to874nf4 라는 레딧유저님이 Virtual DOM 의 중요성을 더 알려주었습니다.
>
> DOM 조작의 실제 문제는 각 조작이 레이아웃 변화, 트리 변화와 렌더링을 일으킨다는겁니다. 그래서, 예를 들어 여러분이 30개의 노드를 하나 하나 수정하면, 그 뜻은 30번의 (잠재적인) 레이아웃 재계산과 30번의 (잠재적인) 리렌더링을 초래한다는 것이죠.
>
> Virtual DOM 은 그냥 뭐 엄청 새로운것도 아니고, 그냥 DOM 차원에서의 [더블 버퍼링](http://cfile29.uf.tistory.com/image/234C904E58D2899A1F294A)이랑 다름이 없는거에요. 변화가 일어나면 그걸 오프라인 DOM 트리에 적용시키죠. 이 DOM 트리는 렌더링도 되지 않기때문에 연산 비용이 적어요. 연산이 끝나고나면 그 최종적인 변화를 실제 DOM 에 던져주는거에요. 딱 한번만 한는거에요. 모든 변화를 하나로 묶어서. 그러면, 레이아웃 계산과 리렌더링의 규모는 커지겠지만, 다시 한번 강조하자면 딱 한번만 하는거에요. 바로 이렇게, 하나로 묶어서 적용시키는것이, 연산의 횟수를 줄이는거구요.
>
> 사실, 이 과정은 Virtual DOM 이 없이도 이뤄질수 있어요. 그냥, 변화가 있을 때, 그 변화를 묶어서 [DOM fragment](https://developer.mozilla.org/en-US/docs/Web/API/DocumentFragment) 에 적용한 다음에 기존 DOM 에 던져주면 돼요.
>
> 그러면, Virtual DOM 이 해결 하려고 하는건 무엇이냐? 그 DOM fragment를 관리하는 과정을 수동으로 하나하나 작업 할 필요 없이, 자동화하고 추상화하는거에요. 그 뿐만 아니라, 만약에 이 작업을 여러분들이 직접 한다면, 기존 값 중 어떤게 바뀌었고 어떤게 바뀌지 않았는지 계속 파악하고 있어야하는데 (그렇지 않으면 수정 할 필요가 없는 DOM 트리도 업데이트를 하게 될 수도 있으니까요), 이것도 Virtual DOM 이 이걸 자동으로 해주는거에요. 어떤게 바뀌었는지 , 어떤게 바뀌지 않았는지 알아내주죠.
>
> 마지막으로, DOM 관리를 Virtual DOM 이 하도록 함으로써, 컴포넌트가 DOM 조작 요청을 할 때 다른 컴포넌트들과 상호작용을 하지 않아도 되고, 특정 DOM 을 조작할 것 이라던지, 이미 조작했다던지에 대한 정보를 공유 할 필요가 없습니다. 즉, 각 변화들의 동기화 작업을 거치지 않으면서도 모든 작업을 하나로 묶어줄 수 있다irtual DOM 의 중요성을 더 알려주었습니다.

### 조화 비교알고리즘의 동작

1. 엘리먼트 타입이 다를경우

  ``` js
renderA: <div />
// 이후
renderB: <span />
// Result : div를 제거하고 span태그를 추가한다.
  ```


2. 엘리먼트 타입이 같을경우

  ``` js
renderA: <Counter a="1"/>
// 이후
renderB: <Counter a="2"/>
// Result : 컴포넌트가 사라지지 않고, 속성(props)값만 변경 
  ```


3. 리스트를 렌더링 할 때

다르게 생겼으면 내부비교하지 않고 새로 그린다. 그게 아니라면 위의 내용과 같다.(리스트 렌더링 시에는 property에 key를 이용해서 렌더링 성능을 최적화 할 수 있다.)

# 정리

react는 대규모 어플리케이션을 만들기 위해 만들어졌다. react는 `Virtual DOM` 을 이용하여 
`repaint`와 `reflow`의 과정을 최소화 하려 노력하였으며, 
이러한 노력은 `조화비교알고리즘`이 큰 역할을 했다.

Virtual DOM의 DOM Tree는 In-Memory에 있으며, 
Virtual DOM은 DOM fragment를 관리하는 과정을 자동화하고 추상화한다.

`조화비교알고리즘`은 virtual DOM과 Real DOM의 차이를 비교하여 수정해야하는 부분만 수정하며 
연산이 끝나면 수정이 완성된 DOM Tree를 `브라우저 레이아웃 엔진`에 건내주어
한번의 reflow와 repaint과정이 되도록 한다. 이 과정이 `reflow`, `repaint`과정의 최소화라 본다.

끝으로 오타 및 틀린 부분 있으면 과감하게 지적 부탁드립니다. 수정하겠습니다.

# React에 대해서 깊이 있게 알아보려면..

- https://velopert.com/ 민준님의 재미있는 이슈나 글들이 많습니다. 
- 제가 링크 남겨놓은 페이지 가급적 살펴봐주셨으면 합니다.

-----
Want to see something else added? <a href="https://github.com/poole/poole/issues/new">Open an issue.</a>
