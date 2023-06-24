gs2023
======
利用法
------
1. [replit](https://replit.com/)にログインし新規作成
2. [+Create repl] に進み [Import from GitHub] でこのURLを入れる
3. Configure replで run command を ruby replgen.rb meibo.csv にして Done
4. Shellタブで uplatex と実行して選択肢最後の texlive.combined.scheme-full.out
5. 同じく dvipdfmx と実行して選択肢最後の texlive.combined.scheme-full.out
6. 4,5が終わったら一度 Replitアイコンから Home に戻って再度gs2023を開く

4,5はとても時間がかかります。ゆっくり待ちましょう。

実行
------------
上のRunボタンを押すか、Shell ウィンドウで

``` shell
chmod +x replgen.rb
./replgen.rb meibo.csv
```
します。chmod は初期設定後の1回だけであとは不要です。


使用上の注意
------------
Replit上のファイルは公開されます(無料モードの条件)。
プライバシーに気をつけてください。

名簿データは ChatGPT で以下のように司令して生成しました。

``` shell
50人分の以下のようなダミーCSVデータを作って下さい。
ユーザID,漢字氏名,ひらがななまえ
なお、ユーザIDは以下の形式でお願いします。
id00013
最初の "id" は固定で、残りの00013の4桁部分「0001」は、
1人目からの五十音順で並べたときの通し番号です。
00013のさいごの「3」つまり数字部分の最後の桁はチェック・ディジットにしてください。
まとめると
idXXXXY,漢字氏名,ひらがななまえ
のようなランダムダミーデータを、ユーザIDが「ひらがな名前」の五十音順でふられたものを50件お願いします。名前の分布は可能なら山形県の苗字分布に従ったものにしてください。
```
