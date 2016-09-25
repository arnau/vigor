rm-bundle:
	git submodule deinit -f $(BUNDLE)
	git rm -f $(BUNDLE)


reboot-install:
	brew install the_silver_searcher
	brew install fzf
	cargo install racer
	/usr/local/opt/fzf/install
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
