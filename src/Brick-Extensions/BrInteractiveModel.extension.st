Extension { #name : #BrInteractiveModel }

{ #category : #'*Brick-Extensions' }
BrInteractiveModel >> gtLocalStatesFor: aView [
	<gtView>
	
	^ aView forward
		priority: 1;
		title: 'Local States';
		object: [ self statesMapping ];
		view: #gtStatesFor:
]
