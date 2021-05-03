function Clear-FilePaths {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[System.IO.FileInfo[]]
		$filePaths
	)

	$failedFilesLogPath = './Logs/failed.log';
	$failedPaths = @()
	Get-Content $failedFilesLogPath | ForEach-Object {
		$items = $_.split('|')
		$processedFilePath = $items[1]

		foreach ($filePath in $filePaths) {
			if ($processedFilePath -eq $filePath.FullName) {
				$failedPaths += $filePath
			}
		}

		$result = @()
		foreach ($filePath in $filePaths) {
			if ($failedPaths -notcontains $filePath -and $result -notcontains $filePath) {
				$result += $filePath
			}
		}

		return $result
	}
}