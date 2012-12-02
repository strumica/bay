#!/bin/sh
rm -rf /tmp

# Install Tcl
wget downloads.sf.net/tcl/tcl8.5.12-src.tar.gz
tar xf tcl8.5.12-src.tar.gz
cd tcl8.5.12/win
./configure --host i686-w64-mingw32 --prefix /tmp/usr/local --disable-shared
make install
cd -

# Install Tk
wget downloads.sf.net/tcl/tk8.5.12-src.tar.gz
tar xf tk8.5.12-src.tar.gz
cd tk8.5.12/win
./configure --host i686-w64-mingw32 --prefix /tmp/usr/local --disable-shared
make install-binaries install-libraries
cd -

# Install gitk
cd /tmp/usr/local/bin
wget raw.github.com/git/git/master/gitk-git/gitk
wget raw.github.com/svnpenn/dotfiles/master/bin/wish
chmod +x gitk wish
cd -

# Archive
cd /tmp
read < <(git-describe-remote.sh git/git)
# strip will decrease file size without increasing archive size
find -exec strip {} \;
tar acf gitk-$REPLY.tar.lzma usr/local/bin usr/local/lib/{tcl8,tcl8.5,tk8.5}
