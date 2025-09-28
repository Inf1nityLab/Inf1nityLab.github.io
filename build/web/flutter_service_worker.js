'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "a3d9fa423bf82e4eb79854cd9286b86a",
"version.json": "9900d5625daed1b73dd918b4f76332b4",
"index.html": "05d3a557d12ad68aa3818b84d8f0247c",
"/": "05d3a557d12ad68aa3818b84d8f0247c",
"main.dart.js": "6cdb50d1169592a46c47ca4e8a05c0d4",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d3a65de0559280304f3557949c0dd66d",
".git/config": "2470969bfb6ce4c901c65472d54ddadf",
".git/objects/66/6e2b899cc4c5bf84f2d9cafa5ab1c18a41321a": "7acd67b951cc1613c9b6ce69148f7d8d",
".git/objects/6f/d651782bc1a626364dd2b41d41497280b4c273": "4bcb97fce6aab7489dc611148c46f4d3",
".git/objects/9b/d3accc7e6a1485f4b1ddfbeeaae04e67e121d8": "784f8e1966649133f308f05f2d98214f",
".git/objects/32/8298d9784781be04a63fdd2e88ef2b97dfeba3": "9f06c9fa57f2eb5c221e1b579f2b221d",
".git/objects/32/e014b1d18ca163a14162a08d1428a081d97eb9": "e7c33bd1ec3de3551748416f6b333fd8",
".git/objects/67/a9f13c3794be8a599281826ed3f48a233edebd": "bc42d8f7a2b21563f4f7cb77b1cb8bfd",
".git/objects/67/b3ecf5cca45f9b7db2a6e4347a78831d75aa1a": "c2119d3d6479a15173f0c4ebb4c76617",
".git/objects/94/a4c84d469c10e4cad4bc0246c0e645c4a74f9b": "599d80ea9117bea17cd87aec4f7e6f1a",
".git/objects/5f/e7b0be57ae23d1638201d346c5a949ab215fc2": "d49fa32ae9560334ddb825c4cf4d3b99",
".git/objects/a4/d9bc7cc92909e0ca9db73969f2d8645e558048": "c0eafd719ccc449780a984a112a721a8",
".git/objects/d9/bd72c8a6562783631eaa5a18867b16f92064bc": "f19302010581e90bbe839345b7117935",
".git/objects/ac/e40052996eabbe240c0341a65fa7df584d096d": "8d771de53d340dbc810b280f630efb7e",
".git/objects/bb/a7fb5e43a8981f3b78f82f1c24df8349a97ea9": "88f62a850b1f289bc9c07c751d00387a",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d7/2b1a1c44139f15f3c60b947d365137e0f823a6": "590577424a8272eab5bd4762a9f019e9",
".git/objects/bd/8723de8d85679c474ea7b031553c5ee1fa5280": "c1b87bfaab69aec571f066c6a0841e0a",
".git/objects/bd/5f43f65fe4b80df598c17b2f501ceeff14bc2d": "455b7530e6197e238c62002545fb59b7",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/e5/4f7853e1159696c04f21f14502d03e47dc86c8": "915e48493fd4c51cf7eb2f8c9ab727fa",
".git/objects/f4/5699d9cbea85ca96ad3d9a8300d5135b8849f1": "f28aa5c3f308680c5185174b2c0e7f4e",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ee/0e319c5539dbb17d9167d3b7194b5e1a963b42": "b8904b0dc33f998f23b01fa587059178",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/e3/a13e4d685c0ce8d99ec81e9b243a10c05907fb": "8cca0509c435486db5265d629925526f",
".git/objects/ca/cdb85d069142291307740c3087bd69cadfd76a": "46f0f48a3a85a2fc1da2b88a62f25c2e",
".git/objects/e4/3c4fbe20db3024c08104af8a49cb73c0a934ec": "dc3d8116700288294c6372c082ab50db",
".git/objects/c8/08fb85f7e1f0bf2055866aed144791a1409207": "92cdd8b3553e66b1f3185e40eb77684e",
".git/objects/7d/813262fe09c147e12225629089ca0e9455a023": "2aa5a2d9c93b5df33054185b322594c5",
".git/objects/7d/54564eee4131787d58bb60b519960c529952d6": "60e5b9a193e9b53d5545b608bae7f5ee",
".git/objects/7c/5646066621507b272750ad136dc62a86d4d838": "05733e80381c0191d95d2f7bf3121e23",
".git/objects/16/e4d4c539a20d1eab1577fcf3e5461330c97326": "0c45ff37254a323453503c8cb4bacd5c",
".git/objects/73/c63bcf89a317ff882ba74ecb132b01c374a66f": "6ae390f0843274091d1e2838d9399c51",
".git/objects/1a/d7683b343914430a62157ebf451b9b2aa95cac": "94fdc36a022769ae6a8c6c98e87b3452",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/26/654bd74060145ad06ed22c45e8369918c8e9fb": "51e098a84959533bf24be8dc3d36126c",
".git/objects/75/66c3d0beedadac9bde6d46a0ad9e6a83a5adba": "360bc63018fd8c70b68a50e7887b5a10",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/3a5e1402ccf71d8f5102ee4fd1095e69e32600": "eb7eff5536ccd937720c32038e7f837a",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/5d/c8b0dee0c6efe15bd565ee2d4b44369ed94792": "b4a1d753c0699d8d7e72b2e799bd1dae",
".git/objects/62/7e12c6b9ad6f99c152fec312a3e56ef0eeb4cc": "6aa0ca090b7d27a1d767603a632f0a6b",
".git/objects/53/18a6956a86af56edbf5d2c8fdd654bcc943e88": "a686c83ba0910f09872b90fd86a98a8f",
".git/objects/53/3d2508cc1abb665366c7c8368963561d8c24e0": "4592c949830452e9c2bb87f305940304",
".git/objects/06/ed738375bfafd11c0777dda1a7d6a822e22785": "efd10d508be501980d33ee76fc73f562",
".git/objects/99/bbdb3482d6f932c6ec27c99ffd84b00d0e8a96": "c7fb16b261d059330d133c38bb5ac4be",
".git/objects/0a/0853f8d988b6f09d9bbe390db67969d4e0ce10": "f9d523fc07c379c93e2e61b5ca67b8a8",
".git/objects/bf/350009fba17a21fea49ebe6cb13a35daf5fb15": "523eff1ab1a1b1c46dbb5c236c0a68c9",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/b8/eb9afe3a854aa338472bec4afd041feb9eb52b": "da5b16a8d9012aeefb8b6879af90f054",
".git/objects/dc/11fdb45a686de35a7f8c24f3ac5f134761b8a9": "761c08dfe3c67fe7f31a98f6e2be3c9c",
".git/objects/d2/a3f7f33575cc529e323e5c39ba56e06d97ad50": "891eac3855261804595181b93c99c4d7",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/6a5236065a6c0fb7193cb2bb2f538b2d7b4788": "4227e5e94459652d40710ef438055fe5",
".git/objects/a1/dda9e8b30e99e81303f6f2bd81bb9a0ebbbdc6": "17e27f1a90357d93123993f80232791d",
".git/objects/ef/f4239d687a8e77cae10f14145ad93dd8b294e2": "720c0b26f0762874596dfa05e6af2bc3",
".git/objects/fa/d56b05e218f2919af1551e6d71136b87cc23c5": "ef01d86c2dc532722d4d03598e69e21c",
".git/objects/f6/cb745031385f733eec825f1b196c8bff177a46": "f7784610329fa9aec1f46f81baf860d4",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e0/8a5ee8c979d7ea75b71d3afa1ce454b343c06a": "5f880739799356ff2432aab4091caf8f",
".git/objects/e0/7ac7b837115a3d31ed52874a73bd277791e6bf": "74ebcb23eb10724ed101c9ff99cfa39f",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/2d/2729c21b00f7698e7dd127d57678736e3c1d79": "d8d0841e12b53dc8c3eb8897c803de8f",
".git/objects/1b/95b9222e303a15e8c42ba20a1d6d19fc9f4a51": "8f4773d625f0d760b73988f62603b9f7",
".git/objects/70/a234a3df0f8c93b4c4742536b997bf04980585": "d95736cd43d2676a49e58b0ee61c1fb9",
".git/objects/70/a3b3cfcb1bbcce1fa85a38a9332b6e6e371706": "43de2665fcf2b07e67725a1224a61a86",
".git/objects/1e/403659912f0292f79a6d0fb02a73d38466479a": "4128d5f5d6be8a709b907ea4f5b0c0c7",
".git/objects/24/c5744797f871ea68e62744c4cced2749c7c255": "07084672235e390dd5858cfa4b6b1721",
".git/objects/23/ff1362749be28d6528d1b1e2b376259935be0c": "f142a8be027ef5d8058a6317f1bda3b5",
".git/objects/8d/7f05ca7298b0a8fb9fb60e3fba9d4e68951017": "3ceedbcdb582ceed21e5305fe85b7eb6",
".git/objects/15/4e87396f44c77b933170834a27f9c477208e0c": "7e289fb08d5934de706e6f41f51ae0d9",
".git/objects/12/1b50d9e6ba7b304187fd905ab24ec74b7693e7": "f626293f889a62dafa6262ada35fa42b",
".git/objects/82/752df793dadbc9b643b5f391bb1dc7f2555ccd": "6a6519548b1051086d25a920e3071ebd",
".git/objects/40/3a7e1d702c3776f81b02842944801b133122a1": "861f77948aa13c495f2b85e7ea41937a",
".git/objects/2e/6da4d47029fb295ef10bbaf7a5acad39997cb6": "82a60510b80f075a2d7941cf6c0cad0d",
".git/objects/8b/16122a3a2248febd17dc49b0a1088a2ef7ed5a": "e15d68c9b94630a629a72b3e6a00ed63",
".git/objects/14/f93f8ef16fb5ba824a330bfa7007230502050d": "1ee5bccdfd6c1485f31f63df7f7921e7",
".git/objects/14/86c87f0bc1fc13432b571644b5750b822d1990": "995e93f8d5de672c3af94bfd3707030b",
".git/objects/22/1b50c9b1d4e5f6c1483e0d7c67dfc1f0caf2ed": "3dfec3e6664829874be493ec824f81d6",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "0bf345e87a2d70914fcd8c2a5f69cc90",
".git/logs/refs/heads/main": "244f5e1730182e7b5f5a7798cc4d69c6",
".git/logs/refs/remotes/origin/main": "db603e1143b7e08d52da4c003313e85e",
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
".git/refs/heads/main": "06753b441fbffd16c12bb7bfe74bb0de",
".git/refs/remotes/origin/main": "06753b441fbffd16c12bb7bfe74bb0de",
".git/index": "401cd970580754e7df1e6bb0a4f341e7",
".git/COMMIT_EDITMSG": "9f0a1a64142ab98ff033a49e38e7f4a9",
"assets/AssetManifest.json": "a0b47ce9fdac967a61b565d8db3b4c4b",
"assets/NOTICES": "5a7fed6551212382699d7c547b61d830",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "3ce4bd2ba1e62dedc9598a4a329da1e8",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "d52c15700ce9dc3ea48a9be21193f1b2",
"assets/fonts/MaterialIcons-Regular.otf": "6532d174056df826cbfbff57b4c799f1",
"assets/assets/img/email.png": "09c1ad709d138b5a8e0fba98734a5a25",
"assets/assets/img/telegram.png": "aec10ba993a147da6dcdbb242877119d",
"assets/assets/img/biom.png": "e721cddc77798bde603d32f9c34cef0d",
"assets/assets/img/tap.svg": "daf9db33d2bb7d40598cec4039e1967c",
"assets/assets/img/instagram.png": "8fbeaea17816378dafcf6d43709d97ad",
"assets/assets/img/all.png": "a20c4a7a7e4327a9282668895f4dfce7",
"assets/assets/img/be7.jpg": "0d66b025ea335141a278ee501bd028d7",
"assets/assets/img/be6.jpg": "3ee90cf2a1d46978ca6baadd303076e2",
"assets/assets/img/be4.jpg": "f43e8d43dbd9b46553e0a69a3fe270ed",
"assets/assets/img/be5.jpg": "15d7cabf5f6d9141bba754472ff38804",
"assets/assets/img/tap3.jpg": "13f0827d286396d2ee039594bbe78c8d",
"assets/assets/img/be1.jpg": "94f9901c78aec3374973331cab3cf02d",
"assets/assets/img/tap2.jpg": "1bd827afd7eeb346bb9243a6c455f86d",
"assets/assets/img/be2.jpg": "54ee24936126d0cad04bede06f8e5678",
"assets/assets/img/mpfpr.png": "30d43c532bf9ff2c25c2b327dfd2775a",
"assets/assets/img/be3.jpg": "8766eb6a3a0d044979e7c1e35533ed2f",
"assets/assets/img/tap1.jpg": "4195482224a95e8944aea6f07131c4c2",
"assets/assets/img/be12.jpg": "3e42b00350cd353965d68a7fd8f5221b",
"assets/assets/img/be11.jpg": "3f8ca78c97d62da162518f2e403a9669",
"assets/assets/img/be10.jpg": "31a3bc673f8b28ef3bc495ed9d163f25",
"assets/assets/img/osm.svg": "715ed54bd41fce17da183ebbd72b05f6",
"assets/assets/img/be.svg": "f8f3125027ac5cc95ad6ac75d84a961b",
"assets/assets/img/logo.png": "706ee857fe95ce57242673c1f72360d7",
"assets/assets/img/eu.png": "3801eccc202606c0554dc78fd6eefdb7",
"assets/assets/img/be8.jpg": "04c19f78044ae058b87b0160694637f0",
"assets/assets/img/alga.png": "77b412e1dd943d913a6b8594e363e66b",
"assets/assets/img/be9.jpg": "e6063ed4413d57e403b15b9b981d4079",
"assets/assets/img/qr.png": "98539bc13bebe42dd8033ac159b2aa9c",
"assets/assets/img/osm1.jpg": "34637b64fac499d0ca8332aac3b21e15",
"assets/assets/img/osm3.jpg": "e6dce738617aaf4181d4eb00fc797438",
"assets/assets/img/main_img.jpeg": "1825a4d2e12d3cb4d82dc74ad85235e1",
"assets/assets/img/osm2.jpg": "c2eeaef6a7a523a606e5a77c09702416",
"assets/assets/img/facebook.png": "1c59675d740dee6a6df9b306c232b3f9",
"assets/assets/img/osm6.jpg": "12d4e1560cbc686e4c3c11b7f4562b87",
"assets/assets/img/osm5.jpg": "48510a7f36416dec75974b43e9434780",
"assets/assets/img/konrad.png": "2a66a12c9fe607c3c99c169d15688a08",
"assets/assets/img/osm4.jpg": "cad3fd8d0d776befcfadcbda5316bb6c",
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
