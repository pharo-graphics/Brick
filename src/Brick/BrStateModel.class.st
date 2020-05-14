"
I am a super class of all models that have a boolean state, for example enabled/disabled, expanded/collapsed, pressed/unpressed
"
Class {
	#name : #BrStateModel,
	#superclass : #BrWidgetModel,
	#category : #'Brick-! Core'
}

{ #category : #testing }
BrStateModel class >> canPropagateToChildren [
	"When is true, a state of my class of models can propagate down to children even if they
	have their own interactive model. This can be used to increase the effect scrope of the state"
	<return: #Boolean>

	^ false
]

{ #category : #'state - notifying' }
BrStateModel >> notifyStateChanged: anObject [
	self dispatchEvent: (self stateChangedEventClass state: anObject)
]

{ #category : #'state - accessing' }
BrStateModel >> stateChangedEventClass [
	^ self subclassResponsibility
]

{ #category : #'state - streaming' }
BrStateModel >> streamStateIn: aBrInteractionStatesMapping [
	self subclassResponsibility
]
