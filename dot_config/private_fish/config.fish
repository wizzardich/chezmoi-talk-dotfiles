set -x fish_greeting ""

switch (uname)
    case Darwin
        source $__fish_config_dir/os/00-mac.fish
    case '*'
        source $__fish_config_dir/os/00-linux.fish
end