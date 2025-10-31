# Pas2JS Template/Boilerplate

## Step 1: Clone this repo

- Clone this repo or just download it, you can change the folder name after you downloaded

## Step 2: Prepare your environment

### Recommended VSCode extensions

- OmniPascal - Open Preview

### On Linux (or Windows WSL or ChromeOS Linux container)

- Access the project folder (root of project folder) from command line
- Run the **setup.sh** script with `./scripts/setup.sh`
- If all goes well, it'll download pas2js to your `$HOME/.local/share/applications/` folder
- The dev and dist scripts are ready to use this folder structure

### On Windows

- Access the project folder (root of project folder) from command line
- Run the **setup.bat** script from `.\scripts\setup.bat`
- If all goes well, it'll download pas2js to your `%LocalAppData%` folder
- The dev and dist scripts are ready to use this folder structure

## Step 3: Open project and run from inside VScode

- Open project folder with VSCode (assuming you have VSCode installed)
- Install extension OmniPascal
- Open the terminal inside VSCode
- **On Linux** compile dev with `./scripts/buildDev.sh`
- **On Windows** compile dev with `.\scripts\buildDev.bat`
- Access dev project in your browser on address `http://localhost:8080`
- **Check your browser console to see if the project works**
- CTRL+C on VScode terminal to stop the server

## Building a release

- Open terminal inside VScode
- **On Linux** compile with `./scripts/buildDist.sh`
- **On Windows** compile with `.\scripts\buildDist.bat`
- Access project on `dist` folder and upload to your server

## How to compile the examples?

- Copy `public_html`, `src` and `ìndex.html` from inside the exemple you want to compile on top of the main `public_html`, `src` and `ìndex.html` overwriting them.
- Build the project

## Can I use this to create backend apps too?

- Yes! Altho you might need to edit the build scripts - they are all commented and easy to understand.

## Dependencies

- In case you are developing a backend app with Pas2JS, you'll need to have NodeJS or Bun in your system.
