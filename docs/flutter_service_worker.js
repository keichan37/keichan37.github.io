'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "c8ae564ad711fff10553c43c08856bb3",
"index.html": "347e7a4306240ac24f973310f7a0d094",
"/": "347e7a4306240ac24f973310f7a0d094",
"main.dart.js": "fe2b2b51e8fb406535fc436de895872b",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "2c50c6fec35bb0968113f71c73a89dfe",
"assets/AssetManifest.json": "74fe0bb225d3504ab8d90a42ef57b83f",
"assets/NOTICES": "d67f8440b06fbe0ce1aacffb33f2c746",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "2ad5f374d31abeb32bc1f05c88b0cb9d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "947cbc92b8f2ba7a6b3b3ce5bc2aad0b",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/yy/aabc90a53e158fe36e0e2933ba2737ed.jpg": "f944a938aaded4dd93f481298e5dc5a8",
"assets/assets/images/yy/eba4518cb58676c1eadd1edb21f8a91d.jpg": "daa11141a1caf308f02a3886d7e11b81",
"assets/assets/images/yy/ecb09e5785e805c4afcb08ee750c178b.jpg": "252111199d784ce75b7998d0cf0877b4",
"assets/assets/images/yy/5c3cfad86e2d1daf306c539a11b860cd.jpg": "f60a6b29babfff585e261c655adf241f",
"assets/assets/images/yy/df9c58267bb47e30403ebd8264591d34.jpg": "4b7aa366ae742fb0cb963264f99dde58",
"assets/assets/images/yy/eb866f3d5fc0630cce6f41a67e4b0cfc.jpg": "d813618e66e5cbe48a0c248f0104181d",
"assets/assets/images/yy/eb36c34e0ded90ae44737d84a0c10d31.jpg": "e0505294cc66552cc6a5ca70af09c9cc",
"assets/assets/images/yy/d52a6c73c4f88b50db12ada554966c1a.jpg": "6a602e7c9013a7e3966f59c9b4a40ad8",
"assets/assets/images/yy/feba574d0407b8d4166a82096efde9aa.jpg": "251d5facc1a913a5acc25078aaf4cdbb",
"assets/assets/images/yy/eeb4c831f4717d880fda6ef1c5c947f7.jpg": "0cca9ae72c26de4b620f2cb9848e8a96",
"assets/assets/images/yy/0bbcd486584d997af7031bc50c491f88.jpg": "041b2105a52aaf8719c91b3d779b40e9",
"assets/assets/images/yy/4316c759ee9a4c91ad6b2eae3a4c1997.jpg": "d9db4cd1835d1a859f55046971de2b6a",
"assets/assets/images/yy/5c840c91c531d5c5dd14eb893e4334b2.jpg": "351dc4c0565020adc7deb4b0aa0f6504",
"assets/assets/images/hamburger.svg": "5f5e214f2169843bf22c1a9388a62098",
"assets/assets/images/yy.png.webp": "692c44ab27bd72e4296ed673dd95ead4",
"assets/assets/images/circleArrowRight.svg": "a3c8918a608f575908314cf7017d2252",
"assets/assets/images/s-yy.jpg.webp": "72a37efee28ccdcccea696b715fbc440",
"assets/assets/images/im.png": "2640f9c5fa280790d4ec2a9a8174e11c",
"assets/assets/images/yy.svg": "0e9e9b791387b79617ff909a5116f2a7",
"assets/assets/images/s-si.jpg.webp": "8016c3ef2818299bb06207e7d126f2a7",
"assets/assets/images/im.png.webp": "342b4d8112c1cac9b795c009f8744202",
"assets/assets/images/shoes.svg": "3ea387c3e375d39c583c89db36826270",
"assets/assets/images/bottoms.svg": "c517bcc8ea96ddc611ee7ccb35657ea9",
"assets/assets/images/yy.png": "e4cd5c69a6360d7bf4334e96354754cb",
"assets/assets/images/tops.svg": "20817ac729040f92f53a989d2959f594",
"assets/assets/images/si.svg": "ae5b4800cc4e44e41eab551be96e1819",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
