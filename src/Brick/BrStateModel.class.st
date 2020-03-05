"
I am a super class of all models that have a boolean state, for example enabled/disabled, expanded/collapsed, pressed/unpressed
"
Class {
	#name : #BrStateModel,
	#superclass : #BrWidgetModel,
	#category : #'Brick-! Core'
}

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
