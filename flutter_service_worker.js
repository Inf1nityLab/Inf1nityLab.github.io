'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "a8297d555dd34879e8e48e1cf12acefa",
".git/config": "564c4099c58a5ac2d4b5257ad5e85347",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "0fb5c2f150e734399fe1572335af9c45",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "8f985401226bd27a62b5f421dbcad4d0",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "eec19422658697a0dd55c97100439d59",
".git/logs/refs/heads/main": "59814d89e77491473966f65150bc84da",
".git/logs/refs/remotes/origin/main": "5c28b0ac25b25bff6890b367c216cce4",
".git/objects/13/e3c5c8ea6841d8a64b6f4b1da4727dafc085c4": "567f2bf78bf47587a7f0f1e4a1f85e41",
".git/objects/36/181ed48379f1ff4d3a163a191fb70de9db0269": "8799ddd254a648c5fb3a46fe519dcca2",
".git/objects/7b/65a2ba73c13adc9ca4bb789e551fa83ea6f965": "ca7d442321cea1cd311053d14603fa0c",
".git/objects/88/4b85abcf4eeae809301cf6c386ed5ece288d2c": "e1cf8c42e7005099fccd5211124f92bb",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/99/de07f3b5ab0466ca17346abcc115082e75d86d": "c9c3afe83222474b8a49e10ac9a2c787",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/ORIG_HEAD": "e3c662fe45705af729f0b57f170ca299",
".git/refs/heads/main": "e3c662fe45705af729f0b57f170ca299",
".git/refs/remotes/origin/main": "e3c662fe45705af729f0b57f170ca299",
"assets/AssetManifest.bin": "1716f4d6703c6f3a4da8dbbe0e0399eb",
"assets/AssetManifest.json": "e9160026d6dd63a230d3b454acc6ecfb",
"assets/assets/breakfast/apple_spina.png": "cd75b3f2041fd38dc68764604bde7ac6",
"assets/assets/breakfast/apple_spina1.png": "b6d017fda6f69594c2cdca3bfcd207b6",
"assets/assets/breakfast/avocado_waffle.png": "efa110393b779e4c0f563f0eb4d2abb0",
"assets/assets/breakfast/belgium.png": "eb60118f945f66ff7e3f74e763cb713f",
"assets/assets/breakfast/bowl_las.png": "47b37ae8ad0e1a34e165c6dd633bf886",
"assets/assets/breakfast/bowl_shrimp.png": "44f8738251cb46abd905e7f503746d4a",
"assets/assets/breakfast/breakfast1.png": "8a54e0e348953feef70f0d57a24f2b05",
"assets/assets/breakfast/breakfast3.png": "0b40b79ec9030c3e4beeef640adca322",
"assets/assets/breakfast/breakfast4.png": "a7aa44009e34ce0fbfde53a60f6ab674",
"assets/assets/breakfast/desserts.png": "dade16e43b6f215d41153f1c3a672fe2",
"assets/assets/breakfast/eggs.png": "89da06ae8d8b1eaf49ac37189c072bff",
"assets/assets/breakfast/granola.png": "4309aca77ed37860fc2ca67d9a0a326f",
"assets/assets/breakfast/granola1.png": "33ea1882d7abaa127d23018e94853ac5",
"assets/assets/breakfast/omlet.png": "ce030ae633855d05c216a2f50a3dc844",
"assets/assets/breakfast/pancake.png": "a35635c8342297194f605b46ab8e7260",
"assets/assets/breakfast/pancake_straw.png": "a089ea4dee2b39a398dee98582290c4a",
"assets/assets/breakfast/pear.png": "26710e1d308c9741f52352afd8274fe4",
"assets/assets/breakfast/pear1.png": "b67109efc6acf00ecb77987bd0c3b9ca",
"assets/assets/breakfast/pita_las.png": "1d95078cf120912be060b8dae626d49d",
"assets/assets/breakfast/pita_tel.png": "fda3d67e8492b0a2e9c7f30c09703e08",
"assets/assets/breakfast/poke_kur.png": "71793c0208a44a62ea67d40c90791ca0",
"assets/assets/breakfast/syrniki.png": "70df2bf9cfb14659af8f3da64b9a9565",
"assets/assets/breakfast/vareniki.png": "cd3ca377c0948f7c37f40d4d3806e953",
"assets/assets/breakfast/waffle_spin.png": "f90b5c939dfbff22673b947e916b3608",
"assets/assets/burgers/bbq.png": "c6201e1df35b4cfd7c32cfcee669183d",
"assets/assets/burgers/chicken.png": "9ba5098adbc21ec528d7875cf255ae90",
"assets/assets/burgers/kla.png": "7289e1d3fca852d8cc20f997b337080d",
"assets/assets/coffee_cup.jpg": "23e0bb116bf9af84894268043a8d6bbc",
"assets/assets/garnirs/brokoli.png": "dfd6dbf5532333f430c3ab4f552b44d3",
"assets/assets/garnirs/dolki.png": "73c8c741cfbbc909553732e94e052965",
"assets/assets/garnirs/free.png": "027f1e45ecdcfd800ad163b2368a5ebc",
"assets/assets/garnirs/kartofel.png": "ab0fc72afb948fdcae514275396281c5",
"assets/assets/garnirs/pure.png": "9d71ec5f65774c076d1152c24c4429dc",
"assets/assets/garnirs/razmarin.png": "fc812ab0674b6cd33672b8d6d64c691f",
"assets/assets/garnirs/vegetables.png": "e7f0aa5e21c12973f9453d09320ec40f",
"assets/assets/main_food/baran.png": "3456e0fb8eccd0cd15b24afce1d0deaf",
"assets/assets/main_food/befstro.png": "65583565a7705d273871e135d965e9f1",
"assets/assets/main_food/chicken.png": "418c3d9bc0491c0fc252ba8aab124912",
"assets/assets/main_food/forel.png": "75cb0ec2d1e5d0dbf042c20f095da566",
"assets/assets/main_food/medal.png": "203fea87fa5a8e0d6842171d82a87e8a",
"assets/assets/main_food/nioki.png": "0be030d423b7183197625b8bda8207a6",
"assets/assets/main_food/ribay.png": "5d71b63a9933708f0155691743331f00",
"assets/assets/main_food/rice.png": "a9a639048da63cfcb4a006e72380587f",
"assets/assets/main_food/salmon_ikra.png": "9bd6d21df427de1f3f78e94371e6a1c1",
"assets/assets/main_food/steak_salm.png": "4da8d424ddace6202e72ed2a06e7313e",
"assets/assets/main_food/tibon.png": "bdd4b2a9d6155cee3b27b33c15effbb0",
"assets/assets/main_food/tongue.png": "c25a4cc29cc78e77f3e175b09638484c",
"assets/assets/main_food.jpg": "60ecf2c011d79e79d3c2eea8ed046ee3",
"assets/assets/pastas/balon.png": "f6310207a5c07f346ce16344219b9b91",
"assets/assets/pastas/fet_kur.png": "170602d307bde2866c283acf3909e532",
"assets/assets/pastas/fet_las.png": "eb770d3e9f936e367596729d349b6d03",
"assets/assets/pastas/fet_more.png": "37309d6da582e65529c36a2ab6432a9e",
"assets/assets/pastas/konfeti.png": "e4620c745e386d4e802806f8548f0835",
"assets/assets/pastas/mushroom.png": "b2ef5800a6c6094ca607cfb201a348cc",
"assets/assets/pastas/past_kur.png": "89ea28afe00fa1a9ef28059c05cb7f3e",
"assets/assets/pastas/ravioli_las.png": "e6e282501f6cb6a5d76474cdb3e43882",
"assets/assets/pastas/rav_kartofel.png": "dc55c4f7b2e3e6555c2dcae27171ed68",
"assets/assets/pastas/rukola.png": "b0227b4e2df460030eb0825dda7c232b",
"assets/assets/salads/avocado-min.png": "1e553fd17d65016802764920850b845e",
"assets/assets/salads/eggplant-min.png": "4ca98fda497a2b6a4d02e4fe9c8ae9b8",
"assets/assets/salads/french-min.png": "1aad975736934d787dee3302bef5016f",
"assets/assets/salads/kon-min.png": "ec2b64818c6c6ee11af805bee7bde4e0",
"assets/assets/salads/las-min.png": "e8a14854d8999fbf739e0cc65384b7ce",
"assets/assets/salads/more-min.png": "f8d48bc760da51ac89ad4e4859527f48",
"assets/assets/salads/muss-min.png": "9aa5cd23ebbea570545156ae9cf9895b",
"assets/assets/salads/pump-min.png": "8240efbef625ce5227f574574fcec84e",
"assets/assets/salads/razno-min.png": "3e071ebd75240671287afd43a04c7bd1",
"assets/assets/salads/rukkola-min.png": "14cd1d42f7911fb3bfaa3a889d811766",
"assets/assets/salads/sezar-min.png": "67556f28242027d1edd65a298a1b1619",
"assets/assets/salads/shop-min.png": "26b69acdd3b29c825d97615f266aea8b",
"assets/assets/salads/svekla-min.png": "eb5f073895155788bbe2b70fd9443e26",
"assets/assets/salads/vitam-min.png": "b7d57385a5066bfcac33a493a77f54a3",
"assets/assets/snacks/bak.png": "1a864358a11b0192c168adae5661d3a5",
"assets/assets/snacks/brusket.png": "bfb58dd45ebbe9279941d3ee00905f4e",
"assets/assets/snacks/buter_tep.png": "f06fa5323d90dddd7876d2d8193ad64d",
"assets/assets/snacks/corn.png": "9d724f6a4bb48cd1fec0296bd5619af1",
"assets/assets/snacks/humus.png": "706bbe496c1b4983dbb9bb322aa76883",
"assets/assets/snacks/kapreze.png": "e475118568a10e0704d0f11077223c84",
"assets/assets/snacks/kruasan_ben.png": "6378aa7962564fd1fc3e102618212da7",
"assets/assets/snacks/kruasan_sem.png": "8210187d0ab6fd7c558b6436a6be76d0",
"assets/assets/snacks/min_bur.png": "60481b901a434836ac1a67ceca1ef81a",
"assets/assets/snacks/panini.png": "69d3894e391ddd2b11d3d5c32dd18db7",
"assets/assets/snacks/pashtet.png": "44efc9f35c0bb856e40094fc08631f62",
"assets/assets/snacks/pit-las.png": "3481f6b5436cffcc71ed2b964474f716",
"assets/assets/snacks/pita_tel.png": "02b650bd6241b89b0d319636ea821f29",
"assets/assets/snacks/roll_sezar.png": "1238d61d24efacbb693216d9cc311793",
"assets/assets/snacks/rulet.png": "cd11c97538d9f833d9b4f0a5be037e33",
"assets/assets/snacks/sendwich.png": "488ab4b45baedd72f2d45f5f776711fc",
"assets/assets/snacks/shakshuka.png": "019ea21ef778f72f76ede542eb515834",
"assets/assets/snacks/zakuska.png": "70082f39f92599e22bed2288df837a69",
"assets/assets/snacks/zukini.png": "de3dd9d3bc926180088250a12df3d3ce",
"assets/assets/soups/borsh.png": "1024d74fcfbf7759da31cb8eef1fe573",
"assets/assets/soups/cheche.png": "f2c41077b078f3b502a82a832576c1d7",
"assets/assets/soups/chicken%2520soup.png": "a8aa71ea377fa1f59c66db5662dfaad2",
"assets/assets/soups/mushroom.png": "4842e45f89da74aaa13906fdffb3dd37",
"assets/assets/soups/okrosh.png": "32aa030c4d2caab5d6facb867715573b",
"assets/assets/soups/pelmeni.png": "56a357d82e5f4c28c370c44aba531154",
"assets/assets/soups/pumpkin.png": "71fe131001712a98269fd9333aef61f7",
"assets/assets/soups/solanka.png": "f3f75337af33242846692bffd31230b1",
"assets/assets/soups/tom.png": "6d64c14e5863a82bc80f1a12fe377d37",
"assets/assets/soups/tomat.png": "af91ec003342c7c2097669b3bcd158f3",
"assets/assets/soups/uha.png": "7d2b2b605a2e5b570f248d87fa6fd493",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/NOTICES": "e76f32a756eeea46952123c3bc0e240d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4cae9beebf250fdf8eed556baa9041ae",
"/": "4cae9beebf250fdf8eed556baa9041ae",
"main.dart.js": "78e4893655357fd0af7522a542b5d868",
"manifest.json": "d2fb13b3b16a93ec2cea2e6447ef84c2",
"version.json": "b62a50e57af64331a960ad33f23d104f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
