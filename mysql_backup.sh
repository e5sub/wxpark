#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��	Wfmysql_backup.sh �WmSW����t�12�,��3:�m�-ӱV���ݐ-�v7��3�*J}�X�����0`���d7�'�BϽ��$����s�=��9�&�Tu!)�i&����֒v��g�l�[��w��r��Ԅ{{�]->������Xq��D�a+$S��AÒ��?D:�tu>c">/m�N����!G6����􎎶�!IJ��� 5뤎h�Nd��p�����[�&��of�ݙq_���n����������U+.Ȣ#
TYHFJ���P���1��x�]�J�Ԍ�@��ΐ�d�d�]«�(_�Lq!mh�08$�f�{<^~���}q�V��Rac�<2[�_,_����Zz%J�2��x���%Ϟ��Km�g��h3��|�����Z��0z/�r�\2,���08��ck�ᗭ���NbM @r?[x��).���x�9��(�̸��{�i77�we�]������a"ŭ�
;�K;Sō���`��:��:>0�*��ث`df�<�
AU���r+�=բr!e���>#=�G5>*C���W�ў�y��3=�Nq�����Ւ�xT���"���9J�-3G���Pq�������lZ�� �q%��ݛ�����[�Ϳ*MuI5��Æ��2a\c#^~����0��6����g�|	�np&eX 'uQS@Ձ;H��,W�c�M����W���� �F!Q�G� F��ؓư��	MtTCO�RZ��a�l�T,��%%`8���m����4��@��l7Ԇ� 8?��q��9�������(�)J�膪f:T��>�J��X+�4Ġ��������w��ޣ������}���ܔ{s�a���NZ�ח�q����4��J;s���7���$ׅ
 
�p����}k%�{��)˔Ꙅ*�#�iu-SI�Q���;9_�&���*�����/?��jh ��2�lz^#j����cH��l�	o���\W�^]'u{W�F��_�ƶ��-R5�$p-�%�md�*�y�����p�Ȫ�v'k��[s���p�^�~ϣ7�Rx=ZՎ��=�ƞ!4܅	7����>xw&
[y�Ƕ��zR�_B׌���VG�dV��O��	xI��������j����Xs��Ћ{bڛ\��@\�y+�/���
�^w��'�w?�:��w����g�S)[ٿ��[/�����bL}iy�{2���=��\�.�Zd�_�0�}�������wkHu��A���MQC�]��`�H�{�e�/7{�!�D�����/�SO��|8s����:𢡄��u�5L�~F*�V��𲴺�Ȩ>&�{�˳�7��Ź�]������l��������\�(R��Uoz�@���z���4�-m�V?�DB0�8Rw���$K��HJ���a�}��F�z�7�����\��AWWW��м;6Q�{���,l<!��%���m�S�@���$�X�&~/�o�a��0���  