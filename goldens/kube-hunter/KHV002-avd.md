---
avd_page_type: kube-hunter_page

title: KHV002
description: Kubernetes version disclosure
types: [Information Disclosure]
---



## Issue description

The fact that your infrastructure is using Kubernetes, and the specific version of Kubernetes used is publicly available, and could be used by an attacker to target your environment with known vulnerabilities in the specific version of Kubernetes you are using.
This information could have been obtained from the Kubernetes API `/version` endpoint, or from the Kubelet's `/metrics` debug endpoint.

## Remediation

Disable `--enable-debugging-handlers` kubelet flag.

## References

- [kubelet server code](https://github.com/kubernetes/kubernetes/blob/4a6935b31fcc4d1498c977d90387e02b6b93288f/pkg/kubelet/server/server.go)
- [Kubelet - options](https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/#options)