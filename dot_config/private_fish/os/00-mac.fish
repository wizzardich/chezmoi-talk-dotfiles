

# Set language

set -x LANG en_US.UTF-8

# Set golang path

set -x GOPATH /Users/vladyslav/go/

# Add GOPATH/bin to PATH

fish_add_path $GOPATH/bin

# Add brew binaries to PATH

eval (/opt/homebrew/bin/brew shellenv)

# Initialize interactive prompt if the shell is interactive

if status is-interactive

    # Initialize Starship prompt

    starship init fish | source

    # Set env vars required for GPG to be used for signing

    set -gx GPG_TTY (tty)

    # Completion

    ## Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079

    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

    ## Enable kubectl autocompletion

    kubectl completion fish | source

    ## Enable direnv

    direnv hook fish | source

    ## Add /usr/local/bin to path

    fish_add_path /usr/local/bin

    ## Enable 1password integration with gh

    source ~/.config/op/plugins.sh

    ## Enable rbenv

    test -f $(which rbenv); and rbenv init - fish | source

    ## Source abbreviations

    source ~/.config/fish/abbreviations.fish

end