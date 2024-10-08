# XCTest Playground 🛠️

このリポジトリは、XCTestの基本的な概念を実際にコードを書きながら学ぶためのプレイグラウンドです。XCTestは、iOS開発においてユニットテストやUIテストを実行するためのフレームワークです。本リポジトリでは、XCTestを効果的に使うためのサンプルコードやガイドを提供しています。

## 目次 📚
1. [XCTestとは](#XCTestとは)
2. [リポジトリのセットアップ](#リポジトリのセットアップ)
3. [基本的なユニットテスト](#基本的なユニットテスト)
4. [UIテストの概要](#UIテストの概要)
5. [カスタムテストの作成](#カスタムテストの作成)
6. [テストの実行とデバッグ](#テストの実行とデバッグ)
7. [貢献方法](#貢献方法)
8. [ライセンス](#ライセンス)

---

## XCTestとは

**XCTest**は、Appleが提供するテストフレームワークで、iOSアプリケーションの自動化されたテストを作成および実行するために使用されます。XCTestを使用すると、次のことができます：

- ユニットテスト：コードの個々の機能が正しく動作しているかをテスト
- UIテスト：アプリのUI要素が正しく表示され、動作するかをテスト

XCTestは、コードの品質を保ち、バグを未然に防ぐための強力なツールです。

---

## リポジトリのセットアップ

### 必要要件

特になし、よっぽど古いXcodeやSwift VersionじゃなければOK

### セットアップ手順
1. このリポジトリをクローンします：
    ```bash
    git clone https://github.com/Masaya1582/XCTest_Playground.git
    ```

2. リポジトリをXcodeで開きます：
    ```bash
    open XCTest_Playground.xcodeproj
    ```

3. `Cmd + U`を押して、既存のテストを実行してみましょう。

---

## 基本的なユニットテスト

まず、XCTestの基本的なユニットテストの書き方を学びましょう。以下は簡単なユニットテストの例です。

```swift
import XCTest
@testable import MyApp

class MyAppTests: XCTestCase {
    func testExample() throws {
        let result = someFunction()
        XCTAssertEqual(result, expectedValue, "someFunction() should return the expected value.")
    }
}
```

このテストでは、someFunction()の結果が期待通りかどうかを確認しています。XCTAssertEqualは、結果が予期された値と一致するかを確認するためのアサーションです。

### よく使われるアサーション

- XCTAssertEqual: 二つの値が等しいかを確認
- XCTAssertTrue: 条件が真であるかを確認
- XCTAssertNil: 値がnilであるかを確認

---

## UIテストの概要

XCTestを使用してUIテストを作成することも可能です。UIテストは、アプリケーションのユーザーインターフェースが正しく動作しているかを確認するために使用されます。

``` Swift
import XCTest

class MyAppUITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        let button = app.buttons["MyButton"]
        XCTAssertTrue(button.exists, "The button should be present on the screen.")
        button.tap()

        let label = app.staticTexts["MyLabel"]
        XCTAssertEqual(label.label, "Expected Text", "Label text should change after button tap.")
    }
}
```

このテストでは、ボタンが存在するかを確認し、タップ後にラベルのテキストが期待通りかどうかをチェックしています。

---

## カスタムテストの作成

自分でテストを作成する際のポイントやベストプラクティスについても解説します。

- テスト名は、テスト対象がわかるように具体的にしましょう
- 各テストケースは独立して実行できるように設計します
- テストメソッドは、失敗時にすぐに原因がわかるよう、アサーションのメッセージを明確に記述しましょう

---

## テストの実行とデバッグ

Xcodeでは、Cmd + Uで全てのテストを実行することができます。また、特定のテストだけを実行したり、ブレークポイントを使ってテストのデバッグも可能です。

---

### テストのヒント

- テストが失敗した場合、Xcodeの「テストナビゲータ」で詳細なエラーメッセージを確認しましょう
- テストを自動で実行するには、Xcodeの「スキーム」設定で、ビルド後にテストを実行するように設定することが可能です

---

## 貢献方法

このプロジェクトに貢献するには、以下の手順でプルリクエストを作成してください：

1. このリポジトリをフォークします
2. 新しいブランチを作成します (git checkout -b feature-branch)
3. 変更をコミットします (git commit -m 'Add some feature')
4. プッシュします (git push origin feature-branch)
5. プルリクエストを提出します

---

## ライセンス

このプロジェクトは MIT License のもとで公開されています。
