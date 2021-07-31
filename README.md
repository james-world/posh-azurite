# posh-azurite

Powershell Module for starting and stopping an Azurite container. Tested on Windows 10 only.
Makes use of the [Azurite docker container](https://github.com/Azure/Azurite).

### Requirements

- `docker` command available in the path

Supplied "as is" and it's very rough and ready! There is no fancy install or error checking. You are welcome to submit a PR if you want to make it better.

To use, just copy the posh-azurite folder into the Modules folder where your powershell profile is located. The value of `$profile` has this. Usually it's `C:\Users\<you>\Documents\PowerShell`. Then add `Import-Module posh-azurite` to your `$profile` to make the commands available when you start Powershell.

Contains the following commands:

## Start-Azurite

Starts a container named Azurite running the azurite emulater.

By default, it maps the ports as follows (i.e. the usual ports for local storage emulation):

- 10000 - blob storage
- 10001 - queue storage
- 10002 - table storage

You can override this (see `help Start-Azurite`).

Container run with --rm so it will be remove itself on stop.

If `-UseHostStorage` is specified, it will map a bind-mount to persist data on the host using the default path `C:\Azurite`. Useful it you want to preserve data between restarts, or see the data on disk.

Pass a custom path using `-hostStoragePath`. Don't use spaces in the path, it isn't tolerant of that.

## Stop-Azurite

Stops a container named Azurite