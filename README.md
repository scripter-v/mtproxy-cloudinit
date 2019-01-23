# Скрипт наливки машины с mt-proxy для DO
В Digital Ocean есть возможность для новых дроплетов указать скрипт [Cloud-Init](https://cloudinit.readthedocs.io/en/latest/).
Для этого при создании дроплета нужно в секции **"Select additional options"** установить флаг **"User data"** и
вставить в поле ввода содержимое файла install.sh и не забыть задать секреты:
```
socks5_user=
socks5_passwd=
mt_proxy_secret=
```
Сервер будет настроен в течение нескольких минут и будет готов к использованию.
