importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-messaging-compat.js");

// Те же значения, что в lib/firebase_options.dart (web) — проект okurmen-591a4.
firebase.initializeApp({
  apiKey: "AIzaSyCCET47uZdMMnq9ZISWwilrX9KVW3vk_Q4",
  authDomain: "okurmen-591a4.firebaseapp.com",
  projectId: "okurmen-591a4",
  storageBucket: "okurmen-591a4.firebasestorage.app",
  messagingSenderId: "17052306800",
  appId: "1:17052306800:web:e74d7ce131a060a6dd53b5",
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((message) => {
  console.log("Background message: ", message);
});
