IF ($IsWindows -or $env:OS -like "Windows*")
{
    & $PSScriptRoot/test.ps1 -NoInstall -Configuration CI -Coverage

	choco install codecov --no-progress
    IF ($lastexitcode -eq 0)
    {
	    codecov -f $PSScriptRoot/../artifacts/coverage.xml
    }
}
ELSE
{
    & $PSScriptRoot/test.ps1 -NoInstall -Configuration Release
}
