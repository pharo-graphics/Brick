notifying
notifyContentChanged
	self dispatchEvent: (BrToolbarItemContentChanged new stencil: self stencil)