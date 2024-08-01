# test
#Описание файлов

# Описать в файле README.md что будет результатом выполнения задачи general_deploy_job из файла .gitlab-ci.yml
Задача general_deploy_job в файле .gitlab-ci.yml является расширением абстрактной задачи .deploy_abstr. Это означает, что она наследует все настройки и шаги из .deploy_abstr, но также может переопределять или добавлять к ним свои собственные параметры. В данном случае, general_deploy_job добавляет значение переменной FILE_ANS, которое указывает на конкретный Ansible playbook (master.yml) для выполнения.

# Рекомендации к Dockerfile
1. Вместо использования отдельных команд RUN для каждого пакета Python и системных пакетов, можно объединить их в одну команду с использованием многострочного синтаксиса. Это уменьшит количество слоев в образе и сделает Dockerfile более читаемым.
2. Вместо установки Ansible через pip, можно использовать официальный образ Ansible, который уже содержит все необходимые зависимости и настроен для работы с Ansible. Это упростит Dockerfile и уменьшит время сборки образа.
3. После установки системных пакетов рекомендуется удалить кэш apt, чтобы уменьшить размер итогового образа.
4. Команды в Dockerfile выполняются последовательно, и каждый RUN, COPY, и ADD создают новый слой в образе. Оптимизация порядка команд может помочь уменьшить размер итогового образа и время его сборки.
Измененный Dockerfile приложил в репозитории

# requirements.yml

Используется для управления зависимостями проекта. Этот файл позволяет определить и установить необходимые коллекции Ansible. Указывает на две коллекции и одну роль, которые должны быть установлены для вашего проекта Ansible:

1.Коллекция community.zabbix версии 1.5.1.
2.Коллекция ansible.posix версии 1.3.0.
3.Роль cloudalchemy.node_exporter.

В качестве улучшения в этом файле, можно добавить комментарии для повышения читаемости файла, а также указать версии с использованием семантического версионирования, что позволит получить больший контроль для управления версиями зависимостей.

# initial_user.yml

Представляет из себя ansible playbook, который будет выполняться на всех хостах. Основная его цель - создать пользователя, который сможет выполнять sudo без использования пароля, а также устанавливает авторизованный ключ SSH.
Улучшить его можно следующим образом:
1. Использовать переменные, которые легко можно будет заменить в будущем на желаемые значения (имя пользователя, и путь до ssh ключа);
2. Добавить теги для задач, что позволит запускать задачи отдельно друг от друга, в случае необходимости;
3. Добавить задачу, которая проверит наличие SSH ключа, что позволит исключить ошибку в выполнении плейбука.
