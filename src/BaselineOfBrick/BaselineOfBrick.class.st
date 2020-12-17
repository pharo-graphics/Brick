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
			baseline: 'PharoBootstrap' with: [
				spec
					repository: '';
					loads: 'KernelGroup' ];

			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			
			baseline: 'BlocCore' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocLayout' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocText' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];

			baseline: 'BrickCore' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickEditor' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickHydra' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickMaterial' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickGlamorous' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			
			baseline: 'BlocPacAsyncElement' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacElementQuery' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacFocusFinder' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacInfinite' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacOverlay' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacResizable' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacScalable' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacScrollable' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacTasker' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			
			baseline: 'Beacon' with: [
				spec repository: 'github://feenkcom/pharo-beacon/repository' ].
		spec 
			package: #Brick with: [
				spec requires: #(#'PharoBootstrap' #'Bloc' 'BrickEditor' 'Beacon' 'BlocPacInfinite' 'BlocPacElementQuery'). ];
			package: #'Brick-DevTool' with: [
				spec requires: #('Brick' ). ] ].
]
