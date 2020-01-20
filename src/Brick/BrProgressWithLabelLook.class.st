Class {
	#name : #BrProgressWithLabelLook,
	#superclass : #BrProgressLook,
	#instVars : [
		'labelStencil'
	],
	#category : #'Brick-Progress - Look'
}

{ #category : #initialization }
BrProgressWithLabelLook >> defaultLabelStencil [
	^ BrProgressFixedLabelStencil new
]

{ #category : #initialization }
BrProgressWithLabelLook >> initialize [
	super initialize.
	labelStencil := self defaultLabelStencil.
]

{ #category : #initialization }
BrProgressWithLabelLook >> initializeListeners [
	super initializeListeners.

	self when: BrLabelRequest reply: [ :aResponse | aResponse text: self text ]
]

{ #category : #accessing }
BrProgressWithLabelLook >> label: aString [
	"Set fixed progress label"
	labelStencil := BrProgressFixedLabelStencil new label: aString.
	self onProgressChanged.
]

{ #category : #accessing }
BrProgressWithLabelLook >> labelStencil [
	^ labelStencil
]

{ #category : #accessing }
BrProgressWithLabelLook >> labelStencil: anObject [
	labelStencil := anObject
]

{ #category : #hooks }
BrProgressWithLabelLook >> onProgressChanged [
	super onProgressChanged.
	self fireEvent: (BrLabelChanged new text: self text)
]

{ #category : #accessing }
BrProgressWithLabelLook >> pattern: aString [
	"The input string can include two place holders called {1} and {2},
	where {1} is transfered amount, and {2} is total to transfer.
	Example: 'Out of {2}%, {1}% transfered...'"
	labelStencil := BrProgressExactProgressLabelStencil new pattern: aString.
	self onProgressChanged.
]

{ #category : #accessing }
BrProgressWithLabelLook >> text [
	<return: #BlRopedText>
	^ labelStencil 
		amount: self amount; 
		total: self total;
		create
]

{ #category : #'event management' }
BrProgressWithLabelLook >> when: aRequestClass reply: aBlock [
	self when: aRequestClass do: [ :aRequest |
		| aReplyEvent |
		
		aRequest consumed: true.

		aReplyEvent := aBlock cull: (aRequest responseFor: self).

		aRequest canRespond
			ifTrue: [ aRequest response: aReplyEvent ].

		aReplyEvent source: self.
		aRequest isOneWay
			ifFalse: [ aRequest source dispatchEventToMyself: aReplyEvent ] ]
]
