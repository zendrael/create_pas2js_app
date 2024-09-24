# Pas2JS Template/Boilerplate

## Step 1: Clone this repo

- Clone this repo or just download it, you can change the folder name after you downloaded

## Step 2: Prepare your environment

### Recommended VSCode extensions

- OmniPascal - Open Preview

### On Linux (or Windows WSL or ChromeOS Linux container)

- Access the project folder from command line
- Run the **setup.sh** script from `./scripts/setup.sh`
- If all goes well, it'll download pas2js to your `$HOME/.local/share/applications/` folder
- The dev and dist scripts are ready to use this folder

### On Windows

- Access the project folder from command line
- Run the **setup.ps1** script from `scripts\setup.ps1` (you must have rights to execute PowerShell scripts)
- If all goes well, it'll download pas2js to your `%LocalAppData%\Programs\` folder
- The dev and dist scripts are ready to use this folder

## Step 3: Open project and run from inside VScode

- open project folder with VSCode (assuming you have VSCode installed)
- install extension OmniPascal
- open the terminal inside VSCode
- **on Linux** compile dev with `./scripts/buildDev.sh`
- **on Windows** compile dev with `scripts\buildDev.ps1` (you must have rights to execute PoweShell scripts)
- access dev project in your browser on address `http://localhost:3000`
- **check your browser console to see if the project works**
- CTRL+C on VScode terminal to stop the server

## Building a release

- open terminal inside VScode
- **on Linux** compile with `./scripts/buildDist.sh`
- **on Windows** compile with `scripts\buildDist.ps1`
- access project on `dist` folder and upload to your server

## Can I use this to create backend apps too?

- Yes! Altho you might need to edit the build scripts - they are all commented and easy to understand.

## Dependencies

- In case you are developing a backend app with Pas2JS, you'll need to have NodeJS or Bun in your system.
