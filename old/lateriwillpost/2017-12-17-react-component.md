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

# 주의

이 블로그의 내용은 대단히 주관적인 내용으로써, 양질의 글을 읽었지만 똥글이 나오는건 인간의 생리학적 기능인 배설 활동 중 똥만들기 interface를 상속했기 때문입니다.

# 이전글 요약 

react는 대규모 어플리케이션을 만들기 위해 만들어졌다. react는 `Virtual DOM` 을 이용하여 
`repaint`와 `reflow`의 과정을 최소화 하려 노력하였으며, 
이러한 노력은 `조화비교알고리즘`이 큰 역할을 했다. 

`조화비교알고리즘`은 virtual DOM과 Real DOM의 차이를 비교하여 수정해야하는 부분만 수정하며 
연산이 끝나면 수정이 완성된 DOM Tree를 `브라우저 레이아웃 엔진`에 건내주어
한번의 reflow와 repaint과정이 되도록 한다. 이 과정이 `reflow`, `repaint`과정의 최소화라 본다.

# 컴포넌트

# regular DOM과 컴포넌트

# 컴포넌트와 엘리먼트의 차이

# 컴포넌트에 들어간 이벤트

# 컴포넌트 ref

리엑트에서 가끔 jquery를 써야하는 구간이 있기는 하다. 

이 때 jquery로 query selector를 찾지말고 $(ref)로 넣어서 쓰자

# 컴포넌트의 생명주기


![생명주기](https://i.imgur.com/mNNKj2C.png)

![각상황에 따른 생명주기 역할-1](https://i.imgur.com/7jBLN64.jpg)

![각상황에 따른 생명주기 역할-2](https://i.imgur.com/7pIUB3V.png)

#

display:none 이나 컴포넌트중 일부가 사라져도 componentDidUnmount 는 돌지 않는다.

#### 각 생명주기항목들의 하는 역할
-
-
-
-
- 


# 컴포넌트의 업데이트 방법, 및 렌더 동작시


-----
Want to see something else added? <a href="https://github.com/poole/poole/issues/new">Open an issue.</a>
