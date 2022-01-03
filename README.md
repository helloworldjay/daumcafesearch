# 🔎 Daum Cafe 검색 앱
***

## 목표
- [Kakao API](https://developers.kakao.com/docs/latest/ko/daum-search/dev-guide#search-cafe)를 활용해서 다음 카페를 검색하는 앱을 구현해요. 

- 검색어를 입력받아 정확도(Accuracy) 기준으로 검색된 결과물을 테이블로 보여줘요. 각 셀을 클릭하면 자세한 내용과 해당 카페로 직접 이동할 수 있는 버튼을 볼 수 있어요.

- MVVM 및 Snapkit을 사용해본 적이 없어 학습하며 결과물을 만드는것이 목적이에요.

## 환경
- iOS: 15.0
- 구조: MVVM
- Packages: Snapkit, Alamofire, Then, KingFisher

## 작업 방식
- 우선 작업을 Jira 티켓 단위로 나누어 구성해요. 작업 기준은 아래와 같아요.

  ![Image 70](https://user-images.githubusercontent.com/58765757/147561232-21aa1b65-d949-4c6d-b539-25bd842543d7.png)

  
  각 티켓 단위로 PR을 생성해요. PR은 Jira 티켓 번호로 네이밍을 시작해요.
  
- 브랜치는 main에 merge하기 전 개별 작업들을 모을 develop이 있어요. PR 단위로 develop 브랜치에서 파생된 브랜치들을 생성해요. 
  브랜치 이름은 "작업 특성/Jira티켓이름-작업내용" 으로 구성해요.
  ex) feature/DEV-13-explain-project
  
- 기존에는 git issues로 작업 관리를 했었지만 이 프로젝트에서는 issues는 이슈로만 관리하고, 작업 관리는 Jira로 할 계획이에요.
  
## 기록
- 작업과 관련된 설계와 고민, 학습의 내용들은 [개인 블로그](https://jayb-log.tistory.com/) 에 작성할 계획이에요. 각 PR에 관련 블로그 글 링크를 기록할 예정이에요.

## 테스트
- 유닛 테스트를 진행해요.
- given / when / then 을 기준으로 테스트해요.

## 블로그
- [프로젝트를 시작하며](https://jayb-log.tistory.com/301)
- [앱 구조 설계하기](https://jayb-log.tistory.com/303)
- [UIColor Custom하기](https://jayb-log.tistory.com/304)
- [Entity 및 모델 구현하기](https://jayb-log.tistory.com/306)
- [Kakao API 사용시 Date 타입이 iso8601일 때 iOS에서 Decoding이 안되는 경우](https://jayb-log.tistory.com/307)
- [네트워크 기능 구현하기](https://jayb-log.tistory.com/308)
- [문자열에서 HTML 태그만 제거하기](https://jayb-log.tistory.com/309)
- [배열의 요소 안전하게 접근하기](https://jayb-log.tistory.com/311)
- [시뮬레이터 없이 UI 확인하는 Preview 기능 만들기](https://jayb-log.tistory.com/312)
