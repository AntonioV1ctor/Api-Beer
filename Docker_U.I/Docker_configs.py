import os


loop = True

while loop:
    os.system("clear")
    print("""
+==================================+
| [Install and Uninstall Docker]   |
|                                  |
| [01]-Uninstall Docker            |
| [02]-Install Docker              |
| [03]-Exit                        |
+==================================+""")
    opt = input(">>>>> ")

    if opt == "01" or opt == "1":
        print("Desinstalando Docker e Docker Compose...")
        os.system("./uninstall_docker.sh")
    elif opt == "02" or opt == "2":
        print("Instalando Docker e Docker Compose...")
        os.system("./install_docker.sh")
    elif opt == "03" or opt == "3":
        os.system("clear")
        print("Saindo...")
        loop = False
    else:
        print("Comando Inválido! Tente novamente.")
