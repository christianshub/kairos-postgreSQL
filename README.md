# HA Proxy setup

## VM provision through Terraform

```bash
cd terraform-provision-postgresql
terraform init -upgrade
terraform apply -parallelism=1 -lock=false
```

## HA Proxy config

```bash
cd ansible-config-postgresql
ansible-playbook -i inventory.ini playbooks/postgresql.yaml
```

## Access

To access postgresql db do:

```bash
docker run -it --rm postgres:17 psql -h 192.168.0.117 -p 15432 -U kairos -d postgres
# Password for user kairos: kairos
```
