# カメラ批評
## サイト概要
既存製品 / 新製品に対して、お店で商品の詳細や、実際の使用感を、
店員から聞き辛いと感じている方はきっといると思います。
その方にとって、SNS は非常に有用な情報源だと考えております。
ちょっとシャイな方も、今一眼を使っていて次はどの筐体にするか考えているユーザーも、
みんなでコミュニケーションを取り合い、購入意欲を刺激し、
ひいては経済を回せるようなきっかけ作りを与えたい。

## サイトテーマ
### テーマを選んだ理由
前職の家電量販店での経験を生かし、一眼レフカメラは見た目ほど難しくなく、
楽しいものだと言う事を、もっと周知させていきたい。

### ターゲットユーザ
アマチュアからプロフェッショナルまで、老若男女を問わない全てのカメラ愛好家。

### 主な利用シーン
一眼レフカメラを導入検討する際に利用価値がある。

## 設計書
### ER図
https://drive.google.com/file/d/1gDqFhiADn8Wrwb7tg7IIyDoWKFn4M4_l/view?usp=sharing

### テーブル定義書
https://docs.google.com/spreadsheets/d/1Yr1T2ljMFAgIiLUh2fwIz7vGZ-fH27ojhK-ww5rLI0Y/edit#gid=348047673

## 機能一覧
- 国際化API (i18n)
- ログイン機能 (devise)
- いいね、コメント機能 (非同期化)
- 検索機能 (ransack)
- 星評価機能 (raty)
- 画像スライダー (swiper)
<https://docs.google.com/spreadsheets/d/10tBmx4HwPR1lWAbOeo9wjkDPpt6Cfcp2BKt7uadJ91A/edit#gid=0>

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9