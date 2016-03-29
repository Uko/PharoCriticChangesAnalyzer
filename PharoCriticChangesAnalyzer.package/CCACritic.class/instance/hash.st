as yet unclassified
hash

	^ (version hash bitXor:
	   entName hash) bitXor:
	   rulName hash