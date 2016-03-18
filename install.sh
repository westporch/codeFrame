#!/bin/bash

vim_path="/usr/bin/vim"
vim_nox_path="/usr/bin/vim.nox"
vim_plugin_path="$HOME/.vim/plugin"
git_path="/usr/bin/git"

function vim_install_check()
{
	if [ ! -f "$vim_path" ]; then
		apt-get -y install vim
	fi
}

#Vi IMproved - enhanced vi editor - with scripting languages support
function vim_nox_install_check()
{
	if [ ! -f "$vim_nox_path" ]; then
		apt-get -y install vim-nox
	fi

}

function git_install_check()
{
	if [ ! -f $git_path ]; then
		apt-get -y install git
	fi

}

function install_codeFrame()
{
	if [ ! -d $vim_plugin_path ]; then
		mkdir -p $vim_plugin_path
	fi
	
	cd $vim_plugin_path
	git clone https://github.com/westporch/codeFrame.git
}

function install_codeFrame_for_debian_series()
{
	vim_install_check
	vim_nox_install_check
	git_install_check
	install_codeFrame
}

linux_type=`cat /etc/*release | grep ^ID= | cut -d '=' -f2 | cut -d '"' -f2`

case $linux_type in
	debian) install_codeFrame_for_debian_series ;;
	raspbian) install_codeFrame_for_debian_series ;;
	kali) install_codeFrame_for_debian_series ;;
	ubuntu) install_codeFrame_for_debian_series ;;

esac
