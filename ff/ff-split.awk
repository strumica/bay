#!/usr/bin/awk -f
BEGIN {
  if (ARGC != 2) {
    print "ff-split.awk [cue file]"
    exit
  }
}
$1 == "FILE" {
  split($0, un, "\42")
  vi = un[2]
}
$1 == "TRACK" {
  wh[++xr] = $2
}
$1 == "TITLE" && xr {
  split($0, un, "\42")
  ya[xr] = un[2]
}
$1 == "INDEX" && $2 {
  split($3, un, ":")
  zu[xr] = sprintf("%d:%02d:%06.3f", un[1] / 60, un[1] % 60, un[2] + un[3] / 75)
}
END {
  for (xr in wh) {
    system(sprintf("ffmpeg -v warning -stats -i '%s' -ss %s%s -b:a 256k " \
    "-movflags faststart -metadata track=%s -metadata title='%s' '%s %s'.m4a",
    vi, zu[xr], zu[xr+1] ? " -to " zu[xr+1]: "", wh[xr], ya[xr], wh[xr],
    ya[xr]))
  }
}
