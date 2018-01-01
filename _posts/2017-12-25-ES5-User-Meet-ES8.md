---
layout: post
title: "ES5 사용자 ES8을 만나다. Cheat Sheet"
description: 자바스크립트 기술이 획일화 되고 nodejs가 많이 쓰이면 그 때 가서 공부해야겠다라고 생각했지만. 그러기엔 너무 패러다임이 빨리 성장한다...
image: 'https://i.imgur.com/IJiVu4m.png'
category: 'javascript'
tags:
- javascript
- functional
twitter_text: ES5 사용자 ES8을 만나다. Cheat Sheet
introduction: 자바스크립트 기술이 획일화 되고 nodejs가 많이 쓰이면 그 때 가서 공부해야겠다라고 생각했지만. 그러기엔 너무 패러다임이 빨리 성장한다...
---

### 주의

이 블로그의 내용은 대단히 주관적인 내용이 가득합니다.
그리고 `양질의 글`을 읽었지만 `똥글`이 나오는건 제 미숙함 때문입니다. 
그럼에도 불구하고 피드백 많이 주신다면 자세히 조사하여 반영하도록 하겠습니다.
또한.. 가능한 링크로 올려놓은 자료들은 반드시 열어보시기 바랍니다. 분명 도움이 될 것입니다.
(- -)(_ _)

# intro

내가 쓸때는 ES5 문법 밖에 없었는데... 정신차리고 보니 ES8을 모르고서 개발문서를 읽기가 힘들어 졌다. 
지어 예제 코드를 문법모르고 사용하는 일도 부지기수로 늘어나게 되었다.
사실 자바스크립트도 jQuey만 열심히 돌려봤지 프로토타입따위 만져본적 없고 남이 만들어준것만 써봤다.
하지만 어느날 나는 react를 해야했고, `객체지향프로그래밍`과 `MVC 패턴`이 우주최고의 패턴인줄만 알았는데
`함수형프로그래밍`프로그래밍이 나오고 `Flux 패턴`이 나왔다. 
사실 나는, backbone.js, angular.js, meteor.js, io.js, socket.io 등등등 
javascript 파생 라이브러리 및 프레임워크가 우후죽순으로 나와서 변화들이 있다는건 알고 있었지만,
"그럼 난! 그 기술들이 하나로 통합되고 안정화 되면 `그때가서 공부할래!`" 했었다.
하지만.. 지금 당장에 만들어야 하는것이 있고, 따라잡으려고 공부하니 새로운 라이브러리들이나 프레임워크들은 새로운 패러다임을 가지고 있었고.
점차 코드가 손에 잡히지 않기 시작했다. 

이 글은 나하고 같은 생각이었거나 지금부터 시작하는 javascript를 다시 시작하는 개발자에게 알고 '시작하면 좋을 몇 가지 키워드'에 대해 간략히 알아보도록 한다.
또한, 지금이 아닌 나중에 공부하면 오질나게 고생하며 야근하고 있을 내 모습이 아른거려 지금이라도 갭을 줄여줄 cheat sheet을 반들어보려한다.

----
***2017년 12월 24일 추가***

자바스크립트의 생태계가 궁금하다면 https://stateofjs.com 를 한번 살펴보길 바란다.
전부를 보는대에 1시간 이상이 걸리지 않을것이다.

***2017년 1월 1일 문장 문맥 수정***


# 차례 

1. eslint
2. babel
3. webpack & parcel.js
4. es8
5. typescript 와 flow
6. arrow function VS regular function
7. class 와 prototype
8. 변수 var, const, let 
9. for loop 
10. spread 연산자 *비구조할당
11. 동기처리 하기 // async/await & generate & promise & callback
12. 함수형 프로그래밍(not 함수지향 프로그래밍)
13. jQuery 지양

각 키워드에는 MDN 을 포함한 다른 블로그 포스팅 링크를 달것이다.
나 또한 그 링크들을 두 세번정도는 봐서 이해했던것이기 때문에, 이 글을 읽는 독자들 또한 필요할 것이라 생각한다.


# 1. eslint

eslint는 기본적으로 코드를 작성하는 syntax규약이 시초였으며,
소스코드 문서에 대한 작성 규칙을 설정하여 모든 개발자가 에디터에서 설정한 규칙을 따르도록 하는 역할을 한다.
이 규칙에는 syntax에 대한 규칙 뿐만 아니라, 가이드라인 또한 준수하게끔 설정할 수 있다.
eslint설정은 default로 Google, Airbnb의 eslint 스타일로 설정 할 수 있지만 이 중에서는 airbnb의 lint style이 가장 엄격(strict) 하다.
개인적으로 eslint의 airbnb설정이 엄격하지만, 사용하면서 표준 가이드나 있었던 이슈에 대한 것도 자연스레 배울 수 있어 javascript 에 어느정도 숙련된 사람이라면 사용해보길 추천한다.


예를들어 react 프로그래밍에서 airbnb의 lint로 설정을 하면 
`첫번째`, 클릭 이벤트리스너를 추가하려하면 키 이벤트도 같이 추가하도록 한다. 
이는 웹 표준에 마우스 클릭뿐만 아니라 키보드로도 접근이 가능하게 만들어야 함을 따른것이다. 
`두번째`, 리엑트 컴포넌트가 상태값을 갖고 있지 않다면 순수함수로 컴포넌트를 만들도록 되어있다. 
이는 class 로 만든 컴포넌트보다 순수함수로 만든 컴포넌트가 미세한 차이로 성능이 더 좋으며, 코드로 보기에도 명료하고 심플하다. 자세한 내용은 [링크](https://hackernoon.com/react-stateless-functional-components-nine-wins-you-might-have-overlooked-997b0d933dbc)를 참고하길 바란다.

내가 이 사실들을 알게된건 다름이 아니라 airbnb가 막으려던걸 풀려고 구글검색하면 첫 페이지에 가장 눈에 띄는 위치에 있기 때문에 궁금함을 참지 못하고 열어보게 되면서 알게된 것이다.
airbnb의 lint 셋팅이 해당 문법을 왜 막았으며 어떤 이슈가 있었는지도 알 수 있고, 그 이슈를 알게되면서 해당 프레임워크 및 라이브러리에 대해 좀 더 깊게 접근하는 계기가 된다.


더 나아가 협업에서도 스파게티 난장판 코드를 보느니 eslint로 그나마 정리된 코드를 보며 코드 리뷰하는것이 정신건강에 더 이로울것이라 생각한다.
회사의 경험으로 나를 포함한 전부가 신입인데 eslint가 없었을때 리뷰할 코드들을 보고 내색은 안했지만 개거품물며 기절할뻔했다.

#### 감사합니다. 저의 좋은 포스팅 마루타가 되어...주셔서... 공개 허용해주신 whitewolf23님 앞으로 더 성장하실겁니다. 빠른 속도로 성장중 이시기도 하고~!

indent... 맞춰달라능 ㅠ퓨ㅠㅠ
![indent](https://i.imgur.com/OCSMMBY.png)

ㅠ퓨... async await라는 훌륭한게 존재한다능 ㅠㅠ퓨ㅠㅠㅠ 아니면 Promise pattern이라도...
setimeout은 만능이 아니라능..... ㅠㅠㅠ픂ㅍㅍ
![callback](https://i.imgur.com/7DTISEO.png)




**설치 및 인스톨**

``` bash
$ yarn global add eslint-cli
$ yarn add eslint
$ eslint --init
--> populer style 선택
--> airbnb 선택
--> (글쓴이는 확장자 js 파일로 하면 린트설정에 주석을 남길 수 있어서 선호합니다. 탐원분들께 린트를 설정한 이유를 남길 수 있어서요.)
```

**이용 방법**

Editor에서 lint 규칙에 어긋난 구간을 표시해줄 텐데 마우스를 올리면 어떤 규칙을 위반했는지 알림메시지가 나올것이다.
만약 어떤 항목을 위반했는지 메시지가 나오지 않는다면 Vim, Atom, Visual Studio Code Editor에 플러그인 다운로드에서 
eslint 또는 jslint라는 키워드로 플러그인을 검색해서 설치하면 다음과 같은 메시지가 나온다.
만약 아래 이미지와 같은 화면이 나오지 않는다면 에디터프로그램을 종료후 다시 켜보기 바란다.

![eslint에서 에러를 나타낼때](https://i.imgur.com/dlfFmLO.png)

만약 해제하고 싶은게 있으며 다음 위의 이미지처럼 에러가 나온다면 툴팁의 header에 소괄호( '()')로 감싸여 있는 '키워드'(`space-infix-ops`)를
https://eslint.org/ 웹 페이지에서 검색한다. 이 규칙에 대해 설정은 .eslint.js 또는 별도로 설정한 확장자 파일에서 셋팅한다.


*[다음 아래는 작성자가 즐겨 쓰는 eslint 설정이다. 점차 줄여나갈 예정이다]*

``` js

module.exports = {
  "extends": "airbnb-base",
  'rules': {
    'indent': ['error', 2], // 함수형으로 코드 짜면 indent 가 만들어넨 카메하메하를 보지 않아도 됨
    'quotes': ['error', 'single'], // 더블 쿼텐션을 지양하며, template literals을 쓰거나 싱글 쿼텐션을 쓰도록
    'semi': ['error', 'never'], //세미콜론 싫어함. 

    'class-methods-use-this': 'off',

    'import/no-extraneous-dependencies': 'off',
    'import/no-unresolved': 'off',

    'arrow-body-style': 'off',
    'arrow-parens': 'off',

    'no-caller': 'off',
    'no-underscore-dangle': 'off',
    'no-unused-expressions': 'off',
    'no-undef': 'off',
    'no-unused-vars': 'off',
    'no-use-before-define': 'off',
    'no-useless-escape': 'off',
    'no-prototype-builtins': 'off',
    'no-param-reassign': 'off',
    'no-restricted-properties': 'off',
    'no-console': 'off',
  },
  'parserOptions': {
    'ecmaVersion': 2017,
    'sourceType': 'module',
  },
};

```

### 2. babel

babel 은 es8, es7, es6 등등으로 작성한 문법들을 원하는 ECMA 버전의 문법으로 교체해준다. 
webpack설정으로 자동컨버팅이 되도록 해서 쓰거나 babel-cli 로 수동으로 Export(Converting)해서 쓰기도 한다.

### 3. webpack & parcel.js

**[webpack](https://webpack.github.io/)**

![webpack](https://i.imgur.com/sxfCGBw.png)

**[parcel.js](https://parceljs.org/)**

![parcel.js](https://i.imgur.com/ZzHMSdK.png)

자바스크립트로 리소스(미디어)들을 로드하기위해 쓴다. 그리고 여러 js나 css 파일들을 하나의 파일로 합칠 수 도 있으며 그와 동시에 minify(compress)해주기도 한다. 
부분적으로 작은 용량의 파일일 경우 성능개선을 위해 js로 미디어파일들을 만들어서 저장하기도 한다. 

webpack과 parcel.js는 같은 역할이다. 웹팩이 좀 오래되서 이슈도 많고 언급도 많다. 
아직까지는 webpack 이 우세하지만 곧 parcel.js가 치고 올라올지도 모른다. 
둘의 차이는 webpack은 유명하고 메이저하며 설정하기가 복잡하다.(제가 잘 못해서 그렇습니다)
parceljs는 기본설정에 대해 딱히 작업하지 않아도 그냥 production 코드로 빌드 한다.  
parcel.js의 기본적인 설정은 사람들이 많이 찾는 설정으로 되어 있어서 설정에 오랜 시간을 투자하지 않아도 된다.
그리고 webpack 보다 build가 빠르다.

### 4. ECMA 버전에 대해 그리고 다음 버전에 대하여

관련 링크1: ECMA 이전버전하고 각 버전이 왜 존재하는지에 대하여 https://cimfalab.github.io/deepscan/2016/07/ecmascript-6
관련 링크2: 각 버전 별 바뀐 사항에 대해서 포스팅한 블로그 https://www.zerocho.com/category/EcmaScript?page=1

굵직 굵직한 특징
- EC6(2015): Generator, Arrow Function, Class 문법, import {} from ' /;'export
- EC7(2016): **(제곱연산자), array.includes(value, startIndex), Promise.
- EC8(2017): [async/await] 

### 5. typescript 그리고 Flow

관련 링크: http://djcordhose.github.io/flow-vs-typescript/flow-typescript-2.html#/

타입 없고 형변환에 제한이 없는 자바스크립트에 타입체크가 되도록 쓴다.
이 둘은 코드로 보면 syntax가 같기때문에 똑같이 보이지만 제네릭 관련해서는 다른 규칙을 가지고 있다.
(자세한 차이는 위 링크를 참조하길 바란다.)

### 6. arrow function VS regular function

``` js
const arrowFunction1 = () => {} // arrow function
const arrowFunction2 = () => { return 1 }
const arrowFunction3 = () => 1  // 바로 return 을 한다면 중괄호 생략이 가능하다.
console.log(arrowFunction2() === arrowFunction3()) // true;

const regularFunction = function(){} // regular function
```

둘의 차이는 this의 여부이다. arrow function은 this를 가질 수 없다. 사용한다면 function scope밖에 유효한 (window를 보는 this가 아닌) this를 이용할 수 있다.
나중에 bind, apply, call 같은 Function Prototype의 메서드를 사용해야한다면 regular Function을 사용해야한다.
regular function은 this를 가질 수 있다. 

### 7. class 와 prototype

- Prototype 관련 링크:  http://www.nextree.co.kr/p7323/
- Class 출처: https://gomugom.github.io/is-class-only-a-syntactic-sugar/

우선, 이 둘에 대한 자세한 설명은 없다. 
prototype은 흔히 알고 있을거라 생각하며 class는 사실 함수이며, 객체지향 코드를 만드는데에 사용할 수 있다.
둘은 서로 같은 역할로써 사용되지만 실제 차이점이 존재한다. 아래의 표를 반드시 참고하고 넘어가길 바란다.

[데스크탑으로 보면 표가 나옴. 모바일일때 표가 생략됨]

|                구분                |             [[prototype]]            |      class      |
|:----------------------------------:|:------------------------------------:|:---------------:|
| constructor를 함수로 실행          |                   O                  |        X        |
| superClass의 constructor 호출      | X(기본). 흉내는 가능하나 한계가 있음 | O. super 키워드 |
| methods 상속                       |                   O                  |        O        |
| methods를 생성자함수로 실행        |                   O                  |        X        |
| static methods : 상속              | X(기본). 흉내는 가능하나 한계가 있음 |        O        |
| static methods를 생성자함수로 실행 |                   O                  |        X        |
| methods: superClass의 메소드 호출  | X(기본). 흉내는 가능하나 한계가 있음 | O. super 키워드 |
| hoisting                           |                   O                  |        O        |
| TDZ                                |                   X                  |        O        |


### 8. var, const, let

var의 scope는 함수단위 / const, let의 scope는 block(또는 braket) 단위
 
변수 선언하고 이후에 수정안하고 계속 써야한다면 const
변수 선언하고 새로 대입해야할 부분이 있다면 let

그냥 var는 쓰지말자, eslint의 대부분의 기본 설정에서 var 변수 사용을 막고있다.
같이 일하는 사람들이 자바스크립트의 var 함수형 scope 보다 black 스코프에 익숙해져 있기 때문에
굳이 Function Scope의 변수를 이용해야 하는 이유를 잘 모르겠다.

개인적으로 var 변수의 사용에 대해 '굳이...?', '그래도.. 그렇지... 음... 굳이...?' 라는 의문이 자꾸 들게하는 것 중에 하나.


### 9. loop

- [lodash](https://www.npmjs.com/package/lodash)
- [Array](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)

이 부분에서는 말이 좀 많은 편이긴 하지만, js에서는 함수형 패러다임이 우세하게 많이 사용되고 있으며
for loop를 쓰는것보다 Array객체의 내장메서드 밑 lodash 같은 라이브러리를 사용하는것이 더 함수형 프로그래밍 다워지기 때문에 for loop를 굳이 사용하진 않는다.

하지만 그렇다고 for loop는 역사의 뒤안길로 사라지고 퇴물이 되어가는 기능은 절대 아니다.
이 둘은 서로 같은 역할(반복문)을 하지만 가지고 있는 동작방식이 다르다.

***중요** 밑의 예제와 이미지에 나타난 결과값을 확인해서 보기를 바란다.

for loop 와 Array및 lodash의 메서드에서 loop는 다르다.

1. for () 안에 간단한 코드를 삽입할 수 있다.
2. blocking io 작업 \에서는 다른 동작을 보인다. 다음 아래의 예제로 그 이유에 대해 알아보도록 하자.

``` js 
const TimeInterrupt = (title) => {
  return new Promise((resolve, reject) => {
     setTimeout(()=>{ resolve(`[${title}]:   timeout 1000 m/s`)}, 1000)
  })
}


async function ForLoop(){
  for(let i = 0; i < 1000; i++){
     const test = await TimeInterrupt('ForLoop')
     console.log(test)
  }
}


async function ArrayLoop(){
  const temp = []
  for(let i = 0; i < 1000; i ++) temp.push(i) 
  temp.filter(async () => {
    const test = await TimeInterrupt('ArrayLoop')
    console.log(test)
    return false
  }) 
}

ArrayLoop()
ForLoop()
```

![What different ForLoop & ArrayLoop](https://i.imgur.com/dv9roSZ.png)

for loop를 싸용하면 현재 index 에서 처리가 끝날때 까지, 다음 index의 처리는 기다리지만 
Array 내장 함수의 Loop는 기다리지 않고 일단 실행시켜 버린다. 그렇게 되면 ArrayLoop의 TimeInterrupt는 
한번에 1000개의 setTimout이 실행되어 1000개가 동시에 1초 후에 종료가 된다. 
잘 유의해서 사용할 수 있도록 하자.

### 10. spread 연산자 && 비구조할당

- spread 연산자 : ...a (... 닷(dot)이 세개 들어가고 변수명을 써야함)
- 비구조 할당 : const { a } = obj  // obj 변수의 속성중 a 의 값을 할당받는다. 

긴 말 필요없다. 예제로 알아보자

``` js
const array = [ 1, 2, 3, 4, 5 ]
const [ a, b, c, ...others ] = array // a,b,c 는 비구조 할당, ...others는 spread 연산자

console.log(a) // [1]
console.log(b) // [2]
console.log(c) // [3]
console.log(others) // [4, 5]
console.log(array) // [ 1, 2, 3, 4, 5 ]

const object = { a:1, b:2, c:3, d:4, e:5, f:6 }
const { a, b, c, ...others } = object // a, b, c는 비구조 할당, ...others는 spread 연산자.

console.log(a) // 1
console.log(b) // 2
console.log(c) // 3
console.log(others) // { d:4, e:5, f:6 }
console.log(object) // { a:1, b:2, c:3, d:4, e:5, f:6 }
```

### 11. 비동기 처리

기본적으로 javascript에서는 동기작업을 비동기처리 해버린다.
모든 Interrupt, I/O 작업일 때 이를 비동기로 처리 해버린다.
하지만 여기에서 문제가 발생하게 된다. 

``` java
// java code : jvm엔진은 기본적으로 동기로 처리를 하고 순차적으로 코드(명령줄)을 읽는다.

ResultSet rs = pstmt.statementQuery(sql, data); // Network I/O 발생
while(rs.hasNext()){
  Object obj = rs.next();
  // ...
  // 생략
  // ...
  System.out.println('1');
}
System.out.println('2');

```

위의 결과는 어떻게 출력이 될까? 1이 먼저 여러번 출력되고 그 다음에 2가 출력될 것이다. 
하지만 만약 java가 javascript 처럼 비동기 언어라면 어떤 결과가 나올까? 아마.. '2'가 출력되고 '1' 이 출력될까?
아니? `'undefined' has not 'hasNext' function` 이렇게 나타날것이다. 
while문이 돌기위해서는 rs가 필요한데 javascript에서는 동기처리를 비동기로 처리하기 때문에 
해당 줄이 끝날때 까지 기다리지 않고 바로 다음줄이 시작되어버린다. 

즉, java나 c 에서 짜던 코드 작성방식으로 javascript코드를 작성하다가, I/O 처리 작업에의해 작성한 의도대로 돌지 않을 수 도 있다.
그렇다면 비동기로 처리한다면 코드는 어떻게 작성해야할까?




#### 1. Callback

특정 Non-Blocking IO 작업이 끝난 이후에 실행되며, 완료의 메시지가 함수를 통해 넘겨 받을 수 있는 메서드. 단지 작업의 처리가 마지막에 불려져서 callback 이 아니다.
`완료`가 되었을 때 결과값과 함께 실행되는 함수이다. 코드로는 이런 형태지만 알맹이가 다르면 그것은 콜백메서드라고 하지 않는다. 그냥 메서드..

``` js 
event.addEventListener('click', (e)=>{alert('click')}) // 
// 이건 콜백메서드가 아님.
fs.readFile('path/file.txt', (err, data) => { console.log(data) }}) // file I/O
// I/O Interrept 비동기 발생 => 비동기 제어 => 콜백메서드

```

콜백으로 처리할 수 있지만, 웹 서비스에서 비동기 작업은 요청 한번에 한번씩 발생하지 않는다.
아래에 보는 코드로 callback으로만 비동기 작업을 처리할 경우에 발생하는 개발부채에 대해 이야기 할것이다.

아래 코드의 로직은 디렉토리의 존재를 확인 하고, 이미지의 크기를 확인한 후에, 썸네일 이미지를 만든다. 

``` js
fs.readdir(source, function (err, files) { // file I/O
  if (err) {
    console.log('Error finding files: ' + err)
  } else {
    files.forEach(function (filename, fileIndex) {
      console.log(filename)
      gm(source + filename).size(function (err, values) { // file I/O
        if (err) {
          console.log('Error identifying file size: ' + err)
        } else {
          console.log(filename + ' : ' + values)
          aspect = (values.width / values.height)
          widths.forEach(function (width, widthIndex) {
            height = Math.round(width / aspect)
            console.log('resizing ' + filename + 'to ' + height + 'x' + height)
            this.resize(width, height).write(dest + 'w' + width + '_' + filename, function(err) { // file I/O 
              if (err) console.log('Error writing file: ' + err)
            })
          }.bind(this))
        }
      })
    })
  }
})
// 출처 : http://callbackhell.com/
```

내가 이 예제를 통해 주의하고 싶었던 점은, 콜백헬(에네르기파)이 발생하게 되며 콜백헬은 코드의 **가독성**을 떨어트리며, 
사용하는 변수의 scope가 콜백헬 내부의 함수 모두에게 스코프를 공유하는 문제도 발생하여 **유지보수**는 점차 어려워진다.
콜백헬의 유지보수문제는 내가 언급한것 이외에도 요인들이 많은데, 무엇보다 직접경험해 본다면 알려주지 않아도 '그 지옥'으로는 가려하지 않을것이다.

#### 2. Promise Pattern

Pormise 패턴은 Callback 패턴과 같이 비동기 처리를 하기 위한 패턴이지만, 다른 형태를 가지고 있다. 
Promise 패턴을 통해서 Callback 패턴 사용시 생길 수 있는 Callback Hell 현상을 어느정도 피할 수 있다.

``` js
const fileData = (path) => { 
  return new Promise((resolve, reject) => {
    fs.readFile(path, function (err, data) {
      try{
        if(err) reject(err)
        resolve(data)
      }catch(e){
        reject(e)
      }
   })
  })
}

fileData('path/file.txt')
  .then((data) => {
    console.log(data) // 파일내용
    // ... 생략
    return result
  })
  .then((result) => {
    console.log(result) // 앞에서 return 해준 값이 이번 then 으로 넘어온다.
  })
  .then().then().then().then().then().then().catch() 
  // 이것이 Promise Chaining 이걸로 에네르기파의 콜백헬은 어느정도 방지할 수 있다.
```

하지만... then()...이걸 꼭 써야하나..? 그냥 java 또는 c/c++ 처럼 순차적으로 써 내려가면 안될까?
또는 1번째 then의 결과값을 10번째 then에서 사용하기 위해서는 스코프 밖에 있는 변수를 이용하는 방법과 결과값으로 전달해서 주는 방법 말고는 없을까?

``` js
const data = fileData('/path/file.txt')
console.log(data)
// 이렇게 동기프로그램인 java처럼 할 수는 없는 걸까?
```

그냥 자바처럼 한줄에 명령어를 써놓고 코드를 짜면 안되는건가? 라는 의문에 ES8은 대답했다.

> Async / Await을 써. 


#### 3. async/await

Promise 로 감싼 2번의 promise pattern의 예제를 이렇게 바꿀 수 있다.

``` js

async function start(){
  const data = await fileData('path/file.txt')
  if(data.errorText)
  // ...) 생략
  const result = data
  // ...) 생략
}

const fileData = (path) => {
  return new Promise((resolve, reject) => {
    try {
      fs.fileRead(path, (err,data) => {
        if(err) reject(err)
        resolve(data) // resolve 한 데이터가 promise의 결과값으로 빠져나간다.
      })
    } catch (e) {
      reject(e)
    }
  })
}
```



이 문법을 쓰려면 함수 앞에 async 키워드를 붙여야 Promise로 wrapping된 반환값 앞에 await를 붙여서 바로 then으로 반환될 결과값을 받아 사용할 수 있다. 
이 부분을 처음 하는 사람이라면 **쉽지 않다.** 이건 일부러라도 설명을 안넣었다. 
직접 찾아서 공부하길 바란다.

#### 4. generator

*(사실 나온 순서대로만 따지면 async/await이 가장 나중에 나왔다. 
하지만.. generator를 마지막에 둔 이유는 사용빈도가 async/await 보다 적으며 promise pattern 에서 바로 async/await를 쓰는 패턴이 일반적으로 많이 사용되고 있어 미루었다.)*

제너레이터는 함수의 실행을 중간에 멈추었다가 필요한 시점에 다시 재개할 수 있다. 일종의 코루틴(Coroutine) 이라고 볼 수 있는데, 이 위키 페이지에도 설명되어 있듯이, 코루틴과는 다르게 멈출 때 돌아갈 위치를 직접 지정할 수 없고, 단순히 호출자에게 제어권을 넘겨주게 된다(그래서 세미-코루틴이라 불린다).

``` js
function* myGen() {
  yield 1;
  yield 2;
  yield 3;
  return 4;
}

const myItr = myGen();
console.log(myItr.next());  // {value:1, done:false}
console.log(myItr.next());  // {value:2, done:false}
console.log(myItr.next());  // {value:3, done:false}
console.log(myItr.next());  // {value:4, done:true}
```

파이썬 개발을 경험해 보았다면, iterator를 만들면서 generator를 많이 봐왔을겄이다. 사용은 python의 generator하고 많이 닮아있다.
사실 generator는 async/await이 나오게 되면서 사람들이 잘 찾지않게된 기능인데, async/await하고는 일단 제공하는 기능이 다르다
generator는 Promise로 랩핑을 하지 않으며, 무엇보다 generator는 iterator를 위한 기능이기 때문에 이 둘은 서로 다른 역할이며 다른 기능이다.
그러므로 즉 대체되는 기능이 아니라는 것이다. 

처음에 generator가 나왔을때에는 신기해하며 '드디어 then 을 적게 볼수 있어!'라는 말이 나왔었지만 async/await이 나오자마자 generator에 대한 감사의 소리는 들리지않았다.
개인적인 생각이지만 사람들이 가장 먼저 필요했던것은 generator의 iterator에 대한 비동기처리를 동기식 처리같은 코드로 만드는게 아닌 
일반적인 비동기 입출력에 대한 동기코드로 만드는것이지 않나 싶다. (그게 더 편하니까)


### 12. 함수형 프로그래밍

요즘 http://www.yes24.com/24/Goods/56885507 [함수형 자바스크립트 프로그래밍:유인동 저] 이라는 책을 읽고있는데,
왜 함수형 함수형 하는지 알거같다. 객체지향은 데이터 중심적인 코드를 지향했었다면, 함수형 프로그래밍은 로직중심의 코드를 지향하고 있다.
함수(로직)을 잘게 잘게 최소단위로 잘라서 어느 기능에도 필요하다면 사용될 수 있도록 만드는 프로그래밍이다. 음... 책사서 챕터 1까지만 해보면 얼마나 재미있는것인지 알게 된다.
또는 [인프런의 유인동씨의 함수형 프로그래밍강좌](https://www.inflearn.com/course/%ED%95%A8%EC%88%98%ED%98%95-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/)를 보는것도 나쁘지 않은 방법인것 같다.

``` js 

// ...(생략) // 여러 함수 선언

//3. 모든 가격 구하기
_.go(products, //이거 함수임
  total_price, // 이것도 함수
  console.log);

//4. 선택 된 총 가격 구하기
_.go(products,
  _.filter(_get('is_selected')),
  total_price, // 이것도 함수
  console.log);
```

이게 함수형 프로그래밍으로 코드가 작성된다면 로직은 아마... 이렇게 작성되지 않을까 싶다. [(실제 예제 소스코드임)](https://github.com/indongyoo/functional-javascript/blob/master/%EC%9D%B8%ED%94%84%EB%9F%B0-%EB%8F%99%EC%98%81%EC%83%81-%EA%B0%95%EC%9D%98-%EC%98%88%EC%A0%9C/6.%20%EC%8B%A4%EC%A0%84%EC%BD%94%EB%93%9C%EC%A1%B0%EA%B0%81-2.html)
유인동 저의 자바스크립트 함수형 프로그래밍(책)에서 언급한 주요 키워드들이 있는데 이 키워드를 미리 알아 놓는다면, 나중에 가져다 쓸 라이브러리를 분석하는데에 있어 도움이 되지 않을까 싶다.

### 13. jQuery 지양

**vanila.js란?**

http://vanilla-js.com/ 에 들어가서 직접 다운받아 보길 바란다. 
개발자 유우머를 볼 수 있을것이다. vailla.js란 그냥 어떠한 라이브러리도 쓰지 않고 직접 코드를 작성하여
순수 브라우저의 기능이나 자바스크립트 엔진의 기능을 순수히 이용하는게 더 좋다라는것을 강조하기위한 개발자식 `유우머`이다.

``` js
// vanila.js

```

jQuery는 크로스브라우징의 DOM Element를 다루는데 아주 훌륭한 라이브러리 이며 한 web2.0부터 web3.0 초반까지는 정말 jqeury 없으면 개발을 못할정도로 필수적인 라이브러리였다.
하지만 babel이 나오기도 했고 각 다른 바르오저 들이 점점 javascript의 스펙을 맞춰나가고 있어, jQuery기반의 라이브러리를 쓰지않고 vanila.js로 크로스브라우징 문제를 해결할 수 있게 되었다.
심지어 babel을 이용해서 ECMA문법의 버전을 바꿀수도 있기 때문에 jQuery의 필요성이 점차 사라지게 되었다.

현재 UI-Framework나 차트같은것들도 jQuery를 기반으로 만들어진것들이 많으나. jQuery 기반이 아닌 라이브러리가 더 많아 지고 있는 추세이기도 하다.
어쩔수 없이 jQuery를 쓰는경우도 있지만 의도적으로 jQuery를 쓰려하진 않는 추세이다.

별개의 이야기지만 '저거 바닐라로 짯냐?' 라는 말은 '라이브러리 없이 순수javascript로 짯냐?' 라고 말하는것과 같다. 
개발자 식의 유우머인 vanilla.js(개발자식 유우머)는 어쩌면 jquery에 대한 의존에 대해 불편을 느낀 사람들에 의해서 나온것일지도 모른다.
무튼 현재에는 '굳이 jquery를 이용할 필요가 없다.'는 이유로 역사의 뒤안길로 사라지고 있는 중 이다.

하지만 테이블이나 그래프 그릴때에는 찾게된다... 직접 개발하기에는 개발시간이 걸리기 때문..에...

# 결론

1. eslint - 쓰셔야 합니다 안쓰면 안됩니다.
2. babel - 쓰셔야 합니다 안쓰면 안됩니다.
3. webpack & parcel.js - 이거 없이 배포가 어렵습니다. 물론 할 babel이나 리소스를 packaging 안한다면요.
4. es8 - 각 버전별 새로운 소식들은 그냥 알고 있으면 좋습니다.
5. typescript 와 flow - 이건 저도 안써본거고 포스팅하면서 조사한거고.. 제 스승 velopert님께서 flow를 쓰시길래 저도 써보려합니다.
6. arrow function VS regular function - this(context) 의 여부입니다.
7. class 와 prototype - 비교글만 봐도 됩니다.
8. 변수 var, const, let - var 쓰지마세요. 스코프와 클로저에 대해 이해도가 깊다 해도 팀원들을 위해  
9. for loop - 코드 짜는사람의 스타일이긴 한데, 특이사항이 아니면 잘 안쓰려고 합니다.
10. spread 연산자 *비구조할당 - 자주쓰세요 코드가 깔끔하게 변합니다.
11. 비동기처리 하기 // async/await & generate & promise & callback - promise 와 async/await 반드시 알고있어야 합니다.
12. 함수형 프로그래밍(not 함수지향 프로그래밍) - 한번쯤 보는것은 나쁘지 않습니다.
13. jQuery 지양 - 으으.. 정말 쓰기 싫은데...(라고 말하며 열심히 쓰고있습니다)라는 생각이 들게 하는 고전 라이브러리입니다.


# 주의 

거듭 강조하지만 해당블로그의 내용은 굉장히 주관적인 내용이 많습니다. 하지만 이에 대한 토론 및 피드백은 열렬히 환영하며 잘 받아드리겠습니다.
감사합니다.