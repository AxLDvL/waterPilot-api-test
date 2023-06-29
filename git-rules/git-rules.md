- [Règles Git pour notre organisation](#règles-git-pour-notre-organisation)
  - [Branches](#branches)
  - [Règles de bonne conduite](#règles-de-bonne-conduite)
  - [Better-commit](#better-commit)
    - [installation](#installation)
    - [Mise en place](#mise-en-place)
    - [Utilisation](#utilisation)
  - [Creation d'une nouvelle branche](#creation-dune-nouvelle-branche)
    - [Assurez-vous d'être sur la branche develop :](#assurez-vous-dêtre-sur-la-branche-develop-)
    - [Créez votre nouvelle branche :](#créez-votre-nouvelle-branche-)
    - [Une fois votre développement terminé et testé, faites un commit :](#une-fois-votre-développement-terminé-et-testé-faites-un-commit-)
    - [poussez votre branche sur le repository :](#poussez-votre-branche-sur-le-repository-)
    - [Merge des branches de fonctionnalités dans `develop`](#merge-des-branches-de-fonctionnalités-dans-develop)
  - [Intégration Continue](#intégration-continue)
  - [Déploiement Continu](#déploiement-continu)




# Règles Git pour notre organisation

## Branches

Organisation du projet sur GitHub pour un groupe de 5 personnes en utilisant une branche principale, des branches de fonctionnalités .  

Gestion des branches
Pour les plugins génériques et le core, deux branches permanentes sont utilisées :

- la branche **develop** est la branche dans laquelle sont faits tous les développements.  
- la branche **main** correspondant au code dans sa version releasée. Aucun commit ne doit être fait sur cette branche. Un merge de la branche develop est fait dans cette branche au moment des releases. Aucun commit ou push ne doit être réalisé directement sur cette branche.  
- Les branches **feature** Chaque nouvelle fonctionnalité doit être développée dans une branche spécifique, nommée `<nom_du_developpeur>/feat/<description_courte_de_la_fonctionnalité>`. Une fois le développement terminé et testé, la branche de fonctionnalité est mergée dans la branche `develop` et ensuite supprimée.


![](branches_git.png)

## Règles de bonne conduite

1. Ne jamais faire un commit direct sur la branche main ou develop.
2. Toujours créer une nouvelle branche pour chaque nouvelle fonctionnalité ou correction de bug.
3. Assurez-vous que tous les tests passent avant de merger une branche de fonctionnalité dans develop.
4. Assurez-vous que develop est stable et que tous les tests passent avant de faire une release en mergant develop dans main.
5. Utilisez better-commits pour tous vos commits afin de maintenir une convention de nommage uniforme et claire.

##  Better-commit
Nous utilisons `better-commits` pour normaliser nos commits et les noms de nos branches.


### installation
[Lien vers Better-commit](https://github.com/Everduin94/better-commits)  

```bash
npm install -g better-commits
```

### Mise en place

Si le fichier de configuration 'better-commits.json' n'a pas encore été créé à la racine du repository.  
Lancer la commande:  
```
better-commits-init
```
Une fois créé, il faudra modifier le début du fichier 'better-commits.json' pour autoriser les émoji comme suit:

```json
{
    "check_status": true,
    "commit_type": {
        "enable": true,
        "initial_value": "feat",
        "infer_type_from_branch": true,
        "append_emoji_to_label": true,
        "append_emoji_to_commit": true,
```

### Utilisation

- Pour exécuter un nouveau commit, utliser la commande suivante:
```bash
better-commits
# or
npx better-commits
```

- Pour créer une nouvelle branche :
```bash
better-branch
```

## Creation d'une nouvelle branche

### Assurez-vous d'être sur la branche develop :
```
git checkout develop
```

### Créez votre nouvelle branche :
```
better-branch
```

### Une fois votre développement terminé et testé, faites un commit :
```
better-commits
```

### poussez votre branche sur le repository :
```
git push origin <nom_de_la_branche>
```

### Merge des branches de fonctionnalités dans `develop`

Une fois que le développement sur votre branche de fonctionnalité est terminé et que tous les tests passent, il est temps de merger votre branche dans `develop`.  

1. Assurez-vous d'abord d'être sur la branche `develop` : 

```bash
git checkout develop
```

1. Faites une mise à jour pour récupérer les dernières modifications :

```bash
git pull origin develop
```

1. Merger votre branche de fonctionnalité dans develop :

```bash
git merge <nom_de_votre_branche_de_fonctionnalité>
```

4. Enfin, poussez vos modifications sur le repository distant :

```bash
git push origin develop
```

## Intégration Continue

Pour chaque repository de notre organisation, nous mettons en place un pipeline d'intégration continue (CI). 

Cela permet de vérifier que chaque commit ou pull request ne brise rien dans le projet et respecte nos normes de qualité de code.

## Déploiement Continu

Le déploiement continu est une pratique qui consiste à déployer automatiquement les nouvelles versions de votre code sur un environnement spécifique après une série de tests réussis. 

Dans notre cas, nous déployons automatiquement le code sur notre serveur de développement (dev) à chaque fois qu'un changement est fusionné dans la branche `develop`.

