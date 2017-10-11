install:
	brew install the_silver_searcher
	brew install ripgrep
	# brew install fzf #TODO
	# /usr/local/opt/fzf/install
	brew install python3
	cargo install racer
	pip3 install vim-vint
	pip3 install proselint
	brew install shellcheck
	vim -c PlugInstall

image:
	docker build -t arnau/vigor .
