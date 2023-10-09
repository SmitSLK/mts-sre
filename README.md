## mts-sre
MtsCloud "Проект для студента poshta69" K8s namespase "sre-cource-student-72"
# Ansible
Для развертывания кластера использовался плейбук https://github.com/vitabaks/postgresql_cluster/tree/master с минимальными изменениями. Были отключены через конфигурацию не используемые компоненты, добавлены переменные для создания пользователя для проекта и БД, в роль `deploy-finish` добавлен блок для инициализации БД и выдачи прав.
Для запуска заполни файл `inventory` и `vars\main.yaml`.
Переменная `api_auth_username` используется для задания имени пользователя приложения для доступа к БД и имени БД.
Переменаая `api_auth_password` используется для задания пароля пользователя приложения для доступа к БД.
Для переменной `postgresql_pg_hba:` добавь строку с доступами не с локалхоста, если потребуется.
Загруженные файлы уже содержат в себе все необходимые изменения, нужно прописать только переменные описанные выше. Обрати внимание на переменную `postgresql_pg_hba:` в распределенной системе без ее настройки не получить доступа к БД при текущей конфигурации.
# Helm
Чарт состоит из двух сабчартов. Один для запуска приложения, второй сделан как заглушка для инициализации приложения (job запускает контейнер с миграцией БД) в представленном контейнере нет инстркментов для запуска миграции, поэтому просто выводится сообщение.
Для запуска необходимо прописать креды для доступа к БД в файл `values.yaml`, если этого не сделать, то сгенерятся рандомные из темплейта секретов, значения переменных мапятся через configmap.
Доступы в комментарии к работе на портале.
