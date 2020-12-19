"
I define how meaningful UI components of a widget should change in a respond to UI events.

Since I am a view model I also manage widget states (e.g. pressed, focused, hovered)
"
Class {
	#name : #BrWidgetModel,
	#superclass : #BrActor,
	#instVars : [
		'model',
		'whenAttachedActions'
	],
	#category : #Brick
}

{ #category : #'*Brick' }
BrWidgetModel >> addInteractiveModelState: aState [ [
	self allActorsBreadthFirstDo: [ :eachModel | 
		(eachModel isKindOf: BrInteractiveModel) ifTrue: [ 
			eachModel addState: aState.
			^ self ] ].
	self add: (BrInteractiveModel with: aState).
]
]
