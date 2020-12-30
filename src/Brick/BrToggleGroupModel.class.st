Class {
	#name : #BrToggleGroupModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'toggles',
		'activatedToggle',
		'toggleEventHandler'
	],
	#category : #'Brick-Toggle - Model'
}

{ #category : #'api - toggles' }
BrToggleGroupModel >> activateToggle: aBrToggleModel [
	"a given toggle is already activated, do nothing"
	(self hasActivatedToggle and: [ self activatedToggle = aBrToggleModel ])
		ifTrue: [ ^ self ].
	
	"deactivate a previously activated toggle"
	self hasActivatedToggle
		ifTrue: [ self deactivateToggle: self activatedToggle ].
	
	activatedToggle := aBrToggleModel.
	activatedToggle activate.

	self notifyToggleActivated: aBrToggleModel
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> activatedToggle [
	<return: #BrToggleModel>
	
	self
		assert: [ self hasActivatedToggle ]
		description: [ 'Can not access an activated toggle if there is no one' ].
		
	^ activatedToggle
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> addToggle: aBrToggleModel [
	self addToggle: aBrToggleModel at: self toggles size + 1
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> addToggle: aBrToggleModel at: anIndex [
	"Toggle already exists, do nothing"
	(self hasToggle: aBrToggleModel)
		ifTrue: [ ^ self ].

	self toggles add: aBrToggleModel beforeIndex: anIndex.
	self onToggleAdded: aBrToggleModel at: anIndex
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> addToggles: aCollectionOfToggleModels [
	aCollectionOfToggleModels do: [ :aToggleModel | self addToggle: aToggleModel ]
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> deactivateToggle: aBrToggleModel [

	"there are no activated toggles, do nothing"
	self hasActivatedToggle
		ifFalse: [ ^ self ].

	"toggle is not activated, do nothing"
	(self activatedToggle ~= aBrToggleModel)
		ifTrue: [ ^ self ].
	
	"we nil it first so that by the time a listener receives an announcement,
	#hasActivatedToggle will return false"
	activatedToggle := nil.
	aBrToggleModel deactivate.

	self notifyToggleDeactivated: aBrToggleModel
]

{ #category : #'api - testing' }
BrToggleGroupModel >> hasActivatedToggle [
	<return: #Boolean>
	
	^ activatedToggle isNotNil
]

{ #category : #'api - testing' }
BrToggleGroupModel >> hasToggle: aBrToggleModel [
	<return: #Boolean>
	
	^ self toggles identityIncludes: aBrToggleModel
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> indexOf: aToggleModel [
	"It returns 0 if a toggle is not present"
	<return: #Number>

	^ self toggles indexOf: aToggleModel
]

{ #category : #initialization }
BrToggleGroupModel >> initialize [
	super initialize.
	
	toggles := OrderedCollection new.
	activatedToggle := nil.
	toggleEventHandler := BrToggleGroupToggleEventHandler new toggleGroup: self
]

{ #category : #'api - testing' }
BrToggleGroupModel >> isEmpty [
	"Return true if there are no toggles in a group, false otherwise"
	<return: #Boolean>
	
	^ self toggles isEmpty
]

{ #category : #'api - testing' }
BrToggleGroupModel >> isNotEmpty [
	"Return true if there is at least one toggle in a group, false otherwise"
	<return: #Boolean>

	^ self isEmpty not
]

{ #category : #notifying }
BrToggleGroupModel >> notifyToggleActivated: aBrToggleModel [
	self dispatchEvent: (BrToggleActivatedEvent new toggle: aBrToggleModel)
]

{ #category : #notifying }
BrToggleGroupModel >> notifyToggleAdded: aBrToggleModel [
	self dispatchEvent: (BrToggleAddedEvent toggle: aBrToggleModel)
]

{ #category : #notifying }
BrToggleGroupModel >> notifyToggleAdded: aBrToggleModel at: anIndex [
	self dispatchEvent: ((BrToggleAddedEvent toggle: aBrToggleModel) index: anIndex)
]

{ #category : #notifying }
BrToggleGroupModel >> notifyToggleDeactivated: aBrToggleModel [
	self dispatchEvent: (BrToggleDeactivatedEvent new toggle: aBrToggleModel)
]

{ #category : #notifying }
BrToggleGroupModel >> notifyToggleRemoved: aBrToggleModel [
	self dispatchEvent: (BrToggleRemovedEvent toggle: aBrToggleModel)
]

{ #category : #hooks }
BrToggleGroupModel >> onToggleAdded: aBrToggleModel at: anIndex [
	
	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Added toggle must not be nil' ].
	
	aBrToggleModel beOneWay.
	aBrToggleModel addEventHandler: toggleEventHandler.
	
	self notifyToggleAdded: aBrToggleModel at: anIndex.
	
	"if user adds a toggle marked as activated we should force activate it"
	aBrToggleModel isActivated
		ifTrue: [ self activateToggle: aBrToggleModel ]
]

{ #category : #hooks }
BrToggleGroupModel >> onToggleRemoved: aBrToggleModel at: anIndex [
	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Removed toggle must not be nil' ].
	
	aBrToggleModel removeEventHandler: toggleEventHandler.
	self notifyToggleRemoved: aBrToggleModel
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> removeToggle: aBrToggleModel [
	| aToggleIndex |

	"trying to remove a toggle that does not exist"
	(self hasToggle: aBrToggleModel)
		ifFalse: [ ^ self ].

	self deactivateToggle: aBrToggleModel.

	aToggleIndex := self indexOf: aBrToggleModel.
	self toggles remove: aBrToggleModel.
	self onToggleRemoved: aBrToggleModel at: aToggleIndex.
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> removeToggles [
	self toggles reverseDo: [ :aToggleModel | self removeToggle: aToggleModel ]
]

{ #category : #accessing }
BrToggleGroupModel >> toggles [
	<return: #Collection of: #BrToggleModel>

	^ toggles
]
