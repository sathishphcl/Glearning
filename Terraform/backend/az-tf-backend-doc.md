

tfenv
tfenv 3.0.0-49-g39d8c27
Usage: tfenv <command> [<options>]

Commands:
   install       Install a specific version of Terraform
   use           Switch a version to use
   uninstall     Uninstall a specific version of Terraform
   list          List all installed versions
   list-remote   List all installable versions
   version-name  Print current version
   init          Update environment to use tfenv correctly.
   pin           Write the current active version to ./.terraform-version


root@Sathish-Wrk-PC:/mnt/c/Data-Disk/DevOps Training/Glearning/Terraform/backend# tfenv use
Switching default version to v1.9.7
Default version (when not overridden by .terraform-version or TFENV_TERRAFORM_VERSION) is now: 1.9.7

terraform init -reconfigure -backend-config=backend.tfvars
