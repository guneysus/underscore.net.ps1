function swap () {
<#
    .EXAMPLE
       swap file1.txt file2.txt
#>
    param(
		[Parameter(Mandatory = $true, Position=0)][string]$file1,
		[Parameter(Mandatory = $true, Position=1)][string]$file2
    )
	
	
	if(-not $(test-path $file1)) {
		throw [System.IO.FileNotFoundException] "$file1 not found."
	}
	
	if(-not $(test-path $file2)) {
		throw [System.IO.FileNotFoundException] "$file2 not found."
	}
	
	$file1Tmp=[System.IO.Path]::GetTempFileName()
	$file2Tmp=[System.IO.Path]::GetTempFileName()
	
	# Copy-Item -Path $file1 -Destination $file1Tmp
	# write-host $file1Tmp
	
	# Copy-Item -Path $file2 -Destination $file2Tmp
	# write-host $file2Tmp
	
	# Remove-Item $file2
	# Rename-Item -Path $file1Tmp -Newname $file2
	
	# Remove-Item $file1
	# Rename-Item -Path $file2Tmp -Newname  $file1
}

function touch () {
<#
    .EXAMPLE
       touch existing-file.txt
	   touch non-existing-file.txt
#>
    param(
		[Parameter(Mandatory = $true, Position=0)][string]$file
    )
	
	$fullpath = Join-Path -Path $(Get-Location) -ChildPath $file
	
	if(-not (test-path $fullpath )) {
		New-Item -Path $fullpath -ItemType File
	} else {
	 $f=[System.IO.FileInfo]::new($fullpath)
	 $f.LastWriteTime=$(get-date)
	}
}

function mkcd () {
<#
	 TODO
    .EXAMPLE
       mkcd non-existing-folder
	   
#>
}