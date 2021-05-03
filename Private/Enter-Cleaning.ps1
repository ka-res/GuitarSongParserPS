function Enter-Cleaning {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$exitCode,
		[Parameter(Mandatory = $true)]
		[string[]]
		$temporaryFile,
		[Parameter(Mandatory = $true)]
		[string]
		$filePath
	)

	$errors = Get-Content $temporaryFile
	$inlineError = "|EXE ExitCode: ${exitCode}|Message: "
	if ($null -ne $errors -and $errors -ne '') {
		$inlineError = + $errors -join ' '
	}
	else {
		$inlineError += "<no error details passed>"
	}

	throw $inlineError
}