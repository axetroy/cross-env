default:
	@make macos
	@make linux
	@make windows

format:
	@v fmt -w main.v

format-check:
	@v fmt -c *.v

windows:
	@v -prod -os windows -m64 -o ./bin/cross-env_windows_amd64 main.v

macos:
	@v -prod -os macos -m64 -o ./bin/cross-env_darwin_amd64 main.v

linux:
	@v -prod -os linux -m64 -o ./bin/cross-env_linux_amd64 main.v