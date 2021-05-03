function Enter-FileProcessing {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$executablePath,
		[Parameter(Mandatory = $true)]
		[string[]]
		$argumentsFormatted,
		[Parameter(Mandatory = $true)]
		[string]
		$filePath
	)

	try {
		$temporaryFile = New-TemporaryFile
		$process = Start-Process -FilePath $executablePath -ArgumentList $argumentsFormatted -RedirectStandardError $temporaryFile -Wait -PassThru

		Enter-Closing $process.ExitCode $temporaryFile $filePath
	}
	catch {
		$argumentsInlined = '|Call arguments: ' + $argumentsFormatted -join ' '

		throw "Could not process file. " + $_.Exception.Message + $argumentsInlined
	}
}