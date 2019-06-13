(Note: mostly following [this tutorial](https://www.bogotobogo.com/DevOps/Terraform/Terraform-terraform-format-tf-and-interpolation-variables.php))

## Key Pair

We need to generate key pair for those created instances before deploying them.

```ssh-keygen -f terraform-demo```

## (TODO) Setup security groups

## Kick Off Clusters

`terraform plan`
`terraform apply`

This will create 2 clusters: one for Spark and the other for Kafka/Zookeeper.
Both are composed of spot instances. They should already have Java (JRE 11) installed.

Try to verify if they have been live.

`ansible spark-cluster -a "java --version"`

You should be able to see the following results
```
34.221.122.251 | CHANGED | rc=0 >>
openjdk 11.0.3 2019-04-16
OpenJDK Runtime Environment (build 11.0.3+7-Ubuntu-1ubuntu218.04.1)
OpenJDK 64-Bit Server VM (build 11.0.3+7-Ubuntu-1ubuntu218.04.1, mixed mode, sharing)

54.218.43.58 | CHANGED | rc=0 >>
openjdk 11.0.3 2019-04-16
OpenJDK Runtime Environment (build 11.0.3+7-Ubuntu-1ubuntu218.04.1)
OpenJDK 64-Bit Server VM (build 11.0.3+7-Ubuntu-1ubuntu218.04.1, mixed mode, sharing)
```

## Destory the cluster

`terraform destroy`