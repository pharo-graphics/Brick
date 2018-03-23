notifying
notifyLabelChanged
	self widget dispatchEvent: (BrLabelChanged new text: self label)