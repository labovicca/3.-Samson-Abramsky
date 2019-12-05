![(аутори)](./repo/glava.png)

Чланак на Википедији - [веза](https://sr.wikipedia.org/wiki/%D0%A1%D0%B0%D0%BC%D1%81%D0%BE%D0%BD_%D0%90%D0%B1%D1%80%D0%B0%D0%BC%D1%81%D0%BA%D0%B8).

#### Struktura

Директоријум `clanak` садржи све потребне датотеке за компајлирање документа о одабраној теми. Директоријум `prezentacija` садржи изворне датотеке за компилацију слајдова презентације.

#### Makefile
```
Прављење чланка и презентације              - $ make или $ make all
Прављење чланка                             - $ make clanak
Прављење презентације                       - $ make prezentacija
Надглед датотека и аутоматско `LaTeX`-овање - $ make watcher
Очистити све направљене датотеке            - $ make clean
```

За аутоматско компајловање потребан је софтвер *inotifywait*.

```
Ubuntu               - # apt install inotify-tools
OpenSUSE (било који) - # zypper install inotify-tools
Fedora               - # dnf install inotify-tools (Fedora 22+, >=2015. год.)
                     - # yum install inotify-tools (пре 2015. год.)
или одговарајући графички програм за инсталацију софтвера (YaST, dnfdragora...)
```

#### Пакети
[scrextend](https://www.ctan.org/pkg/scrextend),
[graphicx](https://www.ctan.org/pkg/graphicx),
[inputenc](https://www.ctan.org/pkg/inputenc),
[fontenc](https://www.ctan.org/pkg/fontenc),
[url](https://www.ctan.org/pkg/url) и [color](https://www.ctan.org/pkg/color).
