"
I define how widgets look. In addition to the BrViewModel I listen to UI events and update decoration (non meaningful) elements of the widgets
"
Class {
	#name : #BrLook,
	#superclass : #BrActor,
	#instVars : [
		'changes'
	],
	#category : #'Brick-! Core'
}

{ #category : #'api - composition' }
BrLook class >> + anotherLook [
	^ self asLook + anotherLook
]

{ #category : #'api - composition' }
BrLook class >> - anotherLook [
	^ self asLook - anotherLook
]

{ #category : #'api - composition' }
BrLook class >> asLook [
	^ self new
]

{ #category : #'api - composition' }
BrLook >> + anotherLook [
	self add: anotherLook asLook
]

{ #category : #'api - composition' }
BrLook >> - aLookClass [
	| toBeRemoved |
	self
		assert: [ aLookClass isClass ]
		description: [ 'It is only possible to remove a look by its type (class) using this API' ].

	toBeRemoved := actors select: [ :eachLook | eachLook class = aLookClass ].
	toBeRemoved reverseDo: [ :eachLook | self remove: eachLook ]
]

{ #category : #'api - composition' }
BrLook >> add: aBrLook [
	"Add a given look instance if it does not exist already"
	| aLookInstance |

	aLookInstance := aBrLook asLook.
	
	(actors includes: aLookInstance)
		ifTrue: [ ^ self ].

	actors := actors copyWith: aLookInstance.

	self widgetDo: [ :anElement | aLookInstance onInstalledIn: anElement ]
]

{ #category : #'api - composition' }
BrLook >> addAll: aCollectionOfLooks [
	aCollectionOfLooks do: [ :aLook | self add: aLook ]
]

{ #category : #'api - changes' }
BrLook >> addChange: aLookChange [
	changes add: aLookChange.
	widget ifNotNil: [ aLookChange upOn: self ]
]

{ #category : #'api - changes' }
BrLook >> addChangeAddChild: aCollection with: aBlock [
	self
		addChange:
			(BrLookAddChildChange new
				path: aCollection;
				value: aBlock;
				yourself)
]

{ #category : #'api - changes' }
BrLook >> addChangeAddChildAs: aCollection with: aBlock [
	self
		addChange:
			(BrLookAddChildAsChange new
				path: aCollection;
				value: aBlock;
				yourself)
]

{ #category : #'api - changes' }
BrLook >> addChangeProperty: aCollection with: aBlock [
	self
		addChange:
			(BrLookPropertyChange new
				path: aCollection;
				value: aBlock;
				yourself)
]

{ #category : #'api - changes' }
BrLook >> addChangeProperty: aCollection withCopy: aBlock [
	self
		addChange:
			(BrLookPropertyCopyChange new
				path: aCollection;
				value: aBlock;
				yourself)
]

{ #category : #'api - composition' }
BrLook >> asLook [
	^ self
]

{ #category : #'api - changes' }
BrLook >> changes [
	^ changes
]

{ #category : #initialization }
BrLook >> initialize [
	super initialize.
	changes := BrLookChanges new
]

{ #category : #initialization }
BrLook >> initializeRequests [
	"Override me to implement requests to the view model to synchronise its properties"
]

{ #category : #accessing }
BrLook >> looks [
	^ self children
]

{ #category : #'api - hooks' }
BrLook >> onInstalledIn: anElement [
	self withAllActorsBreadthFirstDo: [ :eachLook | eachLook onAttachedTo: anElement ].
	self withAllActorsBreadthFirstDo: [ :eachLook | eachLook changes upOn: eachLook ].
	self withAllActorsBreadthFirstDo: [ :eachLook | eachLook initializeRequests ]
]

{ #category : #'api - hooks' }
BrLook >> onUninstalledIn: anElement [
	super onUninstalledIn: anElement.

	self
		assert: [ self widget == anElement ]
		description: [ 'Can not uninstall from a different widget' ].

	self looks reversed do: [ :aLook | aLook onUninstalledIn: anElement ].

	changes downOn: self.
	widget := nil.
	
	self initializeListeners
]

{ #category : #'api - composition' }
BrLook >> remove: aBrLook [
	"Remove a given look if it exists"
	| aLookInstance |

	aLookInstance := aBrLook asLook.
	
	(actors includes: aLookInstance)
		ifFalse: [ ^ self ].
	
	actors := actors copyWithout: aLookInstance.
	aLookInstance widgetDo: [ :anElement | aLookInstance onUninstalledIn: anElement ]
]

{ #category : #accessing }
BrLook >> widgetContent [
	"Return widget's content container element"
	<return: #BlElement>

	self
		assert: [ widget isNotNil ]
		description: [ 'I must be attached to the widget first' ].

	"if widget does not have explicit #content container, we treat widget as a container itself"
	^ widget
		childNamed: #content
		ifFound: [ :anElement | anElement ]
		ifNone: [ widget ]
]
