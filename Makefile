build:
	docker build -t mock .

run: build
	docker run -d -p 4763:4763 mock