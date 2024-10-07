Terraform Beginner’s Guide: Everything You Should Know

Are you a beginner and planning to learn Terraform? Do you want to know all the basic fundamental concepts of Terraform and how it works before you go diving deep, then this terraform tutorial blog post is for you!

In this blog post, I am going to cover a brief introduction of Infrastructure as Code (IaC), Terraform, its lifecycle, and all the core concepts that every beginner should know. I have tried to cover all the topics in this beginner’s guide that will give you a quick start for using Terraform.

What Is Infrastructure as Code (IaC)?
Infrastructure as Code (IaC) is a widespread terminology among DevOps professionals and a key DevOps practice in the industry. It is the process of managing and provisioning the complete IT infrastructure (comprises both physical and virtual machines) using machine-readable definition files. It helps in automating the complete data center by using programming scripts.

![alt text](image.png)

Popular IaC Tools:
1. Terraform An open-source declarative tool that offers pre-written modules to build and manage an infrastructure.
2. Chef: A configuration management tool that uses cookbooks and recipes to deploy the desired environment. Best used for Deploying and configuring applications using a pull-based approach.
3. Puppet: Popular tool for configuration management that follows a Client-Server Model. Puppet needs agents to be deployed on the target machines before the puppet can start managing them.
4. Ansible: Ansible is used for building infrastructure as well as deploying and configuring applications on top of them. Best used for Ad hoc analysis.
5. Packer: Unique tool that generates VM images (not running VMs) based on steps you provide. Best used for Baking compute images.
6. Vagrant: Builds VMs using a workflow. Best used for Creating pre-configured developer VMs within VirtualBox.

What Is Terraform?
Terraform is one of the most popular Infrastructure-as-code (IaC) tool, used by DevOps teams to automate infrastructure tasks. It is used to automate the provisioning of your cloud resources. Terraform is an open-source, cloud-agnostic provisioning tool developed by HashiCorp and written in GO language.

Benefits of using Terraform:

Does orchestration, not just configuration management
Supports multiple providers such as AWS, Azure, Oracle, GCP, and many more
Provide immutable infrastructure where configuration changes smoothly
Uses easy to understand language, HCL (HashiCorp configuration language)
Easily portable to any other provider

Terraform Lifecycle
Terraform lifecycle consists of – init, plan, apply, and destroy.

![alt text](image-1.png)

1. Terraform init initializes the (local) Terraform environment. Usually executed only once per session.
2. Terraform plan compares the Terraform state with the as-is state in the cloud, build and display an
execution plan. This does not change the deployment (read-only).
3. Terraform apply executes the plan. This potentially changes the deployment.
4. Terraform destroy deletes all resources that are governed by this specific terraform environment.

Terraform Core Concepts
1. Variables: Terraform has input and output variables, it is a key-value pair. Input variables are used as parameters to input values at run time to customize our deployments. Output variables are return values of a terraform module that can be used by other configurations.

2. Provider: Terraform users provision their infrastructure on the major cloud providers such as AWS, Azure, OCI, and others. A provider is a plugin that interacts with the various APIs required to create, update, and delete various resources.

3. Module: Any set of Terraform configuration files in a folder is a module. Every Terraform configuration has at least one module, known as its root module.

4. State: Terraform records information about what infrastructure is created in a Terraform state file. With the state file, Terraform is able to find the resources it created previously, supposed to manage and update them accordingly.

5. Resources: Cloud Providers provides various services in their offerings, they are referenced as Resources in Terraform. Terraform resources can be anything from compute instances, virtual networks to higher-level components such as DNS records. Each resource has its own attributes to define that resource.

6. Data Source: Data source performs a read-only operation. It allows data to be fetched or computed from resources/entities that are not defined or managed by Terraform or the current Terraform configuration.

7. Plan: It is one of the stages in the Terraform lifecycle where it determines what needs to be created, updated, or destroyed to move from the real/current state of the infrastructure to the desired state.

8. Apply: It is one of the stages in the Terraform lifecycle where it applies the changes real/current state of the infrastructure in order to achieve the desired state.

Terraform Installation
Before you start working, make sure you have Terraform installed on your machine, it can be installed on any OS, say Windows, macOS, Linux, or others. Terraform installation is an easy process and can be done in a few minutes.

Read our blog to know how to install Terraform in Linux, Mac, Windows

![alt text](image-2.png)

We cover the step-by-step Terraform installation in all these ways in our Terraform training. Check out our blog for all the Hands-on Labs that we cover in our training HashiCorp Certified Terraform Associate-Step By Step Activity Guides.

Terraform Providers
A provider is responsible for understanding API interactions and exposing resources. It is an executable plug-in that contains code necessary to interact with the API of the service. Terraform configurations must declare which providers they require so that Terraform can install and use them.

![alt text](image-14.png)

Terraform has over a hundred providers for different technologies, and each provider then gives terraform user access to its resources. So through AWS provider, for example, you have access to hundreds of AWS resources like EC2 instances, the AWS users, etc.

Terraform Configuration Files
Configuration files are a set of files used to describe infrastructure in Terraform and have the file extensions .tf and .tf.json. Terraform uses a declarative model for defining infrastructure. Configuration files let you write a configuration that declares your desired state. Configuration files are made up of resources with settings and values representing the desired state of your infrastructure.

![alt text](image-6.png)

A Terraform configuration is made up of one or more files in a directory, provider binaries, plan files, and state files once Terraform has run the configuration.

1. Configuration file (*.tf files): Here we declare the provider and resources to be deployed along with the type of resource and all resources specific settings

2. Variable declaration file (variables.tf or variables.tf.json): Here we declare the input variables required to provision resources

3. Variable definition files (terraform.tfvars): Here we assign values to the input variables

4. State file (terraform.tfstate): a state file is created once after Terraform is run. It stores state about our managed infrastructure.

Getting started using Terraform
To get started building infrastructure resources using Terraform, there are few things that you should take care of. The general steps to deploy a resource(s) in the cloud are:

Set up a Cloud Account on any cloud provider (AWS, Azure, OCI)
Install Terraform
Add a provider – AWS, Azure, OCI, GCP, or others
Write configuration files
Initialize Terraform Providers
PLAN (DRY RUN) using terraform plan
APPLY (Create a Resource) using terraform apply
DESTROY (Delete a Resource) using terraform destroy

Import Existing Infrastructure
Terraform is one of the great IaC tools with which, you can deploy all your infrastructure’s resources. In addition to that, you can manage infrastructures from different cloud providers, such as AWS, Google Cloud, etc. But what if you have already created your infrastructure manually?

Terraform has a really nice feature for importing existing resources, which makes the migration of existing infrastructure into Terraform a lot easier.

![alt text](image-7.png)

Currently, Terraform can only import resources into the state. It does not generate a configuration for them. Because of this, prior to running terraform import it is necessary to write manually a resource configuration block for the resource, to which the imported object will be mapped. For example:

resource "aws_instance" "import_example" { 
  # ...instance configuration... 
}
Now terraform import can be run to attach an existing instance to this resource configuration:

$ terraform import aws_instance.import_example i-03efafa258104165f

This command locates the AWS instance with ID i-03efafa258104165f (which has been created outside Terraform) and attaches it to the name aws_instance.import_example in the Terraform state.

Other Blocks that you should be aware of in Terraform:

![alt text](image-8.png)

Image Source : https://www.devopsschool.com/blog/terraform-tutorials-list-of-terraform-blocks-with-explanation/

The Big picture of the Terraform Workflow & Skeleton is ::

![alt text](IaC-Terraform.jpg)


Let's have a quick look at the Terraform Settings block:

![alt text](image-9.png)

Terraform Settings Block
Terraform settings block is used to configure behavior of your Terraform manifests. Each terraform block can have a variety of Terraform-related settings. Only constant values may be used within a Terraform block; arguments may not relate to named objects such as resources, input variables, and so on, nor may they use any of the Terraform language’s built-in functions. Terraform Settings block include Terraform version, list of required providers and Terraform backend. 

Terraform Version
The required version variable allows for the addition of a version constraint string, which outlines which versions of Terraform are compatible with your setup and must be utilized.

If the version of Terraform that is running does not conform to the requirements that have been stated, Terraform will generate an error and then leave without carrying out any more operations.

Terraform Provider
In order for Terraform to be able to successfully install and make use of the various providers, each Terraform module is required to indicate which providers are necessary. The required providers block is where the requirements for the providers are defined.

A local name, a source location, and a version constraint are the three components that make up a provider requirement.

Terraform Backend
The location of the state data files that Terraform uses is specified by a backend.

Terraform makes use of data that is persisted in the state it is now in in order to maintain a record of the resources it maintains. The vast majority of non-trivial Terraform setups either interact with Terraform Cloud or make use of a backend in order to save state in a distant location. Because of this, multiple users are able to access the data that the state maintains and collaborate on the gathering of infrastructure resources.

Providers Block
Provider Block is the heart of the Terraform. Here, we define the rules that interact with the remote system(basically, cloud provider). Provider configurations reside in the root module of terraform. The configuration residing in the Terraform provider block differs according to the provider. For example, Google provider block is very different from AWS. 

![alt text](image-10.png)

Terraform Lifecycle:

![alt text](image-11.png)

And the Terraform Destroy:

![alt text](image-12.png)
