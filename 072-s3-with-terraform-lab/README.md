# S3 With Terraform Lab

## Create resources with CLI

```bash
$ aws iam create-group --group-name finance-analysts
```

## Create and execute terraform plan

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Clean Up!

```bash
$ terraform destroy
$ aws iam delete-group --group-name finance-analysts
```
