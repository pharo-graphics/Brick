"
!Glamorous UI widgets
==Brick== provides higher level graphical widgets, such as buttons, lists, tree views, etc. (as opposed to ${class:BaselineOfBloc|label=Bloc}$, which provides low level graphical elements).
!!Widgets
${class:BrGlamorousComponentsButtons|label=Buttons}$, ${class:BrGlamorousComponentsCheckboxes|label=Checkboxes}$, ${class:BrGlamorousComponentsLists|label=Lists}$, ${class:BrGlamorousComponentsTabs|label=Tabs}$, ${class:BrGlamorousComponentsDropdowns|label=Dropdowns}$, ${class:BrGlamorousComponentsAccordions|label=Accordions}$, ${class:BrGlamorousComponentsBreadcrumbs|label=Breadcrumb}$, ${class:BrGlamorousComponentsPagers|label=Pager}$
!!Architecture
New Brick widgets are typically created by composing existing Brick widgets.

There are several architectural features of Brick that facilitate flexibility and reuse:

- Stencils (subclass of BrStencil) are used to create widgets when lazy creation is required, or when the widget to be created depends on the data being displayed.
- Looks (subclass of ${class:BrLook}$) provide the ability to modify the element to which they are attached.  A typical example is the look of a Button, whether it has a border or not, a label or not, an icon or not, etc.  Looks should only be created when the underlying widget is used in many places, e.g. buttons, and should not affect the API of the widget.
- View Models are used to maintain the state of a Brick widget, e.g. pressed, focused, hovered, and, like Looks, can be composed by adding multiple models together.  Like Looks, models also receive events.
!!Related
Functionality that is related, but not directly part of Brick:

- Brick is built on top of Bloc elements.  If you feel you need to create a Bloc element, ask first, you probably don't.
- Gt phlow views are built on top of Brick and are used to compose views of a particular object.  Their reuse is typically at the application level where the application interface may be composed of multiple Gt phlow views.
"
Class {
	#name : #BaselineOfBrick,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrick
}

{ #category : #baseline }
BaselineOfBrick >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocExamples' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocPac' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacExamples' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'GToolkitResourcesUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility/src' ].
			
		spec
			package: #'Brick-Core' with: [
				spec requires: #('Bloc' 'BlocPac') ];
			package: #'Brick-Editor' with: [
				spec requires: #('Brick-Core') ];
			package: #'Brick-Editor-Extensions' with: [
				spec requires: #('Brick-Editor') ];
			
			package: #'Brick' with: [
				spec requires: #(#'Brick-Core' #'Brick-Editor') ];
			package: #'Brick-Theme' with: [
				spec requires: #(#'Brick') ];
			
			package: #'Brick-Glamorous' with: [
				spec requires: #(#'Brick' #'GToolkitResourcesUtility') ];
			package: #'Brick-Material' with: [
				spec requires: #(#'Brick') ];
			package: #'Brick-Hydra' with: [
				spec requires: #(#'Brick') ];
			
			package: #'Brick-DevTool' with: [
				spec requires: #(#'Brick' #'Bloc' #'BlocPac') ];

			package: #'Brick-Examples' with: [
				spec requires: #(#'BlocExamples' #'Brick' #'Brick-Glamorous' #'Brick-Material' #'Brick-Hydra') ];
			package: #'Brick-Theme-Examples' with: [
				spec requires: #(#'Brick-Theme') ];
			package: #'Brick-Editor-Examples' with: [
				spec requires: #(#'Brick' #'Brick-Editor') ] ]
]
