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
��]�fmysql_backup.sh �WmSW�����(,B���ʌt�uZ�����MvC�d_��
�P�(��hm��0`���d7�'�B���l��%�9���v���{G���pQ�HP�-mg�����dv�F�ц�� {�O;�nM�[wǬ�쓟)� �2D=L2���'�x��Su!:�C��xKS��pu	�0�tR��I�I䚪��������n�(M���r�	`-��ll�V��%�Ğ^�v�������܊�x���ޔ$=�	��s�3_��0S�qL
ʤ�S���%�H\J��D_g��Tʈ��%:O��e^JF�#�%TY���yA�n�O������>t��__�l��g���������^�p��뽜+v,�+�>e����EX�B]ы��<{����.�a�kN�H�oW�?���c�C]��L!6�`��F	A�6��Q����2� �;3��/1���7���c�����뺝���#�a��XK�d6^����T ��[f�ing2��Z���OQL����ߋ� :���^�~LIF�T!�D�	^�A��
T9�K�"��e6(@������`g�u��Bg��
��I|2���(NS�2�p�x�3���z��*!��1?�r�.)&0MC��X�V����7TS��&�h=�p��LGmgǹo�O{nC�18���G��98�� ����R��pCx���P��n?A�&�d7��(䚤ق�ق��6��s�޼��G���
4��zqǵ���	`v�)E�U����"H
0U �b���Ɣ�"�FB�BȆ��F�����)O1()B�MIU"F,!����lPuG��Ă�sиj�Ք�R8*��Q�C�m��J��[ �[V庉o'!%k��**��$EC�c�Q�E��2�|(๎�*	(��"�	��p�h�n3!*�j���+��'������?�=^�ߝ���{-�3�{:�xsQ�Ǆ�R	���o�)'�[��_��Ǹ��ʭ��j&GT�O�������O����".��|$�CnBa�﹝[��<��b���s^r�:����-�46�����=I��㔻q����]#;����=�h�n�c�s[d�!��\䜶HxRL��ʛP���?��!D�wH��a"��_��� Vz%�n��)�J?�G_ X��q+��D�9���3[s��v�Z̤�D.#�x�������&���.[�+�f�eq..zD��@�xPM���H�N�r�������w������[v�.����ݶ��=�dGb��4Iמ{�&�6�>��n?ƽߛ�����]��$0e��B�� �@��@
w�ݢֹ0���K&4P~r�p��`�CU�zbځDSys�a<`��2�����=KȔ:Ż������nk�!a���2ԗǡ��v���1�����w��:���VwC��c�n?����{�9S1�׃�pW�������$8�jO��7�܍{��e�3�`�q�X/|2Y�"��P��4T]��7�V
z-�����w�s���R��o��g�^>/F3�ȭ0 ~b��0LlPI
�0�fO���+�'	��fvr��x����Y�y�z�{p�Y�EV���5�j"�}�E/8:�b���t�y�Sy���S��j�'�Q�����8v)�  