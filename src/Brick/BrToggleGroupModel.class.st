Class {
	#name : #BrToggleGroupModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'toggles',
		'activatedToggle'
	],
	#category : 'Brick-Toggle - Model'
}

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

	self toggles add: aBrToggleModel.
	self onToggleAdded: aBrToggleModel
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> addToggles: aCollectionOfToggleModels [
	aCollectionOfToggleModels do: [ :aToggleModel | self addToggle: aToggleModel ]
]

{ #category : #'gt-inspector-extension' }
BrToggleGroupModel >> gtInspectorTogglesIn: aComposite [
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Toggles';
		display: [ self toggles ]
]

{ #category : #'api - testing' }
BrToggleGroupModel >> hasActivatedToggle [
	<return: #Boolean>
	
	^ activatedToggle isNotNil
]

{ #category : #initialization }
BrToggleGroupModel >> initialize [
	super initialize.
	
	toggles := OrderedCollection new
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
BrToggleGroupModel >> notifyToggleAdded: aBrToggleModel [
	self dispatchEvent: (BrToggleAddedEvent toggle: aBrToggleModel)
]

{ #category : #notifying }
BrToggleGroupModel >> notifyToggleRemoved: aBrToggleModel [
	self dispatchEvent: (BrToggleRemovedEvent toggle: aBrToggleModel)
]

{ #category : #hooks }
BrToggleGroupModel >> onToggleActivated: aBrToggleModel [
	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Activated toggle must not be nil' ].
		
	self toggles
		select: [ :eachToggle | eachToggle ~~ aBrToggleModel ]
		thenDo: #deactivate.
		
	activatedToggle := aBrToggleModel
]

{ #category : #hooks }
BrToggleGroupModel >> onToggleAdded: aBrToggleModel [
	
	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Added toggle must not be nil' ].
	
	aBrToggleModel beOneWay.
	aBrToggleModel when: BrToggleActivatedEvent do: [ :anEvent | self onToggleActivated: anEvent toggle ].
	aBrToggleModel when: BrToggleDeactivatedEvent do: [ :anEvent | self onToggleDeactivated: anEvent toggle ].
	
	self notifyToggleAdded: aBrToggleModel.
	
	"if user adds a toggle marked as activated we should force activate it"
	aBrToggleModel isActivated
		ifTrue: [ self onToggleActivated: aBrToggleModel ]
]

{ #category : #hooks }
BrToggleGroupModel >> onToggleDeactivated: aBrToggleModel [

	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Deactivated toggle must not be nil' ].

	self
		assert: [ aBrToggleModel == self activatedToggle ]
		description: [ 'Deactivated toggle must be known as activated' ].
	
	
	activatedToggle := nil
]

{ #category : #hooks }
BrToggleGroupModel >> onToggleRemoved: aBrToggleModel at: anIndex [
	self
		assert: [ aBrToggleModel isNotNil ]
		description: [ 'Removed toggle must not be nil' ].

	self notifyToggleRemoved: aBrToggleModel
]

{ #category : #'api - toggles' }
BrToggleGroupModel >> removeToggle: aBrToggleModel [
	| aToggleIndex |
	
	aToggleIndex := self toggles indexOf: aBrToggleModel.
	self toggles removeAt: aToggleIndex.
	
	"we have to deactivate removed toggle before sending removed event
	otherwise deactivation event will not bubble"
	aBrToggleModel deactivate.

	self onToggleRemoved: aBrToggleModel at: aToggleIndex
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
