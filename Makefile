install:
	git submodule update --init --recursive --rebase
	ln -sfn ~/.vim/vimrc ~/.vimrc
	cd bundle/vimproc && make

update:
	git submodule sync
	git submodule update --init --recursive --rebase
	cd bundle/vimproc && make

pull:
	git submodule foreach git pull origin master
	cd bundle/vimproc && make


rm-bundle:
	git submodule deinit -f $(BUNDLE)
	git rm -f $(BUNDLE)
