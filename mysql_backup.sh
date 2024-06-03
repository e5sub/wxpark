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
��]fmysql_backup.sh �W�SW����f����X�8�:�3��v�2k����l�>��j��V1(P�b�
�Z�a����n�O�=�n��`��K��y?~�ܛ�GbB�ńd���6K�E�|�4}��`�ݸW����_u'��ۣ��p�я�gmŊ��&Y[%��m��O}�<�u��1�����a;16c$�9�5�iXH���8��iɲ�f��a-q���(�mx�����ě�w��ܗ����na�}8�$�d֌˪eɑDj, #%��e�H��1�x�b�SjF	�H �vg�a�v�A��4��$5�CLL�"J�����V�&~[���U��P\[�M�f�+�ǰT}`�n@2M�7%�_��T"֬ց0c��>K1A0N6q��$\�>i�G[���c!
~�m'�9$�^�����,W��B��<�m<~ي�-�q�ȷ  ��t��s�������("�24�����'��0ܥaw����>�DJ����&Jk�MR�3�/���r�t�y2U�N�T����G�;�m
�FOG����D�(��ࣧ��&De�~���;�ßcN?�;����R&�g���TYI��8�J,�Eb{�8|I�I��@?�MK��:���޽�G��UZ��:ӗT�>�l0�,�52�F����$������/��ѣ�m��I�	]�Pu��ӱ!���&׸A@P���� �9%Y�G�Z���*�'�����MrTC��ɴ�I9j,g*��I��p���m����4�Z�����n�� 8?��y�49����+膀�d۔��]�u�t�q�}��8X;Ytġ��3 ��{Sb��8iE��A9؝5�5�O�7g�&�)��ſ|y�Mz��ܛ��Jyk��x��0O��¾}�B |\��sl�D~g��S��l�&b�a:"aџv��2���*����:.hv�����s5�w���nx�Y�]S)U�!t��#1��8-���g�H+��:{]���(i���7��7��^-o�6�K�	�Do?Y��&ɂ�؉L��d��ƕ�e�Et�."p�^�~-�7�T|3\��+��?�F�!Vܹ17����1xwƊ���h�G�hB׌���+���!&��ؠ�-�C$��X���	��ɞ�ŋc����@B�u+�.��׊��t�-&Zw?�:[�m�vY�o��=�(R2����I�^��?�X����d[�nx������	��(|w9 W36�����U�F�/~����>��)�(䫀b�,����i�q����g'�M��hҔ�������S� �dp��%z:&bO��o8�V��5CÇ��zy���s���ہ�X&{��W�oק��ķ��l������DҼ�eor����M{���w>�J"7�8�4>�L�F��{��4y��ڇ*д^�Y_6��|[|]]]aӁ{wd����)%Q\{B^�AJ���'@���8:�z��\� ]������8@�  