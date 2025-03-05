#!/bin/bash

# Сохраняем исходную директорию
ORIGINAL_DIR=$(pwd)

# Функция для установки пакетов из директории
install_Plasma() {
echo "Выберите способ установки KDE Plasma"
    echo "1. Установить из репозитория"
    echo "2. Установить Plasma 6.2.5"
    read -p "Ваш выбор: " choice

case $choice in
        1)
            # Установка из репозитория
            sudo pacman -S plasma
            if [ $? -eq 0 ]; then
                echo "Установка KDE Plasma из репозитория завершена."
            else
                echo "Ошибка при установке KDE Plasma из репозитория."
            fi
            ;;
        2)
        # Указываем директорию с пакетами
        PACKAGE_DIR="Plasma6.2.5"
            # Проверка, существует ли указанная папка
            if [ ! -d "files/$PACKwAGE_DIR" ]; then
                echo "Ошибка: папка '$PACKAGE_DIR' не найдена."
                return 1
            fi

            # Переходим в указанную папку
            cd "files/$PACKAGE_DIR"

            # Собираем список пакетов
            PACKAGES=$(find . -maxdepth 1 -type f -name "*.pkg.tar.*" -print0 | xargs -0)

            # Устанавливаем все пакеты одной командой
            if [ -n "$PACKAGES" ]; then
                sudo pacman -U $PACKAGES
                echo "Установка пакетов из $PACKAGE_DIR завершена."
            else
                echo "В папке '$PACKAGE_DIR' не найдено пакетов для установки."
            fi

            # Возвращаемся в исходную директорию
            cd "$ORIGINAL_DIR"
            ;;
        *)
            echo "Неверный выбор. Установка KDE Plasma отменена."
            ;;
    esac
}

install_Gnome() {
echo "Выберите способ установки Gnome"
    echo "1. Установить из репозитория"
    echo "2. Установить Gnome"
    read -p "Ваш выбор: " choice

case $choice in
        1)
            # Установка из репозитория
            sudo pacman -S gnome
            if [ $? -eq 0 ]; then
                echo "Установка Gnome из репозитория завершена."
            else
                echo "Ошибка при установке Gnome из репозитория."
            fi
            ;;
        2)
        # Указываем директорию с пакетами
        PACKAGE_DIR="Gnome"
            # Проверка, существует ли указанная папка
            if [ ! -d "$PACKwAGE_DIR" ]; then
                echo "Ошибка: папка '$PACKAGE_DIR' не найдена."
                return 1
            fi

            # Переходим в указанную папку
            cd "$PACKAGE_DIR"

            # Собираем список пакетов
            PACKAGES=$(find . -maxdepth 1 -type f -name "*.pkg.tar.*" -print0 | xargs -0)

            # Устанавливаем все пакеты одной командой
            if [ -n "$PACKAGES" ]; then
                sudo pacman -U $PACKAGES
                echo "Установка пакетов из $PACKAGE_DIR завершена."
            else
                echo "В папке '$PACKAGE_DIR' не найдено пакетов для установки."
            fi

            # Возвращаемся в исходную директорию
            cd "$ORIGINAL_DIR"
            ;;
        *)
            echo "Неверный выбор. Установка Gnome отменена."
            ;;
    esac
}

install_XFCE() {
echo "Выберите способ установки XFCE"
    echo "1. Установить из репозитория"
    echo "2. Установить XFCE"
    read -p "Ваш выбор: " choice

case $choice in
        1)
            # Установка из репозитория
            sudo pacman -S xfce4
            if [ $? -eq 0 ]; then
                echo "Установка XFCE из репозитория завершена."
            else
                echo "Ошибка при установке XFCE из репозитория."
            fi
            ;;
        2)
        # Указываем директорию с пакетами
        PACKAGE_DIR="XFCE"
            # Проверка, существует ли указанная папка
            if [ ! -d "$PACKwAGE_DIR" ]; then
                echo "Ошибка: папка '$PACKAGE_DIR' не найдена."
                return 1
            fi

            # Переходим в указанную папку
            cd "$PACKAGE_DIR"

            # Собираем список пакетов
            PACKAGES=$(find . -maxdepth 1 -type f -name "*.pkg.tar.*" -print0 | xargs -0)

            # Устанавливаем все пакеты одной командой
            if [ -n "$PACKAGES" ]; then
                sudo pacman -U $PACKAGES
                echo "Установка пакетов из $PACKAGE_DIR завершена."
            else
                echo "В папке '$PACKAGE_DIR' не найдено пакетов для установки."
            fi

            # Возвращаемся в исходную директорию
            cd "$ORIGINAL_DIR"
            ;;
        *)
            echo "Неверный выбор. Установка XFCE отменена."
            ;;
    esac
}


install_dev_packages() {
    if ! command -v yay &> /dev/null; then
        echo "Yay не установлен. Попытка сборки..."
        build_yay
        if ! command -v yay &> /dev/null; then
            echo "Ошибка: не удалось установить yay."
            return 1
        fi
    fi
    yay -S github-desktop-bin visual-studio-code-bin
    if [ $? -ne 0 ]; then
        echo "Ошибка при установке пакетов github-desktop-bin и visual-studio-code-bin."
    else
        echo "Установка пакетов github-desktop-bin и visual-studio-code-bin завершена."
    fi
}


# Функция для настройки pacman.conf и обновления баз данных
configure_pacman() {
    # Раскомментирование multilib в /etc/pacman.conf
    sudo sed -i 's/#\[multilib\]/\[multilib\]/' /etc/pacman.conf
    sudo sed -i '/\[multilib\]/{n;s/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/}' /etc/pacman.conf

    # Обновление баз данных пакетов
    sudo pacman -Sy
    echo "Настройка pacman.conf и обновление баз данных завершены."
}

# Функция для установки дополнительных пакетов
install_extra_packages() {
    sudo pacman -S firefox ark dolphin htop audacious telegram-desktop cmake spotify-launcher discord gwenview steam wine wine-mono wine-gecko winetricks lib32-libpulse noto-fonts-cjk wget lib32-mesa obs-studio libva-utils
    echo "Установка дополнительных пакетов завершена."
}

# Функция для настройки Xorg
configure_xorg() {
    # Установка xf86-video-intel
    sudo pacman -S xf86-video-intel
    # Создание файла /etc/X11/xorg.conf.d/20-intel.conf
    cat <<EOF | sudo tee /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
    Identifier "Intel Graphics"
    Driver "Intel"
    Option    "DRI"           "3"
    Option    "TearFree"      "false"
    Option    "TripleBuffer"  "false"
    Option    "SwapbuffersWait"    "false"
EndSection
EOF

    # Конфигурация Xorg
    sudo Xorg :3 -configure
    sudo cp /root/xorg.conf.new /etc/X11/xorg.conf
    echo "Конфигурация Xorg завершена."
}

# Функция для сборки yay
build_yay() {
    if [ -d "files/yay" ]; then
    cd files/yay
    makepkg -si
    if [ $? -eq 0 ]; then # Проверяем, успешно ли выполнен makepkg
        echo "Сборка пакета yay завершена."
    else
        echo "Ошибка при сборке yay."
    fi
    # Возвращаемся в исходную директорию
    cd "$ORIGINAL_DIR"
else
    echo "Директория 'yay' не найдена."
fi

echo "Сборка пакета yay завершена (если директория yay была найдена)."
}

# Функция для сборки intel-vaapi-driver
vaapi_configuration() {
    echo "Выберите способ установки intel-vaapi-driver:"
    echo "1. Установить из репозитория"
    echo "2. Собрать из исходников"
    read -p "Ваш выбор: " choice

    case $choice in
        1)
            # Установка из репозитория
            sudo pacman -S libva-intel-driver
            if [ $? -eq 0 ]; then
                echo "Установка intel-vaapi-driver из репозитория завершена."
            else
                echo "Ошибка при установке intel-vaapi-driver из репозитория."
            fi
            ;;
        2)
            # Сборка из исходников
            if [ ! -d "files/intel-vaapi-driver-2.4.1" ]; then
                echo "Директория 'intel-vaapi-driver-2.4.1' не найдена. Поместите исходники в эту директорию."
                return 1
            fi

            cd files/intel-vaapi-driver-2.4.1
            autoreconf -f -i
            ./configure
            make
            sudo make install
            cd "$ORIGINAL_DIR"
            echo "Сборка и установка intel-vaapi-driver из исходников завершены."
            ;;
        *)
            echo "Неверный выбор. Установка intel-vaapi-driver отменена."
            ;;
    esac
}

# Меню выбора
while true; do
    echo "Выберите действие:"
    echo "1. Установить KDE Plasma"
    echo "2. Установить Gnome"
    echo "3. Установить XFCE"
    echo "4. Настроить pacman.conf и обновить базы данных"
    echo "5. Установить дополнительные пакеты"
    echo "6. Установить пакеты для разработчиков"
    echo "7. Настроить Xorg"
    echo "8. Собрать и установить yay"
    echo "9. Настроить VAAPI"
    echo "10. Перезагрузить систему"
    echo "11. Выйти"
    read -p "Ваш выбор: " choice

    case $choice in
        1) install_Plasma ;;
        2) install_Gnome ;;
        3) install_XFCE ;;
        4) configure_pacman ;;
        5) install_extra_packages ;;
        6) install_dev_packages ;;
        7) configure_xorg ;;
        8) build_yay ;;
        9) vaapi_configuration ;;
        10) sudo reboot ;;
        11) exit 0 ;;
        *) echo "Неверный выбор. Повторите попытку." ;;
    esac
done
