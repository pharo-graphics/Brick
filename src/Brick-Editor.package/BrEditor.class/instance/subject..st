accessing
subject: anObject
	| pragmas |
	subject := anObject.
	
	pragmas := Pragma allNamed: #brickEditorOrder: from: anObject class to: ProtoObject.
	pragmas := pragmas sorted: [: x :y | (x argumentAt: 1) < (y argumentAt: 1)].

	pragmas
		ifEmpty: [ ^ self ].

	builder := BrEditorCompositeBuilder new.
	pragmas first method valueWithReceiver: anObject arguments: { builder }.

	iterator := self defaultIterator editor: self.

	self notifyChanged