#!/usr/bin/env node
import fs from 'node:fs'

const packageJson = JSON.parse(fs.readFileSync('./package.json', 'utf-8'))

// Assert each file in syntaxes/* has an entry in package.json
for (const file of fs.readdirSync('./syntaxes')) {
	const syntaxName = file.slice(0, file.length - '.tmLanguage.json'.length)
	/** @type {string[]} */
	const allGrammars = packageJson.contributes.grammars
		.map((grammar) => {
			return grammar.language
		})
		.filter((item) => typeof item === 'string')

	if (
		[
			'bats.extended',
			'bats.variables',
			'ejs-nested',
			'ejs',
			'proto3.codeblock',
			'textproto-codeblock',
		].includes(syntaxName)
	) {
		continue
	}

	if (!allGrammars.includes(syntaxName)) {
		console.error(`File '${file}' has no entry in packageJson.contributes.grammars`)
		process.exit(1)
	}
}

// Assert that each file in language-configuration/* has an entry in package.json
for (const file of fs.readdirSync('./language-configuration')) {
	const langConfName = file.slice(0, file.length - '.language-configuration.json'.length)
	/** @type {string[]} */
	const allLangConfNames = packageJson.contributes.languages.map((language) => {
		return language.id
	}).filter((item) => typeof item === 'string')

	if (['ejs'].includes(langConfName)) {
		continue
	}

	if (!allLangConfNames.includes(langConfName)) {
		console.error(`File '${file}' has no entry in packageJson.contributes.languages`)
		process.exit(1)
	}
}

// Assert that each file in package.json exists
{
	/** @type {string[]} */
	const languageFiles = packageJson.contributes.languages.map((language) => language.configuration)
	/** @type {string[]} */
	const grammarFiles = packageJson.contributes.grammars.map((grammar) => grammar.path)

	for (const file of languageFiles.concat(grammarFiles).filter((item => typeof item === 'string'))) {
		if (!fs.existsSync(file)) {
			console.error(`File '${file}' expected to exist`)
			process.exit(1)
		}
	}
}

// Assert that each grammar 'id' in package.json is a real grammar
{
	/** @type {string[]} */
	const languageIds = packageJson.contributes.languages.map((language) => language.id).filter((item => typeof item === 'string'))
	const grammarIds = packageJson.contributes.grammars.map((grammar) => grammar.language).filter((item => typeof item === 'string'))
	for (const grammarId of grammarIds) {
		if (!languageIds.includes(grammarId)) {
			console.error(`Grammar id '${grammarId}' expected to correspond to a language id`)
		}
	}
}
