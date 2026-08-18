# ща сделаю здесь explain, ⬇️ import-ы
import os
import time

def shutwin(): #выключение винды
    os.system("shutdown /s /f /t 0")


def shuttux(): #выключение линукса
    os.system("sudo shutdown -h now")

# леха если ты это читаешь есть 3 варианта
# 1. я скинул тебе это в .py файле
# 2. ты это дизассемблировал и превратил в псевдо-код на C
# 3. ты научился юзать гит и гитхаб
# 4. раст лежит здесь : C:\Пользователи\Ваше_Имя\.cargo\bin
# 5. добавить в патх раст: (вводи в повершел!!!)  [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$env:USERPROFILE\.cargo\bin", "User")
# 6. проверить: rustup --version
# уебок когда ты блять покажешь саркофаг блятб

print("привеет")
print("ты любишь войд линукс?")
voidlnx = input()
if voidlnx == "нет": # 1.1
    print("а у тебя система системд? (не имеет значения)")
    systemd = input() # 2.1
    if systemd == "да":
        print("зря ты так агент редхат...")
        print("у тебя винда?")
        winda = input()
        if winda == "да":
            shutwin()
        elif winda == "нет":
            shuttux()

    elif systemd == "нет": # 2.2
        print("молодец, но войд тебе стоит попробывать... ")
        time.sleep(3)
        shuttux()

elif voidlnx == "да": # 1.2
    while True:
        print("сигма!")
        time.sleep(0.1)

elif voidlnx == "сыр.": # 1.3
        print("СЫРРРР СЫРРР СЫРРРРР СЫР СЫР СЫР СЫР СЫР СЫР СЫР СЫР " * 500)
        print("ладно ладно")
        print("тут есть ратник в коде я тебе клянусь")
        

        

# туду: сделать что то с сыром ☑️

