# YangSuBin
![표지_양수빈](https://user-images.githubusercontent.com/60260284/113490330-336b2600-9504-11eb-9baa-099bfad2549c.png)

| 세미나 | 기본 과제 | 도전 과제      |
| ------ | --------- | -------------- |
| 1주차  | O         |                |
| 2주차  | O         | X              |
| 3주차  | O         | 1,2번 O, 3번 X |

------

### 1주차

[화면전환]

###### nextVC에 넘어갈 뷰컨 인스턴스 저장

`guard let nextVC = self.storyboard?.instantiateViewController(identifier: " 넘어갈 뷰컨 이름") as? 넘어갈 뷰컨 이름 else{return}` 



##### modal

###### 특정 위치를 누르면 새로운 창이 기존 창 위에 뜨는 것

모달을 띄우는 present 메서드

`self.present(nextVC, animated: true, completion: nil)`

모달 띄우는 옵션

`nextVC.modalPresentationStyle = fullScreen`

모달 전환 옵션

`nextVC.modalTransitionStyle = coverVertical`

모달창 끄는 메서드

`self.dismiss(animated: true, completion: nil)`



##### navigation

###### 특정 버튼을 누르면 화면이 오른쪽으로 넘어가는 것

navigation stack에 뷰 쌓기 push

`self.navigationController?.pushViewController(nextVC, animated: true)`

navigation stack에서 pop

`self.navigationController?.popViewController(animated: true)`



------

### 2주차

[Tab bar, layout, StackView, ScrollView]

##### Tab bar



##### layout

1. Fram 기반으로 레이아웃 잡기 (Frame - based)

2. Autoresizing masks

3. <u>Autolayout</u>

   : View 사이의 관계 정의

   해당 제약 조건을 바탕으로 각 뷰의 크기 결정 (= 제약 조건이 충분하지 않으면 뷰의 크기를 결정할 수 없음



##### StackView

view 요소들을 일정한 간격으로 가로 또는 세로로 배치하기 위해 사용하는 형태



##### ScrollView

UIScrollView > UITableView, UICollectionView의 SuperClass



------

### 3주차

[데이터 전달, table view, collection view]

##### 데이터 전달

직접 전달 방식 / ~~간접 전달 방식~~

1. 프로퍼티에 접근 (present / push)

   `데이터를 전달받을 뷰컨) 프로퍼티 생성 (var 인스턴스이름 : String = "" / let 인스턴스이름 : String = "apple")`

   `데이터를 전달할 뷰컨) (인스턴스이름).프로퍼티 = 전달할 데이터`

2. Segue prepare 메소드

3. Protocol / delegation

   delegate pattern

   : 하나의 객체가 모든 일을 처리하는 것이 아닌 처리해야 하는 일부를 확장해 다른 객체에게 넘기는 것............

   *pop 하면서 데이터 전달 (뷰컨2 -> 뷰컨1)

   `뷰컨1) protocol 채택(class) + 실제 구현(func) + delgate 위임(nextVC.delgate = self)`

   `뷰컨2) 타입이 protocol인 property 생성 (var delegate : 프로토콜이름) + delegate 사용 + 프로토콜 생성 (protocol)`

4. closure

5. NotificationCenter

