function Get-Genre {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$filePath
	)

	# TODO get by extension

	#return [Genre]::Blues
}