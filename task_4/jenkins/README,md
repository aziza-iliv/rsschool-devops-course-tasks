# Task 4 – Jenkins Deployment on Minikube with Helm

## 📌 Objective

This task demonstrates how to install and configure Jenkins on a local Kubernetes cluster using Minikube and Helm. Configuration includes persistent volumes, Helm charts, and Jenkins Configuration as Code (JCasC).

---

## ✅ Prerequisites

- Helm installed and verified
- Minikube cluster running
- kubectl configured and working
- Jenkins installed using Helm

---

## 🚀 Steps Performed

### 1. Helm Installation and Verification ✅

Helm was installed via Homebrew:

brew install helm

2. Minikube and Cluster Setup ✅
Minikube cluster started with Docker driver:

minikube start --driver=docker
StorageClass verified:

kubectl get storageclass
PVC support is available via standard class.

3. Jenkins Installation via Helm ✅
Jenkins installed into a dedicated namespace:

kubectl create namespace jenkins
helm repo add jenkins https://charts.jenkins.io
helm install jenkins jenkins/jenkins -n jenkins -f jenkins/values.yaml
Login credentials were set using adminUser in the Helm values file.

4. Jenkins Web UI Access ✅
Port-forwarded to access Jenkins locally:

kubectl port-forward -n jenkins svc/jenkins 8080:8080
Accessed via: http://localhost:8080

Login: admin
Password: admin (as defined in values.yaml)

5. JCasC: Auto-create Job ✅
Job hello-world created via JCasC in values.yaml:

JCasC:
  configScripts:
    hello-job: |
      jobs:
        - script: >
            job('hello-world') {
              description('Created via JCasC')
              steps {
                shell('echo "Hello world from JCasC"')
              }
            }
This job is created automatically upon Helm install.

6. Jenkins Job Verification ✅
A freestyle project was successfully created and ran with output:

Hello world
Finished: SUCCESS

Started by user Jenkins Admin
Running as SYSTEM
Agent default-v7r89 is provisioned from template default
---
apiVersion: "v1"
kind: "Pod"
metadata:
  annotations:
    kubernetes.jenkins.io/last-refresh: "1751633759971"
  labels:
    jenkins/jenkins-jenkins-agent: "true"
    jenkins/label-digest: "500b4f18aee87616849e4f4c2435020898e34aa0"
    jenkins/label: "jenkins-jenkins-agent"
    kubernetes.jenkins.io/controller: "http___jenkins_jenkins_svc_cluster_local_8080x"
  name: "default-v7r89"
  namespace: "jenkins"
spec:
  containers:
  - args:
    - "********"
    - "default-v7r89"
    env:
    - name: "JENKINS_SECRET"
      value: "********"
    - name: "JENKINS_TUNNEL"
      value: "jenkins-agent.jenkins.svc.cluster.local:50000"
    - name: "JENKINS_AGENT_NAME"
      value: "default-v7r89"
    - name: "REMOTING_OPTS"
      value: "-noReconnectAfter 1d"
    - name: "JENKINS_NAME"
      value: "default-v7r89"
    - name: "JENKINS_AGENT_WORKDIR"
      value: "/home/jenkins/agent"
    - name: "JENKINS_URL"
      value: "http://jenkins.jenkins.svc.cluster.local:8080/"
    image: "jenkins/inbound-agent:3309.v27b_9314fd1a_4-7"
    imagePullPolicy: "IfNotPresent"
    name: "jnlp"
    resources:
      limits:
        memory: "512Mi"
        cpu: "512m"
      requests:
        memory: "512Mi"
        cpu: "512m"
    tty: false
    volumeMounts:
    - mountPath: "/home/jenkins/agent"
      name: "workspace-volume"
      readOnly: false
    workingDir: "/home/jenkins/agent"
  nodeSelector:
    kubernetes.io/os: "linux"
  restartPolicy: "Never"
  serviceAccountName: "default"
  volumes:
  - emptyDir:
      medium: ""
    name: "workspace-volume"

Building remotely on default-v7r89 (jenkins-jenkins-agent) in workspace /home/jenkins/agent/workspace/task4
[task4] $ /bin/sh -xe /tmp/jenkins3488639072724444450.sh
+ echo Hello World
Hello World
Finished: SUCCESS