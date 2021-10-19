# with thanks to https://github.com/fatih/dotfiles

all:
	mkdir -p ~/.config/nvim

	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/init.vim ~/.config/nvim/init.vim
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.screenrc ] || ln -s $(PWD)/screenrc ~/.screenrc

	# don't show last login message
	touch ~/.hushlogin

clean:
	rm -f ~/.vimrc
	rm -f ~/.zshrc
	rm -f ~/.bashrc
	rm -f ~/.tmux.conf
	rm -f ~/.screenrc

.PHONY: all
