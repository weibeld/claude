# Claude Code Settings

This repository contains customised [Claude Code settings](https://code.claude.com/docs/en/settings) for the `~/.claude` directory.

## Usage

Use this repository as a bare repository with `~/.claude` as the work tree.

A [bare repository](https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---bare) doesn't have an implicit work tree directory (i.e. the directory where the files of the repository are checked out) like normal repositories. Instead, the work tree is explicitly specified with the [`--work-tree`](https://git-scm.com/docs/git#Documentation/git.txt---work-treepath) option (for example, `git --work-tree ~/.claude ...`).

### 1. Clone repository

Clone the repository with the `--bare` option:

```bash
git clone --bare https://github.com/weibeld/claude
```

> **Note:** this works from any directory of the system.

### 2. Check out files to `~/.claude`

Change into the cloned repository:

```bash
cd claude.git
```

And check out the files to the `~/.claude` work tree:

```bash
git --work-tree ~/.claude checkout
```

> **Note:** to force overwriting the existing files with the same names in `~/.claude`, use the `-f` option, i.e. `git --work-tree ~/.claude checkout -f`.

### 3. Manage files

Change into the repository directory:

```bash
cd claude.git
```

And manage the files in `~/.claude` with the usual Git commands by using the `--work-tree` option for those commands that must be run within a work tree:

For example:

```
git --work-tree=~/.claude status
```

```
git --work-tree ~/.claude add
```

```
git --work-tree ~/.claude commit
```

```
git push
```

> **Note:** commands that interact or track physical files or modify the state of the workspace (e.g. `status`, `add`, `commit`, etc.) must be run within a work tree and thus require the `--work-tree` option. Other commands (such as `push`) don't need to be run in a work tree and thus don't require the `--work-tree` option.

## Tips

- Use the `GIT_WORK_TREE` environment variable instead of the `--work-tree` option:
    ```bash
    export GIT_WORK_TREE=~/.claude
    ```
- Define an alias with the `--work-tree` option:
    ```bash
    alias mygit='git --work-tree ~/.claude'
    ```
- Use the [`--git-dir` option or `GIT_DIR` environment variable](https://git-scm.com/docs/git#Documentation/git.txt---git-dirpath) instead of changing into the repository directory:
    ```bash
    git --git-dir ~/repos/weibeld/claude.git --work-tree ~/.claude ...
    ```
    ```bash
    export GIT_DIR=~/repos/weibeld/claude.git
    ```

## References

- [Claude Code Settings](https://code.claude.com/docs/en/settings)
- [Status Line Configuration](https://code.claude.com/docs/en/statusline)
