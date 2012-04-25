## First time

```bash
cd ~/.vim
git submodule update --init
cd ~/.vim/bundle/command-t; rake make # For Command-T
```

## How to add a new plugin

```bash
cd ~/.vim
git submodule add bundle_url bundle/bundle_name
git submodule init
```
Then, in `~/.vim/.gitmodules`, add the line `ignore = dirty` to each submodule.

## Updating plugins

```bash
cd ~/.vim
git pull origin
git submodule foreach git pull origin master
git commit *bundles* -m "Updated plug-ins"
git push origin
```