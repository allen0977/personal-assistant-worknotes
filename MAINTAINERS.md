# Maintainer Tooling

These tools are optional for maintainers and are not required to use the project.

Install the recommended local checks with Homebrew:

```bash
brew install gh gitleaks ripgrep shellcheck bats prettier node
npm install --global cspell markdownlint-cli2
```

Verify:

```bash
gh --version
gitleaks version
rg --version
shellcheck --version
bats --version
prettier --version
markdownlint-cli2 --version
cspell --version
```

`ripgrep` speeds up repository searches and is used by checks when available.
The installer and tests fall back to standard `grep` when it is not installed.

`gh` supports authenticated GitHub repository and remote workflows.
`gitleaks` scans the publication tree for accidentally committed secrets.
`cspell` checks Markdown prose using the project dictionary in `.cspell.json`.

Recommended checks:

```bash
gh auth status
gitleaks detect --source . --redact
shellcheck install.sh
markdownlint-cli2 '**/*.md' '#node_modules' '#.git'
cspell --no-progress '**/*.md'
prettier --check '**/*.{md,json,yaml,yml}'
```

Do not auto-format the existing project until Markdown style rules are agreed.
