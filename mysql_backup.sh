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
��:�fmysql_backup.sh �Xms�V��_q��*i��!Ba̖��� mIw�W��X�zA�I �L�BH ��!4dJii�vH�۟�d���J�$����#�s�y��yΕ{����Y��S	�.nT�Ջ��Be�J����~������Kgj��n�Y�<�/�-�-�LӖ*�6���tSJ�_�'ѵ��{��,��uyݲ�tA�y��rC7Q�Օ��ļ`Z2J�vn���F8�ʫ��ewr#q�;���o���7��e����sE##)f��[�=c�%i&Z�-�+z��c�LN)ȡD�a�T��6�%�@��UA)d�!��uU�I�j�������]yp�O�vy����62S�{\�:�g�m�����<��boE"�3�Q���~S6��{�=�=}��R�.���:2�6�l��1	��� �%���>|&���}�P�D3l;�o�,k��ϳ� @Ng���SY�����"�62��z��u�F��Yu�)�>#�k#T���mys��9UY}�$?���LTʝ�����~Q�~u�؊��iA��Ж<�T�R+� ��4_�
6y�K�\R��$�H��_QG��KwS	�3E(d���ŎcZ��@N^�/�$`��9��������!�T4��a��X���0g�r���V�+[@YM��������70�2{�t�Rv��vG?Pw�y�A���
f��Q��f�b�ɣ���i�$����Ş4�4|��8��:��I��erzQ�`��4z|��}�0�J�\��ܼQY{��%ňx�y���qg�fyu��ż4���䆿��C���B��M����ʠh��x|\���8�i�F�d���> ���we� �����
�GEI�Ѕ*؊�e,1/�B�3V2d��h�\Wزe����JI:�M	^u�5X+� �fX`����Ml{aHE��9]<n�)Ȗ!��U��e���!_>�ab��A�8Trp�����M4�=v^ּ�a9��w5�r��5MBSHK��qL�}v̽��/�����7��rQjH� �)0qp���u��۫���3�q5Y������a�j!��أ����\�/�p	R�.������k��֮�������#p*1m=]��f�9�߄���z�.N��|[�&��{�o������8�n��:�"�3,���O{�O�:X�K%�d��Ȥ:]*�Q�L6d�.H#�u�u�=�)4/�7 Kc�~���0��1O8�֔s��2	g�3v�Y~X]��+*OV��?W�y�1we��������m�^�ޝ��,�ė9?��I�zm���vH�|c�\����=�Υ���'���E1ߤZ��o)oD� /�<ݺ�b"D�z�o`˯F�C���?�v&��A������lP#m��8�l��bHd���דl��Y�������t@�l[�>�������Q�$J�՗K�ƕ�ʫ�l	��?��ޙ^�m]����:[.X��&ẳ����T�e�.�t�n|3>�نʃ�ߦ�i��@�tvvPr��}����eُ�\F:��0�X( �d�Ǝ���pz�a���(��p8��Bx�K�Oν��L�����x�9����:���o�����݀\m�F��߫ϷB.f1�:s�\��̾^�i���NG��k��_G�EX�|�ܽ��uU�̸��P���}d��#�s�-��'
u�)�9��#]�T���ku�Q�׊yUG�=	===q�a ��d�ץ/�ly�GrS�� g�9 ���B��L�D7o��Z� �'+W+S���S��S����Dp��/3�Cλ��vx@�싆��d�
6Ϡ,�ŏ�3��E��)!
^D�"@X���/��)�  