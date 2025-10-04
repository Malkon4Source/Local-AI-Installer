This script installs Ollama for you !
It is simply made to make the local AI installation for you simple !
For this script to run properly, please unzip this folder and move the file called "AI-Install.sh" to ~/ (your home directory), or else you will have to adapt the following commands to your directory ! 
You can run this by opening your terminal and typing "~/AI-Install.sh" and the rest should be automatic with options to choose from !
If the scipt isn't executable, which might happen, typ "sudo chmod +x ~/AI-Install.sh"

When running the script, it should output something like this:

-------------------------------------------------------------------------------------------------------------------------[

Welcome to Malkon's Ollama installer !
I don't host the models listed, this is just to simplify the installation of a local AI !
Also credits to everyone who made the models and who made Ollama !
Published under the GPL license !
Ollama is already installed and working !
Choose a model to install:

 #   Model                    Size     Purpose
-------------------------------------------------------------
 1)  Phi 4                    9.1GB    Smart. Fast. For general use. Requires reasonably beefy computer, though.

 2)  Gemma 3                  815MB    Recommended for most users who just want stuff that works

 3)  Codellama                3.8GB    Dedicated coding assistant. You can probably tell by the name.

 4)  Llama 2 Uncensored       3.8GB    Less censored general use AI... I wonder why you would need this.

 5)  Phi 4 Mini               2.5GB    Phi 4 except it's recommendable for an average user

 6)  I'm not sure...          0GB      You're just unsure, we don't blame you. This is for recommendations!


Enter the number of the model you want to install [1-6]: 

--------------------------------------------------------------------------------------------------------------------------]

Then choose your model, and the output should be something like:

You selected: phi4-mini
Starting Ollama... :-P
Error: listen tcp 127.0.0.1:11434: bind: address already in use
Pulling model from Ollama... :-P
pulling manifest 
pulling 3c168af1dea0: 100% ▕█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▏ 2.5 GB                         
pulling 813f53fdc6e5: 100% ▕█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▏  655 B                         
pulling fa8235e5b48f: 100% ▕█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▏ 1.1 KB                         
pulling 8c2539a423c4: 100% ▕█████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████████▏  411 B                         
verifying sha256 digest 
writing manifest 
success 
Created AI.sh in the home directory (~/AI.sh) and made it executable successfully

Done! You can now run your AI by typing: ~/AI.sh
Do you want to launch the AI now? [Y/N]: Y

--------------------------------------------------------------------------------------------------------------------------]


That's it! You shoould now hav your local AI ready ! Run "~/AI.sh" to start it !

