# PSWindowsUpdate Troubleshooting

## Error
running scripts is disabled on this system

## Fix
Set-ExecutionPolicy RemoteSigned -Scope LocalMachine

## Error
The token '&&' is not a valid statement separator

## Cause
Using PowerShell 5.1

## Fix
Run commands separately or upgrade to PowerShell 7
