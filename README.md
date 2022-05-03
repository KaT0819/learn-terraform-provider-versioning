# Learn Terraform Provider Versioning

This repo is a companion repo to the [Lock and Upgrade Provider Versions Learn guide](https://learn.hashicorp.com/tutorials/terraform/provider-versioning), containing Terraform configuration files to provision a S3 bucket.


# バージョンのロックとアップグレード

versions.tf に記載することでバージョンをロック出来る。


```
# 初期化
terraform init
# デプロイ
terraform apply
```

※チュートリアルにあるソースそのままではapplyで403エラー発生
acl    = "public-read"がついているとなるよう。"private"ならapplyが通る。

IAMにAdmin権限を付与してもエラーなので権限という、より何かパラメータの追加設定が必要になった可能性あり。

## アップグレード
```
terraform init -upgrade
```

アップグレード前のバージョンは、"2.50.0"
アップグレード後のバージョンは、"4.12.1"

最新バージョンでは、aclが非推奨になっているため、applyでwarningが発生する。
```
 Warning: Argument is deprecated
│
│   with aws_s3_bucket.sample,
│   on main.tf line 17, in resource "aws_s3_bucket" "sample":
│   17:   acl = "private"
│
│ Use the aws_s3_bucket_acl resource instead
```
