'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "f92ca18608b56c3d7b208b5f91fff9aa",
"version.json": "9900d5625daed1b73dd918b4f76332b4",
"index.html": "f96cc5827922e4b3684aeaea1f3d2616",
"/": "f96cc5827922e4b3684aeaea1f3d2616",
"main.dart.js": "12e12be3a075d05c0f49436a376de873",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d3a65de0559280304f3557949c0dd66d",
"assets/AssetManifest.json": "cd43593418053a290393d4fe9d1d89b0",
"assets/NOTICES": "8a0970188293dd5c392143423c5434ae",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "49d2366c573de63f50d092940caa5d9b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "6f996af3e60f8fcacb4b60a817cae04b",
"assets/fonts/MaterialIcons-Regular.otf": "6532d174056df826cbfbff57b4c799f1",
"assets/assets/pdf/doc.pdf": "e3a0b7dfd110a6fb5392c560ecdd103e",
"assets/assets/img/email.png": "09c1ad709d138b5a8e0fba98734a5a25",
"assets/assets/img/telegram.png": "aec10ba993a147da6dcdbb242877119d",
"assets/assets/img/biom.png": "e721cddc77798bde603d32f9c34cef0d",
"assets/assets/img/2tap.jpg": "1bd827afd7eeb346bb9243a6c455f86d",
"assets/assets/img/letter.svg": "84377ac167eaabbd692738d87852733c",
"assets/assets/img/instagram.png": "8fbeaea17816378dafcf6d43709d97ad",
"assets/assets/img/dis.svg": "2df6182d639d2e42eea36b05a7c5abc8",
"assets/assets/img/BeMyEyes-Logo.svg": "f8f3125027ac5cc95ad6ac75d84a961b",
"assets/assets/img/all.png": "a20c4a7a7e4327a9282668895f4dfce7",
"assets/assets/img/be7.jpg": "0d66b025ea335141a278ee501bd028d7",
"assets/assets/img/be6.jpg": "3ee90cf2a1d46978ca6baadd303076e2",
"assets/assets/img/be4.jpg": "f43e8d43dbd9b46553e0a69a3fe270ed",
"assets/assets/img/be5.jpg": "15d7cabf5f6d9141bba754472ff38804",
"assets/assets/img/be1.jpg": "94f9901c78aec3374973331cab3cf02d",
"assets/assets/img/goal.svg": "48da9c33ecaa6ae5c6bad674f5eac940",
"assets/assets/img/be2.jpg": "54ee24936126d0cad04bede06f8e5678",
"assets/assets/img/mpfpr.png": "30d43c532bf9ff2c25c2b327dfd2775a",
"assets/assets/img/be3.jpg": "8766eb6a3a0d044979e7c1e35533ed2f",
"assets/assets/img/dog.svg": "4e615c13bc8efa959e8dcc288cc15063",
"assets/assets/img/Osmand%2520logo.svg": "715ed54bd41fce17da183ebbd72b05f6",
"assets/assets/img/3tap.jpg": "13f0827d286396d2ee039594bbe78c8d",
"assets/assets/img/be11.jpg": "1a5974abe5ecce1ff1ed6d42c799b953",
"assets/assets/img/be10.jpg": "e6063ed4413d57e403b15b9b981d4079",
"assets/assets/img/logo.png": "706ee857fe95ce57242673c1f72360d7",
"assets/assets/img/eu.png": "3801eccc202606c0554dc78fd6eefdb7",
"assets/assets/img/be8.jpg": "04c19f78044ae058b87b0160694637f0",
"assets/assets/img/alga.png": "77b412e1dd943d913a6b8594e363e66b",
"assets/assets/img/be9.jpg": "31a3bc673f8b28ef3bc495ed9d163f25",
"assets/assets/img/1tap.jpg": "4195482224a95e8944aea6f07131c4c2",
"assets/assets/img/qr.png": "98539bc13bebe42dd8033ac159b2aa9c",
"assets/assets/img/osm1.jpg": "34637b64fac499d0ca8332aac3b21e15",
"assets/assets/img/osm3.jpg": "e6dce738617aaf4181d4eb00fc797438",
"assets/assets/img/main_img.jpeg": "1825a4d2e12d3cb4d82dc74ad85235e1",
"assets/assets/img/osm2.jpg": "c2eeaef6a7a523a606e5a77c09702416",
"assets/assets/img/facebook.png": "1c59675d740dee6a6df9b306c232b3f9",
"assets/assets/img/osm6.jpg": "12d4e1560cbc686e4c3c11b7f4562b87",
"assets/assets/img/osm5.jpg": "48510a7f36416dec75974b43e9434780",
"assets/assets/img/konrad.png": "2a66a12c9fe607c3c99c169d15688a08",
"assets/assets/img/taptapsee-logo%2520(1).svg": "daf9db33d2bb7d40598cec4039e1967c",
"assets/assets/img/osm4.jpg": "b29348366b6a11f148fb99cf5472189c",
"assets/assets/icon/language.svg": "c843f40e463c334b54a48dceb7956517",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
