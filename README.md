# Скрипт наливки машины в DO с проксями

## Что делает скрипт
Скрипт устанавливает и настраивает докеризованные сервисы mt-proxy ([mtg](https://github.com/9seconds/mtg)) и socks5 proxy ([go-socks5-proxy](https://github.com/serjs/socks5-server))

## Установка
В Digital Ocean есть возможность для новых дроплетов указать [пользовательский скрипт Cloud-Init](https://cloudinit.readthedocs.io/en/latest/topics/format.html#user-data-script).
Для этого при создании дроплета нужно в секции **"Select additional options"** установить флаг **"User data"** и
вставить в поле ввода содержимое файла [install.sh](https://raw.githubusercontent.com/scripter-v/mtproxy-cloudinit/master/install.sh) и не забыть задать секреты:
```
socks5_user=
socks5_passwd=
mt_proxy_secret=
```
Сервер будет полностью подготовлен к использованию в течение нескольких минут.

## Конфигурация
* mt-proxy живет на порту `443`
* socks5 proxy на порту `2081`

## О mt-proxy, секретах и блокировках
* https://telegra.ph/telegram-blocks-wtf-05-26
* https://github.com/9seconds/mtg#secure-mode
