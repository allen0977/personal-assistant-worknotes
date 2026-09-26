# Maintainer tooling

Not required to use the vault. Users need a standard macOS PATH, VS Code, and Copilot. Do not add these as install-time dependencies.

Use this in the maintained branch only.

```bash
brew install shellcheck bats prettier node
npm install --global markdownlint-cli2
```

Verify:

```bash
shellcheck --version
bats --version
prettier --version
markdownlint-cli2 --version
```

Recommended checks:

```bash
shellcheck install.sh
markdownlint-cli2 '**/*.md' '#node_modules' '#.git'
prettier --check '**/*.{md,json,yaml,yml}'
```

- shellcheck validates `install.sh`
- bats supports installer regression tests (`--lock-notes`, missing commands, existing links)
- markdownlint-cli2 checks Markdown structure and tables
- prettier checks formatting
- node is required because markdownlint-cli2 is distributed through npm

Do not auto-format the existing project until Markdown style rules are agreed. The current files produce many line-length and table-style findings.
