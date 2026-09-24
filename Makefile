.PHONY: run build compose-up

.DEFAULT_GOAL := build

build:
	go build -o bin/gogo ./cmd

run:
	go run ./cmd

compose-up:
	docker compose up -d
