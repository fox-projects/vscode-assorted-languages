# shellcheck shell=bash

task.init() {
	pnpm install
}

task.publish() {
	vsce publish
	ovsx publish --pat "$(<'.env-ovsx')"
}
