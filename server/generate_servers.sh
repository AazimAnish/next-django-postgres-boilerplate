#!/bin/sh

cat <<EOF > /pgadmin4/servers.json
{
  "Servers": {
    "1": {
      "Name": "PostgreSQL Container",
      "Group": "Servers",
      "Host": "${DB_HOST}",
      "Port": ${DB_PORT},
      "MaintenanceDB": "${DB_NAME}",
      "Username": "${DB_USER}",
      "SSLMode": "prefer"
    }
  }
}
EOF
