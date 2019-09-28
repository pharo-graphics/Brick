"
I am sent by a tab group view model to let all interested objects know what tabs there are
"
Class {
	#name : #BrTabGroupTabsChangedEvent,
	#superclass : #BrTabGroupEvent,
	#instVars : [
		'tabs'
	],
	#category : #'Brick-Tabs - Events'
}

{ #category : #'instance creation' }
BrTabGroupTabsChangedEvent class >> tabs: aCollectionOfBrTabModels [
	^ self new tabs: aCollectionOfBrTabModels
]

{ #category : #initialization }
BrTabGroupTabsChangedEvent >> initialize [
	super initialize.
	
	tabs := #()
]

{ #category : #accessing }
BrTabGroupTabsChangedEvent >> tabs [
	^ tabs
]

{ #category : #accessing }
BrTabGroupTabsChangedEvent >> tabs: anObject [
	tabs := anObject
]
