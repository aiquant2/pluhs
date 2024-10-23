

# plu-hs README

Welcome to the **plu-hs** extension! This extension provides syntax highlighting, semantic highlighting, and other developer tools for **Plutus** and **Haskell** languages, with seamless integration with the **Cardano Node** for smart contract development.

## Features

- **Syntax highlighting** for both Haskell and Plutus code.
- **Semantic highlighting** to distinguish different code elements such as functions, variables, and Plutus-specific constructs (e.g., `Validator`, `Datum`, `Redeemer`).
- **Bracket matching** and auto-closing pairs for common Plutus and Haskell structures.
- Support for **Plutus-specific** keywords and tokens like `TxOut`, `TxIn`, `UTxO`, `PubKeyHash`.
- Integration with **VS Code** for enhanced productivity when writing smart contracts on the Cardano blockchain.

### Screenshots

Here's a screenshot showing the extension in action:

\!\[Plutus and Haskell syntax highlighting\]\(images/syntax-highlighting.png\)

> **Tip:** Use animations or short, focused videos to demonstrate the extension’s features. This helps users understand it better and shows off the real-time performance of the tool.

## Requirements

Before using the **plu-hs** extension, ensure that you have the following installed:

- **VS Code** version 1.94.0 or later.
- **Haskell** installed on your system (via `ghcup` or similar).
- **Cardano Node** running locally or connected to a testnet for full Plutus smart contract integration.
  
To install and set up the Cardano node, follow the official [Cardano Node installation guide](https://developers.cardano.org/docs/get-started/installing-cardano-node/).

## Extension Settings

This extension contributes the following settings:

* `plu-hs.enable`: Enable or disable this extension.
* `plu-hs.autoClosePairs`: Enable or disable automatic closing of pairs for Haskell and Plutus.
* `plu-hs.semanticHighlighting`: Enable or disable semantic token highlighting.

## Known Issues

Please be aware of the following known issues:

- **High memory usage** when working with very large Plutus contracts.
- **Semantic highlighting delays** may occur on first load for complex projects.

If you encounter issues, please feel free to report them on our GitHub repository.

## Release Notes

### 0.0.1

- Initial release of plu-hs, featuring:
  - Syntax and semantic highlighting for Haskell and Plutus.
  - Bracket matching and auto-closing pairs.
  - Support for Plutus-specific tokens like `TxOut`, `Validator`, `Datum`, and more.

---

## Working with Markdown

You can author this README using Visual Studio Code. Here are some useful editor keyboard shortcuts:

* Split the editor (`Cmd+\` on macOS or `Ctrl+\` on Windows and Linux).
* Toggle preview (`Shift+Cmd+V` on macOS or `Shift+Ctrl+V` on Windows and Linux).
* Press `Ctrl+Space` (Windows, Linux, macOS) to see a list of Markdown snippets.

## For more information

* [Visual Studio Code's Markdown Support](http://code.visualstudio.com/docs/languages/markdown)
* [Markdown Syntax Reference](https://help.github.com/articles/markdown-basics/)

**Enjoy working with Haskell and Plutus on Cardano!**

---

