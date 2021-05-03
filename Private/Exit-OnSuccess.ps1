function Exit-OnSuccess {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$directoryPath
	)

	# TODO save log

	Exit-Module $true
}