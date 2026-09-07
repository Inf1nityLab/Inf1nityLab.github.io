importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyAMGl2cKgD5mMMjM-uUi3T1wKTtQOTb1QM",
  authDomain: "okurmen-it.firebaseapp.com",
  projectId: "okurmen-it",
  storageBucket: "okurmen-it.firebasestorage.app",
  messagingSenderId: "772494798851",
  appId: "1:772494798851:web:dea2cc356e13da168b5e36",
  measurementId: "G-2MYQ48GLK9"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((message) => {
  console.log("Background message: ", message);
});
