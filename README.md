# Shellinabox S3 (Sass Style System)

#### About shellinabox

> Shell In A Box implements a web server that can export arbitrary command line tools to a web based terminal emulator. This emulator is accessible to any JavaScript and CSS enabled web browser and does not require any additional browser plugins.


## Description

Shellinabox S3 (Sass Style System) aims to provide a layer of customization over Shellinabox.

Unlike default _monolithic built-in stylesheet_, this project breaks down terminal emulator CSS into _smaller, customizable, modular_ parts. To do that it makes the most of [SASS language](http://sass-lang.com/).


## Quick start

This project comes with some pre-built stylesheets ready to be used.

Please refer to [usage section](#usage).


## Build

1.	Install dependency: `apt-get install sassc`

2.	Build by running `make` into project directory.  
	This should generate `build/shellinabox.css` and some `build/theme-*.css`.

	A list of themes to be built may always be specified with:  
	```
	make THEMES="solarized-light solarized-dark"
	```
	Where `THEMES` value must be a **space separated list** or special keyword `ALL`.  
	There must be valid corresponding SCSS files into `sass/themes/` in order to work correctly.

	Default theme is always build but **not included** into main stylesheet and **not loaded** by Shellinabox daemon unless specified.

	Partial builds can be achieved specifying a make target between: `main` or `themes`.

3.	Install

	There is no install target ...*at the moment* // TODO! :P  
	However you can manually move or link CSS files from `build/` to `/usr/local/share/shellinabox/`.

### Monolithic build

Is yet possible to build a monolithic `shellinabox.scss` with a single theme built-into.
To do that:

+	edit `config.scss` and set option `$enable-external-themes: false;`.
+	edit `shellinabox.scss` to import a theme: `@import "themes/theme.scss";`


## Customization

Customization, other than theme switching, can be accomplished by direct modify Sass variables, maps, and custom CSS.

Here's a list of relevant files:

+	`themes/*.scss`: define themes own properties like colors schemes.

	You could create your own theme, place it here, and run `make THEMES="my-theme"`

+	`config.scss`: main configuration file for colors, options, fonts, etc.

	Every SASS variable defined here includes the `!default` flag, so a theme can override these.
	You could edit these values, anyhow, avoid importing a theme here to grant external themes to be generated correctly.

+	`shellinabox.scss` main stylesheet file.

	No need to import a theme here unless you disabled external themes (see [monolithic build](#monolithic-build)).


## Usage

From [Shellinabox manpage](https://github.com/shellinabox/shellinabox/wiki/shellinaboxd_man):
> The daemon serves various built-in resources from URLs underneath the service mount points. One or more `--static-file` options allow for overriding these resources with customized externally provided files. The url can either be an absolute or a relative path.

In order to run Shellinabox daemon with custom stylesheet, use:
```
/usr/bin/shellinaboxd \
  --static-file=styles.css:/path/to/shellinabox.css
```

Note that, by default, **no theme is built-into main stylesheet**. It means no colors: just B/W.  
Run Shellinabox daemon specifying external theme file(s) with `--user-css=styles` option:
```
/usr/bin/shellinaboxd \
  --static-file=styles.css:/path/to/shellinabox.css \
  --user-css=Monokai\ Light:+/path/to/theme-monokai-light.css,Monokai\ Dark:-/path/to/theme-monokai-dark.css
```

These themes will show up as options in the right-click context menu of the terminal emulator and they can be switched by the user at runtime.

Please refer to [Shellinabox manpage](https://github.com/shellinabox/shellinabox/wiki/shellinaboxd_man#options) for naming and grouping these options.


#### More information:

* [Manual page](https://github.com/shellinabox/shellinabox/wiki/shellinaboxd_man)
* [Github mirror](https://github.com/shellinabox/shellinabox/)
* [Official site](https://code.google.com/p/shellinabox)
* [Official wiki](https://code.google.com/p/shellinabox/wiki/shellinaboxd_man)
