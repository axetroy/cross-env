default:
	make macos
	make linux
	make windows

format:
	v fmt -w main.v

windows:
	v -prod -os windows -m64 -o ./bin/cross-env_win main.v
	v -prod -os windows -m32 -o ./bin/cross-env_win main.v

macos:
	v -prod -os macos -m64 -o ./bin/cross-env_osx main.v

linux:
	v -prod -os linux -m64 -o ./bin/cross-env_linux main.v
	v -prod -os linux -m32 -o ./bin/cross-env_linux main.v