# Remote Backeds - Lab

## Create manual resources

```bash
# create terraform state bucket
$ aws s3api create-bucket --bucket gvv-tfstate --region us-east-1
# create terraform lock table
$ aws dynamodb create-table \
    --table-name gvv-tfstate-locks \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --region us-east-1
```

## Create and execute terraform plan

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Clean Up!

```bash
$ aws s3api delete-bucket --bucket gvv-tfstate
$ aws dynamodb delete-table --table-name gvv-tfstate-lock
$ terraform destroy
```
