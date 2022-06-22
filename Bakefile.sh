# shellcheck shell=bash

task.watch() {
	pnpm run watch
}

task.build() {
	pnpm run build
}

task.publish() {
	vsce publish
}
