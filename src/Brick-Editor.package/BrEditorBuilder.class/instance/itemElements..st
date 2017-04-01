builder - items
itemElements: anItemValue
	"Return a visual element or a collection of visual elements that will be used to represent a given item value"
	<return: #BlElement>
	| pragmas builder |
	
	pragmas := Pragma allNamed: #brickEditorElementOrder: from: anItemValue class to: ProtoObject.
	pragmas := pragmas sorted: [: x :y | (x argumentAt: 1) < (y argumentAt: 1)].

	pragmas
		ifEmpty: [ ^ #() ].

	builder := BrEditorCompositeElementBuilder new.
	pragmas first method valueWithReceiver: anItemValue arguments: { builder }.
	
	^ builder elementsOn: anItemValue