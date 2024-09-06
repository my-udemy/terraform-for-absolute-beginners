# Terraform For The Absolute Beginners Workshop

## Getting Started

- Install Terraform
- Install AWS CLI

## Configure AWS Credentials

From the user root folder:

```bash
$ mkdir .aws
$ cd .aws
$ touch config
$ touch credentials
```

### The `config` file

```
[profile [mcwiise.cap@gmail.com](mailto:mcwiise.cap@gmail.com)]
region = us-east-1

[profile [german.vargas@episource.com](mailto:german.vargas@episource.com)]
region = us-east-2
```

### The `credentials` file

```
[mcwiise.cap@gmail.com]
aws_access_key_id = YOUR_AWS_ACCESS_KEY_FROM_CONSOLE
aws_secret_access_key = YOUR_AWS_SECRET_KEY_FROM_CONSOLE
```

### Set Up Default Profiles

```
$ aws configure list-profiles
$ export AWS_DEFAULT_PROFILE=mcwiise.cap@gmail.com
```
