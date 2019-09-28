"
I am sent when switch widget is activated
"
Class {
	#name : #BrToggleActivatedEvent,
	#superclass : #BrToggleEvent,
	#category : 'Brick-Toggle - Events'
}

{ #category : #accessing }
BrToggleActivatedEvent >> model [
	^ self target viewModel model
]
