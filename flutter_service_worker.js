'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "a08b1a9443db0ad41dc6dddee81eef3e",
".git/config": "564c4099c58a5ac2d4b5257ad5e85347",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "8cbe8dbd3b5f98c8cf58feba04469a06",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "1d531bbb33702f6cfeeb1eb969bb9ed4",
".git/logs/refs/heads/main": "7fa5eaf6fcc717113d64f5da09e0dcbf",
".git/logs/refs/remotes/origin/main": "c622537b2f17ed22cf1fbbcbe84e59c7",
".git/objects/02/b1e447bf459ec65e45a20be8d08efc37bd06d4": "0223b9b282c3c99ff1b948dda8569613",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/09/64ce6262b939c617804cabc9485982e6ece494": "746852a3a95a6e5ef87e78ee3a6fa349",
".git/objects/13/fa757adab5eea6c2e43d3af9f27f56f66783e6": "1c183d6e58e908f6af9865a6ed0636bb",
".git/objects/20/0fe1f8f95bca7a17a5db8dcac0baca2b1b0844": "12b7a41ea3e699308f20dad16d870e89",
".git/objects/24/3b7f0ff039ff54cce5cf38d48f3776fd5936de": "8d3c22f9846badaedb85dbb0384e767b",
".git/objects/30/d7510b559542c28cdf520fdbfe7b44a28c5d44": "13c30bf74ab38129dbcc6e3738206097",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/35/9c1b56b4920f371bed8b75f4c40cb39fb8de65": "068fa61ce22e4c5601624988868f45dc",
".git/objects/36/0c5d5732a7fb15cb0a62434e6d7091ca13473c": "c4b1cbc51fdac773b8a314e70137cf6d",
".git/objects/38/5e02f84b05ee1ee8f03558e07e5aa251db257f": "6045bcd16f0f27acee866fad847c4648",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/3a/9b3e525ffc0cfa3247c17b03bd3e7b8efb7192": "df9c5531b99d778e7ea5c7faaaf9d9d1",
".git/objects/3b/3412505439ebaea6fb58cea7900369c3415d27": "8b1ec33f0b0b208a6309c945678a6ece",
".git/objects/40/0d5b186c9951e294699e64671b9dde52c6f6a0": "f6bd3c7f9b239e8898bace6f9a7446b9",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/54b0dea5956a49a54becb0ab4d1be1ff151a7f": "0c60cb2c7ac16d218350bc2b22bfc5d8",
".git/objects/4d/a1aad2e1d74072c64017555a8ffc4bcf154470": "ba7789d34049f4dea01ab396caa4dac9",
".git/objects/4e/d6bf485e3d232a7987c4c9ba80113901b995fb": "10490217ea0259b4b1eb97ac479be9a4",
".git/objects/53/91d48f5f848d9514ad090463607243a661d928": "a5e4381afb52fb985a411d4249334268",
".git/objects/54/da6656b5422ab3aafdc9b863d0dfbddf22386c": "4bf109a2ba3276c718f652dec8fddd73",
".git/objects/55/ee803745fe1f154b98c1e31a6918e13fccced4": "86ab31cb8e6bcbef62c415fce8c6975e",
".git/objects/56/bbe732434eb957995f8d1420c4b77ae178a0ac": "c9e3e52e26a2ce4f414269c4516798d4",
".git/objects/57/88446f039cc47156454a8e1d371f95e87ccc02": "50546c79b8c3d763b325a4919daa2a93",
".git/objects/5f/d2bca3bb9b0fbb305839dbf900381660d9aa20": "da0c35795ce63d1226302eb330a16ef1",
".git/objects/61/4d588a063721ef96a3c9c100df4868562e9e71": "20f428403313f5510342e65996b51746",
".git/objects/6b/b42bba671624b0f79145ab42ca65c032462ae1": "327a39020c0a407916e191943a3bcd37",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/76/3a0dc9f1f71412d9465bcc924616c2b25cd759": "07c4d10fafa629e9d32fb8c99fc040fc",
".git/objects/77/89cf4d7408f2267a702267cf89d96eda7ceab9": "eb6889e7dcec87109192f95c56ce37ea",
".git/objects/77/c6307101d6433292f1abb5924a1140b37d0f14": "68c9d27ccd7a55bf5d0577bfb87486d4",
".git/objects/81/4a6fc8d63e85411d132c8d8bc37dafdb106c33": "14363218b56b9a3cb6fd317abe70e5c9",
".git/objects/82/c191b4adba99b2c09a46690189b93b1a99b633": "62038bf4dbb25853c0ffe8cba282dffc",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/84/2a8de17f4caae23fd0f41d825de3daf5ecda92": "f67ab69584e4d45caaf8947a433988be",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/f9c66bb145aa3d739fbc06951e1ab3c2e981bd": "7cec059126b3d067a34477c6f26d0280",
".git/objects/8d/afbe533f9b6edf0b79d4972ba41620386421ec": "190f75e3512bb7924d732aa52c036578",
".git/objects/8f/0fb3fd65b9825218ed65bcc5d1f174f446b0f1": "71f826d034a7af2ce33fe954798dccf0",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/93/59c37108d5a5915045d0acba344352bd8aa2a3": "cb068214b2eb036051165af1906a2e52",
".git/objects/94/30d4bd81fe539c2d53a5bd3366a7cc098c9b66": "723ac9ac476e0e2134c0db11ad2c7d9b",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/9f/622428d1ef5be23a3f15ddf95aa88c2c6a37d6": "8b76c1e4832f2ec1938568c6c333bb4c",
".git/objects/a1/fe901896028ec1760e96658d1d098856327ff7": "5557021fff16ac262a435331de37d6a2",
".git/objects/a2/b2f9ef794b19b6f97e7caef7c12cc4aa7950e7": "afa70f73f04e21648ecbdaa77e7ffa1c",
".git/objects/a9/91f51138ffe059d588003dc7936aff059a0428": "b73a35563fa129bd884d8b5c53ee9231",
".git/objects/ad/2f90b78480aeb6608226d9db4ecbd3ec06aaeb": "4add97a99941aa0e9eed0f2173416ade",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/672bc05c5a09cf1b4b89ccc1cd513fc83197ac": "7ae997684000dd0d4da4aa85b767f0b2",
".git/objects/b1/cc5c554a036b58387db6b5c33522d81f2d9729": "5aaa7cfb09469db11a44067b02367ead",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bb/e8c5a90947925b4d826b87f97b9094ff2d6f56": "e211102cd38219716613de72a6ff46d6",
".git/objects/be/b76c00f8840d19d33cf2b0b4aaab1745b32952": "04fb3e5243b14ff3f022c3ebd6b3d9e1",
".git/objects/c3/547d7ac972f3eff47f7ee630808ba6e959efd5": "b81c7434b30bf497cf05ff4d7194121f",
".git/objects/cc/fab74c1f56c330985060e2247607eaedb3c7d7": "ad5b6117df489509af208438785f208b",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d5/bb50b3c3bc534b51ba035a5e8495ba7af5025b": "81d30e6f235d2cd1960b1a0d917b3043",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/9cd2b40a794830d5e42acd1beb466092966dca": "cd16b25b5a14ef3b3a935dc0757990b4",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/e4/974bdddaa6bcd343cf5d0b68450c7f37327cfc": "3f41bbf6edd835c9d13d42a4336caf55",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/5453cc6240fba1733fb6c727fad4e240a8caf4": "ade306d94bfaf33ec61e9c27e5155c96",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/b371ffabed3d27eb40bfe0ace986cdacbdd6ca": "ea2e24b5661cf0b57966a19f82d74401",
".git/objects/fb/a28e195b66c61aa19dc01fd9ecce36d44132c2": "aa03c9d802233ea26743402d3777ca5b",
".git/objects/fc/812a106639f9755f399f6f159f7d7bbbaecc06": "3f77982c6b0d97a0f671051bc36d1b24",
".git/refs/heads/main": "532ece37e997d5febceedb92bc219d65",
".git/refs/remotes/origin/main": "532ece37e997d5febceedb92bc219d65",
"assets/AssetManifest.bin": "0dbd154b2870e8fe9f8552bafbb39200",
"assets/AssetManifest.bin.json": "df5c8bc3f21c7b0c8127d1189ad90149",
"assets/AssetManifest.json": "907d24494255335e59d972f8071e3ea1",
"assets/assets/icons/apple.png": "441a508c71767c611d20ba0afdfd9784",
"assets/assets/icons/github.png": "50817299547383e6221d22b891c42b15",
"assets/assets/icons/google.png": "0dee9afcc941a669d80ae562ab11be55",
"assets/assets/imgs/logo.png": "104e6071556c7b8056be2adacee001c7",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "9ce8ca63d8a42d3d5b29c885abdf79db",
"assets/NOTICES": "616493b515cd447190e3890977946267",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "391ff5f9f24097f4f6e4406690a06243",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "e24275694a02959b24f601990b82e684",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "aba0dd1e288b39e7af0eecdcf3ef1e33",
"/": "aba0dd1e288b39e7af0eecdcf3ef1e33",
"main.dart.js": "9351208f161d6a2a58d0cc89b52b1fe7",
"manifest.json": "ca9ef091c82c95898f9759e8897c6dfd",
"version.json": "90d297ff78b184d14c4ca50ba01243ad"};
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
