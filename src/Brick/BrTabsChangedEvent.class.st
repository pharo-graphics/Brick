Class {
	#name : #BrTabsChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'tabs'
	],
	#category : 'Brick-Tabs - Events'
}

{ #category : #'instance creation' }
BrTabsChangedEvent class >> tabs: aCollectionOfBrTabModels [
	^ self new tabs: aCollectionOfBrTabModels
]

{ #category : #accessing }
BrTabsChangedEvent >> tabs [
	^ tabs
]

{ #category : #accessing }
BrTabsChangedEvent >> tabs: anObject [
	tabs := anObject
]
