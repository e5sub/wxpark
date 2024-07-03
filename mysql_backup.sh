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
���fmysql_backup.sh �WmSW����t�1PX
��3�釶Ӗ�X+L��nȖ싻A�j����B,ZA�U������&��_蹻�fA�c�d6����s�}��e���f�
Aai;���\2/��W��7쭻�;9�u{j¾5n/���B���)Q�TxâK$�7�~���3?�Z�v����P!���L+J�4�O�O�L�5魭��>IH�)!5m%�*�6d��p=����]q&�0gf�ޙ�_�s�l����煾�e#ʉ��s�1���(S�qE�̔�[���V,!�$���o�,*mƫt	�Ds�
/�b�咚"q����i;�Ƌ��~�����*^Y�m�Gf���kXW��b��u��y���ȮD(�Y:2u������Hw��I�'����~�7�='���D�!�g����xh�웆!�4�F ���$B����� ��l��s&������8"�82c���d���(~�+��ү������o���yTؙ�o��H���C$S9ʃ���ɔ :�V�Y�2~,YA��!�$h�+a��
T���#>ˆ6,B����ם��y��ɳ]�6
�L�S15�ıᘺ��(P������)����Q�p]��77��j�6L���"�l�#�o<�n�'o�7������W:��;�����F��X��ܦ$!����Ooz4?̮֡��f�WyEY���L`�Le� �3�CX	h3��iU�P�y�����2ЧJ�!YE
oɚ3����C��!]2\�*He�%�֐yɤ�)Q����Q�Q�R��	�4�# �K�v�Ķ��V��eU��|R���d�mCŲ;֘A�>ck"��8�pk��?�=��JJ�����F�2S������o
�i�OJ�w_9���Vؙ+<G�y(���*U8rP�o�	����������b�Ѕji"�i�����diJ*�Z�a���=9_����/�]z�"�5�X/�\w��xv5$dU���s?�U�Yhhm��e�7zM
k$(O	q�J��]'�|W����_tƶ��+�-RG���J��)$dȥ�x��ܡ�(�}~�Ҧ�Ks*R�L-Ñz�ڟ\q�Ȣ;��{3Z��c���wƞ"X�	;����18�'r[Y�C��p�DR�hBW��j�M��Y� 6���*�]Q��(+}q�4("5E.�igr��	�=�����}5��M'0�br��� O�.����nY�+�;���HJ���&�:��^�^c���ם�#X���A�6��n�/���ZT������g`M�?��Ҿot/1^��-��,xK.�K��j�A?p��.N�P�<�<��g�ҥn�^rνe{�w4^�0��B� �U�q(tx�γUՆ�p�~�+-ҠQ{�Uau7�+�f���l���lm�xV*�.�������$�[u�W��p�ꬓ}A`����"��%$����Re�!�	I�tA3�^|g�i���Ӟ��T4�k|AӾ{{l"���)��xLn�!�c����i�B����D7{|��_�?�����S�-G��g$#���@���;d�{�q�cֺ�K��G,Z���2`���XI?m��">h9�4�<�*����/{[l  