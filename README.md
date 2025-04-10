# 🇲🇽 Viva Mexico - Flutter App

**Viva Mexico** est une application mobile ludique développée avec **Flutter**, qui simule une porte mexicaine. Lorsqu'on tape sur la porte, un **personnage mexicain sort** et une **musique traditionnelle se lance**. Le projet a été conçu pour l'apprentissage de Flutter, l'intégration multimédia, et le déploiement multiplateforme (iOS / Android).

---

## 📱 Capture d'écran

> *(À insérer : capture avec la porte fermée / ouverte + animation du personnage)*

---

## 🛠️ Fonctionnalités

- Ouverture/fermeture d'une porte animée
- Lecture de son (`mexico.mp3`) à l'ouverture
- Apparition animée d’un personnage
- Compatible Android & iOS
- Animation fluide via `AnimatedPositioned` + `AnimatedOpacity`
- Gestion complète de l’état via `StatefulWidget`

---

## 📦 Technologies utilisées

| Outil / Langage     | Usage                                |
|---------------------|--------------------------------------|
| Flutter             | Framework principal                  |
| Dart                | Langage de programmation             |
| audioplayers        | Plugin de lecture audio              |
| Xcode               | Compilation & test iOS               |
| Android SDK         | Compilation & test Android           |
| Visual Studio Code  | IDE principal du projet              |

---

## 🚀 Lancer le projet

### Prérequis

- Flutter SDK (3.x recommandé)
- Xcode installé (pour iOS)
- Android Studio ou émulateur Android

### Installation

```bash
git clone https://github.com/tonrepo/mexico-door-app.git
cd mexico-door-app
flutter pub get
```
### Lancer l’app
```bash
flutter run
```
L'app se lancera sur l'appareil connecté ou l'émulateur.