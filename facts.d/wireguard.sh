#!/bin/sh
# Author: Simon Deziel

cd "/etc/wireguard" 2> /dev/null || exit 0

echo '{
  "wireguard": {'
for f in ./*.pub; do
  [ -r "$f" ] || continue
  iface="${f#./}"
  iface="${iface%.pub}"
  read -r p < "$f"
  echo "    \"${iface}\": \"${p}\","
done 2> /dev/null
echo '  }
}'
