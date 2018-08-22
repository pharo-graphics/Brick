notifying
notifyProgressChanged: anAmountNumber total: aTotalNumber
	self dispatchEvent: (BrProgressChangedEvent amount: anAmountNumber total: aTotalNumber)