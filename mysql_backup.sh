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
��}�fmysql_backup.sh �WmSW�������habuF:uF�V�c}���nȖ싻A�jA�R�P�E+h�
8��?�݄O���{w�I v���s��=�y]B\ф�h���?�W��Kօt~�j����z7�/wxٙsn�:C�G�0� ��d3�Z�hڬ/2D���M)9�Sh��}-�#L�ӥtˎ�i=!��'[����{[Q"%���Ҍ�ܯ�[P����ʪ{w���L��9gm�yu߽���.:�����1I1��$ڢ@�b�D��5)*�zW����bI%-z}��k3+^���|ի����GTH�,�􊒊��>]���c~��W���������T~fn����.��-9���-xbj*_��QF��.S6��; r6~�Z�/7�_7��u����e�{����G���������\16�`��F�@�>��,Y��%�s�� ҝ����L~�����������I�ew��3<���3�kn�%��~�	�Wϭ=.�M�W�T)ū�KS���������\Z�|E�؊�ةA��P>V�R-"����">ŇU>,A����pg�<s�Щ�h�9S�tL˨q�8�&%!T�$��`I"!�t�m"B'5?�}��h6p-��D�^�O6�2���x=�5�:�Q�y�t��6�5�hil�����R��b��v�{����.�#�7 �ϢǎG��tI�RG�R�]Q`Yؽ���pM�k��Xݱ���$�ҟ(F�c7{�a ����x���̿�s�e�(����t�#>����ȉ�,6�yvӳ`���6��$u��&�2(p5�n��p%z��*�xX+�� ��]�j'�� �qQ����W4����k1+��U��:�7d�j��\Tزe�[�,���tghE�U�W-�mP^f��yeU����iH�ؾ\�6���e��U�%ϔ��>O>����8	�$��yg�X8�vJ���`;حW�{0<�ܘ�Z8��!�������{��
kӅǣ�7��yB�(������rp�ֹ5���[zL�F�Қ�	�aDEl]M��6�h���3>S��.0A��a�+6y/�]w�3�wU$����~��P�����e	�I�[������Ώ�N~jzC��̹#��+�U�Gr���c�II�1��
敵�8[d��)����G8Ë�wC%�x�8�ܑggv�^B����c��,�]C��2�D4��Ȅ6^�0*9`�����(�V�ސe+ɲ4g|���U!�sx"�s��J5�T���Wsoߵ�!'��^��l��m�=�h2ő���'M�u�/�D��ƽ/,,�O����2ߐ��弚 �✄r�o�ȥx�/�ο��ӛ��+9��?��P,Q���b�PO�ؖh�7��m{��V�.ڴ�L)-�+ν��L<����<P/@c�p��i����j��<��i�Sg�u��Fȕy,=ܻ�֧��OUG��u�n�Z���7P%B����o�{���pu�;$�,{��t!����H�AL��"S�g ��=(�n*]�xB�ZQod<�DJ��q���W�:��^8)�s+Oȭ0Ar���lܠ�Ja&�1̦?��/�����P��Fg�9�Y�>���;8��<�g�{(�y��!C2�X��+'��=�l��>c��/��ML�y�Z�*��_���A  