Deploy infrastructure for EdgeX on GCP based on requirements:

https://wiki.edgexfoundry.org/display/FA/Get+EdgeX+Foundry+-+Developers#GetEdgeXFoundry-Developers-Hardware

You will need to generate SSH keys:

```sh
$ ssh-keygen --t rsa -b 4096 -f .ssh/gcloud_id_rsa
# press <Enter> when asked (twice) for a pass-phrase
```

Then [download your credentials from Google Cloud Console](https://www.terraform.io/docs/providers/google/#credentials);
and store them as `account.json`.

Then run `terraform init`

Add external IP address in GCP

Run `terraform apply`

