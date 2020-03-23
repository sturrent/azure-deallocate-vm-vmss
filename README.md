# azure-deallocate-vm-vmss
Simple bash scritp to deallocate ALL vms and vmss from your subscription using az cli

Usage:
``` 
bash deallocate_vms_vmss.sh 
```


Example:
```
:~$ bash deallocate_vms_vmss.sh

Stopping all VMs and VMSS....

Deallocating all VMs:
Stopping jumpbox1 from AKS-PRIVATE-RG
Stopping ubuntu-datasharing1 from DATASHARING

Deallocateting all VMSS intances:
Stoping aks-agentpool1-35064155-vmss from MC_AKS-AGIC_AKS638E_EASTUS2
Stoping aks-mynodepool-78849447-vmss from MC_AKS-MULTI-RG_AKS-MULTI_EASTUS2
Stoping aks-nodepool1-78849447-vmss from MC_AKS-MULTI-RG_AKS-MULTI_EASTUS2
Stoping aks-nodepool1-15887882-vmss from MC_AKS-PRIVATE-RG_AKS-PRIVATE_EASTUS2

Done...

:~$
```