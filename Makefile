.any:

server: .any sync
	cd neo6502 ; mkdocs serve -c

build: .any sync
	cd neo6502 ; mkdocs build -c

sync: .any
	cp ../neo6502-firmware/bin/api-listing.md neo6502/docs/reference	

upload : sync build
	sh mirror.sh