#!/bin/bash
set -e

case "$(uname -s)" in
	Linux*)			"$(dirname $0)/setup-host-linux.sh";;
	Darwin*)		"$(dirname $0)/setup-host-macos.sh";;
	CYGWIN|MINGW*)	"$(dirname $0)/setup-host-win.sh";;
	*)          	>&2 echo "WARNING: unknown host system";;
esac
