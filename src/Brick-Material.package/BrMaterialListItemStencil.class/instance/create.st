instance creation
create
	^ BlElement new
		viewModel: (BrButtonModel new label: self text; icon: self icon);
		look: (BrLook new addAll: self looks)