# meleu's Bashly Custom Libraries

For now I'm just learning how to create a repo for Bashly libs.

If you wanna try by yourself, check [the official documentation](https://bashly.dev/advanced/lib-source/).

---

This repository contains custom, reusable Bash functions that are ready to be
added to any [Bashly](https://bashly.dev) project.

## Usage

To add a library from this repository into your Bashly project, run:

```console
bashly add --source github:meleu/bashly-libs LIBRARY
```

For example:

```console
bashly add --source github:meleu/bashly-libs logs
```

### Libraries Index

- **logs**: Provide commands for structured logging (debug/info/warn/error).
