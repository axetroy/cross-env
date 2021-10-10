module main

import os
import regex

const (
	version = 'v0.1.5'
)

fn print_help() {
	print('cross-env - cross-platform cli for setting environment variables

USAGE:
  cross-env [OPTIONS] [Environment variable] <COMMANDS>

OPTIONS:
  --help, -H       show help
  --version, -V    print the version

EXAMPLE:
  cross-env FOO=BAR NODE_ENV=PRODUCTION node index.js
  cross-env --help
  cross-env --version

SOURCE CODE:
  https://github.com/axetroy/cross-env
')
}

fn main() {
	args := os.args[1..]
	if args.len == 0 {
		print_help()
		exit(1)
	}
	query := r'([a-zA-z0-9_]+)=(.*)'
	mut reg := regex.regex_opt(query) or { panic(err) }
	mut env := os.environ()
	mut flag_index := 0
	for {
		if flag_index >= args.len {
			break
		}

		text := args[flag_index]

		if text.starts_with('-') {
			match text {
				'--help', '-H' {
					print_help()
					exit(0)
				}
				'--version', '-V' {
					println(version)
					exit(0)
				}
				else {
					panic(error("invalid flag '$text'"))
				}
			}
		} else {
			mut start, _ := reg.match_string(text)

			// set env
			if start >= 0 && reg.groups.len > 0 {
				key := text.substr(reg.groups[0], reg.groups[1])
				value := text.substr(reg.groups[2], reg.groups[3])
				env[key] = value
				flag_index++
			} else {
				break
			}
		}
	}
	bin_name := args[flag_index]
	bin_path := os.find_abs_path_of_executable(bin_name) or {
		panic("Can not found executable file '$bin_name' in your \$PATH.\n$err")
	}
	mut ps := os.new_process(bin_path)
	ps.set_args(args[(flag_index + 1)..])
	ps.set_environment(env)
	ps.run()
	ps.wait() // wait for the child process to complete
	assert ps.pid > 0
	assert ps.pid != os.getpid()
}
