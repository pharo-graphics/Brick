"
I add API that allows users to expand and collapse widgets that support it, for example ${class:BrTriangle}$.
"
Trait {
	#name : #TBrExpandable,
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - expandable' }
TBrExpandable >> collapse [
	self states addState: BrCollapsedState uniqueInstance
]

{ #category : #'api - expandable' }
TBrExpandable >> expand [
	self states addState: BrExpandedState uniqueInstance
]

{ #category : #'api - expandable' }
TBrExpandable >> expanded: aBoolean [
	aBoolean
		ifTrue: [ self expand ]
		ifFalse: [ self collapse ]
]

{ #category : #'api - expandable' }
TBrExpandable >> isCollapsed [
	"Return true if an widget is collapsed (does not have an expanded state), false otherwise"
	<return: #Boolean>

	^ self isExpanded not
]

{ #category : #'api - expandable' }
TBrExpandable >> isExpanded [
	"Return true if an widget is expanded (has expanded state), false otherwise"
	<return: #Boolean>

	^ self states hasState: BrExpandedState uniqueInstance
]

{ #category : #'api - expandable' }
TBrExpandable >> toggle [
	self
		deprecated: 'Use #toggleExpanded instead.'
		transformWith: '`@receiver toggle' -> '`@receiver toggleExpanded'.

	self toggleExpanded
]

{ #category : #'api - expandable' }
TBrExpandable >> toggleExpanded [
	"Toggle the expanded state"

	self expanded: self isExpanded not
]
