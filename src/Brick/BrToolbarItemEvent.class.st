Class {
	#name : #BrToolbarItemEvent,
	#superclass : #BlEvent,
	#instVars : [
		'item'
	],
	#category : 'Brick-Toolbar - Events'
}

{ #category : #'instance creation' }
BrToolbarItemEvent class >> item: aBrToolbarItemModel [
	^ self new item: aBrToolbarItemModel
]

{ #category : #accessing }
BrToolbarItemEvent >> item [
	<return: #BrToolbarModel>
	^ item
]

{ #category : #accessing }
BrToolbarItemEvent >> item: aBrToolbarModel [
	self
		assert: [ aBrToolbarModel notNil ]
		description: [ 'Toolbar item must be non-nil' ].

	item := aBrToolbarModel
]
