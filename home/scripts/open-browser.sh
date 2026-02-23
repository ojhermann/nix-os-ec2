if [ -z "$1" ]; then
	echo "Usage: open-browser <url>" >&2
	exit 1
fi

if ! echo -n "$1" | socat - TCP:localhost:7890,connect-timeout=2 2>/dev/null; then
	echo "$1"
	echo "(tip: connect with ssh -R 7890:localhost:7890)" >&2
fi
