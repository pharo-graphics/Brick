Class {
	#name : #BrStyleOrigin,
	#superclass : #Object,
	#category : 'Brick-Style-CSS'
}

{ #category : #'as yet unclassified' }
BrStyleOrigin class >> AUTHOR [
	^ BrStyleAuthorOrigin
]

{ #category : #'as yet unclassified' }
BrStyleOrigin class >> INLINE [
	^ BrStyleInlineOrigin
]

{ #category : #'as yet unclassified' }
BrStyleOrigin class >> USER [
	^ BrStyleUserOrigin
]

{ #category : #'as yet unclassified' }
BrStyleOrigin class >> USER_AGENT [
	^ BrStyleUserAgentOrigin
]
