examples - toggle
predefinedToggle
	<gtExample>
	| aToggle |

	aToggle := BrToggle new.
	aToggle look: BrIconLook + BrLabelLook + BrLayoutLook linearHorizontal fitContent.

	self assert: aToggle isActivated not.
	self assert: aToggle viewModel isActivated not.

	^ aToggle