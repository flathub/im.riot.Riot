# Element Desktop

More than group chat: communication.

* Communicate with your team and out of network colleagues more efficiently: use dedicated rooms which persist information from their creation and forever.
* Forget group emails: join or create rooms per topic, per team, per event… Decide the level of transparency you want to provide across the organisation or project.
* Cut through the noise by creating notifications that are customised by you and for you.
* Grab the attention of your colleague by calling out their name and don’t miss a thing with keyword alerts.
* Deploy bots for fun or practical use with our integrations store.

![Element logged-in frontend](https://element.io/blog/content/images/2020/07/Screenshot-2020-07-15-at-00.54.45.png)

## Disclaimer

The Flathub distribution of Element is community maintained and not affiliated with or officially supported by [Element Software, Inc.](https://element.io/). The Flathub distribution of Element has several known known issues, including broken functionality. To install the officially supported version of Element (Debian/Ubuntu only), visit [the official Element website](https://element.io/get-started).

For known issues, visit the [Issues](https://github.com/flathub/im.riot.Riot/issues) page above. Please do not report bugs to the upstream Element maintainers unless you can consistently reproduce them on the official distribution.

## Experimental Features

### Preliminary Wayland support since 1.7.25.

To try running Element natively under Wayland, run:
```bash
$ flatpak run --socket=wayland --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland im.riot.Riot
```
For GNOME, window decorations are currently missing and you'll have to use keyboard shortcuts instead to resize the window.