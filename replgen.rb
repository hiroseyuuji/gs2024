#!/usr/bin/env ruby
require 'csv'		# CSV.readを使用するため
require 'fileutils'	# Dir.chdirを使用するため

outdir	= ENV["OUTDIR"] || "out"	# 結果書き込みディレクトリ
tex = IO.read("template.tex")		# template.texの中身すべてをtexに

preamble, body = tex.scan(/(.*)\\begin{document}(.*)\\end{document}/m)[0]
#                           ↑                   ↑
#  template.tex全体部分からこの2つに該当する部分が preamble, body に入る
# Rubyの文字列のscanメソッド参照
# https://docs.ruby-lang.org/ja/latest/method/String/i/scan.html
# 最後の //m は行をまたぐ正規表現照合を行うため(これがないと1行だけ検索する)

newbody = CSV.read(ARGV[0], headers:true).collect do |row|
  # ユーザID,氏名,読み仮名  のCSVの各カラム値は
  # row['ユーザID'], row['氏名'], row['読み仮名']
  # で得られる
  body.gsub(/::([^:]+)::/){|w| row.fetch($1, "")}
  # bodyから ::カラム:: を探し、「カラム」に相当する部分を
  # CSVデータの row[カラム] の値にすべて(g)置き換える(sub)
end.join
#  joinで do...end で得られた結果を文字列結合する

test(?d, outdir) or Dir.mkdir(outdir)		# out/ がなければ作成(定石)
open(outdir+"/output.tex", "w") do |out|	# out/output.texに書き込む
  out.print preamble				# out. がファイル書き込み指示
  out.print '\begin{document}'
  out.print newbody				# 全員分結合された本文を出力
  out.print '\end{document}'
end
Dir.chdir(outdir) do		# 一時的に out/ に移動して do...end 内部を実行
  # "and" は左の文が成功したら右の文を実行する
  # system はRubyプログラムの子供としてシェルを起動しコマンド実行するメソッド
  # つまり、uplatexがうまく行った場合に限り dvipdfmx を実行する
  system "uplatex output.tex" and system "dvipdfmx -l -p a6 output"
end
