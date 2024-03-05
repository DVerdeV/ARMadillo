# Get the list of .zip files in the current directory
$zipFiles = Get-ChildItem -Filter *.zip

# Loop through each .zip file
foreach ($zip in $zipFiles) {
    # Delete the .zip file
    Remove-Item $zip.FullName
}

# Get the list of directories in the current directory
$directories = Get-ChildItem -Directory

# Loop through each directory
foreach ($dir in $directories) {
    # Exclude the current directory and parent directory
    if ($dir.Name -ne "." -and $dir.Name -ne "..") {
        # Get the directory name
        $dir_name = $dir.Name
        
        # Zip the directory with its content
        Compress-Archive -Path $dir.FullName -DestinationPath "$dir_name.zip"
    }
}