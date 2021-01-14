"
I am a ${class:BrListHorizontalState}$.
I define a horizontal ${class:BrSimpleList}$ representation.
Use ${class:BrListOrientationLook}$ to define how a ${class:BrSimpleList}$ should look like in the horizontal state.
"
Class {
	#name : #BrListHorizontalState,
	#superclass : #BrListOrientationState,
	#category : #'Brick-List - State'
}

{ #category : #accessing }
BrListHorizontalState >> name [
	^ 'horizontal'
]
