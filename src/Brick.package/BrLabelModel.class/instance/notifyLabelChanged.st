notifying
notifyLabelChanged
	self dispatchEvent: (BrLabelChanged new text: self text)