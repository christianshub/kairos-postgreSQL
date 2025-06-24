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

To access postgresql db do (from your local machine):

```bash
docker run -it --rm postgres:17 psql -h 192.168.0.117 -p 15432 -U kairos -d postgres
# Password for user kairos: kairos
```

## ⚠️ Important Notes

* After the VMs has been created its often possible to make the IP static through your routers network settings 