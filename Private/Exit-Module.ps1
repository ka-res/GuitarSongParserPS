function Exit-Module {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $false)]
		[bool]
		$isSuccess = $true
	)

	if ($isSuccess -eq $true) {
		$exitCode = 0
	}
 else {
		$exitCode = -1
	}

	exit $exitCode
}