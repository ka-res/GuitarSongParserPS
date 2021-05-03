function Get-GrandParentDirectoryName {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$filePath
	)

	$parentDirectoryName = Split-Path $filePath -Parent -ErrorAction Stop
	$grandParentDirectoryName = (Get-Item (Split-Path $parentDirectoryName -Parent) -ErrorAction Stop).Name

	return $grandParentDirectoryName
}