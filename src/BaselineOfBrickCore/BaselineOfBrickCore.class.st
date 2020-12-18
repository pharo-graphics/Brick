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
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocPacElementQuery' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ].

		spec 
			package: #'Brick-Core' with: [
				spec requires: #("#'PharoBootstrap'" #'BlocCore' #'BlocPacElementQuery') ]. ].
]
