Class {
	#name : #BrListModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'items'
	],
	#category : #'Brick-List - Model'
}

{ #category : #'gt-inspector-extension' }
BrListModel >> gtInspectorItemsIn: aComposite [
	<gtInspectorPresentationOrder: 2>

	^ aComposite fastList
		title: 'Items';
		display: [ self items ]
]

{ #category : #initialization }
BrListModel >> initialize [
	super initialize.
	
	items := #()
]

{ #category : #'api - accessing' }
BrListModel >> itemAt: anIndex [
	^ self items at: anIndex
]

{ #category : #'api - accessing' }
BrListModel >> items [
	<return: #Collection of: #Object>
	
	^ items
]

{ #category : #'api - accessing' }
BrListModel >> items: aCollectionOfBrWidgetModel [

	items := aCollectionOfBrWidgetModel.
	self dispatchEvent: (BrListItemsChangedEvent items: self items)
]

{ #category : #hooks }
BrListModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	"answer if somebody is interested in what items I have"
	self when: BrListItemsRequest reply: [ :aResponse | aResponse items: self items ]
]
