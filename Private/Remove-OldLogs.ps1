function Remove-OldLogs {
	$previousFilesLogPath = './Logs/register.log'
	$errorsLogPath = './Logs/error.log'

	Format-Content $previousFilesLogPath -3
	Format-Content $errorsLogPath -30
}