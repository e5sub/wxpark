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
�eqfmysql_backup.sh �W�S�f���b��yP��9�3�釶Ӗ�X+̙Kr\���$'(0C��@�/�p���U����3���'����r9<;�K&��g_��$���U.ɛi*����֒rɼ�)�^-�߰���������	�ָ�<Z|�3�
$��d�iS���I:o���!�cg~���h?r"FE<^Z3�8��>C^�
]�����	HB�7L	�Y+uTI�#�녍-��3���83��Ό��sg�ί�F�$/�e��(qN�-�s�d�ę��+Raf��~�X����>�������9Kx>��+��I�K�Kk�����v����}_���U��T�X+�����&������^���}�Gv%"�~3�4���vb��s'�y�r+�iK"���4�Q𳻅|!�g����dh�b��!�T�� ��/S!fr����Tg���/t����s���8"�<2c������(��+���/����ss���~+�<*�L7V��E�!���r�p�{0>Dg��3�P��%+��D�MѳQ%*6R�*�s�cĢg٨�FE�~���3�;O�:y�+�Na��|&�f�$6Ӑ
�2p�t�3Ec�����<1���Z�uCV-`ڇI�B�VĐ�MF����ɛ��g~[_��j�A�T�؈��{��mJ������'A�����j�Ji�I�W$�U`��6�T'	�:S;D���6�Z?�V�	%��H�<,��(}�g�*�PxK�Ԅ)�%�r���rTA�0,ɴ��K&�H���7�J�ꔢ�N�� /��qݮbV���U5��H���Y�U��Xc=�p�	a���:bPN�9�1b�`�h�9VZR��A:�O�9�M�7���*l��<y\(]�~�L��Zig��h��0ĚP��!@!`�&N�۷"�7{O�)Cj����GX��ҔL8�����{r��7�@��E��xK{i纓����5��UB��}V!j����e�7zM�	k�(��^�*ͻ4N
��捀3��m;�WJ[��do�M���,��1���J�Ңl��J�b���T�2���fr��=���J��hU;N];w�{�X�&��J6��ܞ(l�)�*���I-�	]Ѳ���JFq
�t��;CkN�������9k�3'zpwL;�����n�J�����«ם����ͻf����-�nY�+��5vQ$eL��>o��_��^[c�K����,���AH7�n�/���YS����lg`M�?�:�7�W��ق�b��wJ.�}@Qu���;f���o�}{ꏝ���#�I����{���/5^�0��:� �5�q tx���UӅ�p�~���hX��𲴺r!��;�s�Zy6�fs�>b<��.�.�!��fjщ�$ś[u�W�{p�ꬓN ����"�S�%���g2�!���I͐{�U����d����-�;������cſ��H���cr<���m޴09!�F�&шo!R1��� 6^]+N�����H48|��Dmz�2�Ǻ�+����uI� ���4 	d�C��g��+  