1. 서버리스 인프라에 대해

가볍게.. 누구나가 알 수 있는것을 시작으로 한다.


IaaS
PaaS  monolithic, serverless
SaaS
-----------
BaaS  서버리스의 인프라
FaaS
DbaaS


2. 서버리스 입문하기전에 아키텍쳐에 대한 이해를 먼저

먼저 MSA에 대해서 알아야하고
MSA를 알려면 과거부터 지금까지의 아키텍쳐 페러다임은 어때왔는지도 알아야 할 필요성이 있겟죠?

monolithic -> SOA
           |
          MSA

1-1. monolithic이란?
1-2. monolithic의 장점
1-3. monolithic의 문제점
1-4. SOA의 필요성 언급

1-5. SOA란?
1-6. SOA의 장점
1-7. SOA의 문제점
1-8. MSA의 필요성

1-9. MSA란?
1-10. MSA의 장점
1-11. MSA의 문제점
1-12. MSA의 방향

3. lambda에 대해서 약을 팔아보자.

1번에서 언급한 MSA의 단점들이 얼마나 해소가 되었는가? 에 대해서 강력히 설명.


4. 서버리스 이용방식

3-1. 전통적으로 직접 하나하나 눌러줘서 하는 방식
3-2. 전통적으로 zip파일을 업로드 하는 방식
3-3. serverless
3-4. SAM을 이용해서 하는 방식

5. serverless의 장점설명

6. 예제 및 실습

- 준비작업: AWS계정, IAM셋팅하기, Mac Profile Manager 설치해주기

7. lambda를 운영하면서 겪게 되는 문제들

6-1. 크롤링 및 배치용도
6-2. 