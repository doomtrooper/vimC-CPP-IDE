#!/bin/bash

skeletonC=skeleton.c
skeletonCPP=skeleton.cpp

#Check net connectivity
wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]
	then
		echo "No internet access found."
		exit 0
else
	echo "Internet Connectivity Found..."
fi

if [ ! -f ~/.vimrc ]
	then
		echo ".vimrc File not found!!!"
		echo "Generating new .vimrc Config file...."
		cp ./.vimrc ~/.vimrc
		#checking for successfull execution of a command.
		if [ $? -eq 0 ]; then
    			echo ".vimrc Config file generated successfully..."
		else
    			echo "There was some problem in generating .vimrc config file..."
		fi
	else
		mv ~/.vimrc ~/.vimrc.old
		cp ./.vimrc ~/.vimrc
fi

if [ ! -d "~/.vim" ]
then
	mkdir ~/.vim
fi

if [ ! -f ~/.vim/$skeletonCPP ]
then
	  # Control will enter here if .vim exists.
	  cp ./$skeletonCPP ~/.vim/
fi


if [ ! -f ~/.vim/$skeletonC ]
then
	cp ./$skeletonC ~/.vim/
fi

if [ ! -d "~/.vim/bundle" ]
then
	mkdir ~/.vim/bundle
	cd ~/.vim/bundle	
	#cd ~/.vim
	mkdir ~/.vim/plugin
	#cd ~/.vim/plugin
	
	#installs nerd commentor which a vim plugin for easy commenting
	git clone https://github.com/scrooloose/nerdcommenter.git
	cp ~/.vim/bundle/nerdcommenter/plugin/NERD_commenter.vim ~/.vim/plugin/
	rm -rf ~/.vim/bundle/nerdcommenter 
fi
