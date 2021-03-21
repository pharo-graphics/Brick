"
I am a ${class:BrListHorizontalState}$.
I define a vertical ${class:BrSimpleList}$ representation.
Use ${class:BrListOrientationLook}$ to define how a ${class:BrSimpleList}$ should look like in the vertical state.
"
Class {
	#name : #BrListVerticalState,
	#superclass : #BrListOrientationState,
	#category : #'Brick-List - State'
}

{ #category : #accessing }
BrListVerticalState >> name [
	^ 'vertical'
]
