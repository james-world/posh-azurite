function Start-AzuriteContainer {
param (
    [int] $blobServicePort = 10000,
    [int] $queueServicePort = 10001,
    [int] $tableServicePort = 10002,
    [Switch] $useHostStorage,
    [string] $hostStoragePath = "C:/Azurite"
)
    $dockerImage = "mcr.microsoft.com/azure-storage/azurite"
    $ports = "-p $($blobServicePort):10000 -p $($queueServicePort):10001 -p $($tableServicePort):10002"
    
    Write-Output "Starting Azurite Docker Container"

    if ($useHostStorage.IsPresent) {
        Write-Output "Persisting workspace at `"$($hostWorkspace)`"."
        $volumeMount = "-v $($hostStoragePath):/data"
    } else {
        Write-Output "Workspace will be removed when container is stopped."
        $volumeMount = ""
    }

    $containerName = "--name Azurite"

    $azuriteCommand = "docker run --rm -d $containerName $ports $volumeMount $dockerImage"

    Invoke-Expression $azuriteCommand
}

function Stop-AzuriteContainer {
    Write-Output "Stopping Azurite Docker Container"
	docker stop Azurite
}