# shellcheck shell=bash

task.init() {
	pnpm install
}

task.watch() {
	pnpm run watch
}

task.build() {
	pnpm run build
}

task.publish() {
	vsce publish
}
