Class {
	#name : #BrToggleGroupExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Toggle'
}

{ #category : #'examples - model' }
BrToggleGroupExamples >> addActivatedAndDeactivatedTogglesToEmptyGroup [
	<gtExample>
	| aToggleGroupModel aToggleModelActivated aToggleModelDeactivated |
	
	aToggleGroupModel := self emptyToggleGroupModel.
	
	aToggleModelActivated := self toggleModel.
	aToggleModelActivated activate.
	
	aToggleModelDeactivated := self toggleModel.
	
	aToggleGroupModel addToggles: { aToggleModelActivated . aToggleModelDeactivated }.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle.
	self assert: aToggleGroupModel activatedToggle equals: aToggleModelActivated.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleModelActivated . aToggleModelDeactivated }.
	
	self assert: aToggleModelActivated isOneWay.
	self assert: aToggleModelDeactivated isOneWay.
	
	^ aToggleGroupModel
]

{ #category : #'examples - model' }
BrToggleGroupExamples >> addActivatedToggleToEmptyGroup [
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self emptyToggleGroupModel.
	aToggleModel := self toggleModel.
	aToggleModel activate.
	
	aToggleGroupModel addToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle.
	self assert: aToggleGroupModel activatedToggle equals: aToggleModel.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleModel }.
	
	self assert: aToggleModel isOneWay.
	
	^ aToggleGroupModel
]

{ #category : #'examples - model' }
BrToggleGroupExamples >> addActivatedToggleToGroupWithDeactivatedToggle [
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self addDeactivatedToggleToEmptyGroup.
	aToggleModel := self toggleModel.
	aToggleModel activate.
	
	aToggleGroupModel addToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle.
	self assert: aToggleGroupModel activatedToggle equals: aToggleModel.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleGroupModel toggles first .  aToggleModel }.
	
	self assert: aToggleModel isOneWay.
	
	^ aToggleGroupModel
]

{ #category : #'examples - model' }
BrToggleGroupExamples >> addDeactivatedToggleToEmptyGroup [
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self emptyToggleGroupModel.
	aToggleModel := self toggleModel.
	
	aToggleGroupModel addToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleModel }.

	self assert: aToggleModel isOneWay.
	
	^ aToggleGroupModel
]

{ #category : #'examples - model' }
BrToggleGroupExamples >> addDeactivatedToggleToGroupWithDeactivatedToggle [
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self addDeactivatedToggleToEmptyGroup.
	aToggleModel := self toggleModel.
	
	aToggleGroupModel addToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty not.
	self assert: aToggleGroupModel isNotEmpty.
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleGroupModel toggles first .  aToggleModel }.
	
	self assert: aToggleModel isOneWay.
	
	^ aToggleGroupModel
]

{ #category : #'examples - instance creation' }
BrToggleGroupExamples >> emptyToggleGroupModel [
	<gtExample>
	| aToggleGroupModel |
	
	aToggleGroupModel := BrToggleGroupModel new.
	
	self assert: aToggleGroupModel isEmpty.
	self assert: aToggleGroupModel isNotEmpty not.
	self assert: aToggleGroupModel toggles asArray equals: #().
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel isAttachedToWidget not.
	
	^ aToggleGroupModel
	
	
]

{ #category : #'examples - model' }
BrToggleGroupExamples >> removeActivatedToggleFromGroupWithOneToggle [
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self addActivatedToggleToEmptyGroup.
	
	aToggleModel := aToggleGroupModel toggles first.
	
	aToggleGroupModel removeToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty.
	self assert: aToggleGroupModel isNotEmpty not.
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel toggles asArray equals: #().

	self assert: aToggleModel isActivated not.
	self assert: aToggleModel isOneWay.	"toggle model stays one way"
	
	^ aToggleGroupModel
]

{ #category : #'examples - model' }
BrToggleGroupExamples >> removeTogglesFromGroupWithTwoTogglesOneOfWhichActivated [
	<gtExample>
	| aToggleGroupModel |
	
	aToggleGroupModel := self addActivatedToggleToGroupWithDeactivatedToggle.
	
	aToggleGroupModel removeToggles.

	self assert: aToggleGroupModel isEmpty.
	self assert: aToggleGroupModel isNotEmpty not.
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel toggles asArray equals: #().
	
	^ aToggleGroupModel
]

{ #category : #'examples - model' }
BrToggleGroupExamples >> switchActivatedTogglesInGroupWithTwoToggles [
	<gtExample>
	| aToggleGroupModel aToggleModelActivated aToggleModelDeactivated |
	
	aToggleGroupModel := self addActivatedAndDeactivatedTogglesToEmptyGroup.
	
	"currently activated; will be deactivated"
	aToggleModelDeactivated := aToggleGroupModel toggles first.
	
	"currently deactivated; will be activated"
	aToggleModelActivated := aToggleGroupModel toggles second.
	
	aToggleModelActivated activate.

	self assert: aToggleGroupModel hasActivatedToggle.
	self assert: aToggleGroupModel activatedToggle equals: aToggleModelActivated.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleModelDeactivated . aToggleModelActivated }.
	
	self assert: aToggleModelActivated isActivated.
	self assert: aToggleModelDeactivated isActivated not .

	^ aToggleGroupModel
]

{ #category : #'examples - events' }
BrToggleGroupExamples >> toggleAddedEvent [
	<gtExample>
	| aToggleGroupModel aToggleModel aToggleAddedEvent |
	
	aToggleGroupModel := self emptyToggleGroupModel.
	aToggleModel := self toggleModel.
	
	aToggleAddedEvent := nil.
	aToggleGroupModel when: BrToggleAddedEvent do: [ :anEvent | aToggleAddedEvent := anEvent copy ].
	
	aToggleGroupModel addToggle: aToggleModel.
	
	self assert: aToggleAddedEvent isNotNil.
	self assert: aToggleAddedEvent source equals: aToggleGroupModel.
	self assert: aToggleAddedEvent target equals: aToggleGroupModel.
	self assert: aToggleAddedEvent currentTarget equals: aToggleGroupModel.
	self assert: aToggleAddedEvent traversedTargets size equals: 2.
	self assert: aToggleAddedEvent isConsumed not.

	self assert: aToggleAddedEvent toggle equals: aToggleModel.
	
	^ aToggleAddedEvent
]

{ #category : #'examples - events' }
BrToggleGroupExamples >> toggleDeactivatedEventDueToRemoving [
	<gtExample>
	| aToggleGroupModel aToggleModel aToggleDeactivatedEvent |
	
	aToggleGroupModel := self addActivatedToggleToEmptyGroup.
	aToggleModel := aToggleGroupModel toggles first.
	
	aToggleDeactivatedEvent := nil.
	aToggleModel when: BrToggleDeactivatedEvent do: [ :anEvent | aToggleDeactivatedEvent := anEvent copy ].
	
	aToggleGroupModel removeToggle: aToggleModel.
	
	self assert: aToggleDeactivatedEvent isNotNil.
	self assert: aToggleDeactivatedEvent source equals: aToggleModel.
	self assert: aToggleDeactivatedEvent target equals: aToggleModel.
	self assert: aToggleDeactivatedEvent currentTarget equals: aToggleModel.
	self assert: aToggleDeactivatedEvent traversedTargets size equals: 2.
	self assert: aToggleDeactivatedEvent isConsumed not.

	self assert: aToggleDeactivatedEvent toggle equals: aToggleModel.
	
	^ aToggleDeactivatedEvent
]

{ #category : #'examples - instance creation' }
BrToggleGroupExamples >> toggleModel [
	<gtExample>

	^ BrToggleModel new
]

{ #category : #'examples - events' }
BrToggleGroupExamples >> toggleRemovedDeactivatedEvent [
	<gtExample>
	| aToggleGroupModel aToggleModel aToggleRemovedEvent |
	
	aToggleGroupModel := self addDeactivatedToggleToEmptyGroup.
	aToggleModel := aToggleGroupModel toggles first.
	
	aToggleRemovedEvent := nil.
	aToggleGroupModel when: BrToggleRemovedEvent do: [ :anEvent | aToggleRemovedEvent := anEvent copy ].
	
	aToggleGroupModel removeToggle: aToggleModel.
	
	self assert: aToggleRemovedEvent isNotNil.
	self assert: aToggleRemovedEvent source equals: aToggleGroupModel.
	self assert: aToggleRemovedEvent target equals: aToggleGroupModel.
	self assert: aToggleRemovedEvent currentTarget equals: aToggleGroupModel.
	self assert: aToggleRemovedEvent traversedTargets size equals: 2.
	self assert: aToggleRemovedEvent isConsumed not.

	self assert: aToggleRemovedEvent toggle equals: aToggleModel.
	
	^ aToggleRemovedEvent
]
