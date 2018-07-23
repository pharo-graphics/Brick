updating
updateIcon
	super updateIcon.
	
	self iconDo: [ :anElement |
		anElement
			size: self size;
			margin: self margin ]