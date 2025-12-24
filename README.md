This script installs Ollama for you !
It is simply made to make the local AI installation for you simple !

For this script to run properly, please unzip this folder and move the file called **"AI-Install.sh"** to `~/` (your home directory),  
or else you will have to adapt the following command to your directory !

You can run this by opening your terminal and typing:

```bash
~/AI-Install.sh
```
Sometimes, the script refuses to launch, you can fix this by giving the script executable permissions by running:

```bash
chmod +x ./AI-Install.sh   # Assuming you have the installer in your home directory, like the inscructions told you to do !
```

## UPDATE

Added a feature that discourages user to run script using sudo, otherwise it would install stuff in the wrong directories !
Fixed a few bugs !
Added an option to add an alias to your shell configuration file, making ease of access to your AI easier by just typing 'AI' in your terminal !
Improved support for Fish (Friendly Interactive Shell), I support your philosophy, non-posix users !
