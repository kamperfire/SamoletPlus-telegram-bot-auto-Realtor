# SamoletPlus-telegram-bot-auto-Realtor

Telegram bot for the company Samolet Plus, automatically parses the company's data with objects, loads them into RAM, and displays a single link to the agent who holds the ad. Broad filtering of object parameters.

 An anonymous Telegram bot template for searching for real estate, viewing objects, and collecting potential clients.   
 This repository is based on a real working project, but all secret data, company IDs, city IDs, uploaded objects, user data, logs, and customer branding elements have been removed for publication on GitHub.

## What This Project Shows

- Async Telegram bot built with `aiogram`
- FSM-based user flow for search and lead capture
- Redis-based state storage
- SQLite user profile storage
- JSON-driven property catalog and city analytics
- Separate business config and secret config for safe reuse
- Docker-ready local deployment

## Project Structure

```text
.
├── config/
│   ├── app_config.example.json
│   └── app_config.json          # local, ignored by git
├── data/
│   ├── city_reports/
│   └── objects/
│       ├── Commerce/
│       ├── Flat/
│       ├── House/
│       ├── Land/
│       └── Room/
├── scripts/
│   ├── control_panel.py
│   └── validate_setup.py
├── src/portfolio_bot/
│   ├── main.py
│   └── settings.py
├── storage/
└── docker-compose.yml
```

## Quick Start

1. Create and activate a virtual environment.
2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Fill in local configuration files:

- Edit `.env`
- Edit `config/app_config.json`

4. Validate the setup:

```bash
python scripts/validate_setup.py
```

5. Start Redis locally, then run the bot:

```bash
python src/portfolio_bot/main.py
```

Optional control panel:

```bash
python scripts/control_panel.py
```

## Configuration

### Secrets in `.env`

Use `.env` only for secrets and runtime paths:

- `BOT_TOKEN`
- `REDIS_HOST`
- spam / cooldown limits
- database and storage paths

### Business Data in `config/app_config.json`

All client-facing values live in one separate file:

- brand name
- welcome text
- manager username
- phone numbers
- Telegram link
- office address
- map URL
- optional media URLs
- object card URL template

This makes the template easy to adapt for a new client without touching Python code.

## Data Format

### Property objects

Put uploaded objects into:

- `data/objects/Flat`
- `data/objects/House`
- `data/objects/Commerce`
- `data/objects/Land`
- `data/objects/Room`

Each object should be a separate JSON file.

### City reports

Put city analytics JSON files into:

- `data/city_reports`

The bot builds the city selection dynamically from those files, so no hardcoded city list is required.

## Docker

```bash
docker compose up --build
```

## Sanitization Notes

The published version intentionally excludes:

- Telegram bot token
- real manager identifiers
- real phone numbers
- real office links and map links
- uploaded production objects
- city-specific production analytics
- runtime database
- user history
- lead history
- logs

## Checked Dependency Versions

The dependency pins in `requirements.txt` and `pyproject.toml` were checked against PyPI on April 20, 2026.

- `aiogram==3.27.0`
- `aiosqlite==0.22.1`
- `aiohttp==3.13.5`
- `python-dotenv==1.2.2`
- `redis==7.4.0`
- `psutil==7.2.2`

Sources:

- [aiogram on PyPI](https://pypi.org/pypi/aiogram/json)
- [aiosqlite on PyPI](https://pypi.org/pypi/aiosqlite/json)
- [aiohttp on PyPI](https://pypi.org/pypi/aiohttp/json)
- [python-dotenv on PyPI](https://pypi.org/pypi/python-dotenv/json)
- [redis on PyPI](https://pypi.org/pypi/redis/json)
- [psutil on PyPI](https://pypi.org/pypi/psutil/json)
