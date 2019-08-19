"
I define a set of events that are sent by ${class:BrTabGroupModel}
"
Class {
	#name : #BrTabEvent,
	#superclass : #BlEvent,
	#instVars : [
		'tab'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #'instance creation' }
BrTabEvent class >> tab: aBrTabModel [
	^ self new tab: aBrTabModel
]

{ #category : #accessing }
BrTabEvent >> tab [
	<return: #BrTabModel>

	^ tab
]

{ #category : #accessing }
BrTabEvent >> tab: aBrTabModel [
	self
		assert: [ aBrTabModel isNotNil ]
		description: [ 'Tab must not be nil' ].

	tab := aBrTabModel
]
