hooks
onElementDetached: anElementHolder
	
	self listElement enqueueTask: (BlTaskAction new action: [
		self listElement dispatchEvent: (BrListItemElementDetached new
			itemElement: anElementHolder itemElement;
			rowIndex: anElementHolder position;
			rowValue: (self rowValues at: anElementHolder position)) ])