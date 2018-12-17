# Скрипт наливки машины с mt-proxy для DO
В Digital Ocean есть возможность для новых дроплетов указать скрипт [Cloud-Init](https://cloudinit.readthedocs.io/en/latest/).
Для этого при создании дроплета нужно в секции **"Select additional options"** установить флаг **"User data"** и
вставить в поле ввода строку:
```
#include https://raw.githubusercontent.com/scripter-v/mtproxy-cloudinit/master/install.sh
```

После наливки останется [настроить mt-proxy](https://github.com/scripter-v/mtproxy/blob/master/README.md) и запустить его.
