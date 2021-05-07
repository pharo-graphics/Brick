Class {
	#name : #BrBreadcrumbLinearAptitude,
	#superclass : #BrBreadcrumbAptitude,
	#instVars : [
		'resizerLook'
	],
	#category : #'Brick-Breadcrumb - Look'
}

{ #category : #'private - update' }
BrBreadcrumbLinearAptitude >> addItemsAndSeparators [
	| currentItemElements currentSeparatorElements |
	currentItemElements := self itemElements.
	currentItemElements
		ifNotEmpty: [ self separators removeKey: currentItemElements last ifAbsent: [  ].
			currentItemElements
				allButLastDo:
					[ :eachItemElement | self separators at: eachItemElement ifAbsentPut: self newSeparator ].
			currentSeparatorElements := self separatorElements.
			self
				assert: [ currentItemElements size - 1 = currentSeparatorElements size ]
				description: [ 'There must be one separator less then amount of items' ].
			currentItemElements
				do: [ :eachItemElement | 
					self widgetContent addChild: eachItemElement.
					self separators
						at: eachItemElement
						ifPresent:
							[ :eachSeparatorElement | self widgetContent addChild: eachSeparatorElement ] ].
			self widgetDo: [ :aWidget | aWidget requestStyle ] ]
]

{ #category : #initialization }
BrBreadcrumbLinearAptitude >> initialize [
	super initialize.

	self add: (resizerLook := BrLayoutResizerAptitude new inherit vInherit: [ :aBlock | self itemElements do: aBlock ]).
	self add: (BrLayoutAlignmentAptitude forHorizontalLinearLayout)
]

{ #category : #hooks }
BrBreadcrumbLinearAptitude >> onItemAttached: anItemElement at: anIndex [
	self removeItemsAndSeparators.
	self addItemsAndSeparators
]

{ #category : #hooks }
BrBreadcrumbLinearAptitude >> onItemRemoved: aWidgetModel at: anIndex [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item removed event without being attached to a widget' ].
	
	self widgetDo: [ self removeItemsAndSeparators ].
	self items removeKey: aWidgetModel.
	self widgetDo: [ self addItemsAndSeparators ]
]

{ #category : #hooks }
BrBreadcrumbLinearAptitude >> onSeparatorChanged: aSeparatorStencil [
	self widgetDo: [
		self removeItemsAndSeparators.
		self addItemsAndSeparators ]
]

{ #category : #'private - update' }
BrBreadcrumbLinearAptitude >> removeItemsAndSeparators [
	self itemElements do: [ :eachItem | eachItem removeFromParent ].
	self separatorElements do: [ :eachSeparator | eachSeparator removeFromParent ]
]
