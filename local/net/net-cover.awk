#!/usr/local/bin/velour -f
BEGIN {
  if (!ENVIRON["BROWSER"]) {
    print "BROWSER not set or not exported"
    exit 1
  }
  if (ARGC != 3) {
    print "net-cover.awk <artist> <album>"
    exit 1
  }

  xr = s_gsub(ARGV[1], FS, "+")
  ya = s_gsub(ARGV[2], FS, "+")

  sb[ENVIRON["BROWSER"], "-new-tab", "discogs.com/search?q=" xr "+" ya,
  "-new-tab", "fanart.tv/api/getdata.php?type=2&s=" xr,
  "-new-tab", "google.com/search?tbm=isch&q=" xr "+" ya,
  "-new-tab", "musicbrainz.org/search?type=release&query=" xr "+" ya,
  "-new-tab", "wikipedia.org/w/index.php?search=" xr "+" ya]

  kc_trace(sb)
}
