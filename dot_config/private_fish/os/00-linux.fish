

# Set language

set -x LANG en_US.UTF-8

# Set golang path

set -x GOPATH /home/wizzardich/go/

# Add brew binaries to PATH

set -x PATH /home/wizzardich/.local/bin:/home/wizzardich/.cargo/bin:$PATH

# Initialize interactive prompt if the shell is interactive

if status is-interactive

    # Initialize Starship prompt

    starship init fish | source

    # Set env vars required for GPG to be used for signing

    set -gx GPG_TTY (tty)

    # Export SSH agent auth socket

    set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

    # Completion

    ## Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079

    complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

    ## Enable kubectl autocompletion

    if which kubectl > /dev/null
        kubectl completion fish | source
    end

    ## Enable direnv

    if which direnv > /dev/null
        direnv hook fish | source
    end

    ## Add /usr/local/bin to path

    fish_add_path /usr/local/bin

    ## Source abbreviations

    source ~/.config/fish/abbreviations.fish
end
