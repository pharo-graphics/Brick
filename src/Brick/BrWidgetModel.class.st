"
I define how meaningful UI components of a widget should change in a respond to UI events.

Since I am a view model I also manage widget states (e.g. pressed, focused, hovered)
"
Class {
	#name : #BrWidgetModel,
	#superclass : #BrActor,
	#instVars : [
		'model'
	],
	#category : 'Brick-! Core'
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

	actors := actors copyWith: aBrWidgetModel.
	self widgetDo: [ :anElement | aBrWidgetModel onInstalledIn: anElement ]
]

{ #category : #'api - composition' }
BrWidgetModel >> addAll: aCollectionOfWidgetModels [
	aCollectionOfWidgetModels do: [ :aWidgetModel | self add: aWidgetModel ]
]

{ #category : #'api - composition' }
BrWidgetModel >> asModel [
	^ self
]

{ #category : #'event management' }
BrWidgetModel >> dispatchViewModelAttachedEvent [
	"ViewModelAttached event is listened by Looks to request data from view model.
	If widget has no look attached yet, then there is no need to send this event at all"

	widget lookDo: [ self dispatchEvent: (BrViewModelAttached viewModel: self) ]
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
BrWidgetModel >> onAttachedTo: anElement [
]

{ #category : #hooks }
BrWidgetModel >> onInstalledIn: anElement [
	super onInstalledIn: anElement.
	
	self
		assert: [ widget isNil ]
		description: [ 'Can not install the same look instance on multiple widgets' ].

	widget := anElement.
	self onAttachedTo: anElement.
	self dispatchViewModelAttachedEvent.
	
	self widgetModels do: [ :aWidgetModel | aWidgetModel onInstalledIn: anElement ]
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

		aReplyEvent := aBlock cull: (aRequest responseFor: self).

		aRequest canRespond
			ifTrue: [ aRequest response: aReplyEvent ].

		aReplyEvent source: self.
		aRequest isOneWay
			ifFalse: [ aRequest source dispatchEventToMyself: aReplyEvent ] ]
]

{ #category : #'event management' }
BrWidgetModel >> whenAttachedDo: aBlockClosure [
	self isAttachedToWidget
		ifTrue: [ aBlockClosure cull: self widget ]
		ifFalse: [
			| anAttachedListener |
			anAttachedListener := nil.
			anAttachedListener := BlEventHandler
				on: BrViewModelAttached
				do: [
					self removeEventHandler: anAttachedListener.
					aBlockClosure cull: self widget ].
			self addEventHandler: anAttachedListener ]
]

{ #category : #accessing }
BrWidgetModel >> widgetModels [
	<return: #Collection of: #BrWidgetModel>

	^ self children
]
