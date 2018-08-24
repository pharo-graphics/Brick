Class {
	#name : #BrToggle,
	#superclass : #BlElement,
	#category : 'Brick-Toggle - UI'
}

{ #category : #'api - toggle' }
BrToggle >> activate [
	self viewModel activate
]

{ #category : #'api - toggle' }
BrToggle >> activated: aBoolean [
	self viewModel activated: aBoolean
]

{ #category : #'api - widget' }
BrToggle >> content: anElement [
	"Set the given element as my content"

	self removeChildNamed: #content.
	self addChild: anElement as: #content
]

{ #category : #'api - toggle' }
BrToggle >> deactivate [
	self viewModel deactivate
]

{ #category : #'api - widget' }
BrToggle >> icon [
	<return: #BlElement>

	^ self viewModel icon
]

{ #category : #'api - widget' }
BrToggle >> icon: anElement [
	self viewModel icon: anElement
]

{ #category : #initialization }
BrToggle >> initialize [
	super initialize.

	self viewModel: BrToggleModel new
]

{ #category : #'api - toggle' }
BrToggle >> isActivated [
	<return: #Boolean>

	^ self viewModel isActivated
]

{ #category : #'api - widget' }
BrToggle >> label [
	<return: #BlText or: #String>

	^ self viewModel label
]

{ #category : #'api - widget' }
BrToggle >> label: aBrTextOrString [
	self viewModel label: aBrTextOrString
]

{ #category : #'api - toggle' }
BrToggle >> toggle [
	self viewModel toggle
]
