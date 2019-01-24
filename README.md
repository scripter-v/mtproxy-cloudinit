# Скрипт наливки машины с mt-proxy и socks5 proxy для DO
В Digital Ocean есть возможность для новых дроплетов указать [пользовательский скрипт Cloud-Init](https://cloudinit.readthedocs.io/en/latest/topics/format.html#user-data-script).
Для этого при создании дроплета нужно в секции **"Select additional options"** установить флаг **"User data"** и
вставить в поле ввода содержимое файла [install.sh](https://raw.githubusercontent.com/scripter-v/mtproxy-cloudinit/master/install.sh) и не забыть задать секреты:
```
socks5_user=
socks5_passwd=
mt_proxy_secret=
```
Сервер будет полностью подготовлен к использованию в течение нескольких минут.

## О mt-proxy, секретах и блокировках
* https://telegra.ph/telegram-blocks-wtf-05-26
* https://github.com/serjs/socks5-server


## Конфигурация
* mt-proxy живет на порту `443`
* socks5 proxy на порту `2081`

## Сервисы
Используются докеризованные сервисы [mtg](https://github.com/9seconds/mtg) и [go-socks5-proxy](https://github.com/serjs/socks5-server)
