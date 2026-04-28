# Real Estate Telegram Automation Bot

An anonymized Telegram bot template for real estate search, object filtering, lead capture, and manager handoff.

The project is based on a real client workflow. Public data, company identifiers, user history, logs, object exports, contacts, and branding were removed before publishing.

## What It Shows

- Async Telegram bot built with `aiogram`
- FSM-based user flow for search, filtering, and lead capture
- Redis state storage for active sessions
- SQLite storage for user profiles and request history
- JSON-driven real estate object catalog
- Separate business config and secret config
- Docker-ready local deployment

## Why It Is Useful

Real estate teams often have large object catalogs, repeated user questions, and several agents responsible for different listings. This bot turns that into a structured flow:

1. User selects city and object type.
2. Bot filters objects by parameters.
3. User receives a clean object card.
4. Bot routes the lead to the right manager.
5. Runtime data stays outside the public repository.

## Project Structure

```text
.
|-- config/
|   |-- app_config.example.json
|   `-- app_config.json          # local, ignored by git
|-- data/
|   |-- city_reports/
|   `-- objects/
|       |-- Commerce/
|       |-- Flat/
|       |-- House/
|       |-- Land/
|       `-- Room/
|-- scripts/
|   |-- control_panel.py
|   `-- validate_setup.py
|-- src/portfolio_bot/
|   |-- main.py
|   `-- settings.py
|-- storage/
|-- docker-compose.yml
`-- Dockerfile
```

## Quick Start

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Create local config files:

```bash
cp .env.example .env
cp config/app_config.example.json config/app_config.json
```

Validate and run:

```bash
python scripts/validate_setup.py
python src/portfolio_bot/main.py
```

Docker:

```bash
docker compose up --build
```

## Configuration

Secrets live in `.env`:

- `BOT_TOKEN`
- `REDIS_HOST`
- cooldown and spam limits
- local storage paths

Business values live in `config/app_config.json`:

- brand name
- welcome text
- manager username
- public contacts
- object card URL template
- optional media URLs

This makes the bot reusable for different clients without changing Python code.

## Portfolio Notes

This repository is published as a sanitized portfolio version. It demonstrates the architecture and deployment approach without exposing production data.

The strongest parts of the project are:

- reusable client configuration
- clean separation between runtime data and code
- Telegram UX for object search
- Docker-based deployment
- lead routing workflow

## Keywords

`python`, `aiogram`, `telegram-bot`, `real-estate`, `automation`, `redis`, `sqlite`, `docker`, `lead-generation`, `workflow-automation`

