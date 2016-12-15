#!/usr/bin/awk -f
function z() {
  getline < "/proc/uptime"
  close("/proc/uptime")
  return $0
}
BEGIN {
  x = z()
  while (1) {
    y = z()
    printf "%02d:%05.2f\r", (y - x) / 60, (y - x) % 60
  }
}
