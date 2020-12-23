module main

import os
import regex

const (
	version = 'v0.1.0'
)

fn print_help() {
	print('cross-env - cross-platform cli for setting environment variables

USAGE:
  cross-env [Environment variable] <COMMANDS>

EXAMPLE:
  cross-env FOO=BAR NODE_ENV=PRODUCTION node index.js

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
	query := r'([a-zA-z0-9_]+)=([a-zA-z0-9_]+)'
	mut reg := regex.regex_opt(query) or { panic(err) }
	mut env := os.environ()
	mut index := 0
	for {
		if index >= args.len {
			break
		}
		text := args[index]
		if text == '--help' || text == '-H' {
			print_help()
			exit(0)
			return
		}
		if text == '--version' || text == '-V' {
			println(version)
			exit(0)
		}
		mut start, _ := reg.match_string(text)
		if start >= 0 && reg.groups.len > 0 {
			key := text.substr(reg.groups[0], reg.groups[1])
			value := text.substr(reg.groups[2], reg.groups[3])
			env[key] = value
		} else {
			break
		}
		index++
	}
	bin_path := os.find_abs_path_of_executable(args[index]) or { panic(err) }
	mut ps := os.new_process(bin_path)
	ps.set_args(args[(index + 1)..])
	ps.set_environment(env)
	ps.run()
	ps.wait() // wait for the child process to complete
	assert ps.pid > 0
	assert ps.pid != os.getpid()
}
