#!/bin/bash
# version="0.1"
#
# Vibing cat meme generator by OPSXCQ

die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='ocdxvh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# Defaults
_arg_output="meme.mp4"
_arg_cat_text="OPSXCQ"
_arg_drummer_text="Bash"
_arg_drum_text="Shitposting memes"


print_help()
{
  printf '  ----[ Cat Vibing meme Generator by OPSXCQ ]----\n'
	printf '%s\n' "The general script's help msg"
	printf 'Usage: %s [-o|--output <arg>] [-c|--cat-text <arg>] [-d|--drummer-text <arg>] [-x|--drum-text <arg>] [-v|--version] [-h|--help]\n' "$0"
	printf '\t%s\n' "-o, --output: output video for the meme (default: 'meme.mp4')"
	printf '\t%s\n' "-c, --cat-text: Text over the cat (default: 'OPSXCQ')"
	printf '\t%s\n' "-d, --drummer-text: Text over the drummer (default: 'Bash')"
	printf '\t%s\n' "-x, --drum-text: Text over the drum (default: 'Memes')"
	printf '\t%s\n' "-v, --version: Prints version"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-o|--output)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_output="$2"
				shift
				;;
			--output=*)
				_arg_output="${_key##--output=}"
				;;
			-o*)
				_arg_output="${_key##-o}"
				;;
			-c|--cat-text)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_cat_text="$2"
				shift
				;;
			--cat-text=*)
				_arg_cat_text="${_key##--cat-text=}"
				;;
			-c*)
				_arg_cat_text="${_key##-c}"
				;;
			-d|--drummer-text)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_drummer_text="$2"
				shift
				;;
			--drummer-text=*)
				_arg_drummer_text="${_key##--drummer-text=}"
				;;
			-d*)
				_arg_drummer_text="${_key##-d}"
				;;
			-x|--drum-text)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_drum_text="$2"
				shift
				;;
			--drum-text=*)
				_arg_drum_text="${_key##--drum-text=}"
				;;
			-x*)
				_arg_drum_text="${_key##-x}"
				;;
			-v|--version)
				echo test v$version
				exit 0
				;;
			-v*)
				echo test v$version
				exit 0
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_PRINT_HELP=yes die "FATAL ERROR: Got an unexpected argument '$1'" 1
				;;
		esac
		shift
	done
}

parse_commandline "$@"

ffmpeg_args=$(printf "drawtext=text='%s': fontcolor=black: fontsize=48: x=200: y=550, drawtext=text='%s': fontcolor=white: x=850:y=400:fontsize=48, drawtext=text='%s': x=650: y=600: fontcolor=white: fontsize=48:" "${_arg_cat_text}" "${_arg_drummer_text}" "${_arg_drum_text}")

ffmpeg -i cat.mp4 -threads 16 -vf "${ffmpeg_args}" -codec:a copy "${_arg_output}"
