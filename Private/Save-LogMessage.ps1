function Save-LogMessage {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$filePath,
		[Parameter(Mandatory = $true)]
		[AllowEmptyString()]
		[string]
		$message
	)

	$isError = $message -ne $null -and $message -ne ''
	$date = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
	$logMessage = $date + '|' + $filePath

	if ($isError) {
		$failedFilesLogPath = './Logs/failed.log'
		Add-Content -Path $failedFilesLogPath -Value $logMessage -ErrorAction Stop

		$logMessage += '|' + $message -replace "`r?`n(?!`r?`n)"
		$logFilePath = './Logs/errror.log'
	}
	else {
		$logFilePath = './Logs/register.log'
	}

	try {
		Add-Content -Path $logFilePath -Value $logMessage -ErrorAction Stop
	}
	catch {
		return
	}
}