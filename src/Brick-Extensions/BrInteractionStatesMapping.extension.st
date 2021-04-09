Extension { #name : #BrInteractionStatesMapping }

{ #category : #'*Brick-Extensions' }
BrInteractionStatesMapping >> gtStatesFor: aView [
	<gtView>

	mapping
		ifEmpty: [ ^ aView empty ].
	
	^ aView forward
		priority: 1;
		title: 'States';
		object: [ mapping ];
		view: #gtItemsFor:
]
