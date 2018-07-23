instance creation
create
	^ BlElement new
		background: Color white;
		look: (self looks reduce: [ :a :b | a + b ])