Extension { #name : #BrWidgetModel }

{ #category : #'*Brick' }
BrWidgetModel >> addInteractiveModelState: aState [
	self allActorsBreadthFirstDo: [ :eachModel | 
		(eachModel isKindOf: BrInteractiveModel) ifTrue: [ 
			eachModel addState: aState.
			^ self ] ].
	self add: (BrInteractiveModel with: aState).
]
