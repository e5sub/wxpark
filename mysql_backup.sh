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
�`��fmysql_backup.sh �Xms�V��_q��*i��!Ba̖��� mIw�W��X�zA�I �L�BH ��!4dJii�vH�۟�d������!��~�H��{��s�s��>+�|V0Tj���E�y�X��R��j�ߩ~��3�Ҟ������F���K�
��)i�Tâ�%]0�����It�����1K%<YA3�4]�rB�<������Օ�.�
�aJ�Z����l7
�^�VY]w�,;���3��ޜ���|�a�.�G���;W�3�l�yQ��5.�J��t\�@X��d�e�rQ
�@�֠E��l�^"��\�"��>����H��� *Xmg~�������yi�//VV_�Gf�s��W'�����A�q�.�xo��H�w�u �4��oH:pZ/�g��s_
ܥ�QG&�Ɲm�8���g:�{��m>�e�f�4��2Ќ����)���|;��l+ �ә�����T��x�6�ȩ�L۷^:cw��Q|��G��o*��������[ٜ�mNUW�7I���}$�r�t�~2>D�_ԧ�C�KV;-�6	ڒ��JRl�U��+O�&OqI�K���ׁ���>�+���S}�n*�}&ŌZR��qLKAD(������LB8�?���}��	��Y���&Y�Jp"�\����j�hf�h!�jp�������_��fYf/��T��������A�-�͠`�����a�m{O=|8N�D�u"{�@���p�$��$O{D�<��k%U�!�^��������l+�Gp�r�}�Fu��OV�d=�%:�%�
l|ę����mJ�4��D�'7<f!PT^3@̪�"�����p%&�G�t�����6� Bޕ̃��{/�@�eYE�`ɚ�1sIʮ��.�D�I���L�l^4�VJ�(lJp���`�@�x�a	���j�7��!�}�t�9̧(������6D�]�f�������ġ���\���m���A�
����Ao�ï�ؔ}}�i��B�X����1���1�.>��m>��O �<��9�!UlT�S`����c� �ۋ���7�\�6Q�5�����4�Om�Q���}s.�]��Գ�Cv�a��y͙���5u����c#�}N!f���+�aA#Oy���t��9ɷuo������3q��NΑ�c� �&w�#?�9)bF��>?�io���Q�Kx���l���2�N�����M�Y���r�t@��K�t#�$�Fdi,�O��f�?�	Gݚ�o��Y&��L�����kKw<A�ɪ}����3W:�,U��Q߸_Y������k��L\���N��k��`��C���h碴��H�w.���~�J�V��T�\��-�䅘�[w[L�HX��,c��ht�^=��'���¤=��/4Bù=YY��k��P#'���Z��<p� �ƍ~���GFX�T�}�fۚP�Y���un>��'Q�H��\�7�TV^ fK8n'x1`�Ag���U���-m�v�T4��M�uf����^[z��8���f|���ٿM�pu�8�����	��0��+��˲+��t�X�`䲐&��0��;R����q�͞��`;��txc�M7y/9�ޒ=��W�?���<��bW������l��w����~�=�
�����̹s�>3�zm�9b<�;��1�5"aI��s����U�2��>#��}b��#��+�N(�%C�/s\�Ot4C���Y4�r����
���{zzz�C���d�ץ/�le�GrOO@��}� L!r3uݼ��k��^��\�N�v�O�OIF���?��ƻʄ9��K���.��C�E+�:�R�,~�9�,Vy�  