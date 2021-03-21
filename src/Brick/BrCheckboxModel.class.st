Class {
	#name : #BrCheckboxModel,
	#superclass : #BrWidgetModel,
	#category : #'Brick-Checkbox - Model'
}

{ #category : #'mouse handlers' }
BrCheckboxModel >> clickEvent: anEvent [
	| anElement |
	anEvent consumed: true.
	
	anElement := anEvent currentTarget widget.
	
	anElement states isDisabled
		ifTrue: [ ^ self ].

	anElement isChecked
		ifTrue: [ ^ anElement uncheck ].
		
	(anElement isUnchecked or: [ anElement isIndeterminate ])
		ifTrue: [ ^ anElement check ]
]

{ #category : #initialization }
BrCheckboxModel >> initializeListeners [
	super initializeListeners.

	self when: BlClickEvent do: [ :anEvent | self clickEvent: anEvent ]
]
