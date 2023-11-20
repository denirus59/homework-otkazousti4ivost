#!/bin/bash

# Проверяем доступность порта 80
is_port_open=$(nc -z -w1 localhost 80 2>/dev/null && echo "open" || echo "closed")

if [ "$is_port_open" != "open" ]; then
  echo "Nginx is not available"
  exit 1
fi

# Проверяем наличие index.html
if [ ! -f "/var/www/html/index.nginx-debian.html" ]; then
  echo "index.html is missing"
  exit 2
fi

# Если всё на месте и работает, то выходим со статусом 0
exit 0
