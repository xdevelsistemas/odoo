#!/bin/bash

set -e


echo "[options]" >> server.conf
echo "admin_passwd = $ADMIN_PASSWORD" >> server.conf
echo "dbfilter = ^%d$" >> server.conf
echo "xmlrpc_port = 8069" >> server.conf

case "$1" in
	--)
		shift
		python2.7  /home/odoo/odoo/openerp-server -c server.conf "$@"
		;;
	-*)
		shift
		if [ ! -d "/home/odoo/.local" ]; then
			mkdir ~/.local
		fi
		python2.7  /home/odoo/odoo/openerp-server -c server.conf "$@"
		;;
	*)
		exec "$@"
esac

exit 1
