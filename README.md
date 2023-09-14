# im.riot.Riot

This is a community-maintained [Flatpak](https://flatpak.org/) distribution of [Element Desktop](https://github.com/vector-im/element-desktop/), [formerly](https://element.io/previously-riot) called Riot.

## User-specified config.json

Element Desktop's [instructions](https://github.com/vector-im/element-desktop/#user-specified-configjson) to use user-specified configuration settings do not apply. Instead, `config.json` must be created at `~/.var/app/im.riot.Riot/config/$NAME/config.json`, where `$NAME` is typically `Element`. The contents of the file are otherwise the same.


## Development

Check out this repo or you fork, make sure to include the submodule:
```sh
git clone --recursive git@github.com:flathub/im.riot.Riot.git
cd im.riot.Riot
```

Then you can build the package via `flatpak-builder`:
```sh
flatpak-builder builddir --user --ccache --force-clean --install im.riot.Riot.yaml
```

Then run the flatpak app:
```sh
flatpak run im.riot.Riot
```
