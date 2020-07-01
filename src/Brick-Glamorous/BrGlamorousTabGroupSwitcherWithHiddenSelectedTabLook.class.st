"
I am a tab switcher look that position tabs at top-center part of container.
I hide a selected tab header widget.

I expect to be attached to a ${class:BrTabGroup}$ instance.

!! Examples 
!!! With Labels
${example:BrExamplesShowroom>>#glamorousTabsSwitcherWithHiddenSelectedTabsWithLabels|codeExpanded=false|previewExpanded=true}$

!!! With Icons
${example:BrExamplesShowroom>>#glamorousTabsSwitcherWithHiddenSelectedTabsWithIcons|codeExpanded=false|previewExpanded=true}$

"
Class {
	#name : #BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook,
	#superclass : #BrGlamorousTabGroupSwitcherLook,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #'instance creation' }
BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook >> newHeaderLook [
	^ BrGlamorousTabGroupSwitcherHeaderWithHiddenSelectedTabLook new
]
