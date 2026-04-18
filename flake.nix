  # flake.nix

{
  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    import-tree.url = "github:vic/import-tree";

    disko = {
      url ="github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager?ref=release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
#    ramdots = {
#      url = "github:Leporidaube/ramdots";
#      flake = false;
#     };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {

      imports = [ (inputs.import-tree ./modules) ];
    };
}
