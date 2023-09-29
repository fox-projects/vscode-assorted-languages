#!/usr/bin/env node
import fs from 'node:fs'

const packageJson = JSON.parse(fs.readFileSync('./package.json', 'utf-8'))

// Assert that README.md has all the stuff package.json has
{
	for (const language of packageJson.contributes.languages) {
		let extensionsStr = (language.extensions || []).map((item) => `\`${item}\``).join(', ')
		if (extensionsStr.length > 0) {
			extensionsStr = '(' + extensionsStr + ')'
		}
		console.log(`- ${language.id} ${extensionsStr}`)
	}
}
