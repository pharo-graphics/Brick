instance creation
create
	^ BrButton new
		label: self text;
		icon: self icon;
		look: (BrLook new addAll: self looks)