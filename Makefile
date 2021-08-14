satdress: $(shell find . -name "*.go")
	CC=$$(which musl-gcc) go build -ldflags='-s -w -linkmode external -extldflags "-static"' -o ./satdress

deploy: satdress
	ssh root@hulsmann 'systemctl stop bitmia'
	scp satdress hulsmann:satdress/satdress
	ssh root@hulsmann 'systemctl start bitmia'