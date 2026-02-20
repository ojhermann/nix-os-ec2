cd "${1:-.}" || exit 1

show() {
	if git rev-parse --git-dir >/dev/null 2>&1; then
		git status -sb && tree -aC -I '.git' --gitignore
	else
		tree -aC
	fi
}

clear
show

fsnotifywait -r -m -e modify,create,delete,move --exclude '\.git' . | while read -r line; do
	clear
	show
done
