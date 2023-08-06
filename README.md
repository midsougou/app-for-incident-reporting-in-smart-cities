# Signalement d'Incidents - Application Mobile avec Flutter


## Description

L'application **Signalement d'Incidents** est une application mobile développée avec le SDK Flutter qui permet aux utilisateurs de signaler les problèmes qui surviennent dans leurs régions, tels que des feux de signalisation défectueux, des poubelles renversées, etc. L'application utilise l'API Google Maps pour permettre aux utilisateurs de choisir l'emplacement de l'incident sur une carte interactive.

## Fonctionnalités Principales

- Authentification : Les utilisateurs peuvent se connecter ou créer un nouveau compte pour accéder aux fonctionnalités de l'application.
- Signalement d'Incidents : Les utilisateurs peuvent signaler un incident en choisissant l'emplacement sur la carte, la sévérité de l'incident, le type d'incident, la date et en fournissant une description détaillée.
- Téléchargement d'Images : Les utilisateurs ont la possibilité de télécharger une image pour accompagner leur signalement d'incident.
- Tableaux de Bord et Reporting : Des tableaux de bord et des rapports pour l'administrateur sont disponibles pour suivre les incidents signalés et fournir des statistiques sur les types d'incidents les plus courants et leur localisation. Ils ont été développés avec ``Google Locker Studio``

## Prérequis

- Flutter SDK
- IDE (par exemple, Android Studio ou Visual Studio Code)
- Google Maps API Key (pour utiliser la carte interactive)

## Installation

1. Clonez ce dépôt sur votre machine locale.
2. Assurez-vous d'avoir le SDK Flutter installé et configuré sur votre système.
3. Configurez votre API Key Google Maps en suivant les instructions fournies par Google.
4. Ajoutez votre API Key Google Maps dans le fichier `android/app/src/main/AndroidManifest.xml` :

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="VOTRE_API_KEY_GOOGLE_MAPS" />
```
## Exécution du Projet

1. Lancez votre émulateur ou connectez votre appareil Android à l'ordinateur.
2. Ouvrez le projet dans votre IDE préféré (Android Studio ou Visual Studio Code).
3. Exécutez la commande suivante pour installer les dépendances :

````
flutter pub get
````
Ensuite, exécutez l'application avec la commande :
````
flutter run
`````
Les fichiers .dart ainsi que les widgets sont disponibles dans le dossier `lib`. L'application marche à la fois sur le web, android et IOS. Le serveur utilisé pour héberger l'application est [000webhost](https://www.000webhost.com/)

## Travaux Futurs

Pour améliorer l'application "Signalement d'Incidents" et fournir des fonctionnalités avancées, on peut envisager d'intégrer une partie d'intelligence artificielle. Par exemple, développer un modèle de computer vision capable de reconnaître automatiquement le type d'incident à partir de l'image téléchargée par l'utilisateur. Cela permettrait de remplir automatiquement le formulaire de signalement et d'améliorer la détection de la sévérité de l'incident.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
