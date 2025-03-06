# linux-setup-script
# Скрипт установки и настройки Arch Linux

Этот скрипт автоматизирует установку и настройку Arch Linux, включая установку графических окружений, дополнительных пакетов, настройку Xorg и VAAPI.

## Возможности

-   Установка KDE Plasma, Gnome и XFCE из репозитория или архива.
-   Настройка pacman.conf и обновление баз данных.
-   Установка дополнительных пакетов (Firefox, Dolphin, Steam, Wine и др.).
-   Установка пакетов для разработчиков (GitHub Desktop, VS Code).
-   Настройка Xorg для Intel, NVIDIA и AMD видеокарт.
-   Сборка и установка yay из AUR.
-   Настройка VAAPI для Intel, NVIDIA и AMD видеокарт.
-   Перезагрузка системы.

## Использование

1. Загрузите скрипт. git clone https://github.com/ChosenSoull/Linux-setup-script/tree/main
2. Зайдите в директорию Linux-setup-script. cd Linux-setup-script
3. Запустить скрипт Linux-setup-script. ./linux-setup-script.sh
4. Все готово

## Требования

-   Arch Linux
-   Права суперпользователя (sudo)
-   Подключение к интернету (для установки пакетов из репозитория и AUR)
-   Установленный git (для сборки yay)

## Структура проекта

-   `linux-setup-script.sh`: Основной скрипт.
-   `files/`: Директория для локальных пакетов и исходников.
    -   `Plasma6.2.5/`: Локальные пакеты для KDE Plasma 6.2.5.
    -   `Gnome/`: Локальные пакеты для Gnome.
    -   `XFCE/`: Локальные пакеты для XFCE.
    -   `yay/`: Исходники yay (для сборки из AUR).
    -   `intel-vaapi-driver/`: Исходники драйвера Intel VA-API.
    -   `media-driver/`: Исходники Intel Media Driver.

## Настройка

-   Локальные пакеты для KDE Plasma, Gnome и XFCE должны быть размещены в соответствующих директориях внутри `files/`.

## Известные проблемы

-   Установка Gnome и XFCE из архива может не работать. :(

## Лицензия

Этот скрипт распространяется под лицензией MIT.

## Автор

ChosenSoul