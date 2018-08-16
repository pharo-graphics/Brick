hooks
onElementAttached: anElementHolder
	| anItemElement anItemPosition anItemValue |
	
	anItemElement := anElementHolder itemElement.
	anItemPosition := anElementHolder position.
	anItemValue := self rowValues at: anItemPosition.

	self listElement enqueueTask: (BlTaskAction new action: [
		self listElement dispatchEvent: (BrListItemElementAttached new
			itemElement: anItemElement;
			rowIndex: anItemPosition;
			rowValue: anItemValue) ])