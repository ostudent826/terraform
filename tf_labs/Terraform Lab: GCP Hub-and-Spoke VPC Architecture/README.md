# 🛠️ Terraform Lab: GCP Hub-and-Spoke VPC Architecture

This project sets up a **hub-and-spoke network topology** in Google Cloud using **Terraform** to manage infrastructure as code. It's designed as a hands-on learning lab to practice:

- VPC creation
- Subnetting
- VM provisioning
- VPC Network Peering
- Firewall rules
- Inter-VM connectivity testing

---

## 📌 Topology Diagram

```
                          ┌────────────────────────┐
                          │        HUB VPC         │
                          │ (vpc-hub, region: X)   │
                          └────────┬───────────────┘
                                   │
                      ┌────────────┴────────────┐
                      │                         │
              ┌───────▼───────┐         ┌───────▼───────┐
              │   SPOKE1 VPC  │         │   SPOKE2 VPC  │
              │ (vpc-spoke-1) │         │ (vpc-spoke-2) │
              └───────┬───────┘         └───────┬───────┘
                      │                         │
          ┌───────────▼──────────┐   ┌──────────▼──────────┐
          │ Subnet: subnet-s1    │   │ Subnet: subnet-s2    │
          │ Region: X            │   │ Region: X            │
          └──────────┬───────────┘   └──────────┬───────────┘
                     │                          │
          ┌──────────▼─────────┐     ┌──────────▼─────────┐
          │ VM: vm-spoke1      │     │ VM: vm-spoke2      │
          └────────────────────┘     └────────────────────┘
```

---

## 🧪 Lab Goals

- Build and understand hub-and-spoke VPC architecture in GCP
- Use Terraform to fully manage infrastructure setup
- Test inter-VM communication using GCP network peering
- Learn and configure firewall and routing behavior

---

## 📋 Lab Requirements

### 1. Projects
- One GCP project (or use multiple for cross-project peering testing)

### 2. VPC Networks
- `vpc-hub`: the central VPC
- `vpc-spoke-1`: with a single subnet and VM
- `vpc-spoke-2`: with a single subnet and VM

### 3. Subnets
- `subnet-s1`: for `vpc-spoke-1`
- `subnet-s2`: for `vpc-spoke-2`

### 4. VMs
- `vm-spoke1`: deployed in `subnet-s1`
- `vm-spoke2`: deployed in `subnet-s2`

### 5. Network Peering
- Peering between `vpc-hub` ↔ `vpc-spoke-1`
- Peering between `vpc-hub` ↔ `vpc-spoke-2`

### 6. Firewall Rules
- Allow internal traffic (ICMP, SSH, etc.) across subnets
- Configure to allow testing between VMs

### 7. Routing
- No overlapping CIDR ranges
- Ensure routes allow spokes to communicate via hub

---

## ✅ Testing Plan

- SSH into `vm-spoke1` and test ping to:
  - `vm-spoke2` (should fail initially, then succeed after routing/firewall setup)
  - `vm-hub` (if no VM is there, ping fails as expected)
- Observe routing behavior via `traceroute`
- Test connectivity restrictions by removing firewall rules

---

## 🚀 Next Steps

Start building this project manually using Terraform modules:
- Create a `main.tf`, `variables.tf`, and `outputs.tf` per environment
- Separate VPCs into modules if needed
- Use `terraform apply` per stage and test connectivity

---

## 📁 Repo Structure Recommendation

```
terraform-hub-spoke/
├── modules/
│   ├── vpc/
│   └── vm/
├── hub/
│   ├── main.tf
│   └── variables.tf
├── spoke-1/
│   ├── main.tf
│   └── variables.tf
├── spoke-2/
│   ├── main.tf
│   └── variables.tf
├── network-peering/
│   └── main.tf
├── firewall/
│   └── main.tf
└── README.md
```

---

## 🌐 GCP Docs for Reference

- [VPC Network Peering](https://cloud.google.com/vpc/docs/vpc-peering)
- [Compute Engine VM Instances](https://cloud.google.com/compute/docs/instances)
- [Firewall Rules](https://cloud.google.com/vpc/docs/firewalls)
- [Terraform GCP Provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
