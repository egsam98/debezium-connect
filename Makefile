VERSION=2.2.1

build:
	docker build --build-arg DEBEZIUM_VERSION=$(VERSION).Final -t egsam98/debezium-connect:$(VERSION) .

push:
	docker push egsam98/debezium-connect:$(VERSION)
