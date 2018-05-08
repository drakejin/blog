---
layout: post
title: "서버리스 튜토리얼 with lambda project"
description: ㅠㅠ 서버좀 그만 터트리고 싶다.. lambda쓰면 서버 덜 터지겠지..? lambda 프로젝트를 이용한 serverless 프로젝트...
image: 'https://i.imgur.com/eFv895d.png'
category: 'serverless'
tags:
- lambda
- serverless
- monorithic
twitter_text: 서버리스 튜토리얼 with lambda project
introduction: ㅠㅠ 서버좀 그만 터트리고 싶다.. lambda쓰면 서버 덜 터지겠지..? lambda 프로젝트를 이용한 serverless 프로젝트...
---

### 주의

이 블로그의 내용은 대단히 주관적인 내용이 가득합니다.
그리고 `양질의 글`을 읽었지만 `똥글`이 나오는건 제 미숙함 때문입니다.
그럼에도 불구하고 피드백 많이 주신다면 자세히 조사하여 반영하도록 하겠습니다.
또한.. 가능한 링크로 올려놓은 자료들은 반드시 열어보시기 바랍니다. 분명 도움이 될 것입니다.
(- -)(_ _)

# serverless 란?

- **[출처: AWS serverless](https://aws.amazon.com/ko/serverless)**
- **[출처: 위키: 서버리스 컴퓨팅](https://ko.wikipedia.org/wiki/%EC%84%9C%EB%B2%84%EB%A6%AC%EC%8A%A4_%EC%BB%B4%ED%93%A8%ED%8C%85)**
- **[출차: 조대협님의 블로그: 마이크로 서비스 아키텍쳐 (MSA의 이해)](http://bcho.tistory.com/948)**

서버리스 컴퓨팅을 사용하면 **서버를 고려하지 않고** 애플리케이션과 서비스를 구축하고 실행할 수 있습니다. 서버리스 애플리케이션에서는 **사용자가 서버를 프로비저닝, 확장 및 관리할 필요가 없습니다.** 거의 모든 유형의 애플리케이션 또는 백엔드 서비스를 서버리스로 구축할 수 있으며, 애플리케이션을 **고가용성**으로 실행하고 확장하는 데 필요한 **모든 것이 자동**으로 처리됩니다.


서버리스 컴퓨팅(serverless computing)은 클라우드 컴퓨팅 실행 모델의 하나로, 클라우드 제공자는 동적으로 머신 자원의 할당을 관리한다. 가격은 미리 구매한 용적 단위가 아닌 애플리케이션이 소비한 자원의 실제 양에 기반을 둔다. 유틸리티 컴퓨팅의 일종이다.

서버리스 컴퓨팅은 여전히 서버가 필요하므로 부적절한 명칭이다.(올바른 명칭은 `마이크로 서비스 아키텍쳐`) "서버리스 컴퓨팅"이라는 이름이 사용된 이유는 서버 관리 및 용적 계획 결정이 완전히 개발자나 운영자로부터 숨겨져 있기 때문이다. 서버리스 코드는 마이크로서비스처럼 전통적인 스타일로 배치(deploy)된 코드와 결합하여 사용할 수 있다. 대안으로, 애플리케이션들은 순수 서버리스 형태로 작성할 수 있으며 프로비전된 서버를 아예 사용하지 않는다.


마이크로 서비스 아키텍쳐는 대용량 웹서비스가 많아짐에 따라 정의된 아키텍쳐인데, 그 근간은 SOA (Service Oriented Architecture : 서비스 지향 아키텍쳐)에 두고 있다. SOA는 엔터프라이즈 시스템을 중심으로 고안된 아키텍쳐라면, 마이크로 서비스 아키텍쳐는 SOA 사상에 근간을 두고, 대용량 웹서비스 개발에 맞는 구조로 사상이 경량화 되고, 대규모 개발팀의 조직 구조에 맞도록 변형된 아키텍쳐이다.

# serverless 장점

![serverless 뽕에 취한다으으아](https://i.imgur.com/gDQLpna.jpg)

- **[출처: git@DevStarSJ](https://github.com/DevStarSJ/Study/blob/master/Blog/Cloud/AWS/Serverless/MonolithToServerless.01.md)


1. 서버 스케일링이 필요없다.

요즘 서버를 직접 운영하는 경우는 잘 없고 대부분 클라우드 서비스를 이용한다. (ex. AWS의 EC2) 서버가 죽는 대부분의 경우는 서버가 감당가
능한 통신 대역폭, 메모리 용량, 컴퓨팅 능력을 넘어서는 요청이 들어오는 경우이다. 대부분의 경우는 그렇게 요청이 많이 들어오는 것에 대해서
어느 정도 알 수 있으므로, 미리 서버를 많이 늘려놓으면 된다. 그리고 요즘은 클라우드 서비스 상에 컨테이너를 이용해서 스케일링해주는 서비스
를 대부분 제공해주므로, 오토 스케일링을 설정해 놓으면 해결된다. 하지만 컨테이너에 서버 이미지를 복사해서 가동하는데 대략 15분의 시간이 걸린다고 가정했을 때, 15분동안 기존에 실행하고 있던 서버들 이 죽지않고 요청들을 잘 처리해 준다면 문제가 되지 않지만 그러지 못할 경우에는 바로 장애가 발생하는거다. 심지어 ELB에 같이 물렸을 때에 AWS EC2가 이미 전멸해 있고 트래픽은 계속 몰리는 상태에서 AutoScaling으로 삐용하고 올라와도 트래픽 몰매맞고 또 뻗어버린다.

2. 비용

싸다. 다른 말이 더 필요한가 ? AWS EC2 서버로 운영하는것 보다 Lambda + API Gateway를 이용해서 API를 서비스 해보니 훨씬 더 싸다.
EC2의 경우에는 운영중인 서버수 x 서버 인스턴스의 비용 x 서버가 운영중인 기간 (1시간 단위)로 과금이 이루어 진다. Lambda의 경우는 코드
가 수행된 시간을 100ms 단위로 올림하여 과금한다. API Gateway의 경우 100만 요청 당 3.5 USD가 과금된다. 이렇게 봐서는 과연 더 싼지
바로 판단이 안되겠지만, 실제로 운영해보니 훨씬 더 싸다. 비교도 안되게 싸다. 일단 이 두가지가 직접 겪었던 큰 이유다. 이것 말고도 여러가지 발표자료들을 찾아보면 다른 장점들이 많다. 하지만 그건 옵션 사항인듯 하다.

3. Polyglot Programming 가능
각 API 기능별로 다른 언어로 개발이 가능하다. 당연히 그렇겠지. 각각 따로 디플로이 되어서 관리되니깐... 하지만 그렇게 각각의 API를 서로 다
른 언어로 서로 다른 프레임워크를 써서 만들어 올리면 관리는 누가하나 ? 정말 급하게 서비스해야 되어서 아웃소싱으로 가장 자신있는 언어로
최대한 빨리 해주세요. 가 아닌 이상 한 조직에서 이렇게 했을때 과연 장점이 더 클지 단점이 더 클지... 아니면 개발 조직이 엄청나게 크고, API
개발자가 수십명 있을 경우라면 나름 괜찮을것 같기도 하다. 당장 나의 경우만 보더라도 가장 자신있고 가장 빨리 개발이 가능한 언어는 C# 이
다. 하지만 Node.JS 로 API를 개발 중이다. (여기에는 다른 이유도 있긴있다. 아직 AWS Lambda에서 .Net CORE 지원이 믿을만한 수준은
아니라서...)

4. 나머지 장점들..

나머지 장점들은 플랫폼에서 제공하는 기능에 따라 다르기때문에 그것들에 대한 장점은.. 별도로 조사해보길..!

# serverless의 단점

- **출처: [조대협의 블로그: 대용량 웹서비스를 위한 마이크로 서비스 아키텍쳐의 이해: 마이크로 서비스 아키텍쳐의 문제점](http://bcho.tistory.com/948)**
- **주의: 마이크로 아키텍쳐와 람다를 동일선상에 두고 보면 안된다. 마이크로 아키텍쳐에 대한 단점의 설파지 람다의 단점은 아니다.**
- 람다로 넘어오게 되면서 커버되는 점들이 존재하니 그 점 간과하면 곤란하다.

# serverless의 구분

- **출처: [Velopert의 블로그: 서버리스아키텍쳐(Serverless)란?:Serverless! – BaaS 와 FaaS](http://bcho.tistory.com/948)**

BaaS, FaaS 크게 두가지로 나뉘어 질 수 있다.

### BaaS (Backend as a Service)

Firebase가 바로 BaaS 입니다. 이 시스템에서는, 앱 개발에 있어서 필요한 다양한 기능들 
(데이터베이스, 소셜서비스 연동, 파일시스템등)을 API로 제공해 줌으로서, 개발자들이 서버 개발을 하지 않고서도 필요한 기능을 쉽고 빠르
게 구현 할 수 있게 해주고, 비용은 사용 한 만큼 나가게 되죠. 서버의 이용자가 순식간에 늘어나게
되어도, 따로 대비를 안해주어도 알아서 확장이 됩니다.

- 한줄 장점: 개발 공수가 적다. 자원 설정이 필요 없다.
- 한줄 단점: 복잡한 기능설계 불가능. 자원 유료모드로 들어가면 금액 헬(Hell)

### FaaS (Function as a Service)

FaaS 는 프로젝트를 여러개의 함수로 쪼개서 (혹은 한개의 함수로 만들어서), 매우 거대하고 분
산된 컴퓨팅 자원에 여러분이 준비해둔 함수를 등록하고, 이 함수들이 실행되는 횟수 (그리고 실
행된 시간) 만큼 비용을 내는 방식을 말합니다. 바로 AWS lambda같은 녀석이죠!

- 한줄 장점: 개발 공수가 적지만 BaaS 만큼은 아니다. 서버가 내것이 아니라서 최대 호출할 수 있는 양이 정해져 있다. (돈 더 주면 됨)
- 한줄 단점: WebSocket은 불가능, FaaS 제공사에 강한 의존, 함수들은 무상태적(stateless)


# 이 블로그가 포스팅하고자 하는것은 FaaS? BaaS?

개발자는 지옥도를 걸을때가 멋있다고 했다. BaaS는 Firebase쪽이라서 뭔가 더 공부하고싶은 의욕이 사라진다.
FaaS를 공부할 예정이다. 

# 다음 포스팅도 이론이라던데.. 트루?

네. 아직 재밌는 자료들과 경험에 대해서 간접적으로나마 체험해봐야 하기 때문에...!

# Tip & Word

- 폴리그랏(polyglot): 여러 개의 언어를 사용하는 것을 영어로 폴리글랏(polyglot)이라고 말한다. 원래는 한국어나 영어 같은 실제 세계의 언어에 대해서 적용되는 단어지만 이 책에서는 컴퓨터 프로그래밍 언어를 대상으로 사용했다. 새로운 표현은 아니다. 미국의 프로그래밍 업계에서는 폴리글랏이라는 표현을 사용한 지가 이미 오래되었다.

- 오케스트레이션(Orchestration): 오케스트레이션이라는 뜻은 자원을 관리하고, 배치 및 정렬을 자동화 한다는 뜻입니다. 클라우드 컴퓨팅 서비스에서 인스턴스를 하나 생성하기 위해서는 여러 과정이 필요합니다. 인증 키를 발급 받아야 하고, 네트워크가 생성되었는지 확인해야 하며, 보안 룰도 미리 생성해 두어야 합니다. 이런 일련의 과정이 끝나야만 인스턴스를 하나 생성할 수 있습니다.
오케스트레이션은 이런 일련의 과정을 자동화하여 쉽게 인프라를 배포할 수 있도록 지원하는 템플릿 기반의 엔진입니다. 오케스트레이션에서 사용되는 템플릿 언어는 인프라뿐만 아니라 서비스 및 응용 프로그램의 전체 프로비저닝을 자동화하고, 컴퓨팅, 스토리지 및 네트워킹 구성뿐만 아니라 배포 후 작업을 지정할 수 있습니다. 텔레미터 서비스와의 통합을 통해, 오케스트레이션 엔진은 특정 인프라 요소의 자동 스케일링을 수행 할 수 있습니다.

- 컨테이너 오케스트레이션(Orchestration): 일반적으로 애플리케이션은 의도에 따라 애플리케이션이 실행되게 하기 위해 네트워킹 수준에서 정리가 필요한 개별적으로 컨테이너화된 구성 요소(주로 마이크로 서비스로 칭함)로 구성됩니다. 이러한 방식으로 다수의 컨테이너를 정리하는 과정이 컨테이너 오케스트레이션이라고 알려져 있습니다. 컨테이너 오케스트레이션 정의는 오늘날의 개발에서, 애플리케이션은 더 이상 하나의 통일체가 아니라 특정 애플리케이션이 설계 의도대로 기능하도록 함께 작동해야 하는 수십 또는 수백 개의 느슨하게 결합되고 컨테이너화된 요소로 구성됩니다. 컨테이너 오케스트레이션은 개별 구성 요소와 애플리케이션 계층의 작업을 정리하는 과정을 의미합니다. 컨테이너 오케스트레이션의 동작 방식 Apache Mesos, Google Kubernetes, Docker Swarm 등의 플랫폼들은 각자 컨테이너 관리를 위한 자체적인 특별한 방식을 보유하고 있지만, 사용자들은 컨테이너 오케스트레이션 엔진을 통해 컨테이너의 시작 및 중단 시점 제어, 클러스터로 그룹화, 애플리케이션을 구성하는 모든 과정을 관리할 수 있습니다. 사용자들은 컨테이너 오케스트레이션 툴을 통해 컨테이너 구축을 안내하고, 업데이트, 상태 모니터링, 장애 조치 절차를 자동화할 수 있습니다.