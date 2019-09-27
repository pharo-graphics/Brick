Class {
	#name : #BrListItemsChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'items'
	],
	#category : 'Brick-List - Events'
}

{ #category : #'instance creation' }
BrListItemsChangedEvent class >> items: aCollectionOfBrWidgetModel [
	^ self new items: aCollectionOfBrWidgetModel
]

{ #category : #accessing }
BrListItemsChangedEvent >> items [
	^ items
]

{ #category : #accessing }
BrListItemsChangedEvent >> items: anObject [
	items := anObject
]
