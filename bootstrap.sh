for file in $( ls -A | grep -vE 'bootstrap.sh|\.exclude*|\.git$|\.gitignore|\.DS_Store|.*.md' ) ; do
    if [ "$file" == ".config" ]; then
        for config_file in $( ls -A .config | grep -vE '\.DS_Store' ); do
            ln -sfv "$PWD/.config/$config_file" "$HOME/.config/$config_file"
        done
    else
        ln -sfv "$PWD/$file" "$HOME"
    fi
done
echo "Symlinking complete"
