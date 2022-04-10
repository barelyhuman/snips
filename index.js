import markdown from 'markdown-it'
import {fstat, mkdirSync, readFileSync, writeFileSync} from 'node:fs'
import {readdir} from 'node:fs/promises'
import shiki from 'shiki'

function normalizeName(name) {
	const _norm = name.split('.')
	_norm.pop()
	return _norm.join('')
}

function outTemplate(html) {
	return `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Snips</title>
        <style>${styles()}</style>
    </head>
    <body>
        <main>
		<header>
			<a href="/"><h4>Snips</h4></a>
		</header>
        ${html}
        </main>   
    </body>
    </html>
    `
}

function styles() {
	return readFileSync('public/styles.css', 'utf-8')
}

async function main() {
	const highlighter = await shiki.getHighlighter({
		theme: 'min-dark',
	})
	const _markdown = markdown({
		html: true,
		highlight: (code, lang) => {
			return highlighter.codeToHtml(code, {lang})
		},
	})

	const files = await readdir('snippets')
	const filePath = file => `snippets/${file}`

	mkdirSync('build', {recursive: true})

	files.forEach(file => {
		const html = _markdown.render(readFileSync(filePath(file), 'utf-8'))
		writeFileSync(`build/${normalizeName(file)}.html`, outTemplate(html))
	})
}

main()
