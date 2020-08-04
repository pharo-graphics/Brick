"
I define how meaningful UI components of a widget should change in a respond to UI events.

Since I am a view model I also manage widget states (e.g. pressed, focused, hovered)
"
Class {
	#name : #BrWidgetModel,
	#superclass : #BrActor,
	#instVars : [
		'model',
		'whenAttachedActions'
	],
	#category : #'Brick-! Core'
}

{ #category : #'api - composition' }
BrWidgetModel class >> + anotherModel [
	^ self asModel + anotherModel
]

{ #category : #'api - composition' }
BrWidgetModel class >> asModel [
	^ self new
]

{ #category : #printing }
BrWidgetModel class >> modelName [
	^ self name
]

{ #category : #'api - composition' }
BrWidgetModel >> + anotherModel [
	self add: anotherModel asModel
]

{ #category : #'api - composition' }
BrWidgetModel >> add: aBrWidgetModel [

	self isAttachedToWidget and: [ self widget lookDo: [ :aLook |
		self error: 'Can not add a view model if there is a look'	] ].

	actors := actors copyWith: aBrWidgetModel.
	self widgetDo: [ :anElement | aBrWidgetModel onInstalledIn: anElement ]
]

{ #category : #'api - composition' }
BrWidgetModel >> addAll: aCollectionOfWidgetModels [
	aCollectionOfWidgetModels do: [ :aWidgetModel | self add: aWidgetModel ]
]

{ #category : #'api - composition' }
BrWidgetModel >> addInteractiveModelState: aState [
	self allActorsBreadthFirstDo: [ :eachModel | 
		(eachModel isKindOf: BrInteractiveModel) ifTrue: [ 
			eachModel addState: aState.
			^ self ] ].
	self add: (BrInteractiveModel with: aState).
]

{ #category : #'api - composition' }
BrWidgetModel >> asModel [
	^ self
]

{ #category : #'event management' }
BrWidgetModel >> dispatchViewModelAttachedEvent [
	"ViewModelAttached event is listened by Looks to request data from view model.
	If widget has no look attached yet, then there is no need to send this event at all"
	| aCopyOfActions |
	
	aCopyOfActions := whenAttachedActions copy.
	
	whenAttachedActions := OrderedCollection new.
	aCopyOfActions do: [ :eachAction | eachAction cull: widget ]
]

{ #category : #initialization }
BrWidgetModel >> initialize [
	super initialize.

	whenAttachedActions := OrderedCollection new
]

{ #category : #accessing }
BrWidgetModel >> model [
	^ model
]

{ #category : #accessing }
BrWidgetModel >> model: anObject [
	model := anObject
]

{ #category : #printing }
BrWidgetModel >> modelName [
	^ self class modelName
]

{ #category : #hooks }
BrWidgetModel >> onInstalledIn: anElement [
	super onInstalledIn: anElement.

	self dispatchViewModelAttachedEvent.	
	self widgetModels do: [ :aWidgetModel | aWidgetModel onInstalledIn: anElement ]
]

{ #category : #hooks }
BrWidgetModel >> onUninstalledIn: anElement [
	super onUninstalledIn: anElement.

	self
		assert: [ self widget == anElement ]
		description: [ 'Can not uninstall from a different widget' ].

	self widgetModels reversed do: [ :aWidgetModel | aWidgetModel onUninstalledIn: anElement ].
	widget := nil.
	self initializeListeners
]

{ #category : #printing }
BrWidgetModel >> printOn: aStream [

	aStream nextPutAll: self modelName.
	aStream space.
	aStream nextPut: ${.
	self widgetModels withIndexDo: [ :aWidgetModel :anIndex |
		anIndex = 1 ifTrue: [ aStream cr ].
		aStream tab.
		aStream print: aWidgetModel.
		aStream cr.
	].
	aStream nextPut: $}.
]

{ #category : #'event management' }
BrWidgetModel >> when: aRequestClass reply: aBlock [
	self when: aRequestClass do: [ :aRequest |
		| aReplyEvent |
		
		aRequest consumed: true.

		aReplyEvent := aBlock cull: (aRequest responseFor: self) cull: aRequest.

		aRequest canRespond
			ifTrue: [ aRequest response: aReplyEvent ].

		aReplyEvent source: self.
		
		aRequest isConsumed ifTrue: [ 
			aRequest isOneWay ifFalse: [ 
				aRequest source dispatchEvent: aReplyEvent ] ] ]
]

{ #category : #'event management' }
BrWidgetModel >> whenAttachedDo: aBlockClosure [
	"Evaluate a aBlockClosure as *once* when I am attached to the widget.
	If I am already attached to the widget evaluate the aBlockClosure right away"

	self isAttachedToWidget
		ifTrue: [ aBlockClosure cull: self widget ]
		ifFalse: [ whenAttachedActions add: aBlockClosure ]
]

{ #category : #accessing }
BrWidgetModel >> widgetModels [
	<return: #Collection of: #BrWidgetModel>

	^ self children
]
