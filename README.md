## Workflow

### Terraform infrastructure

Workflow создаёт или удаляет инфраструктуру в Yandex Cloud: сеть, Security Group, непрерываемую ВМ и статический IP.

Push в `terraform-branch` запускает только `terraform plan`.
Во вкладке Actions можно запустить workflow кнопкой Run workflow и выбрать `plan`, `apply` или `destroy`.
`apply` создаёт инфраструктуру и сразу запускает деплой Kittygram.
`destroy` удаляет ВМ, IP и сеть. S3 бакет со state остаётся.

### Kittygram

Workflow проверяет проект, собирает и отправляет Docker образы в Docker Hub, затем запускает приложение на ВМ.

Запускается после `apply` автоматически.
При push в `main` или `first` выполняет новый деплой.
Статический IP берётся из Terraform state. `SSH_HOST` и ручная настройка `ALLOWED_HOSTS` не нужны.

## Как запустить первый раз

1. Запустите `Terraform infrastructure` с действием `plan`.
2. Если plan прошёл, запустите его ещё раз с действием `apply`.
3. Дождитесь завершения Kittygram workflow и откройте `http://<IP ВМ>`.

Для входа в приложение зарегистрируйте нового пользователя на странице `/signup`.
