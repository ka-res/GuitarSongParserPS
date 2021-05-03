function Find-Duplicate {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$filePath
	)

	$logFilePath = './Logs/register.log'

	Get-Content $logFilePath | ForEach-Object {
		$items = $_.split('|')
		$fileDate = $items[0]
		$filePath = $items[1]

		if ($filePath -eq $filePath) {
			$message = "File ${filePath} was processed recently at ${fileDate}"

			throw $message
		}
	}
}