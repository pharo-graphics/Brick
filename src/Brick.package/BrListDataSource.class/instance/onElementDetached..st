hooks
onElementDetached: anElementHolder
	| anItemPosition anItemValue |
	
	anItemPosition := anElementHolder position.
	anItemValue := self rowValues at: anItemPosition.
	
	self listElement enqueueTask: (BlTaskAction new action: [
		self listElement dispatchEvent: (BrListItemElementDetached new
			rowIndex: anItemPosition;
			rowValue: anItemValue) ])