# Projet <i>Cloud</i>

Ce projet vise à déployer automatiquement une application complexe (<i>frontend</i>, <i>backend</i> et <i>storage</i>) séparés dans trois conteneurs Docker sur une infrastructure OpenStack via un modèle Heat.

## Commandes

```bash
# Create the stack
openstack stack create --template template.yaml cloud-project

# Update the stack
openstack stack update --template template.yaml cloud-project

# Delete the stack
openstack stack delete cloud-project
```

### Accès en débogage

* `ssh frontend@<frontend_instance_public_IP>` puis saisir le mot de passe `frontend`.
* `ssh backend@<backend_instance_public_IP>` puis saisir le mot de passe `backend`.

Pour accéder au serveur `database` qui ne dispose pas d’adresse publique, on procède par rebond depuis le serveur `backend` :

* `ssh database@<database_instance_private_IP>` puis saisir le mot de passe `database`.

Vous pouvez aussi utiliser les keypairs générées et visibles dans les sorties.

# TODO
- Mettre au propre les Docker Compose et le mettre dans le projet direct
- Ecrire une doc et un schéma