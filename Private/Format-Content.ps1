function Format-Content {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$logFilePath,
		[Parameter(Mandatory = $true)]
		[int]
		$daysBackCount
	)

	$validLogEntries = ''
	Get-Content $logFilePath | ForEach-Object {
		if ($_ -ne $null -and $_ -ne '') {
			$items = $_.split('|')
			if ($items.length -lt 2) {
				return
			}

			$processingDate = [DateTime]::ParseExact($items[0], 'yyyy-MM-dd HH:mm:ss', $null)

			if ($processingDate -ge (Get-Date).AddDays($daysBackCount)) {
				if ($validLogEntries -ne '') {
					$validLogEntries += [Environment]::NewLine
				}

				$validLogEntries += $_
			}
		}
	}

	if ($validLogEntries -ne $null -and $validLogEntries -ne '') {
		Set-Content -Path $logFilePath -Value $validLogEntries
	}
	else {
		Clear-Content $logFilePath
	}
}