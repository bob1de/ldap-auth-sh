#!/bin/sh

#
# This can be used to authenticate to Home Assistant with the (not yet
# released) command_line auth provider.
#
# The configuration.yaml entry might look as follows:
#
#     homeassistant:
#       auth_providers:
#       - type: command_line
#         command: /path/to/this/script
#         # Uncomment and see below if you want the Home Assistant
#         # user to be populated with his full name.
#         #meta: true
#

# curl is available in the official home-assistant docker image
CLIENT="curl"

USERNAME_PATTERN='^[a-z|A-Z|0-9|_|-|.]+$'

SERVER="ldap://ldap-server:389"
USERDN="uid=$username,ou=people,dc=example,dc=com"

BASEDN="$USERDN"
SCOPE="base"
FILTER="(&(objectClass=person)(memberOf=cn=smarthome,ou=groups,dc=example,dc=com))"

TIMEOUT=3


########## Home Assistant specific features
# Have the value of cn be set as user's friendly name in Home Assistant.
NAME_ATTR="cn"
ATTRS="$NAME_ATTR"

on_auth_success() {
	# print the meta entries for use in HA
	name=$(echo "$output" | sed -nr "s/^\s*$NAME_ATTR:\s*(.+)\s*\$/\1/Ip")
	[ -z "$name" ] || echo "name=$name"
}


. "$(dirname "$0")/../ldap-auth.sh"
