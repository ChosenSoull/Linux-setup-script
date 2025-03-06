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
    echo "2. Установить Plasma из архива Arch Linux"
    read -p "Ваш выбор: " choice

    case $choice in
        1)
            # Установка из репозитория
            sudo pacman -S plasma --noconfirm
            if [ $? -eq 0 ]; then
                echo "Установка KDE Plasma из репозитория завершена."
            else
                echo "Ошибка при установке KDE Plasma из репозитория."
            fi
            ;;
        2)
            # Установка из архива Arch Linux
            install_plasma_from_archive_one_click
            ;;
        *)
            echo "Неверный выбор. Установка KDE Plasma отменена."
            ;;
    esac
}

install_plasma_from_archive_one_click() {
echo "Выберите версию KDE Plasma для установки из архива Arch Linux:"
echo "1. Plasma 6.3.2"
echo "2. Plasma 6.2.5" # Пример Plasma 5
read -p "Ваш выбор: " versionPlasma

    # Объявляем ассоциативный массив для версий пакетов
    declare -A plasma_package_versions

    case "$versionPlasma" in
        1)
            plasma_version_name="6.3.2" # Для отображения пользователю
            # Заполняем массив plasma_package_versions для Plasma 6.3.2
            plasma_package_versions=(
                ["kwayland"]="6.3.2-1"
                ["kactivitymanagerd"]="6.3.2-1"
                ["libkscreen"]="6.3.2-1"
                ["plasma-activities"]="6.3.2-1"
                ["plasma-activities-stats"]="6.3.2-1"
                ["libplasma"]="6.3.2-1"
                ["kscreenlocker"]="6.3.2-1"
                ["kdecoration"]="6.3.2-1"
                ["oxygen"]="6.3.2-1"
                ["breeze"]="6.3.2-1"
                ["kglobalacceld"]="6.3.2-1"
                ["libksysguard"]="6.3.2-1"
                ["ksystemstats"]="6.3.2-1"
                ["milou"]="6.3.2-1"
                ["ocean-sound-theme"]="6.3.2-1-any"
                ["oxygen-sounds"]="6.3.2-1-any"
                ["plasma5-integration"]="6.3.2-1"
                ["kpipewire"]="6.3.2-1"
                ["plasma5support"]="6.3.2-1"
                ["kde-cli-tools"]="6.3.2-1"
                ["systemsettings"]="6.3.2-1"
                ["kinfocenter"]="6.3.2-1"
                ["kmenuedit"]="6.3.2-1"
                ["powerdevil"]="6.3.2-1"
                ["polkit-kde-agent"]="6.3.2-1"
                ["bluedevil"]="1:6.3.2-1"
                ["breeze-gtk"]="6.3.2-1-any"
                ["breeze-plymouth"]="6.3.2-1"
                ["discover"]="6.3.2-1"
                ["drkonqi"]="6.3.2-1"
                ["flatpak-kcm"]="6.3.2-1"
                ["kde-gtk-config"]="6.3.2-1"
                ["kgamma"]="6.3.2-1"
                ["krdp"]="6.3.2-1"
                ["kscreen"]="6.3.2-1"
                ["ksshaskpass"]="6.3.2-1"
                ["kwallet-pam"]="6.3.2-1"
                ["kwrited"]="6.3.2-1"
                ["plasma-browser-integration"]="6.3.2-1"
                ["plasma-disks"]="6.3.2-1"
                ["plasma-firewall"]="6.3.2-1"
                ["plasma-nm"]="6.3.2-1"
                ["plasma-pa"]="6.3.2-1"
                ["plasma-sdk"]="6.3.2-1"
                ["plasma-systemmonitor"]="6.3.2-1"
                ["plasma-thunderbolt"]="6.3.2-1"
                ["plasma-vault"]="6.3.2-1"
                ["plasma-welcome"]="6.3.2-1"
                ["plasma-workspace-wallpapers"]="6.3.2-1-any"
                ["plymouth-kcm"]="6.3.2-1"
                ["print-manager"]="1:6.3.2-1"
                ["qqc2-breeze-style"]="6.3.2-1"
                ["sddm-kcm"]="6.3.2-1"
                ["wacomtablet"]="6.3.2-1"
                ["xdg-desktop-portal-kde"]="6.3.2-1"
                ["spectacle"]="24.12.1-1"
                ["kwin"]="6.3.2.1-5"
                ["layer-shell-qt"]="6.3.2-2"
                ["plasma-workspace"]="6.3.2-1"
                ["plasma-desktop"]="6.3.2-1"
                ["kdeplasma-addons"]="6.3.2-1"
            )
            ;;
        2)
            plasma_version_name="6.2.5" # Для отображения пользователю
            # Заполняем массив plasma_package_versions для Plasma 5.27.10
            plasma_package_versions=(
                ["kwayland"]="6.2.5-1"
                ["kactivitymanagerd"]="6.2.5-1"
                ["libkscreen"]="6.2.5-1"
                ["plasma-activities"]="6.2.5-1"
                ["plasma-activities-stats"]="6.2.5-1"
                ["libplasma"]="6.2.5-1"
                ["kscreenlocker"]="6.2.5-1"
                ["kdecoration"]="6.2.5-1"
                ["oxygen"]="6.2.5-1"
                ["breeze"]="6.2.5-1"
                ["kglobalacceld"]="6.2.5-1"
                ["libksysguard"]="6.2.5-1"
                ["ksystemstats"]="6.2.5-1"
                ["milou"]="6.2.5-1"
                ["ocean-sound-theme"]="6.2.5-1-any"
                ["oxygen-sounds"]="6.2.5-1-any"
                ["plasma5-integration"]="6.2.5-1"
                ["kpipewire"]="6.2.5-1"
                ["plasma5support"]="6.2.5-1"
                ["kde-cli-tools"]="6.2.5-1"
                ["systemsettings"]="6.2.5-1"
                ["kinfocenter"]="6.2.5-1"
                ["kmenuedit"]="6.2.5-1"
                ["powerdevil"]="6.2.5-1"
                ["polkit-kde-agent"]="6.2.5-1"
                ["bluedevil"]="1:6.2.5-1"
                ["breeze-gtk"]="6.2.5-1-any"
                ["breeze-plymouth"]="6.2.5-1"
                ["discover"]="6.2.5-1"
                ["drkonqi"]="6.2.5-1"
                ["flatpak-kcm"]="6.2.5-1"
                ["kde-gtk-config"]="6.2.5-1"
                ["kgamma"]="6.2.5-1"
                ["krdp"]="6.2.5-1"
                ["kscreen"]="6.2.5-1"
                ["ksshaskpass"]="6.2.5-1"
                ["kwallet-pam"]="6.2.5-1"
                ["kwrited"]="6.2.5-1"
                ["plasma-browser-integration"]="6.2.5-1"
                ["plasma-disks"]="6.2.5-1"
                ["plasma-firewall"]="6.2.5-1"
                ["plasma-nm"]="6.2.5-1"
                ["plasma-pa"]="6.2.5-1"
                ["plasma-sdk"]="6.2.5-1"
                ["plasma-systemmonitor"]="6.2.5-1"
                ["plasma-thunderbolt"]="6.2.5-1"
                ["plasma-vault"]="6.2.5-1"
                ["plasma-welcome"]="6.2.5-1"
                ["plasma-workspace-wallpapers"]="6.2.5-1-any"
                ["plymouth-kcm"]="6.2.5-1"
                ["print-manager"]="1:6.2.5-1"
                ["qqc2-breeze-style"]="6.2.5-1"
                ["sddm-kcm"]="6.2.5-1"
                ["wacomtablet"]="6.2.5-1"
                ["xdg-desktop-portal-kde"]="6.2.5-1"
                ["spectacle"]="24.12.1-1"
                ["kwin"]="6.2.5-3"
                ["layer-shell-qt"]="6.2.5-3"
                ["plasma-workspace"]="6.2.5-2"
                ["plasma-desktop"]="6.2.5-2"
                ["kdeplasma-addons"]="6.2.5-2"
            )
            ;;
        *)
            echo "Неверный выбор версии. Установка отменена."
            return 1
            ;;
    esac

    # Проверяем наличие wget и устанавливаем, если его нет (как и раньше)
    if ! command -v wget &> /dev/null; then
        echo "wget не найден. Установка wget..."
        sudo pacman -S wget --noconfirm
        if [ $? -ne 0 ]; then
            echo "Ошибка при установке wget. Установка прервана."
            return 1
        fi
    fi
    
    local arch="x86_64"

    # Создаем директорию files, если её нет (как и раньше)
    mkdir -p "files"

    # Создаем директорию для загрузки пакетов, если её нет (как и раньше), но теперь используем имя версии Plasma
    mkdir -p "files/Plasma-$plasma_version_name"

    # Переходим в директорию files (как и раньше)
    cd "files"

    # Переходим в директорию для загрузки пакетов (как и раньше), но теперь используем имя версии Plasma
    pushd "Plasma-$plasma_version_name"

    # Запрос на подтверждение (как и раньше)
    read -p "Начать установку Plasma $plasma_version_name из архива Arch Linux? (y/n): " confirm
    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "Установка отменена."
        popd
        cd "$ORIGINAL_DIR"
        return 0
    fi

    # Загружаем пакеты (теперь с использованием точных версий из plasma_package_versions)
    no_arch_packages=( # Объявляем массив 'no_arch_packages' (черный список) вне цикла, например, в начале функции
        "breeze-gtk"
        "plasma-workspace-wallpapers"
        "ocean-sound-theme"
        "oxygen-sounds"
    # Добавьте сюда другие пакеты, если нужно
    )

    for pkg in "${!plasma_package_versions[@]}"; do # Используем цикл по ключам plasma_package_versions, как вы просили

        local package_version="${plasma_package_versions[$pkg]}" # Получаем точную версию пакета из массива

        if [[ -z "$package_version" ]]; then
            echo "Ошибка: Версия для пакета '$pkg' не найдена в plasma_package_versions для Plasma $plasma_version_name. Установка прервана."
            popd
            cd "$ORIGINAL_DIR"
            return 1
        fi

        local url="https://archive.archlinux.org/packages/${pkg:0:1}/$pkg/$pkg-$package_version" # Формируем начало URL без архитектуры

        # Проверяем, есть ли пакет в черном списке no_arch_packages
        local is_noarch=false
        for no_arch_pkg in "${no_arch_packages[@]}"; do
            # ---  Усиленный отладочный вывод внутри цикла  ---
            echo "DEBUG:   Сравнение:  Текущий пакет pkg=$(printf %q "$pkg"), Пакет из черного списка no_arch_pkg=$(printf %q "$no_arch_pkg")"
            if [[ "$pkg" == "$no_arch_pkg" ]]; then
                is_noarch=true
                echo "DEBUG:   !!! Совпадение найдено: Пакет '$pkg' == '$no_arch_pkg'. Пакет '$pkg' найден в черном списке."
                break
            fi
        done

        if [[ "$is_noarch" == "false" ]]; then  # Проверяем, является ли is_noarch "false" (пустой строкой)
            echo "DEBUG: Пакет '$pkg' НЕ в черном списке. is_noarch = false" # Теперь "false" ветка выполняется, если is_noarch "false"
            url+="-$arch.pkg.tar.zst" # Если is_noarch = false (не в черном списке), добавляем архитектуру
        else # else ветка выполняется, если is_noarch "true" (не пустая строка)
            echo "DEBUG: Пакет '$pkg' IS в черном списке. is_noarch = true" # Теперь "true" ветка выполняется, если is_noarch "true"
            url+=".pkg.tar.zst" # Если is_noarch = true (в черном списке), НЕ добавляем архитектуру
        fi

        echo "Загрузка $pkg-$package_version..."
        wget "$url"
        if [ $? -ne 0 ]; then
            echo "Ошибка при загрузке $pkg. Установка прервана."
            popd
            cd "$ORIGINAL_DIR"
            return 1
        fi
    done

    # Устанавливаем пакеты (как и раньше)
    echo "Установка пакетов..."
    sudo pacman -U *.pkg.tar.zst --noconfirm
    if [ $? -ne 0 ]; then
        echo "Ошибка при установке пакетов. Установка прервана."
        popd
        cd "$ORIGINAL_DIR"
        return 1
    fi

    echo "Установка Plasma $plasma_version_name из архива Arch Linux завершена."

    # Возвращаемся в исходную директорию (как и раньше)
    popd

    # Удаляем временную директорию (как и раньше)
    rm -rf "Plasma-$plasma_version_name"

    # Возвращаемся в исходную директорию (как и раньше)
    cd "$ORIGINAL_DIR"
}

install_Gnome() {
echo "Выберите способ установки Gnome"
    echo "1. Установить из репозитория"
    echo "2. Установить Gnome (НЕРАБОТАЕТ)"
    read -p "Ваш выбор: " choice

case $choice in
        1)
            # Установка из репозитория
            sudo pacman -S gnome --noconfirm
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
    echo "2. Установить XFCE (НЕРАБОТАЕТ)"
    read -p "Ваш выбор: " choice

case $choice in
        1)
            # Установка из репозитория
            sudo pacman -S xfce4 --noconfirm
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
    yay -S github-desktop-bin visual-studio-code-bin --noconfirm
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
    # Проверка наличия multilib в pacman.conf
    if grep -q "^\[multilib\]" /etc/pacman.conf; then
        echo "Репозиторий multilib включен."
    else
        echo "Репозиторий multilib не включен. Включить его? (y/n)"
        read -r answer
        if [[ "$answer" == "y" || "$answer" == "yes" ]]; then
            # Раскомментирование multilib в /etc/pacman.conf
            sudo sed -i 's/#\[multilib\]/\[multilib\]/' /etc/pacman.conf
            sudo sed -i '/\[multilib\]/{n;s/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/}' /etc/pacman.conf

            # Обновление баз данных пакетов
            sudo pacman -Sy
            echo "Репозиторий multilib включен и базы данных обновлены."
        else
            echo "Установка пакетов, зависящих от multilib, будет пропущена."
        fi
    fi

    # Установка пакетов
    sudo pacman -S firefox ark dolphin htop audacious telegram-desktop cmake spotify-launcher discord gwenview steam wine wine-mono wine-gecko winetricks lib32-libpulse noto-fonts-cjk wget lib32-mesa obs-studio libva-utils --noconfirm
    echo "Установка дополнительных пакетов завершена."
}

# Функция для настройки Xorg
configure_xorg() {
    echo "Выберите видеокарту:"
    echo "1. Intel"
    echo "2. NVIDIA"
    echo "3. AMD"
    read -p "Ваш выбор: " gpu_choice

    case $gpu_choice in
        1)
            # Intel
            echo "Выберите драйвер Intel:"
            echo "1. modesetting (Рекомендуеться)" 
            echo "2. xf86-video-intel"
            read -p "Ваш выбор: " intel_driver_choice

            case $intel_driver_choice in
                1)
                    # modesetting
                    # Создание файла /etc/X11/xorg.conf.d/20-modesetting.conf 
                    cat <<EOF | sudo tee /etc/X11/xorg.conf.d/20-modesetting.conf 
Section "Device" 
    Identifier "Intel Graphics" 
    Driver "modesetting" 
    Option "AccelMethod" "glamor" 
    Option "DRI"  "3" 
EndSection 
EOF
                    ;;
                2)
                    # xf86-video-intel
                    # Установка xf86-video-intel
                    sudo pacman -S xf86-video-intel --noconfirm
                    # Создание файла /etc/X11/xorg.conf.d/20-intel.conf
                    cat <<EOF | sudo tee /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option    "DRI"           "3"
    Option    "TearFree"      "false"
    Option    "TripleBuffer"  "false"
    Option    "SwapbuffersWait"    "false"
EndSection
EOF
                    ;;
                *)
                    echo "Неверный выбор драйвера Intel."
                    return 1
                    ;;
            esac
            ;;
        2)
            # NVIDIA
            echo "Выберите драйвер NVIDIA:"
            echo "1. Nouveau (Открытый)"
            echo "2. NVIDIA (Проприетарный)"
            read -p "Ваш выбор: " nvidia_driver_choice

            case $nvidia_driver_choice in
                1)
                    # Nouveau
                    sudo pacman -S xf86-video-nouveau --noconfirm
                    cat <<EOF | sudo tee /etc/X11/xorg.conf.d/20-nouveau.conf
Section "Device"
    Identifier "Nvidia card"
    Driver "nouveau"
EndSection
EOF
                    ;;
                2)
                    # NVIDIA
                    echo "Выберите версию драйвера NVIDIA:"
                    echo "1. nvidia"
                    echo "2. nvidia-open"
                    echo "3. nvidia-470xx-dkms (AUR)"
                    echo "4. nvidia-390xx-dkms (AUR)"
                    read -p "Ваш выбор: " nvidia_version_choice

                    case $nvidia_version_choice in
                        1)
                            # nvidia
                            sudo pacman -S nvidia --noconfirm
                            ;;
                        2)
                            # nvidia-open
                            sudo pacman -S nvidia-open --noconfirm
                            ;;
                        3)
                            # nvidia-470xx-dkms (AUR)
                            if ! command -v yay &> /dev/null; then
                                echo "Yay не установлен. Попытка сборки..."
                                build_yay
                                if ! command -v yay &> /dev/null; then
                                    echo "Ошибка: не удалось установить yay."
                                    return 1
                                fi
                            fi
                            yay -S nvidia-470xx-dkms --noconfirm
                            ;;
                        4)
                            # nvidia-390xx-dkms (AUR)
                            if ! command -v yay &> /dev/null; then
                                echo "Yay не установлен. Попытка сборки..."
                                build_yay
                                if ! command -v yay &> /dev/null; then
                                    echo "Ошибка: не удалось установить yay."
                                    return 1
                                fi
                            fi
                            yay -S nvidia-390xx-dkms --noconfirm
                            ;;
                        *)
                            echo "Неверный выбор версии драйвера NVIDIA."
                            return 1
                            ;;
                    esac

                    cat <<EOF | sudo tee /etc/X11/xorg.conf.d/20-nvidia.conf
Section "Device"
        Identifier "NVIDIA Card"
        Driver "nvidia"
        VendorName "NVIDIA Corporation"
EndSection
EOF
                    ;;
                *)
                    echo "Неверный выбор драйвера NVIDIA."
                    return 1
                    ;;
            esac
            ;;
        3)
            # AMD
            echo "Выберите драйвер AMD:"
            echo "1. AMDGPU (Открытый)"
            echo "2. ATI (Открытый)"
            echo "3. AMDGPU PRO (Проприетарный)"
            read -p "Ваш выбор: " amd_driver_choice

            case $amd_driver_choice in
                1)
                    # AMDGPU
                    sudo pacman -S xf86-video-amdgpu --noconfirm
                    cat <<EOF | sudo tee /etc/X11/xorg.conf.d/20-amdgpu.conf
Section "OutputClass"
     Identifier "AMD"
     MatchDriver "amdgpu"
     Driver "amdgpu"
     Option "DRI" "3"
EndSection
EOF
                    ;;
                2)
                    # ATI
                    sudo pacman -S xf86-video-ati --noconfirm
                    cat <<EOF | sudo tee /etc/X11/xorg.conf.d/20-radeon.conf
Section "OutputClass"
    Identifier "Radeon"
    MatchDriver "radeon"
    Driver "radeon"
    Option "DRI" "3"
EndSection
EOF
                    ;;
                3)
                    # AMDGPU PRO
                    sudo pacman -S xf86-video-amdgpu --noconfirm
                    cat <<EOF | sudo tee /etc/X11/xorg.conf.d/20-amdgpu.conf
Section "OutputClass"
     Identifier "AMD"
     MatchDriver "amdgpu"
     Driver "amdgpu"
     Option "DRI" "3"
EndSection
EOF
                    ;;
                *)
                    echo "Неверный выбор драйвера AMD."
                    return 1
                    ;;
            esac
            ;;
        *)
            echo "Неверный выбор видеокарты."
            return 1
            ;;
    esac

    # Конфигурация Xorg
    sudo Xorg :3 -configure
    sudo cp /root/xorg.conf.new /etc/X11/xorg.conf
    echo "Конфигурация Xorg завершена."
}

# Функция для сборки yay
build_yay() {
    # Проверяем наличие git
    if ! command -v git &> /dev/null; then
        echo "Git не установлен. Устанавливаем git..."
        sudo pacman -S git --noconfirm
        if [ $? -ne 0 ]; then
            echo "Ошибка при установке git."
            return 1
        fi
        echo "Git установлен."
    fi

    # Проверяем наличие директории files
    if [ ! -d "files" ]; then
        mkdir -p files
    fi
    cd files

    # Клонируем репозиторий yay
    git clone https://aur.archlinux.org/yay.git

    if [ $? -ne 0 ]; then
        echo "Ошибка при клонировании репозитория yay."
        cd "$ORIGINAL_DIR"
        return 1
    fi

    cd yay

    # Собираем и устанавливаем yay
    makepkg -si --noconfirm

    if [ $? -eq 0 ]; then
        echo "Сборка пакета yay завершена."
    else
        echo "Ошибка при сборке yay."
        cd "$ORIGINAL_DIR"
        return 1
    fi

    # Возвращаемся в исходную директорию
    cd "$ORIGINAL_DIR"
    echo "Сборка пакета yay завершена."
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
                            sudo pacman -S libva-intel-driver --noconfirm
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
                            sudo pacman -S intel-media-driver --noconfirm
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
            echo "Хотите установить nouveau-fw?"
            echo "1. Нет"
            echo "2. Да"
            read -p "Ваш выбор: " nouveaufw

            case $nouveaufw in
                1)
                    ;;
                2)
                    # Установка nouveau-fw
                    if ! command -v yay &> /dev/null; then
                        echo "Yay не установлен. Попытка сборки..."
                        build_yay
                        if ! command -v yay &> /dev/null; then
                            echo "Ошибка: не удалось установить yay."
                            return 1
                        fi
                    fi
                    yay -S nouveau-fw --noconfirm
                    if [ $? -eq 0 ]; then
                        echo "Установка nouveau-fw завершена."
                    else
                        echo "Ошибка при установке nouveau-fw."
                    fi
                    ;;
                *)
                    echo "Неверный выбор nouveau-fw"
                    ;;
            esac
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
                    yay -S amdgpu-pro-installer --noconfirm
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
