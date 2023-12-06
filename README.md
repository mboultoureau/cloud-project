# Projet <i>Cloud</i>

Ce projet vise à déployer automatiquement une application complexe (<i>frontend</i>, <i>backend</i> et <i>storage</i> séparés dans trois conteneurs orchestrés par Docker Compose) sur une infrastructure OpenStack via un modèle Heat.

## Commandes

* openstack stack create --template template.yaml roland-garros
* openstack stack update --template template.yaml roland-garros
* openstack stack delete roland-garros

### Accès en débogage

* ssh `frontend@<frontend_instance_public_IP>` puis saisir le mot de passe

Pour accéder au serveur `backend` qui ne dispose pas d’adresse publique, on procède par rebond depuis le serveur ̀ frontend` :

* ssh `backend@<backend_instance_private_IP>` puis saisir le mot de passe


# TODO
- Utiliser le storage
- Mettre au propre les Docker Compose et le mettre dans le projet direct
- Ecrire une doc et un schéma