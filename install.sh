# Setup Terminal

# Install Nix
sh <(curl -L https://nixos.org/nix/install)
# Source Nix
. ~/.nix-profile/etc/profile.d/nix.sh
# Install zsh
nix-env -iA nixpkgs.zsh
# Install curl
nix-env -iA nixpkgs.curl
# Install wget
nix-env -iA nixpkgs.wget
# install git
nix-env -iA nixpkgs.git
# Install vim
nix-env -iA nixpkgs.vim
# Install tmux
nix-env -iA nixpkgs.tmux

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Change shell to zsh
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s "$(command -v zsh)" "${USER}"

# Install powerlevel10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Install Antigen
curl -L git.io/antigen > antigen.zsh
# Install zsh syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
# Install zsh autosuggestions
antigen bundle zsh-users/zsh-autosuggestions

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0

# Install rust latest globally
asdf plugin add rust https://github.com/asdf-community/asdf-rust.git
asdf install rust latest
asdf global rust latest
# Install nodejs globally
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
asdf global nodejs lts
# Install python globally
asdf plugin add python
asdf install python 3.10.5
asdf global python 3.10.5

# Install lsd
cargo install lsd