Class {
	#name : #BrBenchmarkStyler,
	#superclass : #BlTextStyler,
	#instVars : [
		'duration'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #accessing }
BrBenchmarkStyler >> duration [
	^ duration
]

{ #category : #accessing }
BrBenchmarkStyler >> duration: anObject [
	duration := anObject
]

{ #category : #initialization }
BrBenchmarkStyler >> initialize [
	super initialize.

	duration := 100 milliSeconds
]

{ #category : #private }
BrBenchmarkStyler >> privateStyle: aText [ 
	<return: #BlText>
	| aStartTime anEndTime |
	
	aStartTime := DateAndTime now.
	anEndTime := aStartTime + duration.

	[ DateAndTime now < anEndTime ] whileTrue: [
		| aString |
		1000 factorial.
		Smalltalk allClasses collect: #name.
		aString := String loremIpsum: 20000.
		aString includesSubstring: ((String loremIpsum: 20000) copyFrom: 1050 to: 1100) ].
	
	aText foreground: Color random.
	^ aText
]
