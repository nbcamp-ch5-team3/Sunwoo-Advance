# Advance: SearchBook
## 소개
> 앱 개발 심화주차 개인과제 Advance 과제 SearchBook 앱을 구현했습니다.  
> 단계별로 요구사항에 맞게 구현했습니다. (아직 구현은 Lv3까지 완료하였고, 추후에 나머지도 구현할 예정)   
> SwiftLint, SwiftFormat을 사용해봤습니다.  
> MVVM 구조를 기반으로 클린 아키텍처을 구현하려고 해봤습니다.  

## 기술
- 개발환경: Xcode, iOS, App
- 언어: Swift
- 라이브러리: SnapKit, Alamofire, RxSwift

## 설명
### Lv1
- 2개의 탭 과 3개의 화면을 가진 앱 화면 초기 세팅
- 책 검색 화면, 책 장바구니 화면, 책 상세 화면(모달)
> ![Simulator Screen Recording - iPhone 16 Pro - 2025-05-14 at 14 34 35](https://github.com/user-attachments/assets/7a8be0ec-7fb6-4410-b0c1-a19c06ff0773)

### Lv2
- 책 검색 화면 구현
- `UISearchBar`를 사용하여 책을 검색하면 검색 결과 리스트에 책 목록이 등장
- 검색 결과 리스트는 `CompositionalLayout`을 활용하여 `CollectionView` 구현
- 검색에는 카카오 책 검색 REST API 를 이용
> ![Simulator Screen Recording - iPhone 16 Pro - 2025-05-16 at 17 37 10](https://github.com/user-attachments/assets/81f1d56f-6d93-4a35-9178-0c35bef37774)

### Lv3
- 책 상세 보기 & 담기 기능 구현
- 책 상세 화면에서는 검색 결과 응답 내용을 자세하게 보여줌. (`title`, `authors`, `thumbnail`, `price`, `contents`) 
- 담기 버튼을 누르면 장바구니 페이지에 저장 (`CoreData` 사용)
- 담기 버튼을 누르면 모달이 닫힌 이후, 책 검색 화면에서 "…"책 담기 완료! 라는 알림창을 보여줍니다.
- X 버튼을 탭 하면 모달은 닫힘
- `ScrollView`를 사용하여 책 상세 화면은 컨텐츠 양에 따라 스크롤 가능
- 장바구니 화면에서 전체 삭제 버튼을 누르면 담았던 모든 책 삭제
- `TableView Cell`을 스와이프 방식을 통하여 담은 책 개별삭제
- 추가 버튼을 누르면 첫번째 탭(책 검색 화면)을 보여주고, 서치바를 활성화
> ![Simulator Screen Recording - iPhone 16 Pro - 2025-05-19 at 12 50 19](https://github.com/user-attachments/assets/5c9e8c72-27fd-46ba-bece-3826fb3c0768)

## 프로젝트 구조
```
├── BookSearch
│   ├── Application
│   │   ├── APIKey.swift
│   │   ├── AppDelegate.swift
│   │   ├── DIContainer
│   │   │   ├── DIContainer.swift
│   │   │   ├── DIContainer+DataSource.swift
│   │   │   ├── DIContainer+Repository.swift
│   │   │   ├── DIContainer+UseCase.swift
│   │   │   ├── DIContainer+ViewController.swift
│   │   │   └── DIContainer+ViewModel.swift
│   │   └── SceneDelegate.swift
│   ├── Data
│   │   ├── Model
│   │   │   ├── BookResponse.swift
│   │   │   └── Persistence
│   │   │       ├── BookCart+CoreDataClass.swift
│   │   │       ├── BookCart+CoreDataProperties.swift
│   │   │       └── BookSearch.xcdatamodeld
│   │   │           └── BookSearch.xcdatamodel
│   │   │               └── contents
│   │   ├── RepositoryImpl
│   │   │   └── DefaultBookRepository.swift
│   │   └── Source
│   │       ├── Local
│   │       └── Remote
│   │           └── BookDataSource.swift
│   ├── Domain
│   │   ├── Entity
│   │   ├── Protocol
│   │   │   ├── Repository
│   │   │   │   └── BookRepository.swift
│   │   │   └── UseCase
│   │   │       └── SearchBookUseCase.swift
│   │   └── UseCaseImpl
│   │       └── DefaultSearchBookUseCase.swift
│   ├── Presentation
│   │   ├── Manager
│   │   │   └── CoreDataManager.swift
│   │   └── Scene
│   │       ├── BookCart
│   │       │   ├── ViewController
│   │       │   │   ├── BookCartViewController.swift
│   │       │   │   ├── BookCartViewController+UICollectionViewDataSource.swift
│   │       │   │   ├── BookCartViewController+UICollectionViewDelegate.swift
│   │       │   │   └── SubView
│   │       │   │       ├── AddBookCartList.swift
│   │       │   │       ├── CartCell.swift
│   │       │   │       └── CartHeaderView.swift
│   │       │   └── ViewModel
│   │       │       └── BookCartViewModel.swift
│   │       ├── BookDetail
│   │       │   └── ViewController
│   │       │       ├── BookDetailViewController.swift
│   │       │       └── SubView
│   │       │           ├── BookDetailView.swift
│   │       │           └── DetailButtons.swift
│   │       ├── BookSearch
│   │       │   ├── ViewController
│   │       │   │   ├── BookSearchViewController.swift
│   │       │   │   ├── BookSearchViewController+BookDetailViewControllerDelegate.swift
│   │       │   │   ├── BookSearchViewController+UICollectionViewDataSource.swift
│   │       │   │   ├── BookSearchViewController+UICollectionViewDelegate.swift
│   │       │   │   ├── BookSearchViewController+UISearchBarDelegate.swift
│   │       │   │   └── SubView
│   │       │   │       ├── BookSearchBarView.swift
│   │       │   │       ├── BookSearchResultList.swift
│   │       │   │       ├── ResultCell.swift
│   │       │   │       └── SectionHeaderView.swift
│   │       │   └── ViewModel
│   │       │       └── BookSearchViewModel.swift
│   │       └── TabBar
│   │           └── TabBarController.swift
│   └── Resource
│       ├── Assets.xcassets
│       │   ├── AccentColor.colorset
│       │   │   └── Contents.json
│       │   ├── AppIcon.appiconset
│       │   │   └── Contents.json
│       │   └── Contents.json
│       ├── Base.lproj
│       │   └── LaunchScreen.storyboard
│       └── Info.plist
└── BookSearch.xcodeproj
    ├── project.pbxproj
    ├── project.xcworkspace
    │   ├── contents.xcworkspacedata
    │   ├── xcshareddata
    │   │   └── swiftpm
    │   │       ├── configuration
    │   │       └── Package.resolved
    │   └── xcuserdata
    │       └── snoo.xcuserdatad
    │           └── UserInterfaceState.xcuserstate
    └── xcuserdata
        └── snoo.xcuserdatad
            └── xcschemes
                └── xcschememanagement.plist

```

