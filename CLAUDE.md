# Homepage Veniaminch

Личный сайт + оргструктура ресторана «Высоко» + дашборд экосистемы. **veniaminch.ru**

## Stack

Чистый HTML5 + CSS3 + JS (без сборщиков), nginx Alpine (Docker), шрифт DM Sans

## Commands

```
# Локально — просто открыть файл
open index.html

# Docker
docker build -t homepage .
docker run -p 8080:80 homepage
```

## Architecture

- `index.html` — дашборд экосистемы: карточки проектов, статистика токенов, roadmap Now-Next-Later
- `org.html` (~970 строк) — оргструктура: иерархия, 18 функциональных зон, матрица 9x9
- `infra.html` — инфраструктура: серверы, сервисы, карточки проектов с модулями
- `canvas.html` — tldraw whiteboard через esm.sh (import map, без сборщика); вне скоупа `update-ecosystem`

## Key Decisions

- Sidebar: 72px слева на десктопе, нижняя панель 56px на мобильных (breakpoint 900px)
- Пароль на всех страницах: sessionStorage `roadmap_auth`, пароль `fh242d995`
- Skill `update-ecosystem` (симлинк `.claude/skills/update-ecosystem` → родительская `Claude and other things/.claude/skills/`) — читает 8 `ROADMAP.md` проектов и обновляет index/infra/org + Notion. Жёстко завязан на CSS-классы `.nnl-card`, `.project`, `.mod`, `.dir-tag` — отсюда правило «без сборщиков»

## Gotchas

- НЕ менять структуру HTML — только обновлять контент внутри существующих секций
- Дату обновления ставить текущую (`rev. DD.MM.YYYY` в header)
- При добавлении проекта — добавить карточку в infra.html по шаблону существующих

## Deploy

Docker (nginx:alpine) → GitHub (veniaminch-sudo/homepage-veniaminch) → Coolify → veniaminch.ru
