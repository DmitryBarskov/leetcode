%: anyway
	@if [ "$@" != "Makefile" ]; then docker run --rm --init -v $$PWD:/home/bun/app --ulimit memlock=-1:-1 oven/bun bun test ./$@; fi

anyway:
	@true
