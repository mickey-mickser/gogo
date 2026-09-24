# gogo

REST API для списков дел на Go: регистрация, JWT и CRUD списков и задач. Данные хранятся в PostgreSQL.

## Стек

- Go, Gin
- PostgreSQL, sqlx
- JWT

## Запуск

```bash
docker compose up -d
cp .env.example .env
go run ./cmd
```

Сервис слушает `:8000`. При первом старте сам создаёт таблицы из `schema/000001_init.up.sql`.

Пароль базы берётся из `DB_PASSWORD`. Параметры подключения — в `configs/config.yaml`.

## API

Регистрация и вход:

```bash
curl -s -X POST localhost:8000/auth/sign-up \
  -H 'Content-Type: application/json' \
  -d '{"name":"Mickey","username":"mickey","password":"secret"}'

curl -s -X POST localhost:8000/auth/sign-in \
  -H 'Content-Type: application/json' \
  -d '{"username":"mickey","password":"secret"}'
```

Дальше заголовок `Authorization: Bearer <token>`.

| Метод | Путь | Назначение |
|---|---|---|
| POST | `/auth/sign-up` | Регистрация |
| POST | `/auth/sign-in` | Вход, выдаёт JWT |
| POST | `/api/lists/` | Создать список |
| GET | `/api/lists/` | Все списки пользователя |
| GET | `/api/lists/:id` | Один список |
| PUT | `/api/lists/:id` | Обновить список |
| DELETE | `/api/lists/:id` | Удалить список |
| POST | `/api/lists/:id/items/` | Добавить задачу |
| GET | `/api/lists/:id/items/` | Задачи списка |
| GET | `/api/items/:id` | Одна задача |
| PUT | `/api/items/:id` | Обновить задачу |
| DELETE | `/api/items/:id` | Удалить задачу |
