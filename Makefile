install:
	brew install the_silver_searcher
	brew install fzf
	cargo install racer
	/usr/local/opt/fzf/install
	vim -c PlugInstall


image:
	docker build -t arnau/vigor .
