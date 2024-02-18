%: anyway
	@if [ "$@" != "Makefile" ]; then docker run --rm --init -v $$PWD:/home openjdk:21-slim java /home/$@; fi

anyway:
	@true
