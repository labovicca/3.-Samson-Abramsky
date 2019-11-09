![(аутори)](./repo/glava.png)

Чланак на Википедији - [веза](https://sr.wikipedia.org/sr-el/%D0%9A%D0%BE%D1%80%D0%B8%D1%81%D0%BD%D0%B8%D0%BA:MekaDrage/%D0%BF%D0%B5%D1%81%D0%B0%D0%BA).

#### Makefile
```
Прављење .dvi документа                     - $ make или $ make all
Надглед датотека и аутоматско `LaTeX`-овање - $ make watcher
Очистити све направљене датотеке            - $ make clean
```

За аутоматско компајловање потребан је софтвер inotifywait.

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
