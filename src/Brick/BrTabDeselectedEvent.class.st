"
I am sent when a tab is deselected in ${class:BrTabGroupModel}
"
Class {
	#name : #BrTabDeselectedEvent,
	#superclass : #BrTabEvent,
	#category : #'Brick-Tabs - Events'
}

{ #category : #sending }
BrTabDeselectedEvent >> sendTo: anObject [
	anObject tabDeselected: self
]
