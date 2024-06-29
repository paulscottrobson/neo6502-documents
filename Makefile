.any:

serve: .any sync
	cd neo6502 ; mkdocs build -c
	cd neo6502 ; mkdocs serve

build: .any sync
	cd neo6502 ; mkdocs build -c

sync: .any
	cp ../neo6502-firmware/bin/api-listing.md neo6502/docs/reference	

upload : sync build
	sh mirror.sh