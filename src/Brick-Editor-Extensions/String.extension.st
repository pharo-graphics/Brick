Extension { #name : #String }

{ #category : #'*Brick-Editor-Extensions' }
String >> gtInspectorBrickContentsIn: composite [
	<gtInspectorPresentationOrder: -10>
	composite blocText 
		title: '_String';
		display: [ self ]
]
