"
I am sent when switch widget is deactivated
"
Class {
	#name : #BrToggleDeactivatedEvent,
	#superclass : #BrToggleEvent,
	#traits : 'TBrToggleOriginalEvent',
	#classTraits : 'TBrToggleOriginalEvent classTrait',
	#category : #'Brick-Toggle - Events'
}

{ #category : #sending }
BrToggleDeactivatedEvent >> sendTo: anObject [
	anObject toggleDeactivated: self
]
