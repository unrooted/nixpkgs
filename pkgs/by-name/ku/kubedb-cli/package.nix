{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubedb-cli";
  version = "0.49.0";

  src = fetchFromGitHub {
    owner = "kubedb";
    repo = "cli";
    rev = "v${version}";
    sha256 = "sha256-7/WSc3PeeFX05xwvtwpN3sjy91gUnnC8cTeYxJOsqoM=";
  };

  vendorHash = null;

  # Don't compile the documentation stuff
  subPackages = [ "cmd/kubectl-dba" ];

  meta = with lib; {
    description = "kubectl plugin for KubeDB by AppsCode";
    homepage    = "https://github.com/kubedb/cli";
    license     = licenses.unfree;
    maintainers = [ maintainers.starcraft66 ];
  };
}
