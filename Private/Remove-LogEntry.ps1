function Get-Name {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$filePath
	)

	$escapedFilePath = [RegEx]::Escape($filePath)
	$previousFilesLogPath = './Logs/register.log'
	$validLogEntries = ''
	Get-Content $previousFilesLogPath | ForEach-Object {
		if ($_ -ne $null -and $_ -ne '') {
			if ($_ -notmatch $escapedFilePath) {
				if ($validLogEntries -ne '') {
					$validLogEntries += [Environment]::NewLine
				}

				$validLogEntries += $_
			}
		}
	}

	if ($validLogEntries -ne $null -and $validLogEntries -ne '') {
		Set-Content -Path $previousFilesLogPath -Value $validLogEntries
	}
 else {
		Clear-Content $previousFilesLogPath
	}
}