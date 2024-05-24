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
�whPfmysql_backup.sh �W�SW����fcd`YG,Nl�љ~h;m�Nk�����/w7�g��,�@�V�֑�3P!���n�O�=�n��N�%s���y��97�O��fJq�Mq!(嶋��qŽ�gn�l�����?��:�� ����h�����]Չ�!;_!ٲ�Y����c��Dϱ�G�P�KY��u+!���W�� ����x��HɎ�"5�%O�c� �p������9�ğ^$;�d��p�̭��#\\N�혢9QI�=Yb�jd�D���2uk�����XR��	���{\ڍ7�R^������1<D��e��а��m��x�������AX����Zyd�8�X�uk�ԇ��d�F}[v���$B���<PfT8<�6��Y�\��?-�$�W��O;c�v����
~^��$�_;�q�B<�P���x�1#����*q�A�"m @�3S�x��so7�o�#r�#��u?;E��x +�$�Ka����B��������dqs�E(A��G0�T���������*T!�i��0N���Vڸ�\��91l�a�_���E.rgN����4Y��i#�=��MQ�������dG�PX��>&_3q�<4�k�����#x=����ܽS�����W5���|��y��؈?7V��w85�����ɫ;��N���u8.i9��M�PA3A8�:ĴP�$ �B�Q�MYC@[�F��1�g/k���02��W��Yf�M�TC�0c[u�L�U���^ƽ��m�bq��,�j�Zԡ�^h����Z�Mm37��a��hZ"ƣ��-'T�j��X���1�`�t���$�1��?��'�K�&Ӯ���[����$�=�2p���NZ�;�ǅ������J;���㈷ �5��*:(�7 4�������ͮZL:v��I��e{e��N�2��H���O���:X05�8h��X/�����1U-/Hj���A4�Yh�������z":I.�A��j�Ws�n�����ض?~���U�k
�����^�t��n\��Esk�ɻ����9����7�����])��[�	K�O��W�0A�k(A���`����l�κ'���t�J��+�V:+� �j�I�$5i���8����+c!��b,�㞘��.�c�����֗����ƻ^v���D�Y�0`��-+�ٻ�E����z�Ͻ��S_Z^�_�`�?tlCq�>Y��i%�o3t���_ZzI��~�5��Rekw��=Ŋg���+�a̓#��k���
j��$a�;:�(@��zl�C;�8�?^&�/�0 �ኻ]M >P	���jj�V��w訬�F�d�miu7.1Q��X��0�d�M�&�ug�`�*�w迏�dc�#�x\��c�A���̮�S+���tsƟ{C���Ȧ@|%U/���,�z����I)��m _�x�Y���@6�2,���AOOO�i����J�v  