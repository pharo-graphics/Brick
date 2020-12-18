Class {
	#name : #BaselineOfBrickCore,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickCore
}

{ #category : #baseline }
BaselineOfBrickCore >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			"baseline: 'PharoBootstrap' with: [ spec loads: 'KernelGroup' ];"

			baseline: 'BlocCore' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocPacElementQuery' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ].

		spec 
			package: #'Brick-Core' with: [
				spec requires: #("#'PharoBootstrap'" #'BlocCore' #'BlocPacElementQuery') ]. ].
]
