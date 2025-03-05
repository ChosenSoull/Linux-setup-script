#!/bin/bash

# Сохраняем исходную директорию
ORIGINAL_DIR=$(pwd)
if [ ! -d "files" ]; then
    mkdir files
fi

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
            if [ ! -d "files/$PACKAGE_DIR" ]; then
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
    # Выбор репозиториев
    echo "Выберите репозитории для включения (введите номера через пробел):"
    echo "1. core"
    echo "2. extra"
    echo "3. multilib"
    echo "4. core-testing"
    echo "5. extra-testing"
    echo "6. multilib-testing"
    read -p "Ваш выбор: " repo_choices

    # Разбор введенных чисел
    for choice in $repo_choices; do
        case $choice in
            1) repo="core";;
            2) repo="extra";;
            3) repo="multilib";;
            4) repo="core-testing";;
            5) repo="extra-testing";;
            6) repo="multilib-testing";;
            *) echo "Неверный выбор: $choice"; continue;;
        esac

        # Раскомментирование репозитория
        sudo sed -i "s/#\[$repo\]/\[$repo\]/" /etc/pacman.conf
        sudo sed -i "/\[$repo\]/{n;s/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/}" /etc/pacman.conf
        echo "Репозиторий $repo включен."
    done

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

vaapi_configuration() {
    echo "Выберите видеокарту:"
    echo "1. Intel"
    echo "2. NVIDIA"
    echo "3. AMD"
    read -p "Ваш выбор: " gpu_choice

    case $gpu_choice in
        1)
            # Intel VA-API
            echo "Выберите драйвер Intel VA-API:"
            echo "1. libva-intel-driver (для GMA 4500 и до Coffee Lake)"
            echo "2. intel-media-driver (для Broadwell и новее)"
            read -p "Ваш выбор: " intel_driver_choice

            case $intel_driver_choice in
                1)
                    # libva-intel-driver
                    echo "Выберите способ установки libva-intel-driver:"
                    echo "1. Установить из репозитория"
                    echo "2. Собрать из исходников"
                    read -p "Ваш выбор: " libva_choice

                    case $libva_choice in
                        1)
                            # Установка из репозитория
                            sudo pacman -S libva-intel-driver
                            if [ $? -eq 0 ]; then
                                echo "Установка libva-intel-driver из репозитория завершена."
                            else
                                echo "Ошибка при установке libva-intel-driver из репозитория."
                            fi
                            ;;
                        2)
                            # Сборка из исходников
                            if [ ! -d "files" ]; then
                                echo "Директория 'files' не найдена. Поместите исходники в эту директорию."
                                return 1
                            fi
                            cd files
                            if [ ! -d "intel-vaapi-driver" ]; then
                                git clone https://github.com/intel/intel-vaapi-driver.git
                                if [ $? -ne 0 ]; then
                                    echo "Ошибка при клонировании репозитория intel-vaapi-driver."
                                    cd "$ORIGINAL_DIR"
                                    return 1
                                fi
                            fi
                            cd intel-vaapi-driver
                            autoreconf -f -i
                            if [ $? -ne 0 ]; then
                                echo "Ошибка при выполнении autoreconf."
                                cd "$ORIGINAL_DIR"
                                return 1
                            fi
                            ./configure
                            if [ $? -ne 0 ]; then
                                echo "Ошибка при выполнении configure."
                                cd "$ORIGINAL_DIR"
                                return 1
                            fi
                            make
                            if [ $? -ne 0 ]; then
                                echo "Ошибка при выполнении make."
                                cd "$ORIGINAL_DIR"
                                return 1
                            fi
                            sudo make install
                            if [ $? -ne 0 ]; then
                                echo "Ошибка при выполнении sudo make install."
                                cd "$ORIGINAL_DIR"
                                return 1
                            fi
                            cd "$ORIGINAL_DIR"
                            echo "Сборка и установка libva-intel-driver из исходников завершены."
                            ;;
                        *)
                            echo "Неверный выбор способа установки libva-intel-driver."
                            ;;
                    esac # Закрываем блок case для libva_choice
                    ;;
                2)
                    # intel-media-driver
                    echo "Выберите способ установки intel-media-driver:"
                    echo "1. Установить из репозитория"
                    echo "2. Собрать из исходников"
                    read -p "Ваш выбор: " intel_media_choice

                    case $intel_media_choice in
                        1)
                            # Установка из репозитория
                            sudo pacman -S intel-media-driver
                            if [ $? -eq 0 ]; then
                                echo "Установка intel-media-driver из репозитория завершена."
                            else
                                echo "Ошибка при установке intel-media-driver из репозитория."
                            fi
                            ;;
                        2)
                            # Сборка из исходников
                            if [ ! -d "files" ]; then
                                echo "Директория 'files' не найдена. Поместите исходники в эту директорию."
                                return 1
                            fi
                            cd files
                            if [ ! -d "media-driver" ]; then
                                git clone https://github.com/intel/media-driver.git
                                if [ $? -ne 0 ]; then
                                    echo "Ошибка при клонировании репозитория media-driver."
                                    cd "$ORIGINAL_DIR"
                                    return 1
                                fi
                            fi
                            sudo pacman -S intel-gmmlib cmake
                            cd media-driver
                            mkdir -p build_media
                            cd build_media
                            cmake ..
                            if [ $? -ne 0 ]; then
                                echo "Ошибка при выполнении cmake."
                                cd "$ORIGINAL_DIR"
                                return 1
                            fi
                            make -j"$(nproc)"
                            if [ $? -ne 0 ]; then
                                echo "Ошибка при выполнении make."
                                cd "$ORIGINAL_DIR"
                                return 1
                            fi
                            sudo make install
                            if [ $? -ne 0 ]; then
                                echo "Ошибка при выполнении sudo make install."
                                cd "$ORIGINAL_DIR"
                                return 1
                            fi
                            cd "$ORIGINAL_DIR"
                            echo "Сборка и установка intel-media-driver из исходников завершены."
                            ;;
                        *)
                            echo "Неверный выбор способа установки intel-media-driver."
                            ;;
                    esac # Закрываем блок case для intel_media_choice
                    ;;
                *)
                    echo "Неверный выбор драйвера Intel VA-API."
                    ;;
            esac # Закрываем блок case для intel_driver_choice
            ;;
        2)
            # NVIDIA VA-API
            if ! command -v yay &> /dev/null; then
                echo "Yay не установлен. Попытка сборки..."
                build_yay
                if ! command -v yay &> /dev/null; then
                    echo "Ошибка: не удалось установить yay."
                    return 1
                fi
            fi
            yay -S nouveau-fw
            if [ $? -eq 0 ]; then
                echo "Установка nouveau-fw завершена."
            else
                echo "Ошибка при установке nouveau-fw."
            fi
            ;;
        3)
            # AMD VA-API
            echo "AMD VA-API поддерживается в драйвере Mesa."
            echo "Выберите драйвер AMD:"
            echo "1. Остаться на открытом драйвере (Mesa)"
            echo "2. Перейти на проприетарный драйвер AMDGPU PRO"
            read -p "Ваш выбор: " amd_driver_choice

            case $amd_driver_choice in
                1)
                    ;;
                2)
                    if ! command -v yay &> /dev/null; then
                        echo "Yay не установлен. Попытка сборки..."
                        build_yay
                        if ! command -v yay &> /dev/null; then
                            echo "Ошибка: не удалось установить yay."
                            return 1
                        fi
                    fi
                    yay -S amdgpu-pro-installer
                    ;;
                *)
                    echo "Неверный выбор драйвера AMD."
                    ;;
            esac # Закрываем блок case для amd_driver_choice
            ;;
        *)
            echo "Неверный выбор видеокарты."
            ;;
    esac # Закрываем блок case для gpu_choice
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
