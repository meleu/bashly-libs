# Bashly Custom Libraries Template

A template repository for building and sharing custom
[Bashly](https://bashly.dev) libraries.

---

> **Instructions for template builders (you!)**
> 1. Clone this repository (or click **Use this template** on GitHub).
> 2. Update the README with your own instructions.
> 3. Add your libraries — each library in its own folder.
> 4. Update the libraries configuration in `libraries.yml`.
> 5. Replace all references of:   
>    **github:bashly-framework/custom-libs-template**
>
>    with your own GitHub username/repo:  
>    **github:YOUR_USERNAME/YOUR_REPO**
>
> Documentation: https://bashly.dev/advanced/lib-source/
>
> If you create a public Custom Libraries source that could be useful to others,
> please share it in [Bashly Discussions → Show and tell](https://github.com/bashly-framework/bashly/discussions/categories/show-and-tell)
> or add it to the [Bashly Wiki → Community Standard Libraries](https://github.com/bashly-framework/bashly/wiki/Community-Standard-Libraries).
>
> Delete this section when you’re done.

---

This repository contains custom, reusable Bash functions that are ready to be
added to any [Bashly](https://bashly.dev) project.

## Usage

To add a library from this repository into your Bashly project, run:

```console
bashly add --source github:bashly-framework/custom-libs-template LIBRARY
```

For example:

```console
bashly add --source github:bashly-framework/custom-libs-template prompts
```

### Libraries Index

- **prompts**: Add `prompt` and `ask` functions to prompt users for input
