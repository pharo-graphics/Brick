Class {
	#name : #BrDevLookArtifactReference,
	#superclass : #Object,
	#instVars : [
		'lookClass',
		'artifact',
		'methods'
	],
	#category : #'Brick-DevTool'
}

{ #category : #accessing }
BrDevLookArtifactReference >> artifact [
	^ artifact
]

{ #category : #accessing }
BrDevLookArtifactReference >> artifact: anObject [
	artifact := anObject
]

{ #category : #accessing }
BrDevLookArtifactReference >> lookClass [
	^ lookClass
]

{ #category : #accessing }
BrDevLookArtifactReference >> lookClass: anObject [
	lookClass := anObject
]

{ #category : #accessing }
BrDevLookArtifactReference >> methods [
	^ methods
]

{ #category : #accessing }
BrDevLookArtifactReference >> methods: anObject [
	methods := anObject
]
