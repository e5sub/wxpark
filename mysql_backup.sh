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
�џkfmysql_backup.sh �W�SW����fcd`Y,�X�X�љ~h;m�������l�>��j��V1(P�b�
�Z�a����n�O�=�n��`��K��y?~�ܛ�G���$�i&���Ƃv�>�)M_+=Xs7�����W݉1����8\z�#CY[�⬭���VI�h��%�c���t�:x�X�����a;q6c$�9�5�iXH���8��iѲ�f��aM:�p�n�6�{K��F�Mͻ[S�����M���>b$1ٟ5�j�YtD��H�su*Rcf��~�X���Q>��t��-5�^�F���fx�iCS��AQְ������߄oK3���*W�k+�����|�����������h�>�JD�:f���g)&��I������K�'�h+��z,D�ϳ��;�����]9+ŀ�j�Yȁc�=��~ي1[h�!� �;����1���+?��룈��Д�󪗟t��xp��݅��k/���)m�R�z\ޚ(�-7I����H�^������T!:�R�Z�~UC��G�)�=բr!���s>#=�G5>*C�����ў�9����=���*fzV�p�Д��JҐ���U$C�d̃�����%'Ɋ��lZ�� �y%��ݛ�p���[��?�3}I5�����2A^#C^a�:�o�0J2m ����n�,=
ܶ�a��a�,颦�����%�Y��F�7�����6��)��>��r�O^P�=Qe�T]h��z�N�M�Qc9S�(GO*5���Nξh�-�l0�]�y�Ԥ-�vC8͠��i5ϛئa�Y��=]^7x�'�ئ�T�m�[�;���ӯ$���ɢ#��>��ߛ�G�I+:����Q�A~½9�4qL�$-����m�����$�W�[3�ǣ�7��xRnH���+�����ck'�;�w����d�4����;��	��Ty0���qA�D,m���i�c��u�+�b�:H������׈Yh���i�>�D�[)��A��JmxFI#�7��f网Mo�jy���\Z�L@%z���5I\Ɩ2���U�?W֖�w����}z������R��p�:�\7��y�Xq����
J6���+n�:��I#�	]3�����J�g
�t��JB���(�(�cq��'b�M�D/^���|=*�[yu�ݼV|���m1Ѻ�`��hs��
~{v�1E������L��
��8���җW�'C��wÃ�m(��v_N �pGA�;�������/�U��6�~�cT8� ���N�D!_�d�$�]�L����U�7�8;�l*MF�����_t'���'��/����0{���f�>n��3lԝ{U^�����3ٻw�2]x�>�'���7`����O7��D ���,{�K�ӷ|m�+� @��	T��)�I�� f25����#$���ϰ�>�S�������ɴf������
�ܻ#c�?O)Rq�	y(���,N(����qtR����A� �{�7X�80�  