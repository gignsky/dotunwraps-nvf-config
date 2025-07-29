# .unwrap's nvf config

This is a WIP [nvf](https://github.com/notashelf/nvf) configuration.

nvf is a framework for structuring your Neovim configuration using Nix.

## Home Manager Module Support

Steps to Implement:

1. Add this repository as a flake input:
 ```
 {
inputs = {
  nvf-config.url = "github:dotunwrap/nvf-config";  # or path to your gigvim repo
  # ... other inputs
};
```

2. In your home-manager configuration:
```
home-manager.users.yourusername = {
  imports = [
    nvf-config.homeManagerModules.default
    # or: nvfconfig.homeManagerModules.unwrap-vim
  ];

  programs.unwrap-vim.enable = true;
};
```
