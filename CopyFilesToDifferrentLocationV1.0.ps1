[string] $FileDirectory = "C:\Users\TommasHuang\Downloads\Backup";
[string] $OutputPath  = "C:\Users\TommasHuang\Downloads\ZipFiles";
[string] $OutputPath2 = "C:\Users\TommasHuang\Downloads\ZipFiles2";
[string] $OutputPath3 = "C:\Users\TommasHuang\Downloads\ZipFiles3";

foreach ($FilePath in Get-ChildItem $FileDirectory | Select-Object -ExpandProperty FullName)
{
    [string] $Header = Get-Content $FilePath -First 1

    if ($Header -match 'Name,Emp.*') {
        Copy-Item $FilePath $OutputPath
    }
    elseif ($Header -match 'Name,Group.*') {
        Copy-Item $FilePath $OutputPath2
    }
    else {
        Copy-Item $FilePath $OutputPath3
    }
}