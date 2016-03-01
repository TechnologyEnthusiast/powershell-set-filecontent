#
# Set-FileContent.ps1
#

# This function will find and replace string(s) in a text file, then commit the changes.
Function Set-FileContent
{
	[CmdletBinding()]
	PARAM
	(
		[ValidateNotNullOrEmpty()]
		[string]$Filepath,
	
		[ValidateNotNullOrEmpty()]
		[string[]]$FindString,
	
		[ValidateNotNullOrEmpty()]
		[string[]]$ReplaceString
	)

	$FileContent = [System.IO.File]::ReadAllText("$Filepath")
	for ($i = 0; $i -lt ($FindString.Count); $i++)
	{
		$Find = $FindString[$i]
		$Replace = $ReplaceString[$i]
		Write-Output "Replacing: $Find"
		Write-Output "With: $Replace"
		$FileContent = $FileContent.Replace("$Find","$Replace")
		$Find = $null
		$Replace = $null
	}
	[System.IO.File]::WriteAllText("$Filepath", $FileContent)
}
