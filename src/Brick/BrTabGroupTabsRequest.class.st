"
I am sent to request a tab group view model to respond with all the registered tabs
"
Class {
	#name : #BrTabGroupTabsRequest,
	#superclass : #BrTabGroupRequest,
	#category : #'Brick-Tabs - Events'
}

{ #category : #initialization }
BrTabGroupTabsRequest >> responseClass [
	^ BrTabGroupTabsChangedEvent
]
