VERSION=1.9
REPO=dictav/golang-mecab

build: Dockerfile
	docker build -t $(REPO):$(VERSION) .
	docker tag $(REPO):$(VERSION) $(REPO):latest

push:
	docker push $(REPO):$(VERSION)
	docker push $(REPO):latest

