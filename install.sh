#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# use at your own risk

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
#files="bashrc vimrc vim zshrc oh-my-zsh private scrotwm.conf Xresources"    # list of files/folders to symlink in homedir
files=(*)

##########

if [[ -e $olddir ]]; then
	echo "$olddir exists, fix your stuff"
	exit
fi

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir "$olddir"
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd "$dir" || exit 1
echo "done"

echo "${files[@]}"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in "${files[@]}"; do
	[[ $file == "install.sh" ]] && continue
	[[ $file == "config" ]] && continue
	[[ $file == "fonts" ]] && continue
	if [[ -e ~/.$file ]]; then
		echo "Moving existing dotfile $file from ~ to $olddir"
		echo mv ~/".$file" "$olddir"
		mv ~/."$file" "$olddir"
	fi
	echo "Creating symlink to $file in home directory."
	ln -s "$dir/$file" ~/".$file"
done

rmdir --ignore-fail-on-non-empty "$olddir"
