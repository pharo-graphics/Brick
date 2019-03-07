"
I am a simple list model without column support
"
Class {
	#name : #BrSimpleListModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'items'
	],
	#category : 'Brick-List - Model'
}

{ #category : #'gt-inspector-extension' }
BrSimpleListModel >> gtInspectorItemsIn: aComposite [
	<gtInspectorPresentationOrder: 2>

	^ aComposite fastList
		title: 'Items';
		display: [ self items ]
]

{ #category : #initialization }
BrSimpleListModel >> initialize [
	super initialize.
	
	items := #()
]

{ #category : #'api - accessing' }
BrSimpleListModel >> itemAt: anIndex [
	^ self items at: anIndex
]

{ #category : #'api - accessing' }
BrSimpleListModel >> items [
	<return: #Collection of: #BrWidgetModel>

	^ items
]

{ #category : #'api - accessing' }
BrSimpleListModel >> items: aCollectionOfBrWidgetModel [

	items := aCollectionOfBrWidgetModel.
	self dispatchEvent: (BrListItemsChangedEvent items: self items)
]

{ #category : #hooks }
BrSimpleListModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	"answer if somebody is interested in what items I have"
	self when: BrListItemsRequest reply: [ BrListItemsChangedEvent items: self items ]
]
