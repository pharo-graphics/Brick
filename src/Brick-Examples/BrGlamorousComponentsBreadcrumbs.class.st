"
!Breadcrumb
Indicate the current location within a navigational hierarchy that automatically adds separators between items.
!!!!With labels
${example:BrGlamorousComponentsBreadcrumbs>>#breadcrumbWithLabels|previewShow=#gtLiveFor:|previewHeight=65|previewExpanded=true|codeExpanded=false}$
!!!!With buttons
${example:BrGlamorousComponentsBreadcrumbs>>#breadcrumbWithButtons|previewShow=#gtLiveFor:|previewHeight=65|previewExpanded=true|codeExpanded=false}$
!!!!Without separator
${example:BrGlamorousComponentsBreadcrumbs>>#breadcrumbWithoutSeparator|previewShow=#gtLiveFor:|previewHeight=85|previewExpanded=true|codeExpanded=false}$
"
Class {
	#name : #BrGlamorousComponentsBreadcrumbs,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #breacrumb }
BrGlamorousComponentsBreadcrumbs >> breadcrumbWithButtons [
	<gtExample>

	^ BrBreadcrumb new
		look: (BrGlamorousBreadcrumbAptitude new separator: [
			BrLabel new
				look: (BrGlamorousLabelAptitude new thin foreground: Color gray);
				text: '/';
				margin: (BlInsets left: 5 right: 5) ]);
		addItem: (BrButton new
			look: BrGlamorousLinkSquaredButtonWithLabelAptitude new glamorousRegularFont;
			label: 'Home');
		addItem: (BrButton new
			look: BrGlamorousLinkSquaredButtonWithLabelAptitude new glamorousRegularFont;
			label: 'Store');
		addItem: (BrButton new
			look: BrGlamorousLinkSquaredButtonWithLabelAptitude new glamorousRegularFont;
			label: 'T-Shirt')
]

{ #category : #breacrumb }
BrGlamorousComponentsBreadcrumbs >> breadcrumbWithLabels [
	<gtExample>

	^ BrBreadcrumb new
		look: (BrGlamorousBreadcrumbAptitude new separator: [
			BrLabel new
				look: (BrGlamorousLabelAptitude new thin foreground: Color gray);
				text: '>';
				margin: (BlInsets left: 5 right: 5) ]);
		addItem: (BrLabel new
			look: BrGlamorousLabelAptitude;
			text: 'Home');
		addItem: (BrLabel new
			look: BrGlamorousLabelAptitude;
			text: 'Store');
		addItem: (BrLabel new
			look: BrGlamorousLabelAptitude;
			text: 'T-Shirt')
]

{ #category : #breacrumb }
BrGlamorousComponentsBreadcrumbs >> breadcrumbWithoutSeparator [
	<gtExample>

	^ BrBreadcrumb new
		look: BrGlamorousBreadcrumbAptitude;
		addItem: (BrLabel new
			look: BrGlamorousLabelAptitude;
			text: 'Home');
		addItem: (BrLabel new
			look: BrGlamorousLabelAptitude;
			text: 'Store');
		addItem: (BrLabel new
			look: BrGlamorousLabelAptitude;
			text: 'T-Shirt')
]
