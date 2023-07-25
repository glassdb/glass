baseline
baseline: spec
	<baseline>
	spec
		for: #'gemstone'
		do: [ 
			spec
				configuration: 'GoferProjectLoader'
					with: [ 
							spec
								versionString: #'stable';
								repository: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
				configuration: 'Gofer'
					with: [ 
							spec
								versionString: #'stable';
								loads: #('Core');
								repository: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
				project: 'Gofer-Tests' copyFrom: 'Gofer' with: [ spec loads: #('Tests') ];
				baseline: 'Grease'
					with: [ 
							spec
								loads: #('Core');
								repository: 'github://GsDevKit/Grease:master/repository' ];
				project: 'Grease-Tests' copyFrom: 'Grease' with: [ spec loads: #('Tests') ];
				baseline: 'Metacello'
					with: [ spec repository: 'github://dalehenrich/metacello-work:master/repository' ];
				configuration: 'XMLSupport'
					with: [ 
							spec
								versionString: #'stable';
								loads: #('Core');
								repository: 'http://www.squeaksource.com/XMLSupport' ];
				project: 'XMLSupport-Tests'
					copyFrom: 'XMLSupport'
					with: [ spec loads: #('Tests') ];
				yourself.
			spec
				package: 'GemStone-Interactions';
				package: 'Core'
					with: [ 
							spec
								requires: #('GemStone-Interactions');
								includes: #('GemStone-Compression');
								yourself ];
				package: 'Base-Bootstrap' with: [ spec requires: #('Core') ];
				package: 'Bootstrap' with: [ spec requires: #('Base-Bootstrap') ];
				package: 'GemStone-ANSI-Streams' with: [ spec requires: #('Core') ];
				package: 'GemStone-Compression' with: [ spec requires: #('Core') ];
				package: 'GemStone-Indexing-Extensions'
					with: [ spec requires: #('Bootstrap') ];
				package: 'GemStone-Release-Support' with: [ spec requires: #('GsCore') ];
				package: 'Sport'
					with: [ 
							spec
								file: 'Sport3.010-dkh.38';
								requires: #('Bootstrap');
								repository: 'http://seaside.gemtalksystems.com/ss/hyper' ];
				package: 'Squeak' with: [ spec requires: #('Sport') ];
				package: 'Regex-Core' with: [ spec requires: #('Core' 'Squeak') ];
				package: 'Regex-Tests-Core' with: [ spec requires: #('Regex-Core') ];
				yourself.
			spec
				package: 'Announcements' with: [ spec requires: #('GsCore') ];
				package: 'SmaCC' with: [ spec requires: #('GsCore') ];
				package: 'SMTPMail' with: [ spec requires: #('GsCore') ];
				package: 'System-Digital-Signatures' with: [ spec requires: #('GsCore') ];
				package: 'Utf8Encoding' with: [ spec requires: #('GsCore') ];
				yourself.
			spec
				package: 'Change-Notification' with: [ spec requires: #('Monticello') ];
				package: 'PackageInfo-Base'
					with: [ 
							spec
								file: 'PackageInfo-Base.g';
								requires: #('GsCore') ];
				package: 'Monticello'
					with: [ 
							spec
								includes: #('MonticelloGs');
								requires: #('PackageInfo-Base') ];
				package: 'MonticelloGs' with: [ spec requires: #('Monticello') ];
				package: 'GemStone-Deployment'
					with: [ 
							spec
								postLoadDoIt: #'deploymentPostLoadDoIt';
								requires: #('Monticello') ];
				yourself.
			spec
				package: 'OmniBrowser'
					with: [ spec requires: #('Core' 'GemStone-Interactions') ];
				package: 'OB-GemStone-Platform' with: [ spec requires: #('OmniBrowser') ];
				package: 'OB-Monticello'
					with: [ spec requires: #('OB-Standard' 'Monticello') ];
				package: 'OB-SUnitIntegration' with: [ spec requires: #('OB-Standard') ];
				package: 'OB-SUnitGUI'
					with: [ 
							spec
								file: 'OB-SUnitGUI.g';
								requires: #('OB-Standard') ];
				package: 'OB-Standard'
					with: [ spec requires: #('OB-GemStone-Platform' 'Change-Notification') ];
				package: 'OB-Tools'
					with: [ spec requires: #('OB-Standard' 'Announcements') ];
				package: 'JadeServer' with: [ spec requires: #('OB-Tools') ];
				yourself.
			spec
				package: 'GsSqueakCommon-Core'
					with: [ spec requires: #('GsCore' 'Grease') ];
				package: 'GsSqueakCommon-Tests'
					with: [ spec requires: #('GsSqueakCommon-Core') ];
				yourself.
			spec
				group: 'default' with: #('GLASS');
				group: 'Base'
					with: #('GsCore' 'GsMonticello' 'Gofer' 'Grease' 'GsSqueakCommon');
				group: 'GLASS'
					with:
						#('Base' 'GsOB' 'GoferProjectLoader' 'Metacello' 'GemStone-Release-Support');
				group: 'GsCore'
					with:
						#('Core' 'Base-Bootstrap' 'Bootstrap' 'GemStone-ANSI-Streams' 'GemStone-Indexing-Extensions' 'Sport' 'Squeak' 'Regex-Core' 'Regex-Tests-Core');
				group: 'GsMisc'
					with:
						#('Announcements' 'SmaCC' 'SMTPMail' 'System-Digital-Signatures' 'Utf8Encoding');
				group: 'GsMonticello'
					with:
						#('Change-Notification' 'PackageInfo-Base' 'Monticello' 'GemStone-Deployment');
				group: 'GsOB'
					with:
						#('OmniBrowser' 'OB-GemStone-Platform' 'OB-Monticello' 'OB-SUnitIntegration' 'OB-SUnitGUI' 'OB-Standard' 'OB-Tools' 'JadeServer');
				group: 'GsSqueakCommon' with: #('GsSqueakCommon-Core');
				group: 'XML-Parser' with: #('XMLSupport');
				group: 'CI' with: #('GLASS' 'GsMisc' 'Gofer-Tests' 'Grease-Tests');
				yourself ].
	spec
		for: #'gs2.x'
		do: [ 
			spec
				package: 'Announcements' with: [ spec file: 'Announcements.g' ];
				package: 'GemStone-Exceptions'
					with: [ spec requires: #('Bootstrap' 'Sport') ];
				package: 'GemStone-Release-Support'
					with: [ spec file: 'GemStone-Release-Support.v2x' ];
				package: 'GsRandom' with: [ spec requires: #('Base-Bootstrap') ];
				package: 'OB-Standard' with: [ spec file: 'OB-Standard.g' ];
				package: 'OB-Tools' with: [ spec file: 'OB-Tools.g' ];
				package: 'Sport' with: [ spec requires: #('GsRandom') ];
				package: 'Utf8Encoding' with: [ spec file: 'Utf8Encoding.230' ];
				package: 'Core' with: [ spec includes: #('Core24x') ];
				package: 'Core24x' with: [ spec requires: #('Core') ];
				package: 'GsSqueakCommon-Core'
					with: [ spec includes: 'GsSqueakCommon-CoreV24' ];
				package: 'GsSqueakCommon-CoreV24'
					with: [ spec requires: 'GsSqueakCommon-Core' ];
				yourself.
			spec
				package: 'Monticello' with: [ spec file: 'Monticello.g' ];
				yourself.
			spec
				group: 'GsCore' with: #('GsRandom' 'GemStone-Exceptions');
				yourself ].
	spec
		for: #'Issue29FixANeeded'
		do: [ 
			spec
				package: 'GemStone-244-Exceptions'
				with: [ spec requires: #('GemStone-Exceptions') ].
			spec
				group: 'GsCore' with: #('GemStone-244-Exceptions');
				yourself ].
	spec
		for: #'Issue29FixBNeeded'
		do: [ 
			spec
				package: 'GemStone-245-Exceptions'
				with: [ spec requires: #('GemStone-Exceptions') ].
			spec
				group: 'GsCore' with: #('GemStone-245-Exceptions');
				yourself ].
	spec
		for: #'gs3.x'
		do: [ 
			spec
				package: 'Core' with: [ spec file: 'Core.v3' ];
				package: 'Base-Bootstrap' with: [ spec file: 'Base-Bootstrap.v3' ];
				package: 'Bootstrap' with: [ spec file: 'Bootstrap.v3' ];
				package: 'GsSqueakCommon-Core'
					with: [ spec includes: 'GsSqueakCommon-CoreV30' ];
				package: 'GsSqueakCommon-CoreV30'
					with: [ spec requires: 'GsSqueakCommon-Core' ];
				package: 'GsSqueakCommon-Tests'
					with: [ spec includes: 'GsSqueakCommon-TestsV30' ];
				package: 'GsSqueakCommon-TestsV30'
					with: [ spec requires: 'GsSqueakCommon-Tests' ];
				package: 'OB-Standard' with: [ spec file: 'OB-Standard.v3' ];
				package: 'OB-SymbolListBrowser' with: [ spec requires: #('OB-Standard') ];
				package: 'OB-Tools' with: [ spec file: 'OB-Tools.v3' ];
				package: 'Sport' with: [ spec file: 'Sport3.010.v3-jupiter.33' ];
				package: 'Squeak' with: [ spec file: 'Squeak.v3' ];
				yourself.
			spec
				package: 'Change-Notification'
					with: [ spec file: 'Change-Notification.v310' ];
				package: 'GemStone-Deployment'
					with: [ spec file: 'GemStone-Deployment.v310' ];
				package: 'Monticello' with: [ spec file: 'Monticello.v3' ];
				yourself.
			spec
				group: 'GsOB' with: #('OB-SymbolListBrowser');
				yourself ].
	spec
		for: #'gs3.0.x'
		do: [ 
			spec
				package: 'Change-Notification'
					with: [ spec file: 'Change-Notification.v300' ];
				package: 'Core' with: [ spec includes: #('Core300') ];
				package: 'Core300' with: [ spec requires: #('Core') ];
				package: 'GemStone-Deployment' with: [ spec file: 'GemStone-Deployment' ];
				package: 'Monticello' with: 'Monticello.v301';
				package: 'Utf8Encoding' with: [ spec file: 'Utf8Encoding.230' ];
				package: 'Sport' with: [ spec includes: 'SportPatch30' ];
				package: 'SportPatch30'
					with: [ 
							spec
								requires: 'Sport';
								file: 'SportPatch30-dkh.1';
								repository: 'http://seaside.gemtalksystems.com/ss/hyper';
								yourself ];
				yourself ].
	spec
		for: #(#'gs3.1.x' #'gs3.2.0.x' #'gs3.2.1.x')
		do: [ 
			spec
				package: 'Core' with: [ spec includes: #('Core31x') ];
				package: 'Core31x'
					with: [ 
							spec
								requires: #('Core');
								yourself ] ].
	spec
		for: #'gs3.1.x'
		do: [ 
			spec
				package: 'Utf8Encoding'
				with: [ 
					spec
						file: 'Utf8Encoding.310';
						requires: #('GsCore') ] ].
	spec
		for:
			#(#'gs3.2.2.x' #'gs3.2.3.x' #'gs3.2.4.x' #'gs3.2.5.x' #'gs3.2.6.x' #'gs3.2.7.x' #'gs3.2.8.x' #'gs3.2.9.x' #'gs3.2.10.x' #'gs3.2.11.x' #'gs3.2.12.x' #'gs3.2.13.x' #'gs3.2.14.x' #'gs3.2.15.x' #'gs3.2.16.x' #'gs3.2.17.x' #'gs3.2.18.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' #'gs3.6.x' #'gs3.7.x' #'gs3.8.x' #'gs3.9.x')
		do: [ 
			spec
				package: 'Core' with: [ spec includes: #('Core322x') ];
				package: 'Core322x'
					with: [ 
							spec
								requires: #('Core');
								yourself ] ].
	spec
		for:
			#(#'gs3.2.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' #'gs3.6.x')
		do: [ 
			spec
				package: 'Squeak' with: [ spec file: 'Squeak.v32' ];
				package: 'Utf8Encoding'
					with: [ 
							spec
								file: 'Utf8Encoding.310';
								requires: #('GsCore') ] ].
	spec
		for:
			#(#'gs3.2.8.x' #'gs3.2.9.x' #'gs3.2.10.x' #'gs3.2.11.x' #'gs3.2.12.x' #'gs3.2.13.x' #'gs3.2.14.x' #'gs3.2.15.x' #'gs3.2.16.x' #'gs3.2.17.x' #'gs3.2.18.x' #'gs3.3.x' #'gs3.4.x' #'gs3.5.x' #'gs3.6.x')
		do: [ 
			spec
				package: 'OB-Tools' with: [ spec file: 'OB-Tools.v33' ];
				yourself ].
	spec
		for: #'gs3.3.x'
		do: [ 
			spec
				package: 'MonticelloGs' with: [ spec file: 'MonticelloGs.v33' ];
				package: 'Squeak' with: [ spec file: 'Squeak.v33' ];
				yourself ].
	spec
		for: #(#'gs3.4.x' #'gs3.5.x' #'gs3.6.x' #'gs3.7.x' #'gs3.8.x' #'gs3.9.x')
		do: [ 
			spec
				package: 'GemStone-Indexing-Extensions'
					with: [ spec file: 'GemStone-Indexing-Extensions.v34' ];
				package: 'Monticello' with: [ spec file: 'Monticello.v34' ];
				package: 'MonticelloGs' with: [ spec file: 'MonticelloGs.v33' ];
				package: 'Bootstrap' with: [ spec file: 'Bootstrap.v34' ];
				package: 'Network-Url';
				package: 'Squeak'
					with: [ 
							spec
								requires: 'Network-Url';
								file: 'Squeak.v34' ];
				yourself ].
	spec
		for: #(#'gs3.5.x' #'gs3.6.x' #'gs3.7.x' #'gs3.8.x' #'gs3.9.x')
		do: [ 
			spec
				package: 'Core' with: [ spec file: 'Core.v35' ];
				package: 'Network-Url35x' with: [ spec requires: 'Network-Url' ];
				package: 'Network-Url' with: [ spec includes: 'Network-Url35x' ];
				yourself ].
	spec
		for:
			#(#'gs3.5.4.x' #'gs3.5.5.x' #'gs3.5.6.x' #'gs3.5.7.x' #'gs3.5.8.x' #'gs3.5.9.x')
		do: [ 
			spec
				package: 'Bootstrap' with: [ spec file: 'Bootstrap.v354' ];
				package: 'Core' with: [ spec file: 'Core.v354' ];
				package: 'Monticello' with: [ spec file: 'Monticello.v354' ];
				yourself ].
	spec
		for: #(#'gs3.6.x')
		do: [ 
			spec
				package: 'Base-Bootstrap' with: [ spec file: 'Base-Bootstrap.v36' ];
				package: 'Bootstrap' with: [ spec file: 'Bootstrap.v36' ];
				package: 'Change-Notification'
					with: [ spec file: 'Change-Notification.v36' ];
				package: 'Core' with: [ spec file: 'Core.v36' ];
				package: 'Monticello' with: [ spec file: 'Monticello.v36' ];
				package: 'Squeak'
					with: [ 
							spec
								requires: 'Network-Url';
								file: 'Squeak.v36' ];
				yourself ].
	spec
		for: #(#'gs3.7.x' #'gs3.8.x' #'gs3.9.x')
		do: [ 
			spec
				package: 'Base-Bootstrap' with: [ spec file: 'Base-Bootstrap.v36' ];
				package: 'Bootstrap' with: [ spec file: 'Bootstrap.v37' ];
				package: 'Change-Notification'
					with: [ spec file: 'Change-Notification.v36' ];
				package: 'Core' with: [ spec file: 'Core.v37' ];
				package: 'Monticello' with: [ spec file: 'Monticello.v36' ];
				package: 'OB-Tools' with: [ spec file: 'OB-Tools.v37' ];
				package: 'Squeak'
					with: [ 
							spec
								requires: 'Network-Url';
								file: 'Squeak.v37' ];
				package: 'Utf8Encoding'
					with: [ 
							spec
								file: 'Utf8Encoding.370';
								requires: #('GsCore') ];
				yourself ].
	spec
		for: #'maglev'
		do: [ spec package: 'Bootstrap' with: [ spec file: 'Bootstrap.maglev' ] ].
	spec
		for: #'Issue3TraitLoadFixNeeded'
		do: [ 
			spec
				package: 'Monticello'
				with: [ spec preLoadDoIt: #'traitsMonticelloPreLoadDoIt' ] ]
