#!/bin/bash
ERR_CODE=1


if [ $# -eq 0 ]; then
  #ファイルを指定されなかった場合
  echo '引数の数が不正です'
  exit $ERR_CODE
fi


#指定されたファイル名を設定
if [ $# -eq 1 ]; then
  FILENAME="$!"
elif [ $# -eq 3 ]; then #オプションがつけられていた場合
  FILENAME="$3"
else
  echo '引数の数が不正です'
  exit $SUCCESS_CODE 
fi


#ディレクトリの選定、作成
MKDIR="./memo"
if [ "$1" == "-d" ]; then
  MKDIR="${MKDIR}/$2"
fi

[ ! -d MKDIR ] && mkdir -pv MKDIR

MKFILE="${MKDIR}/${FILENAME}"



#一時ファイルを作成して、そこに入力開始
temp_file="$(mktemp -d)" #/tmp配下にランダムな名前のファイルが作成される

date="## `date +%D`"
now_date_grep=`cat "${MKFILE}" | grep "${date}"`
if [ "${now_date_greo}" == "" ]; then #同じ日にメモを取っていた場合、日付タイトルを追加しない
  "${date}" > "${temp_file}"
  echo >> "${temp_file}"
  vi +2 "${temp_file}"
else
  vi "${temp_file}"
fi


#一時ファイルの内容を実際のファイルに追記
echo "\n\n" >> "${MKFILE}" 
cat "${temp_file}" | "${MKFILE}"



#終了処理
trap '
  rm ${temp_file}
' EXIT



