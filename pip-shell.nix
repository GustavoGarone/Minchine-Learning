let
  config = {
    allowUnfree = true;
  };
  pkgs = import <nixpkgs> {inherit config;};
in
(pkgs.buildFHSEnv {
  name = "pipzone";
  targetPkgs = pkgs: (with pkgs; [
    (python3.withPackages (python-pkgs: [
      python-pkgs.pandas
      python-pkgs.virtualenv
      python-pkgs.pip
      python-pkgs.jupyter
      python-pkgs.numpy
      python-pkgs.pytorch
    ]))
    cudaPackages.cudatoolkit
  ]);
    runScript = "./start.sh";
}).env
