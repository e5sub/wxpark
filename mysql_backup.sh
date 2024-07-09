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
�M��fmysql_backup.sh �X�S�������6P�Wgm��N�Q�+��Zu��$��yi��e�zAAi���En�����(��f�������}q)ر_v���=��;O6���)������Fu}Q�h}Y��\��_u��T���{�LM:�L8K��G_Q�B�d�f��T���`�,k@7���g���{���R)_V�-;CuQ(�G:\7t׻�;�EKbA0-WKv����A8�*���ewr#q�;��ί��o7��e�����%#+)f��[�=c�2�d�X�S	�E��A��	Q6��H�D�a�T��5�%�`͓��R��C�/��
���v�'���������V��be�y}d�:��~u���>0��y���=�TrgP"�0-��l ��{6w����]���ّM�q���O�����^ƅsC{ۇ��X���7e�M4������f�����<�
 �tf*+?c0����0^�M r�#�έ��]gl��Qg�է�um�JU׿�l��6���Ϛ��g�6��K�S:=� ������ ď����D�m��i5-�R)�*O�/`ӧ��ʥ%Hx0}�`����:z�t_��Ja�)B1���v�R�*p
�|��$���AX��S?��C��h60=�$K�d'a���Z��F�V��r�'���m�;�yo`�e��a���|��soO����C *��fP0�-����06C����9��쇎:��=�ix�8y
�u��=�b�����&��/������a���#��9ʹy���S@V�#�%:�%��l|ĝ���mJ:�x�Γ����(*�� �4A�Aрi����#p�H���@[} !���!I�������U�]�ZbAV��g�lȦ'�D9زe����JI:�M	^!� �胐L3*0~Z��&��0��j�.7��e�D�
mCl�#kf�_�2��� N*y8���N��&�� k����;��M9��&�)����}}�}�:��������	ě��H]�R%�F%�>&	N�>����x[�y����6OD�O����djc�����s1.��"��]B��5��k��֮�������#p*1m����aA3O����v��9�?���s���w�rm��#�x�M�\G~RD9fƀ�>9�qo��q�Kx���l���2�Δ��n�-��X�2�r]tH��G�t#�d�Fdi,����f�����5����LBř��w�֖����U�������t�]Y��~��q��r��לř�����d���)��.a���76��Ei?�����o\o��H���$�T�\����8.�1O�����X�������z��O����Ig�yPh��{{��>�HۡF*N(���y�
a���4�)��������Ͷ5��sxI���|�O���\{��l\���<̖p�N�c�>�����m�.�7̟����rђw4	ם��ԧZ,{m���v���A�6T|��:L�������2�{ p�o�\p�l�.�~��2�`͇��B��&�@4v������}�G�v�����^�~r�%g��4~0���K�l�]�ÿ��:�.�x��&i�Y���l+��3�����쫵����t�[�&p��:jD(��g��e���veƝ}J`���$��G�e[,�N(�%S�/s\�Ot	tS���Y4��r���UG�=���O���;��_�>�s����==Qr��l,P"����Mt�����d�juj��@����Y��g"���W��!��|�w;<s�EC�|D�h[gP	����C���E���"�	�n����]����eۄ�  