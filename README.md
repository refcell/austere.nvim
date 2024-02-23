# austere

Austere is a minimally constructed neovim config built from the ground up.

## Overview

At its core, Austere is an opinionated [neovim][neovim] configuration with
remote usage as a core design tennant. Austere is **not** meant to be a
framework and provides a minimal configuration that can be adapted by directly
modifying its source.

Performance is a primary goal without sacrificing aesthetic.

## Usage

To use [Austere][a], clone the repo and then install the configuration.

_Notice, [`just`][just] must be installed to use the convenience bash Justfile target commands._

```bash
git clone https://github.com/refcell/austere
cd austere
just
```

This will copy the [Austere][a] config into the `~/.config/nvim/` directory.
If a neovim config already exists in this directory, it will be copied in a
backup directory `~/.config/nvim.bak`. If you need to revert the [Austere][a]
installation, you can simply run `just restore-backup`.

[just]: https://github.com/casey/just

## Features


## Architecture



## Plugin List




## Requirements

First and foremost, install [Neovim][neovim] itself.

[ripgrep][ripgrep] is used for fast, efficient live word greps.

[ripgrep]: https://github.com/BurntSushi/ripgrep
[neovim]: https://github.com/neovim/neovim

## Contributing

All contributions are welcome.

When contributing please provide a concise description of the issue, feature
request, or your changes.

## License

Open sourced under the [MIT License][license].

## Acknowledgements

- [@clabby][c]'s [dots][cd]
- [Astronvim][avim]

[avim]: https://github.com/AstroNvim/AstroNvim
[c]: https://github.com/clabby
[cd]: https://github.com/clabby/dots
[a]: https://github.com/refcell/austere
[neovim]: https://github.com/neovim/neovim
[license]: ./LICENSE.md
