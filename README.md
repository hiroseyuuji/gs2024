gs2024
======
利用法
------
1. [replit](https://replit.com/)にログインしておきます
2. https://replit.com/@koekionline1/gs2024 を開きます
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

このリポジトリの更新方法
------------------------
1. 画面左下「Tools」内にある Git をクリック
2. 自力で修正したファイルをコミット(登録)するかリセット(破棄)する  
   リセットする: → [Reset All]ボタンを押す
   コミットする: → [Commit Message]欄に修正内容を示す文を入れて  
   Stage and commit all changes を押す
3. Pull X commit with rebase と出ているボタンを押す


問題
----
1. meibo.csvの1行目と2行目の間に  
   id0000,鶴岡至,つるおかいたる  
   を足してPDFを生成して1件増えることを確認してください。
2. template.texを修正し、表に見出し行を追加し以下のような表示になるよう
にして生成されるPDFを確認してください。
3. 上記に加え、3列めに「秘密のじゅもん」列を足しPDFを確認してください。
4. jumon.csvをmeibo.csvの3列めに追加し、プログラムから生成される表に「秘
密のじゅもん」が入るようにしてください。

### 問2の表の例
ユーザID|氏名
--------|----
id0001	|ここに氏名

### 問3の表の例
ユーザID|氏名|秘密のじゅもん
--------|----|---------------
id0001	|ここに氏名|

問題(続編)
----------
1. pasteコマンドの使い方を確認する
2. pasteコマンドを用いてmeibo.csvとjumon.csvからじゅもん入りの  
   mj.csvを作成する。
3. template.tex(オリジナル版)を duplicate して名前を  
   jumon.tex に変えてから、(前問同様)じゅもんが入るようにしてください。
4. 表(tabular)のあとにQRコードを読み取る記述を入れてください。

### QRコードの作成とLaTeX文書への入れ方
#### QRコード生成
シェルを起動して以下のように実行します。

```
./mkqr.sh
```
もし、エラーになる場合は上記コマンドを実行する前に以下のコマンドを打ちます。
```
chmod +x mkqr.sh
```
このファイルが何をしているか cat mkqr.sh [Enter]
として確かめておくとよいでしょう。

#### LaTeX文書への画像の入れ方

``` tex
\includegraphics[width=2cm]{画像ファイル名}
```
の書式で画像ファイルをその位置に取り込むことができる。
この例では、out/id0001.png のようなファイル名なので、  
out/::id::.png  
がテンプレートファイル名になることがわかる。



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
