#Installing on Linux is a bit more manual. Use the following installation instructions:

#1: Clone the GitHub repo

git clone https://github.com/tfutils/tfenv.git ~/.tfenv

#2: Update $PATH 

echo ‘export PATH=”$HOME/.tfenv/bin:$PATH”‘ >> ~/.bash_profile

#3: Create a symlinks

sudo ln -s ~/.tfenv/bin/* /usr/local/bin

# https://spacelift.io/blog/terraform-version-upgrade

# tfenv use latest
# tfenv use <version>

# Them proceed to use terraform commands.