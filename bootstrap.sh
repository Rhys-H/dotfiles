for file in $( ls -A | grep -vE 'bootstrap.sh|\.vscode|\.exclude*|\.git$|\.gitignore|.*.md' ) ; do
        ln -sfv "$PWD/$file" "$HOME"
done
echo "Symlinking complete"

export PYTHONSTARTUP=~/.pythonrc.py
