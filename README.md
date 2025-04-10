# 🇲🇽 Viva Mexico - Flutter App

**Viva Mexico** est une application mobile ludique développée avec **Flutter**, qui simule une porte mexicaine. Lorsqu'on tape sur la porte, un **personnage mexicain sort** et une **musique traditionnelle se lance**. Le projet a été conçu pour l'apprentissage de Flutter, l'intégration multimédia, et le déploiement multiplateforme (iOS / Android).

---

## 📱 Capture d'écran
<p float="left">
  <img src="https://github.com/user-attachments/assets/e863e953-de79-4cbf-8251-05540746a5de" width="150" />
  <img src="https://github.com/user-attachments/assets/d344c561-9071-4a46-8335-a0bf599d4d9a" width="150" />
  <img src="https://github.com/user-attachments/assets/46128f06-acc0-4d8c-be72-c90fa78f3de8" width="150" />
</p>
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
