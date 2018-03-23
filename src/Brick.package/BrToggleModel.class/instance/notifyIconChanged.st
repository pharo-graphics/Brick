notifying
notifyIconChanged
	self widget dispatchEvent: (BrIconChanged new icon: self icon)