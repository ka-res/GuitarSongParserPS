function Exit-OnError {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$filePath,
		[Parameter(Mandatory = $true)]
		[string]
		$message
	)

	Write-Error -Message $message
	# TODO save log

	Exit-Module $false
}