# grep needs LANG=
# jekyll needs LANG=en_US.UTF-8
# So it is best to just leave it alone

# PATH
read c < <(cd \\;pwd)
p=(
  /opt/etc
  /usr/bin
  /usr/local/bin
  $c/progra~1/7-zip
  $c/windows/system32
)
IFS=: read PATH <<< "${p[*]}"

# Ignore incorrect file modes
git config core.filemode false 2>/dev/null

# Load dotfiles
for file in ~/.{aliases,bash_prompt,exports,functions}; do . $file; done
