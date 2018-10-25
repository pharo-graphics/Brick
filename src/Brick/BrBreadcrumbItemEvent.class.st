Class {
	#name : #BrBreadcrumbItemEvent,
	#superclass : #BlEvent,
	#instVars : [
		'item'
	],
	#category : #'Brick-Breadcrumb - Events'
}

{ #category : #'instance creation' }
BrBreadcrumbItemEvent class >> item: aBrToolbarItemModel [
	^ self new item: aBrToolbarItemModel
]

{ #category : #accessing }
BrBreadcrumbItemEvent >> item [
	<return: #BrToolbarModel>
	^ item
]

{ #category : #accessing }
BrBreadcrumbItemEvent >> item: aBrToolbarModel [
	self
		assert: [ aBrToolbarModel notNil ]
		description: [ 'Toolbar item must be non-nil' ].

	item := aBrToolbarModel
]
