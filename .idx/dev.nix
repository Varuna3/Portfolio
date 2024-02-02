# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  channel = "stable-23.11"; # "stable-23.11" or "unstable"
  # Use https://search.nixos.org/packages to  find packages
  packages = [
    pkgs.nodejs_21
    pkgs.neofetch
    # pkgs.typescript
    # pkgs.python3
    # pkgs.go
  ];
  # Sets environment variables in the workspace
  env = {
    TEST = "Hello world!";
  };
  # search for the extension on https://open-vsx.org/ and use "publisher.id"
  idx.extensions = [
   "vscodevim.vim"
   "esbenp.prettier-vscode"
  ];
  # preview configuration, identical to monospace.json
  idx.previews = {
    enable = true;
    previews = [
      {
        command = [
          "npm"
          "run"
          "dev"
          "--"
          "--port"
          "$PORT"
          "--host"
          "0.0.0.0"
        ];
        manager = "web";
        id = "web";
      }
    ];
  };
}
