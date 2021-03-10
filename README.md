- [1. Usage](#1-usage)
  - [1.1. Default Weights](#11-default-weights)
  - [1.2. Options](#12-options)
    - [1.2.1. Level](#121-level)
    - [1.2.2. Weights](#122-weights)
- [2. Development](#2-development)
  - [2.1. Setup](#21-setup)
    - [2.1.1. Config](#211-config)
    - [2.1.2. Run in docker](#212-run-in-docker)
  - [2.2. Run the bot](#22-run-the-bot)
  - [2.3. Run one-off](#23-run-one-off)

# 1. Usage

```
-rate <image/url> [lvl=<level>] [<stat>=<weight> ...]
```

## 1.1. Default Weights

ATK%, DMG%, Crit - 1 \
ATK, EM, Recharge - 0.5 \
Everything else - 0

## 1.2. Options
### 1.2.1. Level
Compare to specified artifact level (defaults to parsed artifact level)
```
-rate lvl=20
```

### 1.2.2. Weights
Set custom weights (valued between 0 and 1)
```
-rate atk=1 er=0 atk%=0.5
```
\<stat> is any of HP, HP%, ATK, ATK%, ER (Recharge), EM, PHYS, CR (Crit Rate), CD (Crit Damage), ELEM (Elemental DMG%), Heal, DEF, DEF%

# 2. Development
If you need help or want to contribute, feel free to DM shrubin#1866 or join https://discord.gg/SyGmBxds3M

## 2.1. Setup
### 2.1.1. Config
Set up a bot on the Discord Developer Portal \
Go to https://ocr.space and get an API key

Store environment variables for OCR Space and Discord in `bot/.env` file.
```
DISCORD_TOKEN=<token>
OCR_SPACE_API_KEY=<key>
```
DATABASE: store the url in ```bot/.env``` file. (the empty db file is in ```bot``` directory)
```
DATABASE_URL=sqlite:///db/bot.db
```

Optional: \
Set a Discord `CHANNEL_ID=<id>` to receive messages when the bot goes up/down \
Set `DEVELOPMENT=True` to divert all messages to `CHANNEL_ID`

### 2.1.2. Run in docker
1. Install docker: https://www.docker.com/products/docker-desktop
2. Start docker
3. Open command windows in the root directory
   1. ```docker build -t genshin-artifact-rater .```
   2. ```docker run -d -it --restart unless-stopped --name genshin-artifact-rater --mount type=bind,source="$(pwd)/db",target=/app/db genshin-artifact-rater ```
4. This will use the database file from the host machine. If you delete the docker container the db wont be lost.

## 2.2. Run the bot
```
python3.8 bot.py
```

## 2.3. Run one-off
Edit `url` in `rate_artifact.py`
```
python3.8 rate_artifact.py
```
