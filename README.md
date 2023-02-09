# 見守りアプリ「ミマモル」

## 〜ミマモルとは〜

 このアプリは,一人暮らしをしている祖父を人感センサーを使い、遠くからでも見守ることができるようにするために作ったアプリです。
 
### 〜ミマモルの概要〜
 
  ミマモルは人感センサーを使い、反応した時間をFirebaseのRealtime Databaseに記録し、「ミマモル」で確認できるようになっています。
  
### ミマモルの機能紹介

#### 〜記録確認機能〜

まず記録を確認できる画面は３つあります。

一つ目は”ホーム画面”です。
”ホーム画面”では、直近で記録した時間を見ることができ、その日に何回記録されたかも数字で確認することができます。
それからセンサーで誰を記録しているか分かりやすくするために、対象者の名前も表示しています。

二つ目は”記録画面”です。
”記録画面”では、その日に記録した記録を全て見ることができます

三つ目は”カレンダー”です。
”カレンダー”の画面は”設定画面”から開くことができ、カレンダーでは指定した過去の記録を全て確認することができます。
もし記録がない日があれば、'記録なし'と表示されるようになっています。

#### 〜設定〜

先ほどの”カレンダー”の説明で出てきた”設定”ですが、”対象者設定”と"カレンダー"そして”使い方”の画面を開くことができます。
”カレンダー”は先ほども説明した通り、指定した過去の記録を見ることができます。”使い方”では各画面の説明を書こうとしているのですが、まだ完成ではないので記入していません。
では”対象者設定”なのですが、これは”ホーム画面”でにある対象者名を10文字いないで変更ができる機能です。
