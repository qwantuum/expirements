-- Хелпер для Void Linux на LuaJIT

local function clearScreen()
    os.execute("clear")
end

local function getUsername()
    -- Получаем имя текущего пользователя (nazar)
    local f = io.popen("whoami")
    local user = f:read("*a"):gsub("%s+", "")
    f:close()
    return user
end

local function showMenu()
    print("====================================")
    print("    VOID LINUX HELPER (LuaJIT)      ")
    print("====================================")
    print("1. Обновить всю систему (xbps-install)")
    print("2. Очистить систему от сирот (xbps-remove -O)")
    print("3. Установить и настроить doas (замена sudo)")
    print("4. Показать инфо о железе (Battery/RAM)")
    print("5. Выйти")
    print("====================================")
    io.write("Выберите действие (1-5): ")
end

local currentUser = getUsername()

while true do
    clearScreen()
    showMenu()
    
    local choice = io.read()
    
    if choice == "1" then
        print("\n[!] Запуск обновления системы...")
        os.execute("sudo xbps-install -Syu")
        print("\nНажмите Enter, чтобы продолжить...")
        io.read()
    elseif choice == "2" then
        print("\n[!] Удаление неиспользуемых пакетов...")
        os.execute("sudo xbps-remove -O")
        print("\nНажмите Enter, чтобы продолжить...")
        io.read()
    elseif choice == "3" then
        print("\n[!] Установка opendoas...")
        os.execute("sudo xbps-install -y opendoas")
        
        print("[!] Настройка конфигурации /etc/doas.conf...")
        -- Создаем временный файл конфигурации и через sudo пишем его в /etc/doas.conf
        -- С опцией 'persist' doas не будет постоянно спрашивать пароль в текущей сессии
        local confCmd = string.format("echo 'permit persist :wheel' | sudo tee /etc/doas.conf")
        os.execute(confCmd)
        
        print("[!] Проверка работоспособности doas...")
        print("Попробуем выполнить 'doas apt' или 'doas xbps-install -S':")
        os.execute("doas xbps-query -L")
        
        print("\n[+] Установка завершена! Теперь вместо 'sudo' можно писать 'doas'.")
        print("Нажмите Enter, чтобы продолжить...")
        io.read()
    elseif choice == "4" then
        print("\n[i] Текущее состояние системы:")
        print("------------------------------------")
        print("Загрузка памяти:")
        os.execute("free -h | grep Mem")
        print("Статус батареи:")
        os.execute("cat /sys/class/power_supply/BAT*/capacity 2>/dev/null && echo '% заряда' || echo 'Батарея не найдена'")
        print("------------------------------------")
        print("\nНажмите Enter, чтобы продолжить...")
        io.read()
    elseif choice == "5" then
        print("\nУдачи в Void Linux! Пока.")
        break
    else
        print("\n[Ошибка] Неверный выбор. Нажмите Enter...")
        io.read()
    end
end
