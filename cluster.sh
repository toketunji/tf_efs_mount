  # Create a cluster in AWS that has HA masters.  This cluster
  # will be setup with an internal networking in a private VPC.
  # A bastion instance will be setup to provide instance access.
  
  export NODE_SIZE=${NODE_SIZE:-t2.medium}
  export MASTER_SIZE=${MASTER_SIZE:-t2.medium}
  export ZONES=${ZONES:-"eu-west-1a"}
  export KOPS_STATE_STORE="s3://kube007-clusters"
  export KOPS_FEATURE_FLAGS=AlphaAllowGCE
  
  kops create cluster \
  --node-count 2 \
  --name kubernetes.cluster.example.com \
  --zones $ZONES \
  --node-size $NODE_SIZE \
  --master-size $MASTER_SIZE \
  --master-zones $ZONES \
  --networking weave \
  --topology private \
  --bastion="true" \
  --yes
  --state=s3://kube007-clusters \
  --image ubuntu-os-cloud/ubuntu-1604-xenial-v20170202 \

