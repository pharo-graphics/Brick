Class {
	#name : #BrBreadcrumbItemEvent,
	#superclass : #BlEvent,
	#instVars : [
		'item',
		'index'
	],
	#category : #'Brick-Breadcrumb - Events'
}

{ #category : #'instance creation' }
BrBreadcrumbItemEvent class >> item: aBrToolbarItemModel [
	^ self new item: aBrToolbarItemModel
]

{ #category : #accessing }
BrBreadcrumbItemEvent >> index [
	<return: #Number>

	^ index
]

{ #category : #accessing }
BrBreadcrumbItemEvent >> index: aNumber [
	index := aNumber
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
