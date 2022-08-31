'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "38d0130fa324a28770773fc4f1c53bec",
"assets/assets/images/logo_bit.png": "a77613a16b291e47bb4f51a6090ea3c7",
"assets/assets/images/logo_utec.png": "022be27dfce41eb28eab50807c3eb018",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "ddcbb0a5b7f31cf2feb13bdecb5d937e",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/pay_android/assets/ar/book_with_dark.svg": "3bd2e94aa0271599fe2577d711467049",
"assets/packages/pay_android/assets/ar/book_with_light.svg": "7bc9e07b6fbe813a929d242019cbd774",
"assets/packages/pay_android/assets/ar/checkout_with_dark.svg": "abc2f2d1a0c75079407a04ce2d4eab66",
"assets/packages/pay_android/assets/ar/checkout_with_light.svg": "de8067420c7c9be96f03df8c4812b1cb",
"assets/packages/pay_android/assets/ar/donate_with_dark.svg": "9b3a4652d4a2287982649981807ba03e",
"assets/packages/pay_android/assets/ar/donate_with_light.svg": "0b68c5047af8dc71925d9375b6887493",
"assets/packages/pay_android/assets/ar/order_with_dark.svg": "1dc8e92826a8deb4daade5d8286692ec",
"assets/packages/pay_android/assets/ar/order_with_light.svg": "de1169e4746d94650ff6f8187e56c94c",
"assets/packages/pay_android/assets/ar/pay_with_dark.svg": "285c0a00d2db2f29fa4d09841fa953e7",
"assets/packages/pay_android/assets/ar/pay_with_light.svg": "4c52bc60766c09dfdd0dfd20c1861f5f",
"assets/packages/pay_android/assets/ar/subscribe_with_dark.svg": "93fb6868df029a058934c3d87b8b7d49",
"assets/packages/pay_android/assets/ar/subscribe_with_light.svg": "3cf8996c3405dbb4618e92c5a840a8eb",
"assets/packages/pay_android/assets/bg/book_with_dark.svg": "6e4b1cde6eb8a50ff26377963aff9acf",
"assets/packages/pay_android/assets/bg/book_with_light.svg": "daf3e92c39c65a94a67e9317af0b6b3e",
"assets/packages/pay_android/assets/bg/checkout_with_dark.svg": "cc90dfd7a304dc7d1f8641b703e276ae",
"assets/packages/pay_android/assets/bg/checkout_with_light.svg": "a5baad3fa695c8162acbe7983e0fd40d",
"assets/packages/pay_android/assets/bg/donate_with_dark.svg": "d6a91582db6f9b8f13224b09b83aeb49",
"assets/packages/pay_android/assets/bg/donate_with_light.svg": "3cc4e112495819e0b4160de69b8d9770",
"assets/packages/pay_android/assets/bg/order_with_dark.svg": "33c068340d1762b3f0e6d16b28ca7a30",
"assets/packages/pay_android/assets/bg/order_with_light.svg": "fb8c50c9550ade4bba95bbe7db3aec11",
"assets/packages/pay_android/assets/bg/pay_with_dark.svg": "0a08169f3d343ce0ce9b49e972ed051a",
"assets/packages/pay_android/assets/bg/pay_with_light.svg": "b332973d8c89817d4bfa783f03122980",
"assets/packages/pay_android/assets/bg/subscribe_with_dark.svg": "1d9a3abf9f08b08d90e02999a19caae8",
"assets/packages/pay_android/assets/bg/subscribe_with_light.svg": "fed1692a2f1e06b6abab03df2ed0c223",
"assets/packages/pay_android/assets/buy_with_dark.svg": "9b6873f8f06c33dbfbcf1b5cd5ab3c96",
"assets/packages/pay_android/assets/buy_with_light.svg": "f5528e7809ce78d679e30b7821053388",
"assets/packages/pay_android/assets/ca/book_with_dark.svg": "956ba498f3cb855a602d04405530e760",
"assets/packages/pay_android/assets/ca/book_with_light.svg": "41558ae62823f4fa3286235f20eb14cd",
"assets/packages/pay_android/assets/ca/checkout_with_dark.svg": "ae5edf1049f6b52afbff1a20817c4d2f",
"assets/packages/pay_android/assets/ca/checkout_with_light.svg": "c15d085327df5026940bd56e0735dd62",
"assets/packages/pay_android/assets/ca/donate_with_dark.svg": "6fed09fb1a7c1ea53352f2a6eb4e7e19",
"assets/packages/pay_android/assets/ca/donate_with_light.svg": "b4905cd1f4fad1593a2e0de02a2fcaa4",
"assets/packages/pay_android/assets/ca/order_with_dark.svg": "da74d1942c211b2b6808e8e98344096a",
"assets/packages/pay_android/assets/ca/order_with_light.svg": "0e459d03868c384447939418324e028e",
"assets/packages/pay_android/assets/ca/pay_with_dark.svg": "e6bb2eb54c0a1034f092dc8ec43d656f",
"assets/packages/pay_android/assets/ca/pay_with_light.svg": "a6df1e2757a7ff58758f29b1a4a37515",
"assets/packages/pay_android/assets/ca/subscribe_with_dark.svg": "bc641e5045ae810b689ce9d39a604e7f",
"assets/packages/pay_android/assets/ca/subscribe_with_light.svg": "827a524eec5fcc16d0843ac092837ce2",
"assets/packages/pay_android/assets/cs/book_with_dark.svg": "de71f2de1051eb9931c5eb4d7a517c19",
"assets/packages/pay_android/assets/cs/book_with_light.svg": "efa4e1e2bf2eb7e01d8938cbfb340d72",
"assets/packages/pay_android/assets/cs/checkout_with_dark.svg": "e0ab8b71b0ca78fc5d1fc463fa213b77",
"assets/packages/pay_android/assets/cs/checkout_with_light.svg": "09e7b3f30f1f4a7705460e8e4e3076a8",
"assets/packages/pay_android/assets/cs/donate_with_dark.svg": "496e27e92914ff6a28df48125be53387",
"assets/packages/pay_android/assets/cs/donate_with_light.svg": "23ef00da027e38f79e3a84161f3b04e2",
"assets/packages/pay_android/assets/cs/order_with_dark.svg": "1711ff90691b2d9fe8e4a60018e52c92",
"assets/packages/pay_android/assets/cs/order_with_light.svg": "81386b4d990ba3a38f4584f64366d28a",
"assets/packages/pay_android/assets/cs/pay_with_dark.svg": "16f15a63c84a715319e9b08f1fb2ba73",
"assets/packages/pay_android/assets/cs/pay_with_light.svg": "388b74784dade8e1dde08b3690b1b415",
"assets/packages/pay_android/assets/cs/subscribe_with_dark.svg": "bedc56b2c0e95431c3c7b24f8c8e28b7",
"assets/packages/pay_android/assets/cs/subscribe_with_light.svg": "43eb8356aac47915acc18ba1b0dbd467",
"assets/packages/pay_android/assets/da/book_with_dark.svg": "e276fab3e4c0bc6a45cb2ee802375bfa",
"assets/packages/pay_android/assets/da/book_with_light.svg": "a64c327034f3c2a552c058c49300e93e",
"assets/packages/pay_android/assets/da/checkout_with_dark.svg": "243fc012801622e4e0dbb6acc23d03a5",
"assets/packages/pay_android/assets/da/checkout_with_light.svg": "272fae07c93dd4da5d0029ab063d85c3",
"assets/packages/pay_android/assets/da/donate_with_dark.svg": "7d760b31cee484652e73eb5b431cb010",
"assets/packages/pay_android/assets/da/donate_with_light.svg": "7d642fcc2933620913b45337e73ca443",
"assets/packages/pay_android/assets/da/order_with_dark.svg": "13fc0123303697ca2c26b24b35f86936",
"assets/packages/pay_android/assets/da/order_with_light.svg": "d34f39d4afb717c5ac98e3a82280bc33",
"assets/packages/pay_android/assets/da/pay_with_dark.svg": "bc2c1c88c24d2ce9d8defdedc85774e8",
"assets/packages/pay_android/assets/da/pay_with_light.svg": "51b9665bd666d1ec12407f109d06fd36",
"assets/packages/pay_android/assets/da/subscribe_with_dark.svg": "af15276a9a74c1151c46af7cf9504cfa",
"assets/packages/pay_android/assets/da/subscribe_with_light.svg": "f44877fac9418ea929f5426e9be0d9eb",
"assets/packages/pay_android/assets/de/book_with_dark.svg": "c0854c0082f1dae041f0fd3dbb126c7e",
"assets/packages/pay_android/assets/de/book_with_light.svg": "64a6e6d009a8dcd36a92f72e759ed9c2",
"assets/packages/pay_android/assets/de/checkout_with_dark.svg": "530cbe4078ca41a513cfba1508b744bd",
"assets/packages/pay_android/assets/de/checkout_with_light.svg": "e6d584c494836b956667c677dd388a55",
"assets/packages/pay_android/assets/de/donate_with_dark.svg": "423d427f53d49c2509612ab055e1a293",
"assets/packages/pay_android/assets/de/donate_with_light.svg": "e8c6ecf7386ebda379c5b9858d52c6bf",
"assets/packages/pay_android/assets/de/order_with_dark.svg": "e098e4d5cd84b5d8c6b435e70d7e3bf9",
"assets/packages/pay_android/assets/de/order_with_light.svg": "f0bfd818ea9118bcca8b6763d413f0b7",
"assets/packages/pay_android/assets/de/pay_with_dark.svg": "a7732c7d077e937552d2df40ea1bf970",
"assets/packages/pay_android/assets/de/pay_with_light.svg": "76d6f887382a44db8839845d3478b508",
"assets/packages/pay_android/assets/de/subscribe_with_dark.svg": "b0e36fa1790d765b5c9e57755a3222e2",
"assets/packages/pay_android/assets/de/subscribe_with_light.svg": "d28666ad2b658f489256968cefd44541",
"assets/packages/pay_android/assets/el/book_with_dark.svg": "c598448b1e1b50a8ac2aeebb3e1a771c",
"assets/packages/pay_android/assets/el/book_with_light.svg": "907fd7fd58571084134118d9d793c59f",
"assets/packages/pay_android/assets/el/checkout_with_dark.svg": "d63c0e5749cb8c2d04609244fc60cb3f",
"assets/packages/pay_android/assets/el/checkout_with_light.svg": "aaa4947ec01e9934acc97a4f2cb48bf2",
"assets/packages/pay_android/assets/el/donate_with_dark.svg": "77d5c83ec9baa59ec6b826e6f1e121fc",
"assets/packages/pay_android/assets/el/donate_with_light.svg": "3e32436da2f232c1f96fa85d8824da45",
"assets/packages/pay_android/assets/el/order_with_dark.svg": "57196875b348a00cef51598f54d68473",
"assets/packages/pay_android/assets/el/order_with_light.svg": "0b829894d1cbeff5c85af0e10563ea00",
"assets/packages/pay_android/assets/el/pay_with_dark.svg": "dfdbabdb3ba4aad4d4412942cc47443b",
"assets/packages/pay_android/assets/el/pay_with_light.svg": "10df947a6b70c7c1a4ceb9954fbc135b",
"assets/packages/pay_android/assets/el/subscribe_with_dark.svg": "428d58b309eca984a72226eeea17f736",
"assets/packages/pay_android/assets/el/subscribe_with_light.svg": "311452c7d7c564d45afe873894540cc7",
"assets/packages/pay_android/assets/en/book_with_dark.svg": "7a9cf8a2509e22162684e3a81a7a52e5",
"assets/packages/pay_android/assets/en/book_with_light.svg": "333b989bb31d925e98f52a1bdc6949fc",
"assets/packages/pay_android/assets/en/checkout_with_dark.svg": "3959d54891a44154d1e0a97571d1ab50",
"assets/packages/pay_android/assets/en/checkout_with_light.svg": "46e1e01e4072cffc9179799d79f303d0",
"assets/packages/pay_android/assets/en/donate_with_dark.svg": "771daaa5b9c023dde8ef71aba7dc83cd",
"assets/packages/pay_android/assets/en/donate_with_light.svg": "f67e4d4cbda5333662a4593fa38f6ba2",
"assets/packages/pay_android/assets/en/order_with_dark.svg": "16a5a4e1d0c2c04e045a471764c766f3",
"assets/packages/pay_android/assets/en/order_with_light.svg": "002cb1bb139a54f8ee975d8b773fd7fe",
"assets/packages/pay_android/assets/en/pay_with_dark.svg": "5499e643b7eb946d9d1993c1769ffc46",
"assets/packages/pay_android/assets/en/pay_with_light.svg": "80b00ed93f04bf17b4c405377a72ef48",
"assets/packages/pay_android/assets/en/subscribe_with_dark.svg": "e2eb024d9d8bacd395a398b3f8f2996f",
"assets/packages/pay_android/assets/en/subscribe_with_light.svg": "ab45c2809a774e1184d6d2617e8ecfa9",
"assets/packages/pay_android/assets/es/book_with_dark.svg": "ec8fa43c794b51913fcc165365f22787",
"assets/packages/pay_android/assets/es/book_with_light.svg": "3aca2431604fbaf1b9a4b8e69ee1542d",
"assets/packages/pay_android/assets/es/checkout_with_dark.svg": "a34c481b9226edf17704c1727f0be30d",
"assets/packages/pay_android/assets/es/checkout_with_light.svg": "ad66a24be458e418c52efe67b9e66409",
"assets/packages/pay_android/assets/es/donate_with_dark.svg": "617795fe79db0c3129fa35ea77ea3cc7",
"assets/packages/pay_android/assets/es/donate_with_light.svg": "4042f4e6a33371686087fa461c106531",
"assets/packages/pay_android/assets/es/order_with_dark.svg": "59123cc1d769752cf8c23d632cd1b000",
"assets/packages/pay_android/assets/es/order_with_light.svg": "bd060d59e3a22c856639941256d1d725",
"assets/packages/pay_android/assets/es/pay_with_dark.svg": "aa6a4f76d58ce84fc8d42ccbea5fe908",
"assets/packages/pay_android/assets/es/pay_with_light.svg": "0742e4c96eeba1064a19826eaaf831ca",
"assets/packages/pay_android/assets/es/subscribe_with_dark.svg": "8a4ab2609c9e93e496a53d0830e73540",
"assets/packages/pay_android/assets/es/subscribe_with_light.svg": "50e048c6be675c5431ccc4b12568e539",
"assets/packages/pay_android/assets/et/book_with_dark.svg": "d44941c7d2f1e9bd020cdcf7995c6aa2",
"assets/packages/pay_android/assets/et/book_with_light.svg": "c743fb69306bb4692d5697d4318f9a93",
"assets/packages/pay_android/assets/et/checkout_with_dark.svg": "8bf6cfc9bf0ec60cd9361e89c3dab098",
"assets/packages/pay_android/assets/et/checkout_with_light.svg": "46f373bca8f43dee103de105d0b2e461",
"assets/packages/pay_android/assets/et/donate_with_dark.svg": "ad4f8fcda9f17b13bc79a9dfbb01e09b",
"assets/packages/pay_android/assets/et/donate_with_light.svg": "155d13f4608bb5b35b0e22b0c0d4442e",
"assets/packages/pay_android/assets/et/order_with_dark.svg": "6cf38ceae595c22993016f5db167057e",
"assets/packages/pay_android/assets/et/order_with_light.svg": "c79470f730ed8d169c5fbe0b08627960",
"assets/packages/pay_android/assets/et/pay_with_dark.svg": "4d310f268e11baa752004c1eba215856",
"assets/packages/pay_android/assets/et/pay_with_light.svg": "22bd7a3a31e780e849859f476c0b4bb1",
"assets/packages/pay_android/assets/et/subscribe_with_dark.svg": "38b0b91aebd7b25365d552327123a5d4",
"assets/packages/pay_android/assets/et/subscribe_with_light.svg": "959b019b50837f569daec6701831438c",
"assets/packages/pay_android/assets/fi/book_with_dark.svg": "4fe6f403e05b46b39d1cc2c868bc0388",
"assets/packages/pay_android/assets/fi/book_with_light.svg": "6676034a57cd00876042164a512adf2a",
"assets/packages/pay_android/assets/fi/checkout_with_dark.svg": "7f0cfd546dfc90079eff9ca36d3003ef",
"assets/packages/pay_android/assets/fi/checkout_with_light.svg": "b8c402e578ce18be0de23ffcba316066",
"assets/packages/pay_android/assets/fi/donate_with_dark.svg": "5c73ffa3951b94b3efe1863bbd9f72cb",
"assets/packages/pay_android/assets/fi/donate_with_light.svg": "49d05e93a59ba16838799411d6d49076",
"assets/packages/pay_android/assets/fi/order_with_dark.svg": "3dae001513a132fd49cc161b138c63a6",
"assets/packages/pay_android/assets/fi/order_with_light.svg": "360d83bc8d2c5ab4aa36eb71599dc5f2",
"assets/packages/pay_android/assets/fi/pay_with_dark.svg": "777b5ae1c225ee454a465c79c94dd4ae",
"assets/packages/pay_android/assets/fi/pay_with_light.svg": "2c7535d87feeabeed0bb24e8959309d9",
"assets/packages/pay_android/assets/fi/subscribe_with_dark.svg": "0dec31a7f20fd2d4d6384598b4117aa8",
"assets/packages/pay_android/assets/fi/subscribe_with_light.svg": "00c4cc9a526cee2c54c3ae888456ad0b",
"assets/packages/pay_android/assets/fr/book_with_dark.svg": "be18bfa2f1aaefc9ab209e83d4f3d83a",
"assets/packages/pay_android/assets/fr/book_with_light.svg": "bede0083f2efe996dadc32fdb586638c",
"assets/packages/pay_android/assets/fr/checkout_with_dark.svg": "0d067b44ff219328d3c1f1a0600e65e3",
"assets/packages/pay_android/assets/fr/checkout_with_light.svg": "9226f73ff98dcff8e693f86d69aba1af",
"assets/packages/pay_android/assets/fr/donate_with_dark.svg": "7c5d3e9a6b478ebd47bd41d4407f3a9a",
"assets/packages/pay_android/assets/fr/donate_with_light.svg": "29aea6080c5467544059c3824b5824e8",
"assets/packages/pay_android/assets/fr/order_with_dark.svg": "5f4be7c8d8a698f07a3b30764f3d11dd",
"assets/packages/pay_android/assets/fr/order_with_light.svg": "5251c52188cfcf3435a32d2a5e2c0b04",
"assets/packages/pay_android/assets/fr/pay_with_dark.svg": "26bba4a0b61c1bbaaa0d2595f1560453",
"assets/packages/pay_android/assets/fr/pay_with_light.svg": "865098918611dde8a361f41413f702be",
"assets/packages/pay_android/assets/fr/subscribe_with_dark.svg": "f94b954086b1a13bb61dba874f55df3e",
"assets/packages/pay_android/assets/fr/subscribe_with_light.svg": "f8429ab5e91d871aa22d2c771b64a65a",
"assets/packages/pay_android/assets/gpay_logo_dark.svg": "3564204149c26f43d43cb236d4ff97a3",
"assets/packages/pay_android/assets/gpay_logo_light.svg": "abae2ee3616a428a70cc20584b3e00ce",
"assets/packages/pay_android/assets/hr/book_with_dark.svg": "f3b060ebcc414ccd27b628e8bfe06e5b",
"assets/packages/pay_android/assets/hr/book_with_light.svg": "0931e6eaf07931e2b6142883d65b618f",
"assets/packages/pay_android/assets/hr/checkout_with_dark.svg": "3fda572f10d1bcbf148a66deb487d5d5",
"assets/packages/pay_android/assets/hr/checkout_with_light.svg": "547cc155b5812bb665b49fba0b252c40",
"assets/packages/pay_android/assets/hr/donate_with_dark.svg": "80e1a5a284b79274c7ce4f4467d66b98",
"assets/packages/pay_android/assets/hr/donate_with_light.svg": "e1d8fb6351d2113bc30ec04857c7368b",
"assets/packages/pay_android/assets/hr/order_with_dark.svg": "c69cc70419a1bbac329bcd46e5ecbc5c",
"assets/packages/pay_android/assets/hr/order_with_light.svg": "87fd04239ce277bbe5a2034bede12ec7",
"assets/packages/pay_android/assets/hr/pay_with_dark.svg": "edb569f29de56847f8dee540fc5520a6",
"assets/packages/pay_android/assets/hr/pay_with_light.svg": "e50fbb4ebe0fbef2c0b96d4afd1c2391",
"assets/packages/pay_android/assets/hr/subscribe_with_dark.svg": "c7ad4d78f73306da0e9e31f42f3b537a",
"assets/packages/pay_android/assets/hr/subscribe_with_light.svg": "e3b7759ea76e200282e4df38b2544fce",
"assets/packages/pay_android/assets/id/book_with_dark.svg": "e76f991d732a623ab43763900fba5dd7",
"assets/packages/pay_android/assets/id/book_with_light.svg": "17066c9cdcbf7bb79b92f26dfb7fa376",
"assets/packages/pay_android/assets/id/checkout_with_dark.svg": "29eb46ee7ee00281f9403e1d550e197b",
"assets/packages/pay_android/assets/id/checkout_with_light.svg": "db0e8ad5e81d967cd5e0b1df8cdbc1d4",
"assets/packages/pay_android/assets/id/donate_with_dark.svg": "5e2bbe61dca9fb1049905a86f0d92052",
"assets/packages/pay_android/assets/id/donate_with_light.svg": "35a29f1131d3c7ad1c1a3b28e1280cbc",
"assets/packages/pay_android/assets/id/order_with_dark.svg": "ea49860db2e489a935031644715d63e4",
"assets/packages/pay_android/assets/id/order_with_light.svg": "69c10e719ecffe322e4cf2d05feaa458",
"assets/packages/pay_android/assets/id/pay_with_dark.svg": "0c8a3131e9a385aae05aacae22dec09f",
"assets/packages/pay_android/assets/id/pay_with_light.svg": "7968f48de113615104b9d37268cadf52",
"assets/packages/pay_android/assets/id/subscribe_with_dark.svg": "8809dddf5ccafd11b3aa8f885c9c2b07",
"assets/packages/pay_android/assets/id/subscribe_with_light.svg": "d6991689f4a65d8b4e93846aa887905f",
"assets/packages/pay_android/assets/it/book_with_dark.svg": "34da39827c60b5e723f4721c80f24b1b",
"assets/packages/pay_android/assets/it/book_with_light.svg": "ffeefa1aa815271c026df2245d78d419",
"assets/packages/pay_android/assets/it/checkout_with_dark.svg": "ac58c3079101439aa3fb98beef639f75",
"assets/packages/pay_android/assets/it/checkout_with_light.svg": "f3c9c34efd3e467ebfdf3729e5089546",
"assets/packages/pay_android/assets/it/donate_with_dark.svg": "bbd24e42ce157126aadae9c223d0f59b",
"assets/packages/pay_android/assets/it/donate_with_light.svg": "5dbe1b539543ab46dd535ccc4382cefe",
"assets/packages/pay_android/assets/it/order_with_dark.svg": "88fc2f5ec08ad5da7dbcb9901befd24d",
"assets/packages/pay_android/assets/it/order_with_light.svg": "ae56e860a2ff9cc8a6b2ce1154401d58",
"assets/packages/pay_android/assets/it/pay_with_dark.svg": "cf57363cf13ce04aea239a2ee3084d6d",
"assets/packages/pay_android/assets/it/pay_with_light.svg": "e0020f5f762d5a727a0c31a56d0adfdd",
"assets/packages/pay_android/assets/it/subscribe_with_dark.svg": "4b1dfe12f3b819213a092ab11a7205ab",
"assets/packages/pay_android/assets/it/subscribe_with_light.svg": "219d2dda210c630313f7a3bf99bf19ba",
"assets/packages/pay_android/assets/ja/book_with_dark.svg": "cba0a01e6c573aad842c98a6e95e5725",
"assets/packages/pay_android/assets/ja/book_with_light.svg": "ed7ae11af46092e9d2633ca558539163",
"assets/packages/pay_android/assets/ja/checkout_with_dark.svg": "8057bfd122a70f5a3df410ca05b50209",
"assets/packages/pay_android/assets/ja/checkout_with_light.svg": "404b091b3965477c43ba80ec96ff393e",
"assets/packages/pay_android/assets/ja/donate_with_dark.svg": "91ec71f36f83ba9f2b76f7ff7a71c93e",
"assets/packages/pay_android/assets/ja/donate_with_light.svg": "1d57e54e5d3cd9f174823c1eb243c3b6",
"assets/packages/pay_android/assets/ja/order_with_dark.svg": "3afc1df5d1b72dd77cf5f2badd4248f7",
"assets/packages/pay_android/assets/ja/order_with_light.svg": "1f7c4c35ee77871f2865f13307ed8230",
"assets/packages/pay_android/assets/ja/pay_with_dark.svg": "a9073a26efa3309851c47f519a931908",
"assets/packages/pay_android/assets/ja/pay_with_light.svg": "5cd2c575e2264cdcc61cf078b0786840",
"assets/packages/pay_android/assets/ja/subscribe_with_dark.svg": "09211fdfc2bca221f139e65a47543cd0",
"assets/packages/pay_android/assets/ja/subscribe_with_light.svg": "d371ba2d7f01baeed5a93cda650c6509",
"assets/packages/pay_android/assets/ko/book_with_dark.svg": "b81ebc94ed31dde1b8113ade46ac70cd",
"assets/packages/pay_android/assets/ko/book_with_light.svg": "e77e0bf5669b25d539ae243019ce5c03",
"assets/packages/pay_android/assets/ko/checkout_with_dark.svg": "5b870a830e4861024b46e0332359ad46",
"assets/packages/pay_android/assets/ko/checkout_with_light.svg": "b87ee15292b4a7043e06264e0203c115",
"assets/packages/pay_android/assets/ko/donate_with_dark.svg": "635136cbe42a69b9cc6fe4f882e97ba6",
"assets/packages/pay_android/assets/ko/donate_with_light.svg": "f34aecf3f2e4987387702e19f11716c0",
"assets/packages/pay_android/assets/ko/order_with_dark.svg": "490138e6920b0d0a678ef351a808481b",
"assets/packages/pay_android/assets/ko/order_with_light.svg": "7ee7b361653946851b3940701979bf02",
"assets/packages/pay_android/assets/ko/pay_with_dark.svg": "9a30fd5d47a7257b9629c6d77a228dd8",
"assets/packages/pay_android/assets/ko/pay_with_light.svg": "69da08b7d4b0e6657c333cb26defe4be",
"assets/packages/pay_android/assets/ko/subscribe_with_dark.svg": "e178865a001ba63ca911359dc1c5c6d1",
"assets/packages/pay_android/assets/ko/subscribe_with_light.svg": "13e6fd735bae73c03d8be6d71326f205",
"assets/packages/pay_android/assets/ms/book_with_dark.svg": "cdd2c3f23c2fc5562e113032e6b1a2ff",
"assets/packages/pay_android/assets/ms/book_with_light.svg": "2c99482ccc06f81847db40afe645c258",
"assets/packages/pay_android/assets/ms/checkout_with_dark.svg": "73bde2cd28620c4953647d1ca0b37055",
"assets/packages/pay_android/assets/ms/checkout_with_light.svg": "955abd9dd63ca87647d9f201de909843",
"assets/packages/pay_android/assets/ms/donate_with_dark.svg": "b5f8c39c7a9c6b0e0a17eb28b83e4b69",
"assets/packages/pay_android/assets/ms/donate_with_light.svg": "02d4a735bd0266a5a850b9b722546c4d",
"assets/packages/pay_android/assets/ms/order_with_dark.svg": "93c23e107607984c4185e110610c7530",
"assets/packages/pay_android/assets/ms/order_with_light.svg": "390883ab8479a440ab485e0b3a9cf87f",
"assets/packages/pay_android/assets/ms/pay_with_dark.svg": "e5c466b739ebce5c023f1e0f2e127665",
"assets/packages/pay_android/assets/ms/pay_with_light.svg": "a711a5f81f09264b8574191c4a0f1c65",
"assets/packages/pay_android/assets/ms/subscribe_with_dark.svg": "8273f2049db37de19b0a2dfd0467acfe",
"assets/packages/pay_android/assets/ms/subscribe_with_light.svg": "26c837aa6f1e9b73af3c59b70c522ce9",
"assets/packages/pay_android/assets/nl/book_with_dark.svg": "9cf10b5d875d46b56a7316dceaee1cf6",
"assets/packages/pay_android/assets/nl/book_with_light.svg": "5c4a496a1c04491d7787992af1426002",
"assets/packages/pay_android/assets/nl/checkout_with_dark.svg": "d1996a7eb48e83a69bd69eb6eb5ed955",
"assets/packages/pay_android/assets/nl/checkout_with_light.svg": "bc3485cfb0d967633af1c4f993c05647",
"assets/packages/pay_android/assets/nl/donate_with_dark.svg": "0941658c0423b8223186c176f087cb96",
"assets/packages/pay_android/assets/nl/donate_with_light.svg": "0ffd414a4152526193e0e833ec76312e",
"assets/packages/pay_android/assets/nl/order_with_dark.svg": "0e025f069f5b33d276f600d80bb7cfc5",
"assets/packages/pay_android/assets/nl/order_with_light.svg": "9389c7b886ee19003f27d1c8f19a9fdb",
"assets/packages/pay_android/assets/nl/pay_with_dark.svg": "c47d8cf8741601f6b88982abedf540fd",
"assets/packages/pay_android/assets/nl/pay_with_light.svg": "70b339a937fc55945fe9d98b7cf6a021",
"assets/packages/pay_android/assets/nl/subscribe_with_dark.svg": "6834c0b7369ec6be2ead0183fbbf7fa5",
"assets/packages/pay_android/assets/nl/subscribe_with_light.svg": "aaf9745d30c1ab69d304392c010f5e66",
"assets/packages/pay_android/assets/no/book_with_dark.svg": "8d54b48c81493554aff44e67232fb8dd",
"assets/packages/pay_android/assets/no/book_with_light.svg": "0d56a2330a4417e4d6d15de43a4b2cbe",
"assets/packages/pay_android/assets/no/checkout_with_dark.svg": "ef19e69d08670fdff3801e3287d36db3",
"assets/packages/pay_android/assets/no/checkout_with_light.svg": "f90177be82434db2abe3affcbc64502f",
"assets/packages/pay_android/assets/no/donate_with_dark.svg": "c0db134b295389640768a3be9497ef15",
"assets/packages/pay_android/assets/no/donate_with_light.svg": "4b950706fc06016953d2e571eda43450",
"assets/packages/pay_android/assets/no/order_with_dark.svg": "07016503c82510fe3f630d657d068c03",
"assets/packages/pay_android/assets/no/order_with_light.svg": "cdd40573f93c9d916d2169fc9ce8dac2",
"assets/packages/pay_android/assets/no/pay_with_dark.svg": "00ab8ea6e2774c406cbef108b1523bce",
"assets/packages/pay_android/assets/no/pay_with_light.svg": "10f8bd7ac4425acdc3b7e41af16aa9e8",
"assets/packages/pay_android/assets/no/subscribe_with_dark.svg": "1d3a39143e44dfe656be5f1964d140a3",
"assets/packages/pay_android/assets/no/subscribe_with_light.svg": "4722370743326f202ebd42b813b287be",
"assets/packages/pay_android/assets/pl/book_with_dark.svg": "2894d572f23b7b526ebd2199b5e42f50",
"assets/packages/pay_android/assets/pl/book_with_light.svg": "e3d76d08ef81c528595566cb30f64f7b",
"assets/packages/pay_android/assets/pl/checkout_with_dark.svg": "dce3459c7b5218f7777bbfea5f757e8b",
"assets/packages/pay_android/assets/pl/checkout_with_light.svg": "1bf4bdef1b22e4d94e4ff63f921ee082",
"assets/packages/pay_android/assets/pl/donate_with_dark.svg": "18df87f9dc2ec56fc5452faf62b47b4f",
"assets/packages/pay_android/assets/pl/donate_with_light.svg": "d8eb932b73de9facb8a53abfaf85ff3c",
"assets/packages/pay_android/assets/pl/order_with_dark.svg": "b6e356acb9e0496146c50f452359741a",
"assets/packages/pay_android/assets/pl/order_with_light.svg": "7378c64733e2b08eabd489590ca83837",
"assets/packages/pay_android/assets/pl/pay_with_dark.svg": "a885c3216a3d80953f8534a3aef81a5f",
"assets/packages/pay_android/assets/pl/pay_with_light.svg": "6497e6962d2dc0a8136d9d0dc70a3489",
"assets/packages/pay_android/assets/pl/subscribe_with_dark.svg": "b706868e61f92debf0bd8f97e40935ee",
"assets/packages/pay_android/assets/pl/subscribe_with_light.svg": "ba4b97f739fc0dcb7109e509d0eb1733",
"assets/packages/pay_android/assets/pt/book_with_dark.svg": "419917c9fa350ed55848690a486b0e28",
"assets/packages/pay_android/assets/pt/book_with_light.svg": "cf76883a20b891e5044b5e21e8a973b3",
"assets/packages/pay_android/assets/pt/checkout_with_dark.svg": "f4bb4db1759cbd1077715a947006e653",
"assets/packages/pay_android/assets/pt/checkout_with_light.svg": "5857b1f6cd2c1327fe470b5aad56fa01",
"assets/packages/pay_android/assets/pt/donate_with_dark.svg": "bb4227174b41da23abb0c6bdc08e20e2",
"assets/packages/pay_android/assets/pt/donate_with_light.svg": "8123e0d7a86efb4aec6573b75395dcdb",
"assets/packages/pay_android/assets/pt/order_with_dark.svg": "96b0aae80ce9b94e58a3711d9a299fd3",
"assets/packages/pay_android/assets/pt/order_with_light.svg": "81775bbd7647e2f6b3bf849ab12a8374",
"assets/packages/pay_android/assets/pt/pay_with_dark.svg": "d92f26b9c41cbe05e232a6c3c44564ca",
"assets/packages/pay_android/assets/pt/pay_with_light.svg": "577e96b023de7dcae3c5dbb929ee2616",
"assets/packages/pay_android/assets/pt/subscribe_with_dark.svg": "84f71b4a73948fed28f573d7601f77d4",
"assets/packages/pay_android/assets/pt/subscribe_with_light.svg": "5d5b2fc7bb60aaa1dd249e6851ac588f",
"assets/packages/pay_android/assets/ru/book_with_dark.svg": "9ceb0f2603d23ac9f5a26a92fd802af0",
"assets/packages/pay_android/assets/ru/book_with_light.svg": "3e870af1a9493238b4a56f3dc0de88e7",
"assets/packages/pay_android/assets/ru/checkout_with_dark.svg": "8d833dd4bf328e6da21367d279de0022",
"assets/packages/pay_android/assets/ru/checkout_with_light.svg": "cd50493ea386c3bfd602b83092093150",
"assets/packages/pay_android/assets/ru/donate_with_dark.svg": "5949ad6885c128b3b4cf3acff9510418",
"assets/packages/pay_android/assets/ru/donate_with_light.svg": "60b1e377b26574733a56aa7a86fe8de2",
"assets/packages/pay_android/assets/ru/order_with_dark.svg": "106ef0b66d0e3c1ffd95af4ccea9da44",
"assets/packages/pay_android/assets/ru/order_with_light.svg": "5d05f2cb8a82556fd5462e7c13910057",
"assets/packages/pay_android/assets/ru/pay_with_dark.svg": "2f16ca6a9f6ee33807c20ac7c19f93bc",
"assets/packages/pay_android/assets/ru/pay_with_light.svg": "6bf8cfe1624907965303697c006715ae",
"assets/packages/pay_android/assets/ru/subscribe_with_dark.svg": "13567975aa2404f0e20375f365202149",
"assets/packages/pay_android/assets/ru/subscribe_with_light.svg": "7716e853eb09f4810f0d3b19695be319",
"assets/packages/pay_android/assets/sk/book_with_dark.svg": "ae9095cb0df57c3d9b94e97202f7b281",
"assets/packages/pay_android/assets/sk/book_with_light.svg": "9a9d5a2a327968402ef791cc912509e0",
"assets/packages/pay_android/assets/sk/checkout_with_dark.svg": "433247f42e412cd15bde220f40abb4cf",
"assets/packages/pay_android/assets/sk/checkout_with_light.svg": "856c3cfe1fa603ccb5d775a85b595218",
"assets/packages/pay_android/assets/sk/donate_with_dark.svg": "c0d4e265d9ec92a18ad089ddcc1ba94a",
"assets/packages/pay_android/assets/sk/donate_with_light.svg": "c6946e540c3322e5f872bd666a326857",
"assets/packages/pay_android/assets/sk/order_with_dark.svg": "6385eaade7a5ae9cd20aa9bc3a457074",
"assets/packages/pay_android/assets/sk/order_with_light.svg": "ab6435e2af425d52111cfca3eaa5be67",
"assets/packages/pay_android/assets/sk/pay_with_dark.svg": "ab08bfd1946fc34152f401e0fb29332e",
"assets/packages/pay_android/assets/sk/pay_with_light.svg": "7ee02b63389cfd25075b6f557b1387ac",
"assets/packages/pay_android/assets/sk/subscribe_with_dark.svg": "487831462f2594b22cf25869614408a2",
"assets/packages/pay_android/assets/sk/subscribe_with_light.svg": "9cdeed41ee05fedb2ccebea8afadeadd",
"assets/packages/pay_android/assets/sl/book_with_dark.svg": "f6fcf61d346bb895374e49130d9f8cfe",
"assets/packages/pay_android/assets/sl/book_with_light.svg": "b11c72cd103a797250e921931b66a960",
"assets/packages/pay_android/assets/sl/checkout_with_dark.svg": "fc82e7f5279d78533147fb6016d743b7",
"assets/packages/pay_android/assets/sl/checkout_with_light.svg": "727b7651bc9c6d1aa30c2e82d7f6d208",
"assets/packages/pay_android/assets/sl/donate_with_dark.svg": "b909f0bec21bdec558fc4b84e6bb32b8",
"assets/packages/pay_android/assets/sl/donate_with_light.svg": "7f0e43ba8a703f48e8195b68bd0d4e93",
"assets/packages/pay_android/assets/sl/order_with_dark.svg": "134438a581c6ecb33cc4f8565767523c",
"assets/packages/pay_android/assets/sl/order_with_light.svg": "cd2f02e812c60bc84c8525663f50ae83",
"assets/packages/pay_android/assets/sl/pay_with_dark.svg": "c7cddaada386df58279b4fc6f20578af",
"assets/packages/pay_android/assets/sl/pay_with_light.svg": "732fb265ab0ce78394e4dde950e7c85e",
"assets/packages/pay_android/assets/sl/subscribe_with_dark.svg": "ad6c0766f3fb6a5e9470fb97c5c49059",
"assets/packages/pay_android/assets/sl/subscribe_with_light.svg": "09303fe49857acf4d66db45639ec576d",
"assets/packages/pay_android/assets/sr/book_with_dark.svg": "f39f65c17a725cf786e96d63acf91936",
"assets/packages/pay_android/assets/sr/book_with_light.svg": "bfdafdc1b94783ae10d636903261e20a",
"assets/packages/pay_android/assets/sr/checkout_with_dark.svg": "cdb38a7a68a8602d5341a5bc189e3279",
"assets/packages/pay_android/assets/sr/checkout_with_light.svg": "2a8de5dfd963b37c7a328639f19ee0b3",
"assets/packages/pay_android/assets/sr/donate_with_dark.svg": "1b0ac53447313c2497612f7d7347ab5e",
"assets/packages/pay_android/assets/sr/donate_with_light.svg": "34ea6b81effa46b0df5d9f8c36f31d9c",
"assets/packages/pay_android/assets/sr/order_with_dark.svg": "5a9aea3ef368c74457c3409df7f72335",
"assets/packages/pay_android/assets/sr/order_with_light.svg": "a85195b49b052b8f803fafc02695c275",
"assets/packages/pay_android/assets/sr/pay_with_dark.svg": "653c92de32641a236519c309934fd192",
"assets/packages/pay_android/assets/sr/pay_with_light.svg": "60f85a9d9ee87aaccda46062d992d952",
"assets/packages/pay_android/assets/sr/subscribe_with_dark.svg": "f25ef7180352ec4dd1e830b022165128",
"assets/packages/pay_android/assets/sr/subscribe_with_light.svg": "96a1e71f495bca00a6d136f5bf059937",
"assets/packages/pay_android/assets/sv/book_with_dark.svg": "ca6944f9ecb039760c2c1ec81869e8d7",
"assets/packages/pay_android/assets/sv/book_with_light.svg": "0bbb28c73696db48d3e65a73b0a1626e",
"assets/packages/pay_android/assets/sv/checkout_with_dark.svg": "53e7e3d0bbd7ead6597af15718bea234",
"assets/packages/pay_android/assets/sv/checkout_with_light.svg": "192388b1e3fc232335dea8954b9a50ed",
"assets/packages/pay_android/assets/sv/donate_with_dark.svg": "5e7fe300de4a910f13387ca0efd3b414",
"assets/packages/pay_android/assets/sv/donate_with_light.svg": "7cd44dc5432456e4c04342673c6da514",
"assets/packages/pay_android/assets/sv/order_with_dark.svg": "bc67e49d84712ffedf346b87456895bf",
"assets/packages/pay_android/assets/sv/order_with_light.svg": "b7c3fedf6dd06814f712c79e6086bc08",
"assets/packages/pay_android/assets/sv/pay_with_dark.svg": "b1ba4a6643bf9ed444f269d7c77aa491",
"assets/packages/pay_android/assets/sv/pay_with_light.svg": "32b311a96183131da1a37e851e201b18",
"assets/packages/pay_android/assets/sv/subscribe_with_dark.svg": "375e0494adbe84894c93b6c51aaee9f1",
"assets/packages/pay_android/assets/sv/subscribe_with_light.svg": "4ca255bf385bd2b6eea1cecd5589a618",
"assets/packages/pay_android/assets/th/book_with_dark.svg": "4269913a9912199551cdd4695e2501f2",
"assets/packages/pay_android/assets/th/book_with_light.svg": "d23370867f6836501a7cf4fb6af68666",
"assets/packages/pay_android/assets/th/checkout_with_dark.svg": "8774b54a2184a1299586e89cbe69101c",
"assets/packages/pay_android/assets/th/checkout_with_light.svg": "b7397dfeff11c716a3f44642125335ec",
"assets/packages/pay_android/assets/th/donate_with_dark.svg": "473f070c74c770ac40adbff7c352577e",
"assets/packages/pay_android/assets/th/donate_with_light.svg": "af3a6500cb397f631cf50a99fab5a880",
"assets/packages/pay_android/assets/th/order_with_dark.svg": "ccd992d0478caf4894844bf43d602574",
"assets/packages/pay_android/assets/th/order_with_light.svg": "a7645d900b78daae8d0a21b367713b93",
"assets/packages/pay_android/assets/th/pay_with_dark.svg": "64bd1fa89cbb15d89bd3d61775febdd5",
"assets/packages/pay_android/assets/th/pay_with_light.svg": "cee02fd16f07ccd498abfb0c26e9cc50",
"assets/packages/pay_android/assets/th/subscribe_with_dark.svg": "e77d73b1386a74635cb837610f746304",
"assets/packages/pay_android/assets/th/subscribe_with_light.svg": "5f7d11baa49ff581e163d73c12230101",
"assets/packages/pay_android/assets/tr/book_with_dark.svg": "4d010d5c18943b2238e6349a41e3bf05",
"assets/packages/pay_android/assets/tr/book_with_light.svg": "23123295edeba6c5b661939513143295",
"assets/packages/pay_android/assets/tr/checkout_with_dark.svg": "b8a4ec4456a9d47be542616332d3fc0b",
"assets/packages/pay_android/assets/tr/checkout_with_light.svg": "03864f3a896521b2b63aa7c474ec5fa2",
"assets/packages/pay_android/assets/tr/donate_with_dark.svg": "8c83a67e4eb76b7440d863885c7ec4ee",
"assets/packages/pay_android/assets/tr/donate_with_light.svg": "b5f8159e82372562c44d0cfe51277990",
"assets/packages/pay_android/assets/tr/order_with_dark.svg": "b20a2ae2607a5718d2e793f30a4f076d",
"assets/packages/pay_android/assets/tr/order_with_light.svg": "f84aca1c7be65dc51cac5028627d589b",
"assets/packages/pay_android/assets/tr/pay_with_dark.svg": "2b2284bf0ca3f69cdaa08c80eb37d14b",
"assets/packages/pay_android/assets/tr/pay_with_light.svg": "25c843bb039521e159d6daf1a8cb43a9",
"assets/packages/pay_android/assets/tr/subscribe_with_dark.svg": "420916f9ba1896599fa8e52095384e47",
"assets/packages/pay_android/assets/tr/subscribe_with_light.svg": "fb098c04009487c915f9138304d8a376",
"assets/packages/pay_android/assets/uk/book_with_dark.svg": "35afc997a1a4a1bfac5add9c2838b501",
"assets/packages/pay_android/assets/uk/book_with_light.svg": "d6c9b9fbb4e59ed7fa3537b4a09009c4",
"assets/packages/pay_android/assets/uk/checkout_with_dark.svg": "7652fe458ec5c733b3dc09e5efca742a",
"assets/packages/pay_android/assets/uk/checkout_with_light.svg": "4de4d92ec951e83bb1a4e14098d40338",
"assets/packages/pay_android/assets/uk/donate_with_dark.svg": "2b3f6c85039debe75b5e8747c1ba5668",
"assets/packages/pay_android/assets/uk/donate_with_light.svg": "b79c9ab5d7a7968d28dc1c94905cef5e",
"assets/packages/pay_android/assets/uk/order_with_dark.svg": "4499a868f4289451281112d00f3748c5",
"assets/packages/pay_android/assets/uk/order_with_light.svg": "446db75aae5da31ce7732b23b66c2396",
"assets/packages/pay_android/assets/uk/pay_with_dark.svg": "940cd40c9de84b46d9dc76880953ef46",
"assets/packages/pay_android/assets/uk/pay_with_light.svg": "3b1f9fb7f301699c61d36fd790c44ed5",
"assets/packages/pay_android/assets/uk/subscribe_with_dark.svg": "783a6ebf8f084c50a4cb7782fe9862e0",
"assets/packages/pay_android/assets/uk/subscribe_with_light.svg": "d668801feabd0c958acf31c4065410fd",
"assets/packages/pay_android/assets/zh/book_with_dark.svg": "620e07f721e1960af0920e4b005110e5",
"assets/packages/pay_android/assets/zh/book_with_light.svg": "40381b9e13482f7581787e561074254c",
"assets/packages/pay_android/assets/zh/checkout_with_dark.svg": "599c3bc42471a1e1b2f63672c8930b5c",
"assets/packages/pay_android/assets/zh/checkout_with_light.svg": "f5fc591043d158b9e3b5c805196fc8d4",
"assets/packages/pay_android/assets/zh/donate_with_dark.svg": "c0931d4209639c2f62f496467cab92c6",
"assets/packages/pay_android/assets/zh/donate_with_light.svg": "1dfcd01ffde96aaacf88fab46caf22b7",
"assets/packages/pay_android/assets/zh/order_with_dark.svg": "b5fd050d84d8bc8ee6c85047730d2a29",
"assets/packages/pay_android/assets/zh/order_with_light.svg": "faf54afd9e3cc6e0513b9b513de44594",
"assets/packages/pay_android/assets/zh/pay_with_dark.svg": "e16fd57e0cb788199ca54da17f0dc7d4",
"assets/packages/pay_android/assets/zh/pay_with_light.svg": "8c29aec84758809203850633d8befe10",
"assets/packages/pay_android/assets/zh/subscribe_with_dark.svg": "b9ff8ab508baf753f311fd9c401a52c3",
"assets/packages/pay_android/assets/zh/subscribe_with_light.svg": "4472b468be881c99405c756499bc8d1a",
"assets/packages/pay_platform_interface/pubspec.yaml": "5560a47d560610d5fda44a4b8d423776",
"assets/packages/rflutter_alert/assets/images/2.0x/close.png": "abaa692ee4fa94f76ad099a7a437bd4f",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_error.png": "2da9704815c606109493d8af19999a65",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_info.png": "612ea65413e042e3df408a8548cefe71",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_success.png": "7d6abdd1b85e78df76b2837996749a43",
"assets/packages/rflutter_alert/assets/images/2.0x/icon_warning.png": "e4606e6910d7c48132912eb818e3a55f",
"assets/packages/rflutter_alert/assets/images/3.0x/close.png": "98d2de9ca72dc92b1c9a2835a7464a8c",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_error.png": "15ca57e31f94cadd75d8e2b2098239bd",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_info.png": "e68e8527c1eb78949351a6582469fe55",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_success.png": "1c04416085cc343b99d1544a723c7e62",
"assets/packages/rflutter_alert/assets/images/3.0x/icon_warning.png": "e5f369189faa13e7586459afbe4ffab9",
"assets/packages/rflutter_alert/assets/images/close.png": "13c168d8841fcaba94ee91e8adc3617f",
"assets/packages/rflutter_alert/assets/images/icon_error.png": "f2b71a724964b51ac26239413e73f787",
"assets/packages/rflutter_alert/assets/images/icon_info.png": "3f71f68cae4d420cecbf996f37b0763c",
"assets/packages/rflutter_alert/assets/images/icon_success.png": "8bb472ce3c765f567aa3f28915c1a8f4",
"assets/packages/rflutter_alert/assets/images/icon_warning.png": "ccfc1396d29de3ac730da38a8ab20098",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a3cd5365b7182e073feccc2be3f5fe72",
"/": "a3cd5365b7182e073feccc2be3f5fe72",
"main.dart.js": "90f24cfa6442a266052ae58ecbc2adca",
"manifest.json": "f4957e9e50a0b18e3cfa5219c9016fd2",
"version.json": "d641cfb795539f00e072680fd0084ccc"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
