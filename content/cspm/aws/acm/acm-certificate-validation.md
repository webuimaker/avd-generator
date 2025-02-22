---
title: ACM-Certificate-Validation
draft: false

display_title: ACM Certificate Validation
avd_page_type: cloudsploit_page

breadcrumb_remediation_parent: aws
breadcrumb_remediation_parent_name: AWS
breadcrumb_remediation_child: acm
breadcrumb_remediation_child_name: ACM
---
### Quick Info

| | |
|-|-|
| **Plugin Title** | ACM Certificate Validation |
| **Cloud** | AWS |
| **Category** | ACM |
| **Description** | ACM certificates should be configured to use DNS validation. |
| **More Info** | With DNS validation, ACM will automatically renew certificates before they expire, as long as the DNS CNAME record is in place. |
| **AWS Link** | https://aws.amazon.com/blogs/security/easier-certificate-validation-using-dns-with-aws-certificate-manager/ |
| **Recommended Action** | Configure ACM managed certificates to use DNS validation. |

## Detailed Remediation Steps

1. Log into the AWS console and navigate to the ACM service page.\
![](/path/to/some/image.png)
2. Click into each certificate that has been requested. \
![](/path/to/some/image.png)
3. Expand the domains associated with the certificate.
4. Ensure each domain listed has DNS validation configured. If DNS validation is used, DNS records will be listed for the domain.
5. Ensure that the records provided by AWS are configured and valid within your DNS provider (such as Route 53).
6. If DNS validation is not used, request a new certificate for the same domains using DNS validation and update the downstream services to use this new certificate. Once done, delete the old certificate to ensure it can no longer be used.