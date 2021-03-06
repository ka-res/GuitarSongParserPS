<#
	.Synopsis
	Enables processing of guitar song files

	.Description
	Process guitar song files via scripts

	.Parameter DirectoryPath
	Input parameter

	.Example
	Start-Processing -DirectoryPath ''
#>

# Get public and private function definition files
$Public = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue)
$Private = @(Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue)

# Dot source the files
foreach ($import in @($Public + $Private)) {
	Try {
		$import.fullname
	}
	Catch {
		Write-Error -Message "Failed to import function $($import.fullname): $_"
	}
}

Add-Type -TypeDefinition @"
public enum Genre
{
	Blues,
	Rock,
	Folk,
	Indie,
	Jazz
}
"@

# Here I might...
# Read in or create an initial config file and variable
# Export Public functions ($Public.BaseName) for WIP modules
# Set variables visible to the module and its functions only
Export-ModuleMember -Function $Public.Basename