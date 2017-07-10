#!/bin/bash
ERR_CODE=1


if [ $# -eq 0 ]; then
  #�t�@�C�����w�肳��Ȃ������ꍇ
  echo '�����̐����s���ł�'
  exit $ERR_CODE
fi


#�w�肳�ꂽ�t�@�C������ݒ�
if [ $# -eq 1 ]; then
  FILENAME="$!"
elif [ $# -eq 3 ]; then #�I�v�V�����������Ă����ꍇ
  FILENAME="$3"
else
  echo '�����̐����s���ł�'
  exit $SUCCESS_CODE 
fi


#�f�B���N�g���̑I��A�쐬
MKDIR="./memo"
if [ "$1" == "-d" ]; then
  MKDIR="${MKDIR}/$2"
fi

[ ! -d MKDIR ] && mkdir -pv MKDIR

MKFILE="${MKDIR}/${FILENAME}"



#�ꎞ�t�@�C�����쐬���āA�����ɓ��͊J�n
temp_file="$(mktemp -d)" #/tmp�z���Ƀ����_���Ȗ��O�̃t�@�C�����쐬�����

date="## `date +%D`"
now_date_grep=`cat "${MKFILE}" | grep "${date}"`
if [ "${now_date_greo}" == "" ]; then #�������Ƀ���������Ă����ꍇ�A���t�^�C�g����ǉ����Ȃ�
  "${date}" > "${temp_file}"
  echo >> "${temp_file}"
  vi +2 "${temp_file}"
else
  vi "${temp_file}"
fi


#�ꎞ�t�@�C���̓��e�����ۂ̃t�@�C���ɒǋL
echo "\n\n" >> "${MKFILE}" 
cat "${temp_file}" | "${MKFILE}"



#�I������
trap '
  rm ${temp_file}
' EXIT



