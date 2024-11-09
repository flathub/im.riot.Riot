# im.riot.Riot

This is a community-maintained [Flatpak](https://flatpak.org/) distribution of [Element Desktop](https://github.com/element-hq/element-desktop/), [formerly](https://element.io/blog/the-world-is-changing/) called Riot.

## User-specified config.json

Element Desktop's [instructions](https://github.com/vector-im/element-desktop/#user-specified-configjson) to use user-specified configuration settings do not apply. Instead, `config.json` must be created at `~/.var/app/im.riot.Riot/config/$NAME/config.json`, where `$NAME` is typically `Element`. The contents of the file are otherwise the same.

## Networking proxy

Overriding enviroment variables such as `all_proxy`, `http_proxy`, `https_proxy` can toggle proxy for Element Desktop. For example:

```bash
# enable proxy
flatpak override --env=all_proxy=http://127.0.0.1:7890 im.riot.Riot

# disable proxy overriding and use proxy settings from system (if current-shell env have related variables)
flatpak override --unset-env=all_proxy im.riot.Riot

# disable all proxy settings (Flatpak shell will inherit env from host shell sometimes)
flatpak override --env=all_proxy="" --env=http_proxy="" --env=https_proxy="" im.riot.Riot
```
