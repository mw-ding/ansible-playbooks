[spark-cluster]
${spark-inst-ips}

[kafka-cluster]
${kafka-inst-ips}

[all:vars]
ansible_ssh_private_key_file = ${key_path}
ansible_ssh_user = ubuntu