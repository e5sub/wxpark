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
�l�~fmysql_backup.sh �W�S�f���b��yP�B�����C�i�t���%9.��b���V�P��P8�V�jp�+o��%w����$w���%����}����*��$���v~kI�d^H�g���o�[w�w�r2��Ԅ}k�^�?��rbiS2�����E�H:o���!F#g~��hk?�B/��V�Ni�"�t��k�[[��}���SBj�JU�m� {�znc˹��L,�'�̢�3c����ٶ�+��*�}i=&�F�y��\e>)Q�"㊔�)�����V,!�$���o�,*mƫ�^���^N��%�%5E��xQ�l;�Ƌ��~�����*^Y�m�Gf���kX�x�@E��x^�>�#����R3�����v"��s'ٟx�r3�YS,���4�P𳻉|!�g����xh�l��!�T�F ��/S!br��E��Tg6��9:�_z��vs�S��[w2�vf_�Q{�����9B��[��vv���5B�"��TRyP8�=�Dg֊3�PƏ%+��:D��a%,�S!�*�s�cD�gٰE���3�9O�:y�+�Fa��|*���86S�
�2p�t�3Ec�����"
���F�uCV-`چI�B�VĐ�M������������R[_��J�~Ӕ�؈�+���۔$$5�1v��MO���ǁ��:���*�H ��Թ�	l��L`u�z� +m&�~ ��J2���yX8}Q�T�1$�hB�-YSc���~�U6�K��Q�̰$�2/�t=%j��8�5�Q�z�;!��`��j�Mt�n�iE?8\V�X�'%�:/HfY7T4�c����1&��&2�A9�ƈ�����XIIuO���?Q�Afʾ1_3p�Ua3-����B���+g��
;s�G�7��� V�
G� 
�-0Ap���5����jL�P-M�8M�8�rM�����e�/ؓ�\���"إ�,B��텝�NvsW�@BVE,;�X������O�]x��$��F��!�U�ܽK㤒���8��ض3~��E�H^�q
�r)3��+w(-�f�߯�)�[�Ҡ��GS�p����'W�?�h�ά�ތV��ܵ3�����{a�ά�a����V���"^+�TC��-�Zx�@�d'�M���S���./ۉ���8W������Ǵ3�X����&���lo_ͽ~�	�.���{`��2��������.���)�i⮓}�9�u6澰��<�����!?w�~9Lզ� �60dAk�!ԕ~�{��|�-h��dûXrA_BUc�����vqJ�x�a�B�ɳ�b�9B���ι�lO=�R�5	�9n��\��B���<]UmX���&*�^VwC.��rmv�^+�f�n��F��������k��KR��UgzŻ��:����?�L/�8!YBo|*U&�2!	��D��4P�Z��iOVH*^6������j߼=6��{���m<&���>H��v��0A*f�&��?��b�����hk�����C��c,-Poq��X��E�䢘�.�$�	�r�;g@�|��c��o�+6  