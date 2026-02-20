cd "${1:-.}" || exit 1

fsnotifywait -r -m -e modify,create,delete,move --exclude '\.git' . | while read -r line; do
	clear
	gst
done
