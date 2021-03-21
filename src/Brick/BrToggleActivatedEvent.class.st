"
I am sent when switch widget is activated
"
Class {
	#name : #BrToggleActivatedEvent,
	#superclass : #BrToggleEvent,
	#traits : 'TBrToggleOriginalEvent',
	#classTraits : 'TBrToggleOriginalEvent classTrait',
	#category : #'Brick-Toggle - Events'
}

{ #category : #accessing }
BrToggleActivatedEvent >> model [
	^ self target viewModel model
]

{ #category : #sending }
BrToggleActivatedEvent >> sendTo: anObject [
	anObject toggleActivated: self
]
