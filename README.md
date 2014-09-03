# Multi language site with Jekyll

This POC provide a solution in order to setup a **multi language site with Jekyll** (with URL rewrite by subdomain). Is builded around two plugins `herissonConverter.rb` and `i18nFilter.rb`.

Features:

* URL rewriting by subdomain (i.e. en.mydomainname.com fr.mydomainname.com es.mydomainname.com...) => provide by `herissonConverter.rb`
* Page translation => provide by `i18nFilter.rb`

## URL rewriter by subdomain

Plugin `herissonConverter.rb`.

Put URLs in the `_data/locales.yml` file. Like this:

```yml
#_data/locales.yml
fr:
    urlHome: /
    urlAbout: /a-propos/
en:
    urlHome: /
    urlAbout: /about/
```

In the template add `herisson_url: namOfUrl` and `permalink: -` like this:

```yml
---
name: "about"
title: "About"
herisson_url: urlAbout
permalink: -
---
```

And rename templates from `.html` to `.herisson`.

## Filter converter

Plugin `i18nFilter.rb`.

Put the translation in the `_data/locales.yml` file. Like this:

```yml
#_data/locales.yml
fr:
    hello: bonjour
    world: monde

en:
    hello: hello
    world: world
```

In the template use the `trans` filter like this:

```liquid
{{ 'hello_world'|trans }}
```

## Sample SKEL

```
-- about
|   `-- index.herisson
|-- _config-en.yml
|-- _config-fr.yml
|-- _config.yml
|-- _data
|   `-- locales.yml
|-- index.herisson
|-- LICENSE.md
|-- _plugins
|   |-- herissonConverter.rb
|   `-- i18nFilter.rb
|-- README.md
|-- _site
|-- _site-en
|   |-- about
|   |   `-- index.html
|   `-- index.html
`-- _site-fr
    |-- a-propos
    |   `-- index.html
    `-- index.html
```

## Run Jekyll

```sh
$ jekyll serve --config _config.yml,_config-en.yml --watch
$ jekyll serve --config _config.yml,_config-fr.yml --watch
...
```

Each websites (by lang) are available in the `_site-lang/` folder.

## That's it!

## License

- MIT license (see LICENSE.md file)

## Author

- Rémi Babrbe (aka Remiii)

