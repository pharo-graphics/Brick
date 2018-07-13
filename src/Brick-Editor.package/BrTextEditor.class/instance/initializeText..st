initialization
initializeText: aBrText
	aBrText when: BlTextStringInserted send: #onStringInserted: to: self.
	aBrText when: BlTextDeleted send: #onTextDeleted: to: self