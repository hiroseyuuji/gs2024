gs2023
======
利用法
------
1. [replit](https://replit.com/)にログインしておきます
2. https://replit.com/@koekionline1/gs2023 を開きます
3. 右上の [Fork] ボタンを押しName/Descriptionを確認後 [Fork Repl] を押します
4. Run ボタンを押し左側にできた out/ を開きPDFファイルをクリックします


実行
------------
上のRunボタンを押すか、Shell ウィンドウで

``` shell
chmod +x replgen.rb
./replgen.rb meibo.csv
```
します。chmod は初期設定後の1回だけであとは不要です。

問題
----
1. template.texを修正し、表に見出し行を追加し以下のような表示になるよう
にしてください。
2. 1に加え、3列めに「秘密のじゅもん」列を足してください。
3. jumon.csvをmeibo.csvの3列めに追加し、プログラムから生成される表に「秘
密のじゅもん」が入るようにしてください。

### 問1の表の例
ユーザID|氏名
--------|----
id0001	|ここに氏名

### 問2の表の例
ユーザID|氏名|秘密のじゅもん
--------|----|---------------
id0001	|ここに氏名|


使用上の注意
------------
Replit上のファイルは公開されます(無料モードの条件)。
プライバシーに気をつけてください。

データについて
--------------
名簿データは ChatGPT で以下のように司令して生成しました。

``` shell
50人分の以下のようなダミーCSVデータを作って下さい。
ユーザID,漢字氏名,ひらがななまえ
```
何度やっても五十音順で生成してくれなかった以下のようにして作り変えました(zsh)。

``` z-shell
head -1 orig.csv > meibo.csv
tail -n +2 orig.csv|cut -d, -f2,3| {i=1
  typeset -Z 4 i
  while read l; do
    echo "id$i,$l"
	i=$((++i))
  done} >> meibo.csv
```
