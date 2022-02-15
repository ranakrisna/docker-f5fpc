#!/bin/bash

show_help() {
cat << EOF
	Usage: $0 <MODE>

	Supported modes:
  	- start
  	- stop
EOF
}

MODE="$1"

if [ -z "$MODE" ] ;  then
  show_help
  exit 1
fi

case $MODE in
  start)
	docker ps -q --filter "name=f5fpc-vpn" | grep -q . && docker stop f5fpc-vpn
	./f5fpc-vpn.sh client -t 'sso.pertanian.go.id' -u 'konsulbastb' -p '1qazxsw2%$!(bastb'
    ;;
  stop)
	echo "Shutting down..."
	docker ps -q --filter "name=f5fpc-vpn" | grep -q . && docker stop f5fpc-vpn
    ;;
  *)
    echo "Unsupported mode $MODE!"
    show_help
    exit 1
    ;;
esac
