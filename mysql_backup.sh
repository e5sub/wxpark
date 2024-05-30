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
��"Xfmysql_backup.sh �W�SW����fcd`Y,�X�X�љ~h;m�����MvC�d�n5�P�(�
�hm��a����n�O�=�nv�� X�/������so"	IE���a"PY�,o,��������5g�^���naՙsn�:���G?2T ��d3�Z�h�l�d��5��R<v�H�ᮃ��Ř����g�zJ̒#���Dzggǡ��ʈ�%#5g��Ƀ� g�Fimý��-`$�Լ�5��u߽�����CLRL�猄��qAmQ��2R�\]���̬�����+�V�r�G�ۃ6�����W�Q�**��BFWea`P�T���x���7����}/��Յ��Juh�<;_�>�=���u�a��!���G���f��������~bg�g��ߋ�����D���m=����v�GB��ۮ�Mƀ�|�,��6ь�X[�,Y��%�q�k ҝ�ҫ�Ly�ƛ�QDNuh��y�-L:�a<8K���O���s}���7~)m=�lM�ז���e�_$S/�n���dj�Z�N-��[Q;�m2�FOGը��D�(�ǈEO�Q��J��;�Ew�'v�9q�tO� �c��ل�S�8phJU$9�K2�6���I]4%̃�����%'Ɋ��l��f�y%��p���[��?j3}I1�����2A^#Cnq�6���0r*���;�ny,=
ܶ�a��n���DUEn?K�s\}� op�xX+� �S��u��s�O^P�=Qc�]����Z�JedU�ScyC6)GK�>Ö-;o]��F��.�<�5�C��N3(p^Z��&�iRN5vO��t��ʖ!�d˷u�t�q�=��X;Ytġ��3���{Sb���Y��A9؝5j5(L87g�&�)��ſ=y�Mz��ܝ��Jek��x��0OI�¾}�B�\��sl�D~g�o1m�F&�
�a�E�m]͆3)<�>�s�g�0��"���F�oY�l�p��X��Ҋ&A�b�G�UbZ;;p8E��"��f��t�����(�ۻf5��;��^�l���;
_�D/;I����>�Z�l�s$�����$�s��p�^u-���Tz=\���)<pG�!4��1�����1�w�JE�ö��G҈_BW��f���]�>&��Р�-�C$������Xk��Ћ�Ĥ;>_ρ�J�VY]t6��^��n[L��^Xuևm�vY�k��=�(������I�n��7�X����d[�vx�\�]ad�n9�
��PC�˼��P��0wr{S�P��0�4Y-)c�EҼ�.j5�͗�N6�J�i�){)�����^A�a�>�k�<t4��`��a���qk��CX�zu�^V��c+���Kؽw�:]|�>]����5�'��w7`����G/��D���,��K�۶rm�-� 8=�	R��i�Ne� f�>ɔ���2�e��J�k@Ӛ�7r�l*���x����¦���X���Sr����<���{��l,N(����qtR��]� ^?���0��  