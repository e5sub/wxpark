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
�y��fmysql_backup.sh �WmSW����ٸ",B���ʌt�:Vڱ�M�d7dk�����jA�R�PĢ�Z�a�����n�'�B����h�~�l�9��������§d�O	f��Ayf��<��7��J�J����ۥ[9C��ب}cĞ,=��r�yS2���E�"]0��챟b-�v���c����j���sZZȑO:�뚁򖖦�P��
�)�4oev)�VT�=}����ܞsFg0g���:n����Z�'��TJH���IQ6�(X�:�(I0��k(sZW��W��9'�z}��kQy3U���|��W9�ď�����Dw�y4���O�����^Ykg�Kk��'k�G���=��A�q�.gyO�Z�*W��@�	f[�!��i��J�l�N܅&���d��;]��B�O5�������*���i(�e������$k�ϳu @Ng���&S�y�����"gm`��m��c�=7h��Z\zI���b��ߋ��ʫc����x�~�b��ܬ��^����y�c�
bg�M�����A��9�)��q.�pq�����d�P�ۏw&Z���,�j^Ia�1۲"�@N^��yS���,p�&��;]��ߧ�j��O�L�-�D��Ls��i�L��CJ��p�����':|�,��BkS���������+[n�^��2�; }���<v=�~8N�D�Km�[@Ӱu+>����Q6�&3Z^��?	�����ņ~�վ�)ʾ~����Ud=�%:�%�
�kx������MJJg5��@�g�<��fPTF3@L��"���ͥ��LD���L53'mf� ���+�{"=�wt�@��Y��`ɚ�4�YI
���.�FMK�L�`�7�:J�(�Ip��W_u@��2�- �+�v�ķ���W�����氞�d�BZ2�yv������I��q	���rN"n��?m�����Twu���+�=��N�,BW���x�8%;�?��������ě���<-V�Jp�F����qn��~c��3����&f��[<Q�?����*Kz�voھ>�­.4A���CV|ོzř�½� #c�WLp�8�������B�!$hd(o�^���!'��3��^qF.���9�i��\�u�'9-E���Ǐt4=u,���
��J�ɠ:Y�i�^06$�H �5�s�.�������qÞ^t���<������(II��=g�bΞ��Ђ����hqy��FE�GU7�+H���02�2�e�:��E��F7ꬓ>հ�5��4��;��'Q�$Kw�ˋ��ʥ⛷��Y��{r^xnt�$�my�?�RΔ>=i��3��Kԣ�����x ��a~P�J�oدƀ���P�$�( �� g�%��נ�n��Jfg3��C�=.�ܮ��D� ���)U�>��7Y�E�M]9��%����✻���Sok��`���|�������K�WU�����ŕN���������=&�ۗ�&&߿�����fG�.j��@�EX��?�ܙ�	�K��Kˊ�L�8#Y�,^9�\.>$Q�/J4C����V���l�YEC�=
;w�t���GK��Rť��^�0)��	�nPE
Q����?��	��ril�yW�=��T�,�>����0 �����.�9�.A&�X��+�	��M��}�$/h|���L�Z6�VU���8�  