notifying
notifyActivationChanged
	self dispatchEvent: (BrActivationChanged enabled: self isEnabled)