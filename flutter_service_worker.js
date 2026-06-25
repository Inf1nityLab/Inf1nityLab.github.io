'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c34941c0fd4ad21629ed199a7272d9df",
"version.json": "199ff5cc9a72fdfc40bba13289f6280a",
"index.html": "dcc430ec39bc1f5fd2b5ee03e88f2986",
"/": "dcc430ec39bc1f5fd2b5ee03e88f2986",
"firebase-messaging-sw.js": "52e308ce03cf187b7d2713723efd3af4",
"main.dart.js": "6446680f5a3b96428f242e7e51069a7e",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "68bb616d1e8fa27242c17eee37549bf2",
"icons/Icon-192.png": "00d2b473b4be487cacc9932fcad28d38",
"icons/Icon-maskable-192.png": "00d2b473b4be487cacc9932fcad28d38",
"icons/Icon-maskable-512.png": "cecdb0e38c79bf1cd4f5f190803b045c",
"icons/Icon-512.png": "cecdb0e38c79bf1cd4f5f190803b045c",
"manifest.json": "def62833950c9dcb946e7ae2d2cda1f1",
".git/config": "1ba51ff1e2adc41f810971f2eedd8ccd",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/68/0ef5301de28d0b81afc653a73ad4b7096347f8": "bc490f6d2448ddcc4300518262b66c53",
".git/objects/3b/a18be1d9d27750300dada24668e931f770b7fe": "c9125d338fe5e916d09b515765322ea9",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/04/eddef90a47b454c4b2b3dae773a099deee7064": "6a3be89e2bb60766a53c0a7a525e6a55",
".git/objects/69/b2023ef3b84225f16fdd15ba36b2b5fc3cee43": "6ccef18e05a49674444167a08de6e407",
".git/objects/56/e5cd764450692982890d7d3fb0bb23f46dd4f1": "57a671ae5440c27be2e2b4017147fbb5",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/3d/bc0fed6d10f3fb3c29742712d5267c3b70a496": "af6695f3cf84df3741bdd37b00e74761",
".git/objects/58/9511eb98261b21f531eb71b326e556a1a75dd1": "b1429e53d7c7d2a8dac0cab7579fbfab",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/5f/1ab5566130135101fcb835fae798ef46e8921b": "5d68e942bc512f28499e3ed0d269da2e",
".git/objects/02/1b78fbd23dfb8068e421d0e755d33a5fb2de4c": "6ee42ba3a1a968ecc90d5e2dda9e688a",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/d7/5cd7c818e8b13992fc46b455ba0fa6548d84e2": "12e36281d0e1d27db879e9dc3b29cd89",
".git/objects/da/cde7aa54e504bb509a4374f43e39ced99a0eca": "ca3e80456d86b2bb464113130c6d0879",
".git/objects/bc/aad68f1a2b1841da0da3bbe5e3dfbf3f5660e2": "2ef6474af84b68fa6b71cf351551a0ce",
".git/objects/ae/6c123cc698c54abc22a42e01e649e23fb66223": "f74904865af42d4b93990c498be52499",
".git/objects/d8/2856be9f550b821b2fe66f7ddd97b8b5722348": "0ce64333c7afc3ae1189377f5b022c48",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/fc/9f09152002475ebc123cd9baf983dbfca3f4f5": "de686d15296b05692e03a86ef9eedd41",
".git/objects/fc/7d792a0d6089f8e904c1651e556db34d2f437d": "2c897a44a45951f5436dc0cd7bdf0b68",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/ed/821ff1272794b7cd4f3adf620a47af117e1e48": "941d55a9077e71422784c7f9e6aa70cc",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/42/72c655d377d9aac503032f162e1db63d64d756": "374d8110df84abaad475d12c835a1ae2",
".git/objects/89/ca790fde53ea15a55725afe7810b7953067f2a": "b6f9d686ef92ed1535bbf5853d31b516",
".git/objects/73/e19f33f7523f6801b82136418de21dfc4fd32f": "0a8dc14a2d73603119e2b8037c74e4c8",
".git/objects/28/63a56e491e7e6636a9fb14280fa10094a541c8": "d6d7fca4a00bb8a03df4c40c1200ffef",
".git/objects/17/a8d9e1bc40585ea80729a7feda470f45787c6c": "5b7902b5bcc870092791dd5a0c61cf75",
".git/objects/8f/5402d1a1fc9fb1d5d5cb804f519bd04dbdb054": "ed7463b05d8416c79424b31624d363ed",
".git/objects/75/f5c275f972719f9308dad9ea41a8ba61d967eb": "b6668d87020ff32cd00066f3cfc011a2",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/5c/99f4e8b83a5105caf789a96d938a200675176c": "2d0244d2f735c153cee109617d980ca5",
".git/objects/65/83c5fd20541b2f10edc5eec2098e2c09669470": "022720f3234c9244a4b50b9253c6d555",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/5e/be473c439819676a8a8c40bdb694cd359fe166": "4641f8a142c1feb71330b740ac8630ad",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/b6/8aa1dda5a158c73bbcead3e72a7fb05b4fac34": "b8a65a80474443b1e48169853e14ade7",
".git/objects/d5/b9116818d7debb1971d1b22f372e2412fad678": "1c0d6ac1edb1faff3beafc927ed42590",
".git/objects/d5/64d0bc3dd917926892c55e3706cc116d5b165e": "ab5f20dcd5b558888db7d80b0f979f8a",
".git/objects/aa/f3e29a391bcba7fccb3c3697f0fb4a4646ab55": "fbc2addc9f319b9d2cd810e95ea2de8a",
".git/objects/af/7a258c3e36387ca20b16342569d167f9f16feb": "758db5fbbcaf22fd15da02a5cb9c0a8a",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/e1/fd27e005283767e0136b670cc30ba0ff921c50": "ac244bc12d510d98235e264e2281377a",
".git/objects/e6/eb8f689cbc9febb5a913856382d297dae0d383": "466fce65fb82283da16cdd7c93059ff3",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/c5/da573b2e47bad496ea0d641ced7c42c79cfd29": "3053758a0a53ff44bb5447f40dd7385f",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e7/1aa58625f0d98e3d387b2ebb119dbc61411c46": "ceb39ed5f9348355193966b59f8d098f",
".git/objects/ce/5e0d0636198929cee17508a0e6b2411b2dd143": "d33666def08b131dabb8f093931d523f",
".git/objects/e0/519d7bb01e3102a69eb13111250ca70a8e49ce": "b5d0890d77574c33e132b8ef87c98d58",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/41/bdad7ea821cdd1bdeba4b1979bedc48ae8117a": "8c559cac171034c3d37549ca8684a72f",
".git/objects/15/6d6575a8b67a2252b60304fd0c7108e9150b5b": "de9a1aedbe8fdfc9422d1ecfa9cd689c",
".git/objects/8c/86430cbcea780b0ec226a204e58f04a2914ecd": "911752fd818e636101a9900a766913ed",
".git/objects/85/d327ce4d78ac945930de776f2915e541dc0ffa": "6a9368d25687f3cf94e11c4903d0c26e",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "af04c3c5893fdb53871482b1b1034b65",
".git/logs/refs/heads/main": "48bdf0280e9a0520aa5661dc6b26d096",
".git/logs/refs/remotes/origin/main": "93ccc116867466e5cbb020e1859d8da7",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "dbb81ee751061acba24830973468c95b",
".git/refs/remotes/origin/main": "dbb81ee751061acba24830973468c95b",
".git/index": "8774799624bc97e36e6b4bb8b879fee8",
".git/COMMIT_EDITMSG": "4b034317ac91f298c43c852ef9bbab21",
"assets/NOTICES": "0dd85943b7b76f84d264c74d4e0deeb3",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "84815e4c9e98eea4a32ce0df7125b450",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/youtube_player_iframe/assets/player.html": "3029933f550279de9450d4e7327a3473",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "e8a71c93d586bbdca2cb892060e5b0d6",
"assets/fonts/MaterialIcons-Regular.otf": "0ba4e29e376ab013854b364906556969",
"assets/assets/images/okurmen.png": "1e8ea3091344fd3e60e434228a8f756e",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
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
