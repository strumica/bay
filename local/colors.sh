#!/bin/dash -e
<<'eof'
 1 foreground bright
 5 background bright

30 foreground black
31 foreground red
32 foreground green
33 foreground yellow
34 foreground blue
35 foreground magenta
36 foreground cyan
37 foreground white

40 background black
41 background red
42 background green
43 background yellow
44 background blue
45 background magenta
46 background cyan
47 background white
eof

while read br
do
  printf '%9s fg [\33[%bm██\33[m] bg [\33[%bm  \33[m]\n' "$br" "$br" "$br"
done <<'eof'
30
31
32
33
34
35
36

1;30
1;31
1;32
1;33
1;34
1;35
1;36
1
5;30
5;31
5;32
5;33
5;34
5;35
5;36
5
1;5;30
1;5;31
1;5;32
1;5;33
1;5;34
1;5;35
1;5;36
1;5
30;41
31;41
32;41
33;41
34;41
35;41
36;41
41
1;30;41
1;31;41
1;32;41
1;33;41
1;34;41
1;35;41
1;36;41
1;41
5;30;41
5;31;41
5;32;41
5;33;41
5;34;41
5;35;41
5;36;41
5;41
1;5;30;41
1;5;31;41
1;5;32;41
1;5;33;41
1;5;34;41
1;5;35;41
1;5;36;41
1;5;41
30;42
31;42
32;42
33;42
34;42
35;42
36;42
42
1;30;42
1;31;42
1;32;42
1;33;42
1;34;42
1;35;42
1;36;42
1;42
5;30;42
5;31;42
5;32;42
5;33;42
5;34;42
5;35;42
5;36;42
5;42
1;5;30;42
1;5;31;42
1;5;32;42
1;5;33;42
1;5;34;42
1;5;35;42
1;5;36;42
1;5;42
30;43
31;43
32;43
33;43
34;43
35;43
36;43
43
1;30;43
1;31;43
1;32;43
1;33;43
1;34;43
1;35;43
1;36;43
1;43
5;30;43
5;31;43
5;32;43
5;33;43
5;34;43
5;35;43
5;36;43
5;43
1;5;30;43
1;5;31;43
1;5;32;43
1;5;33;43
1;5;34;43
1;5;35;43
1;5;36;43
1;5;43
30;44
31;44
32;44
33;44
34;44
35;44
36;44
44
1;30;44
1;31;44
1;32;44
1;33;44
1;34;44
1;35;44
1;36;44
1;44
5;30;44
5;31;44
5;32;44
5;33;44
5;34;44
5;35;44
5;36;44
5;44
1;5;30;44
1;5;31;44
1;5;32;44
1;5;33;44
1;5;34;44
1;5;35;44
1;5;36;44
1;5;44
30;45
31;45
32;45
33;45
34;45
35;45
36;45
45
1;30;45
1;31;45
1;32;45
1;33;45
1;34;45
1;35;45
1;36;45
1;45
5;30;45
5;31;45
5;32;45
5;33;45
5;34;45
5;35;45
5;36;45
5;45
1;5;30;45
1;5;31;45
1;5;32;45
1;5;33;45
1;5;34;45
1;5;35;45
1;5;36;45
1;5;45
30;46
31;46
32;46
33;46
34;46
35;46
36;46
46
1;30;46
1;31;46
1;32;46
1;33;46
1;34;46
1;35;46
1;36;46
1;46
5;30;46
5;31;46
5;32;46
5;33;46
5;34;46
5;35;46
5;36;46
5;46
1;5;30;46
1;5;31;46
1;5;32;46
1;5;33;46
1;5;34;46
1;5;35;46
1;5;36;46
1;5;46
30;47
31;47
32;47
33;47
34;47
35;47
36;47
47
1;30;47
1;31;47
1;32;47
1;33;47
1;34;47
1;35;47
1;36;47
1;47
5;30;47
5;31;47
5;32;47
5;33;47
5;34;47
5;35;47
5;36;47
5;47
1;5;30;47
1;5;31;47
1;5;32;47
1;5;33;47
1;5;34;47
1;5;35;47
1;5;36;47
1;5;47
eof
