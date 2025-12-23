#!/bin/bash

echo "Welcome to Malkon's Ollama installer ! [v0.4]"
echo "I don't host the models listed, this is just to simplify the installation of a local AI !"
echo "Also credits to everyone who made the models and Ollama !"
echo "Published under the GPL license !"

current_shell=$(basename "$SHELL")
echo "Detected your current shell: $current_shell"


echo "I recommend NOT running this script using sudo !"
read -p "Have you run this script using sudo? [y/n]: " rootconfirm

case $rootconfirm in
y|yes)
read -p "I recommend NOT doing so, but do you wish to continue anyway? [y/n] " DYC
    case $DYC in
    y|yes)
    echo "Okay, then I assume you know what you're doing !"
    ;;
    n|no)
    echo "Okay, just run the script normally, and it'll work !"
    exit 1
    ;;
    esac
;;
n|no)
echo "Goodie !"
;;
esac



sleep 0.25

detect_package_manager() {
    if command -v apt &> /dev/null; then
        echo "apt"
    elif command -v dnf &> /dev/null; then
        echo "dnf"
    elif command -v yum &> /dev/null; then
        echo "yum"
    elif command -v pacman &> /dev/null; then
        echo "pacman"
    elif command -v zypper &> /dev/null; then
        echo "zypper"
    else
        echo "unknown"
    fi
}

PM=$(detect_package_manager)

if ! command -v ollama &> /dev/null || ! ollama --version &> /dev/null; then
    echo "Oh noes ! Ollama is not installed or not functioning properly, but we'll fix it !"
    echo "Installing Ollama for you... :-P"

    if ! command -v curl &> /dev/null; then
        echo "curl is not installed. Installing curl using $PM... :-P"
        case "$PM" in
            apt)
                sudo apt update && sudo apt install -y curl
                ;;
            dnf)
                sudo dnf install -y curl
                ;;
            yum)
                sudo yum install -y curl
                ;;
            pacman)
                sudo pacman -Sy --noconfirm curl
                ;;
            zypper)
                sudo zypper install -y curl
                ;;
            *)
                echo "Oh noes, it seems like you're running this installer in an unsupported environment ! Please manually install curl to proceed or wait for official support for this environment !"
                exit 1
                ;;
        esac
    fi

    curl -fsSL https://ollama.com/install.sh | sh

    echo "Ollama installed successfully ! Please restart the terminal if needed, or your system may not detect Ollama !"

 exit 0

 echo "Ollama is already installed and working !"
fi


sleep 0.25

echo "Choose a model to install:"
echo
echo "Format: Name (Size, Parameter)"
echo
echo "1) Phi 4 (9.1 GB, 14B)"
echo "2) Gemma 3 (815 MB, 1B)"
echo "3) Codellama (3.8 GB, 7B)"
echo "4) llama2-uncensored (3.8 GB, 7B)"
echo "5) Phi4-mini (2.5 GB, 3.8B)"
echo "6) GPT-oss (14 GB, 20B)"
echo "7) I'm unsure..."
echo "8) I wanna name my own model !"
echo

read -p "Enter the number of the model you want to install [1-7]: " choice

case $choice in
    1)
        model="phi4"
        ;;
    2)
        model="gemma3:1b"
        ;;
    3)
        model="codellama"
        ;;
    4)
        model="llama2-uncensored"
        ;;
    5)
        model="phi4-mini"
        ;;
    6)
        model="gpt-oss"
        ;;
    7)
        echo "Hi! I'll help you out for this!"
echo
        echo "1. Are you just chilling on your laptop, or any other personal device ? You should use Phi 4 Mini or Gemma 3! Phi 4 Mini requires a slightly better device in terms of performance, while Gemma 3 is your go-to for average use !"
echo
        echo "2. Maybe you have a beefy computer or device ? Something dedicated for pure performance?  Possibly something you built and knew what you did with? Phi 4 is your go !"
echo
        echo "3. Maybe you have a server ? Multiple Graphics Processing Units ? Amounts of RAM you didn't know existed? Phi 4 is pretty good, but you're probably gonna be liking Codellama or GPT-oss for this !"
echo
        echo "We will add more models later, as for now this is just a test and is WIP ! So don't feel down if your prefered model is not on here, there are probably tons of tutorials showing you how to install your prefered model !"
echo
        echo "You don't have to worry about installing Ollama, this script likely already did that for you !"
echo
exit 0
        ;;
    8)
        echo "Check out https://ollama.com/library for models !"
        read -p "What's the model name you wanna use?: " CustomModel
        model="$CustomModel"
        ;;
    *)
        echo "Pick something that's listed, silly !"
        exit 1
        ;;
esac

echo "You selected: $model"
echo "Starting Ollama... :-P"
ollama serve
echo "Pulling model from Ollama, this may take some time... :-P"
#ollama pull "$model"
if ! ollama pull "$model"; then
echo "Uh oh, we failed to pull your model, named $model !"
echo "This could be an error related to Internet Connection, or to the model name listed !"
echo "We're exiting the script for you to prevent running or generating invalid code !"
exit 1
fi

cat <<EOF > $HOME/AI.sh
#!/bin/bash
# This script was generated by Malkon's local AI installer script !
# Licensed under GPL v3
# Feel free to modify the script to your needs !
ollama run $model # CRITICAL LINE !!! Do not remove unless you know what you are doing >:O
EOF

chmod +x ~/AI.sh
echo "Created AI.sh in the home directory (~/AI.sh) and made it executable successfully !"

while true; do
echo "Which shell do you want the alias installed in? "
echo "1) Bash"
echo "2) Zsh"
echo "3) Fish"
echo "4) Skip"
read -p "Enter the number: " shell_choice
case "$shell_choice" in
    1) grep -qxF 'alias AI="$HOME/AI.sh"' ~/.bashrc || echo 'alias AI="$HOME/AI.sh"' >> ~/.bashrc
    echo "Please restart your terminal after script has finished running to make the alias properly work !"
    break
    ;;
    2) grep -qxF 'alias AI="$HOME/AI.sh"' ~/.zshrc || echo 'alias AI="$HOME/AI.sh"' >> ~/.zshrc
    echo "Please restart your terminal after script has finished running to make the alias properly work !"
    break
    ;;
    3)
mkdir -p ~/.config/fish
touch ~/.config/fish/config.fish
grep -q "function AI" ~/.config/fish/config.fish || cat <<EOF >> ~/.config/fish/config.fish
function AI
~/AI.sh
end
EOF
echo "Please restart your terminal after script has finished running to make the alias properly work !"
    break
    ;;
    4) echo "Skipping alias creation..."
    break
    ;;
    *) echo "Enter a listed option, please !"
    ;;
esac

done

echo "Done! You can now run your AI by typing: ~/AI.sh"


read -p "Do you want to launch the AI now ? [y/n]: " choice2

case "${choice2,,}" in
     y|yes)
        ~/AI.sh
        ;;

     n|no)
       exit 0
       ;;
     *)
       echo "Oh well... we didn't quite get that !"
       echo "If you want to launch it, type '~/AI.sh' !"
esac
