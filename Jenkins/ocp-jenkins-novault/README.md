# ocp-jenkins-novault

## Overview

Ansible playbook for deploying Jenkins on Openshift and its template 

## Prerequisites

- Ansible
- Python module
  - openshift
  - kubernetes
- Ansible Collection
  - kubernetes.core
  - community.okd

## Getting Started

Image source can reference from [Openshift-Jenkins](https://github.com/openshift/jenkins)

If you want deploy jenkins with offline environment, you need to clone image to your own image registry first.

Community Jenkins images

- quay.io/openshift/origin-jenkins
- quay.io/openshift/origin-jenkins-agent-base
- quay.io/openshift/origin-jenkins-agent-nodejs
- quay.io/openshift/origin-jenkins-agent-maven

### Deploy Jenkins with playbook

#### Clone git repo

git clone repo

```
git clone https://github.com/MilkLiver/ansible-playbook-sample.git
```

enter directory

```
cd ansible-playbook-sample/Jenkins/ocp-jenkins-novault
```

#### Configure Jenkins settings

edit  [jenkins-parameters.env](parameter-files\jenkins-parameters.env) 

```
vi parameter-files/jenkins-parameters.env
```

Jenkins configuration

```
JENKINS_SERVICE_NAME=<Name> --> Jenkins Service Name
JENKINS_IMAGE=<Jenkins Image Url>
AGENT_BASE_IMAGE=<Jenkins Agent Image Url>
JAVA_BUILDER_IMAGE=<Jenkins Java Builder Image Url>
NODEJS_BUILDER_IMAGE=<Jenkins Nodejs Image Url>
VOLUME_CAPACITY=<PVC Claim Size>

# Optional
# If you need to specify a specific PV, you need set its storage class name
JENKINS_PV_NAME=<PV Storage Class Name>
```

Example

```
JENKINS_SERVICE_NAME=jenkins
JENKINS_IMAGE=myregistry/openshift/origin-jenkins:4.13
AGENT_BASE_IMAGE=myregistry/openshift/origin-jenkins-agent-base:4.13
JAVA_BUILDER_IMAGE=myregistry/openshift/origin-jenkins-agent-maven:4.13
NODEJS_BUILDER_IMAGE=myregistry/openshift/origin-jenkins-agent-nodejs:4.13
VOLUME_CAPACITY=1Gi
JENKINS_PV_NAME=specific-pv01
```

#### Configure OCP login settings

edit  [ocp-oauth-secret.txt](secret-files\ocp-oauth-secret.txt) 

```
vi secret-files/ocp-oauth-secret.txt
```

OCP login account

```
username: <account>
password: <password>
```

Example

```
username: user
password: pass
```

#### Configure OCP deploy settings

edit  [cluster-config.yaml](vars\cluster-config.yaml) 

```
vi vars/cluster-config.yaml
```

OCP deploy setting

```
cluster_api_url: <cluster api url>
template_namespace_target: <deploy target namespace>
```

Example

```
cluster_api_url: "https://api.ocp.olg.offline.com:6443"
template_namespace_target: "jenkins"
```

#### Deploy

execute script or command

script

```
./deployJenkins.sh
```

command

```
ansible-playbook playbook/template-jenkins.yaml
```

