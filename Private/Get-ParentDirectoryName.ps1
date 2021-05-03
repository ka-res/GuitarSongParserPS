function Get-Name {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$filePath
	)

	$parentDirectoryName = (Get-Item (Split-Path $filePath -Parent) -ErrorAction Stop).Name

	return $parentDirectoryName
}