/** @type {import('prettier').Config} */
module.exports = {
	...require('@hyperupcall/prettier-config'),
	overrides: [
		{
			files: '*.tmLanguage.json',
			options: {
				plugins: ['prettier-plugin-sort-json'],
				jsonSortOrder: JSON.stringify({
					$schema: null,
					name: null,
					scopeName: null,
					uuid: null,
					comment: null,
					author: null,
					maxTokensPerLine: null,
					keyEquivalent: null,
					fileTypes: null,
					injectionSelector: null,
					foldingStartMarker: null,
					foldingStopMarker: null,
					'/^[^\\d+]/': 'lexical',
					'/^\\d+/': 'numeric',
					patterns: null,
					repository: null,
				}),
			},
		},
		{
			files: '*.language-configuration.json',
			options: {
				plugins: ['prettier-plugin-sort-json'],
				jsonSortOrder: JSON.stringify({
					$schema: null,
					comments: null,
					wordPattern: null,
					colorizedBracketPairs: null,
					brackets: null,
					autoCloseBefore: null,
					autoClosingPairs: null,
					surroundingPairs: null,
					lineComment: null,
					blockComment: null,
					'/^[^\\d+]/': 'lexical',
					'/^\\d+/': 'numeric',
				}),
			},
		},
	],
}
