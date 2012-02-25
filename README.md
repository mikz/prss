# PRSS

## Private RSS [downloader]

HDbits introduced private rss feature where you can export download list
to rss. This tool fetches that rss and download all files to given
directory.

## Install

>  gem install prss


## Usage

>  prss passkey directory

## Cron
> crontab -e

### With RVM

>  \* * * * * /bin/bash -l -c 'prss mypasskey ~/storage/watch'

### Without RVM

>  \* * * * * prss mypasskey ~/storage/watch
