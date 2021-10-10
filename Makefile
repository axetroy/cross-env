default:
	@make windows
	@make macos
	@make linux

format:
	@v fmt -w *.v

format-check:
	@v fmt -c *.v

windows:
	@v -prod -os windows -m64 -o ./bin/cross-env.exe main.v

macos:
	@v -prod -os macos -m64 -o ./bin/cross-env main.v

linux:
	@v -prod -os linux -m64 -o ./bin/cross-env main.v