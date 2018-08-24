Extension { #name : #BlElement }

{ #category : #'*Brick-Old' }
BlElement >> addStyleClass: anObject [
	self styleClasses add: anObject
]

{ #category : #'*Brick-Old' }
BlElement >> addStylesheet: anObject [
	self stylesheets add: anObject.
]

{ #category : #'*Brick-Old' }
BlElement >> defaultStyler [
	^ BrElementStyler on: self
]

{ #category : #'*Brick-Old' }
BlElement >> pseudoClassStates [
	^ self styler pseudoClassStates
]

{ #category : #'*Brick-Old' }
BlElement >> removeStyleClass: anObject [
	self styleClasses remove:anObject
]

{ #category : #'*Brick-Old' }
BlElement >> styleClass [
	^ self styleClasses first
]

{ #category : #'*Brick-Old' }
BlElement >> styleClass: anObject [
	self styleClasses: {anObject}
]

{ #category : #'*Brick-Old' }
BlElement >> styleClasses [
	^ self styler styleClasses
]

{ #category : #'*Brick-Old' }
BlElement >> styleClasses: aCollection [
	self styler styleClasses: aCollection
]

{ #category : #'*Brick-Old' }
BlElement >> styleId [
	^ self styler styleId
]

{ #category : #'*Brick-Old' }
BlElement >> styleId: anObject [
	self styler styleId:anObject
]

{ #category : #'*Brick-Old' }
BlElement >> styler [
	^ styler ifNil: [ styler := self defaultStyler ]
]

{ #category : #'*Brick-Old' }
BlElement >> styler: aStyler [
	styler := aStyler
]

{ #category : #'*Brick-Old' }
BlElement >> stylesheets [
	^ self styler stylesheets
]
