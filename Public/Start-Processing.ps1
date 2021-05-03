function Start-Processing {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory = $true)]
		[string]
		$directoryPath,
		[Parameter(Mandatory = $false)]
		[AllowEmptyString()]
		[string]
		$fileExtension
	)

	try {

	}
	catch {

	}

	# TODO
	[Genre]$genre = Get-Genre $filePath

	try {
		switch ([Genre]::$genre) {
			{ $_ -eq [Genre]::Blues } {
				# TODO
				Invoke-AsBlues $filePath
				break
			}
			Default {
				throw "Could not match genre"
			}
		}
	}
	catch {
		Exit-OnError $_.Exception.Message
	}

	Exit-OnSuccess
}