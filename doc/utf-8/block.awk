#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC != 3) {
    print "block.awk <from> <to>"
    exit 1
  }
  d = s_rjust(tolower(ARGV[1]), 6)
  q = s_rjust(tolower(ARGV[2]), 6)
  while ("fc-list -v : charset postscriptname" | getline) {
    if (NF > 6 && $1 > d && $1 < q) {
      z = 1
    }
    if (z && /postscriptname/) {
      print $NF
      z = 0
    }
  }
}
