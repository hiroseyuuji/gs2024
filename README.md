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
```
