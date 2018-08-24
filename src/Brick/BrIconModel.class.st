Class {
	#name : #BrIconModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'icon'
	],
	#category : 'Brick-! Core'
}

{ #category : #accessing }
BrIconModel >> icon [
	<return: #BlElement>

	^ icon
]

{ #category : #accessing }
BrIconModel >> icon: aBlElement [

	icon = aBlElement
		ifTrue: [ ^ self ].

	icon := aBlElement.
	self notifyIconChanged
]

{ #category : #initialization }
BrIconModel >> initialize [
	super initialize.
	
	icon := (BlEllipse radius: 5) asElement
]

{ #category : #notifying }
BrIconModel >> notifyIconChanged [
	self dispatchEvent: (BrIconChanged new icon: self icon)
]

{ #category : #hooks }
BrIconModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ]
]
