### Github Action | Formatter

```yaml
name: Format
on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
jobs:
  format:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
        with:
          ref: ${{ github.head_ref }}
      - uses: actions/setup-node@v1
        with:
          node-version: '12.x'
      - name: Format
        run: |
          npm i
          npx standard --fix | echo "Will fix everything I can"
      - name: Commit changes
        uses: stefanzweifel/git-auto-commit-action@v4.1.2
        with:
          commit_message: ':robot: Formatted!'
          branch: ${{ github.head_ref }}
```
