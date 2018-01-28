#!/bin/dash -e

# have to do this first before we remove reg
REG DELETE 'HKCR\CSSfile\shell' /f
REG DELETE 'HKCR\FirefoxHTML\shell' /f
REG DELETE 'HKCR\inifile\shell' /f
REG DELETE 'HKCR\JSFile\shell' /f
REG DELETE 'HKCR\txtfile\shell' /f
REG DELETE 'HKCR\Unknown\shell' /f

# remove symlinks
awklib '
BEGIN {
  FS = "/"
  sb["rm"]
}
{
  arb_bpush(sb, "/usr/local/bin/" $NF)
}
END {
  shb_trace(sb)
}
' symlink.txt
