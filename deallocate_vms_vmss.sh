#!/bin/bash

### Deallocate ALL VMs  and VMSS in the subscription

echo -e "\nStopping all VMs and VMSS...."
VM_LIST="$(az vm list | grep -v '^Name\|^---' | awk '{print $1"#"$2}')"
VMSS_LIST="$(az vmss list | grep -v '^Name\|^---' | awk '{print $1"#"$2}')"

if [ "$VM_LIST" == '' ]; then
	echo -e "\nNo VMs found...\n"
else
	echo -e "\nDeallocating all VMs:"
	for INSTANCE in $(echo "$VM_LIST")
		do 
			VM_NAME="$(echo -n "$INSTANCE" | cut -d '#' -f1)"
			RESOURCE_GROUP="$(echo -n "$INSTANCE" | cut -d '#' -f2)"
			echo -e "Stopping $VM_NAME from $RESOURCE_GROUP"
			az vm deallocate -n $VM_NAME -g $RESOURCE_GROUP --no-wait
	done
fi

if [ "$VM_LIST" == '' ]; then
	echo -e "\nNo VMSS found...\n"
else
	echo -e "\nDeallocateting all VMSS intances:"
	for INSTANCE in $(echo "$VMSS_LIST")
		do
			VMSS_NAME="$(echo -n "$INSTANCE" | cut -d '#' -f1)"
			RESOURCE_GROUP="$(echo -n "$INSTANCE" | cut -d '#' -f2)"
			echo -e "Stoping $VMSS_NAME from $RESOURCE_GROUP"
			az vmss deallocate -n $VMSS_NAME -g $RESOURCE_GROUP --instance-ids "*" --no-wait
	done
fi

echo -e "\nDone...\n"

exit 0