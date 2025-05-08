mkdir -p /var/cache/lightdm
mkdir -p /var/cache/lightdm-data
mkdir -p /var/lib/lightdm
mkdir -p /var/lib/lightdm-data

chown lightdm:lightdm /var/cache/lightdm
chown lightdm:lightdm /var/cache/lightdm-data
chown lightdm:lightdm /var/lib/lightdm
chown lightdm:lightdm /var/lib/lightdm-data

chmod 755 /var/cache/lightdm
chmod 755 /var/cache/lightdm-data
chmod 755 /var/lib/lightdm
chmod 755 /var/lib/lightdm-data