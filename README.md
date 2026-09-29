# Zombie System

A comprehensive zombie system for FiveM with safe zones and boss zombies.

## Features

- Dynamic zombie spawning with configurable models and health
- Safe zones to protect players from zombie encounters
- Boss zombies with increased health and unique models
- Configurable spawn rates and limits for zombie nests

## Requirements

- FiveM server
- ESX Framework
- MySQL-Async

## Installation

1. Download the script files.
2. Place them in your FiveM server's resources folder.
3. Add `start SyncZombiesSystem` to your server.cfg file.
4. Import the database.sql file into your MySQL database.

## Usage

The system will automatically spawn zombies in configured nests. Players can avoid zombies by staying within safe zones. Boss zombies will spawn periodically.

## Configuration

Configure the system by editing the `config.lua` file. Adjust zombie models, health, safe zones, spawn rates, and more to fit your server's needs.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=zombie-system&utm_content=bottom) — describe it in one sentence and get the full source code.