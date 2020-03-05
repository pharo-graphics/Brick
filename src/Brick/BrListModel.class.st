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

{ #category : #hooks }
BrListModel >> initializeListeners [
	super initializeListeners.

	"answer if somebody is interested in what items I have"
	self when: BrListItemsRequest reply: [ :aResponse | aResponse items: self items ]
]

{ #category : #'api - accessing' }
BrListModel >> itemAt: anIndex [
	^ self items at: anIndex
]

{ #category : #'api - accessing' }
BrListModel >> itemCount [
	<return: #Number>

	^ self items size
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
