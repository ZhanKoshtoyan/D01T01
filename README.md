# D01T01. Знакомство с Linux и Git

Учебный проект школы 21 (School 21 / Ecole 42), посвящённый основам работы в Linux, терминалу, bash-скриптам и системе контроля версий Git.

Проект представляет собой текстовый квест: последовательно выполняя задания (quests), вы знакомитесь с командами Linux, написанием простых скриптов и работой с ветками в Git.

## Стек и инструменты

- **ОС:** Linux (Ubuntu / WSL)
- **Оболочка:** bash
- **Утилиты:** `git`, `nano` / `vim`, `grep`, `sed`, `find`, `stat`, `sha256sum`, `pkill`
- **Язык скриптов:** bash
- **Формат документации:** Markdown

## Структура репозитория

```text
.
├── README.md
└── src/
    ├── ai_door_control.sh
    ├── ai_door_management_module.sh
    ├── ai_initial_module.sh
    ├── ai_module_2.sh
    ├── edit.sh
    ├── files.log
    ├── history_of_vi.txt
    ├── history_of_vim.txt
    ├── important_data_for_ai_module_2.txt
    ├── quest3.sh
    ├── quest4.sh
    ├── quest5.txt
    ├── quest6.sh
    ├── readme.txt
    ├── ai_help/
    │   ├── keygen.sh
    │   ├── unifier.sh
    │   ├── main.key
    │   ├── main-2.key
    │   ├── main-3.key
    │   └── key/
    │       ├── part1.key
    │       ├── part2.key
    │       └── ... (part60.key)
    ├── door_management_files/
    │   ├── door_configuration/
    │   │   ├── door_1.conf
    │   │   ├── door_2.conf
    │   │   └── ... (door_16.conf, door_21.conf)
    │   ├── door_logs/
    │   │   ├── door_1.log
    │   │   └── ... (door_16.log)
    │   └── door_map/
    │       └── door_map_1.1
    └── git_for_human/
        └── readme.txt
```

> **Примечание:** файлы `main.key`, `main-2.key`, `main-3.key` и папка `key/` появляются в результате выполнения квестов 6–7 и распределяются по веткам согласно `src/git_for_human/readme.txt`.

## Квесты

### Quest 1. Clone
Склонировать репозиторий проекта с GitLab на локальную машину. Убедиться, что настроен SSH-ключ для доступа к GitLab.

**Команда:**
```bash
git clone <SSH-URL-репозитория>
```

### Quest 2. Repo
Запустить скрипт `src/ai_initial_module.sh`, следовать его инструкциям. Исправить ошибки, не меняя сам скрипт. Все изменения зафиксировать в Git.

**Особенность:** скрипт ожидает ровно 5 модулей; для запуска может потребоваться `chmod +x`.

### Quest 3. Dirs & Files
Навести порядок в файлах конфигурации для `src/ai_door_management_module.sh`. Все команды, которые для этого использовались, сохранить в `src/quest3.sh`.

**Примерное содержимое `quest3.sh`** — переименование и раскладка файлов по нужным директориям (см. скрипт в репозитории).

### Quest 4. Kill him
Остановить фоновый процесс `ai_door_control.sh`, который запускается после `ai_door_management_module.sh`. Команды сохранить в `src/quest4.sh`.

**Команда:**
```bash
pkill -f ai_door_control.sh
```

### Quest 5. Conf
С помощью консольного текстового редактора (`nano`, `vi`, `vim`) изменить конфигурацию первой двери: заменить `STATUS: CLOSED` на `STATUS: OPEN` в `src/door_management_files/door_configuration/door_1.conf`. Все действия (открытие редактора, правка, сохранение, выход) записать в `src/quest5.txt` в виде нумерованного списка.

### Quest 6. Rm
Собрать ключ из частей, сгенерированных скриптом `keygen.sh`, удалив всё лишнее, и запустить `unifier.sh` для получения `main.key`. Все команды сохранить в `src/quest6.sh`. Итоговый `main.key` и папку `key/` поместить в `src/ai_help/`.

**Логика:**
- `keygen.sh` создаёт 300 пустых файлов и 60 файлов `partN.key` со случайными числами;
- нужно удалить все файлы, кроме `partN.key` (проверить расширение `.key`);
- `unifier.sh` суммирует числа из `partN.key` и записывает результат в `main.key`.

### Quest 7. Branches
Создать и слить ветки в Git согласно инструкциям из `src/git_for_human/readme.txt`. Подробная последовательность команд приведена в разделе «Работа с ветками» ниже.

### Bonus Quest 8. Vim
Дополнить `src/history_of_vim.txt` информацией о версиях Vim после 2001 года (используя `vim`), добавить заголовок `"A Quick Summary Of the History of the Vim Editor"`. После каждого изменения (исходное состояние, добавление заголовка, добавление версий) вносить запись в `src/files.log` в формате:

```
путь_к_файлу — размер_в_байтах — дата_и_время — sha256-сумма — алгоритм
```

### Bonus Quest 9. Script
Разработать скрипт `src/edit.sh`, который принимает путь к файлу, строку для поиска и строку для замены, выполняет замену и логирует изменение в `src/files.log` в том же формате.

**Обработка краевых ситуаций:**
- неверное количество аргументов;
- файл не существует;
- искомая строка отсутствует в файле.

### Bonus Quest 10. Gitlab
Подготовить краткий мануал по GitLab в `src/gitlab_manual.md` (Markdown), каждый пункт — заголовок + скриншот:
1. Создание личного репозитория с `.gitignore` и `README.md`.
2. Создание веток `master`, `develop`, `feature` от `develop`.
3. Создание merge request в `develop`.
4. Создание issue и комментария к нему.

## Работа с ветками (Quest 7)

В `src/git_for_human/readme.txt` описан порядок работы с ветками. Ниже — сводка команд.

### 1. Создать ветку `develop` и перенести в неё все изменения

```bash
git checkout -b develop
git add .
git commit -m "develop: initial project state"
git push -u origin develop
```

### 2. Создать ветку `key-branch` от `develop` и добавить `main.key`

```bash
git checkout -b key-branch develop
# убедиться, что main.key присутствует в src/ai_help/
git add src/ai_help/main.key
git commit -m "key-branch: add main.key"
git push -u origin key-branch
```

### 3. Создать копию `main.key` → `main-2.key` и зафиксировать

```bash
cp src/ai_help/main.key src/ai_help/main-2.key
git add src/ai_help/main-2.key
git commit -m "key-branch: add main-2.key"
git push
```

### 4. Создать ветку `feature/3-key` от `key-branch` и добавить `main-3.key`

```bash
git checkout -b feature/3-key key-branch
cp src/ai_help/main.key src/ai_help/main-3.key   # или создать иначе
git add src/ai_help/main-3.key
git commit -m "feature/3-key: add main-3.key"
git push -u origin feature/3-key
```

### 5. Влить `feature/3-key` в `key-branch`

```bash
git checkout key-branch
git merge feature/3-key
# разрешить конфликты, если есть
git push
```

### 6. Создать ветку `release/1.0` от `develop`

```bash
git checkout develop
git checkout -b release/1.0
git push -u origin release/1.0
```

### 7. Последовательно влить `key-branch` в `develop`, затем `develop` в `release/1.0`

```bash
git checkout develop
git merge key-branch
git push

git checkout release/1.0
git merge develop
git push
```

После выполнения всех шагов в ветках будут нужные файлы:
- `develop` — полный набор файлов проекта;
- `key-branch` — содержит `main.key` и `main-2.key`;
- `feature/3-key` — содержит `main-3.key`;
- `release/1.0` — финальная версия, включающая всё.

## Примечания

- Все скрипты должны иметь права на выполнение (`chmod +x`).
- В репозитории не должно быть скомпилированных бинарников, временных файлов и `*:Zone.Identifier`.
- Рекомендуемый `.gitignore`:
  ```gitignore
  build/
  *.o
  *.out
  a.out
  *:Zone.Identifier
  ```
- Проект выполнен в рамках учебной программы школы 21 (D01T01).

## Автор

**monabeef**