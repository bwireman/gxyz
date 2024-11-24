#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."

gleam check
gleam update
gleam build
gleam fix
gleam format
gleam test