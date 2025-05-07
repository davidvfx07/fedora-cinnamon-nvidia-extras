#!/usr/bin/env bash
set -euo pipefail

cd /var/tmp

#CHANGE WITH ZIG VERSION
wget https://ziglang.org/download/0.14.0/zig-linux-x86_64-0.14.0.tar.xz -O zig.tar.xz
tar xf zig.tar.xz

#CHANGE WITH ZIG VERSION
ZIGPATH=$(pwd)/zig-linux-x86_64-0.14.0

git clone https://codeberg.org/AnErrupTion/ly ly
cd ly

$ZIGPATH/zig build
$ZIGPATH/zig build installexe

cd ..

#chcon system_u:object_r:xdm_exec_t:s0 /usr/bin/ly

systemctl enable ly.service

rm -rf $ZIGPATH
rm -f zig.tar.xz
rm -rf ly