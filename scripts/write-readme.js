#!/usr/bin/env node
import fs from 'node:fs'

const packageJson = JSON.parse(fs.readFileSync('./package.json', 'utf-8'))

// Assert that README.md has all the stuff package.json has
let str = ''
{
	for (const language of packageJson.contributes.languages) {
		let extensionsStr = (language.extensions || []).map((item) => `\`${item}\``).join(', ')
		if (extensionsStr.length > 0) {
			extensionsStr = '(' + extensionsStr + ')'
		}
		str += `- ${language.id} ${extensionsStr}\n`
	}
}

let readmeText = fs.readFileSync('README.md', 'utf-8')
let result = readmeText.replace(
	/(?<=<!-- block-start -->\n).*?(?=<!-- block-end -->)/su,
	str
)
fs.writeFileSync('README.md', result)
