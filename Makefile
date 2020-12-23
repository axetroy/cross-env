default:
	make windows
	make macos
	make linux

format:
	v fmt -w main.v

windows:
	v -prod -os windows -o ./bin/cross-env_win main.v

macos:
	v -prod -os macos -o ./bin/cross-env_osx main.v

linux:
	v -prod -os linux -o ./bin/cross-env_linux main.v