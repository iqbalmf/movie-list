#function
clean_pub_get_run:
	@echo "clean the repository"
	flutter clean

	@echo "get dependencies"
	flutter pub get

build_runner:
	@echo "build runner --delete-conflict"
	dart run build_runner build --delete-conflicting-outputs

pull:
	@echo "git pull branch main"
	git pull origin main

.PHONY:clean_pub_get_run pull  #it name specify the make command name