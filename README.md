# InCyber POC - Terraform

Bref dépôt POC pour provisionner une infra Azure minimale (VNet, subnet, NSG, NIC, VM) via des modules Terraform.

Structure
- `modules/` : modules réutilisables (`network`, `vm`).
- `environments/` : instanciations des modules par environnement (`dev`, `prod`).
- `terraform/` : configuration racine (providers, backend example).

Prérequis
- Terraform installé (v1.0+ recommandé).
- Variables d'authent Azure exposées via les variables d'environnement ARM (`ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`, `ARM_SUBSCRIPTION_ID`) ou via un provider configuré.

Commandes utiles
- Formater tous les fichiers :

```powershell
Set-Location .\terraform
terraform fmt -recursive
```

- Initialiser et valider chaque dossier contenant des `.tf` :

```powershell
Get-ChildItem -Recurse -Directory |
  Where-Object { (Get-ChildItem -Path $_.FullName -Filter *.tf -File -ErrorAction SilentlyContinue).Count -gt 0 } |
  ForEach-Object {
    Push-Location $_.FullName
    terraform init -backend=false -input=false
    terraform validate
    Pop-Location
  }
```

- Plan (depuis l'environnement voulu, e.g. `environments/dev`) :

```powershell
terraform init
terraform plan -var-file="terraform.tfvars"
```

Sécurité / bonnes pratiques
- Ne committez jamais de secrets. Le fichier `terraform/environments/*/terraform.tfvars` contient actuellement un placeholder `admin_password` ; remplacez-le par une valeur sécurisée localement ou utilisez Azure Key Vault / variable d'environnement.
- Restreindre l'accès RDP : utilisez la variable `rdp_source_address_prefix` dans `modules/network` au lieu de `0.0.0.0/0` en production.
- Configurez un backend distant (Storage Account / Container) pour le state Terraform en production (ex.: `terraform/providers.tf` contient un exemple commenté).

Points à vérifier
- Compléter `terraform/providers.tf` si vous voulez activer un backend remote.
- Vérifier `admin_password` et remplacer le placeholder par un secret sécurisé avant tout déploiement.

Contact
- Pour continuer, dites si vous voulez que je configure un backend Azure, intègre Key Vault pour les secrets ou exécute un `terraform plan` ici.
