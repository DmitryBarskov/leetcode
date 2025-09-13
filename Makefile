test_ruby:
	ruby ruby/*spec.rb

ruby/%: FORCE
	ruby $@

python3/%: FORCE
	python -m doctest $@ # | sed -r 's/\x1B\[(;?[0-9]{1,3})+[mGK]//g'

FORCE: ;
