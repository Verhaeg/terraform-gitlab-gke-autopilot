# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/google" {
  version     = "4.48.0"
  constraints = ">= 2.15.0, >= 3.33.0, >= 3.43.0, >= 3.45.0, >= 3.50.0, >= 3.53.0, >= 3.83.0, ~> 4.28, >= 4.38.0, < 5.0.0"
  hashes = [
    "h1:k+3asWyC+EEr3gi4Rq8cSP8kr2JGJGcVuQtBXVYorjM=",
    "zh:19c2910e8c555482c28665ad8bed3b6b790ef9b66c565cbb6a5957f8be83048a",
    "zh:25fcb8e54aacdadca12fc9966745f34ae3918fa2a85ee1c1f084ec73c00eb01c",
    "zh:2e54b7902311b1ad69b0eeb2980a83df3df380042be50bf0785ddfc995de0ad8",
    "zh:607ac01d98beaafc06e967294b47d779c23f370240d81c09e434b2b13f56e63f",
    "zh:639fbefa214bbd83a318f38fa7412cebf1e4f90b53f39bf427b865de54ce8013",
    "zh:75b192f9267c71cad573afd2cd0d080c589660766058a9dd8d244bfcb17e96bc",
    "zh:7f355151dd8641bf605f7c287faf56089a9acc9316f91892bc9de8e56d458569",
    "zh:9bfdb7d504c0369352dd019889a7ad35f24751c756eaa13e4ab165d2b5c6a6ea",
    "zh:b37e6b5e1863a30ccd39a7c0f583e21823d373383e474a8845d46693fc3404f8",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
    "zh:f6640c0d8780d2eb465f3fc4a4bcb11a4a0fc7d6db23feb79ca088fc8d081813",
    "zh:f6c0aed1c955399239010704894a8c583c61a53ef8ac732f9307d04c366f5e7d",
  ]
}

provider "registry.terraform.io/hashicorp/google-beta" {
  version     = "4.49.0"
  constraints = ">= 3.43.0, >= 3.45.0, >= 3.50.0, ~> 4.11, ~> 4.28, >= 4.38.0, >= 4.42.0, < 5.0.0"
  hashes = [
    "h1:/Z9B/HivPhS6JeMo3Oho/UVUNkOgiVsd0kmPoOUY8YI=",
    "zh:03f7d936d581dff14bb963b05a444a9c0b1fd41d26375ce27918fb7c45614689",
    "zh:3c64e80aa346a812de3ff0b351c3d50e7fe1c44747426bfd2087bd1a887eb45b",
    "zh:3fe17786069603a212feacc2f1c816b0f491dcff1a6d8c5385ecbdee993d35a0",
    "zh:50355aa91cf3f9a534aaabf71d4aa89bd59c1553bec0030359a320e468647b76",
    "zh:53f71886192e2a579f202f1f337d95793f1c9222d5e577a2dac3e29f2cde22a3",
    "zh:871560b92de695c876203ccc771ea25934c142a227401b7f125e8f3926715648",
    "zh:8771df7f2fc1c3125da0861dd7270104c0cd529f1c27b9a1691b13a43413f47a",
    "zh:ad45781ac59d0a3a7b7ecae07240c40c876e31d4bf72e7d0a26e09e96b854417",
    "zh:da7830cdcbeecae58954c95ff717944dcb40666039cb6dc13a771ceb3fdf5a2b",
    "zh:dc5965b64312f5065fac91e0dbcbbafab6e871902295a4711a5bfbb84f3a7ed4",
    "zh:df93f8cbdf6d77feccb57f79f074a5821266c9cb8f5b1749e578a575a178eb3f",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
  ]
}

provider "registry.terraform.io/hashicorp/helm" {
  version     = "2.8.0"
  constraints = ">= 2.0.0, >= 2.6.0"
  hashes = [
    "h1:U0w0mUT0SwZCR0poGNSxGaZJKWcOiu4GerpGztYBiMM=",
    "zh:1e42d1a04c07d4006844e477ca32b5f45b04f6525dbbbe00b6be6e6ec5a11c54",
    "zh:2f87187cb48ccfb18d12e2c4332e7e822923b659e7339b954b7db78aff91529f",
    "zh:391fe49b4d2dc07bc717248a3fc6952189cfc49c596c514ad72a29c9a9f9d575",
    "zh:89272048e1e63f3edc3e83dfddd5a9fd4bd2a4ead104e67de1e14319294dedf1",
    "zh:a5a057c3435a854389ce8a1d98a54aaa7cbab68aca7baa436a605897aa70ff7e",
    "zh:b1098e53e1a8a3afcd325ecd0328662156b3d9c3d80948f19ba3a4eb870cee2b",
    "zh:b676f949e8274a2b6c3fa41f5428ea597125579c7b93bb50bb73a5e295a7a447",
    "zh:cdf7e9460f28c2dbfe49a79a5022bd0d474ff18120d340738aa35456ba77ebca",
    "zh:e24b59b4ed1c593facbf8051ec58550917991e2e017f3085dac5fb902d9908cb",
    "zh:e3b5e1f5543cac9d9031a028f1c1be4858fb80fae69f181f21e9465e366ebfa2",
    "zh:e9fddc0bcdb28503078456f0088851d45451600d229975fd9990ee92c7489a10",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
  ]
}

provider "registry.terraform.io/hashicorp/http" {
  version = "3.2.1"
  hashes = [
    "h1:wKM96IefXoEIFZZEW0gzc1SV7GFZqvV8z72IMgma5/4=",
    "zh:088b3b3128034485e11dff8da16e857d316fbefeaaf5bef24cceda34c6980641",
    "zh:09ed1f2462ea4590b112e048c4af556f0b6eafc7cf2c75bb2ac21cd87ca59377",
    "zh:39c6b0b4d3f0f65e783c467d3f634e2394820b8aef907fcc24493f21dcf73ca3",
    "zh:47aab45327daecd33158a36c1a36004180a518bf1620cdd5cfc5e1fe77d5a86f",
    "zh:4d70a990aa48116ab6f194eef393082c21cf58bece933b63575c63c1d2b66818",
    "zh:65470c43fda950c7e9ac89417303c470146de984201fff6ef84299ea29e02d30",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:842b4dd63e438f5cd5fdfba1c09b8fdf268e8766e6690988ee24e8b25bfd9e8d",
    "zh:a167a057f7e2d80c78d4b4057538588131fceb983d5c93b07675ad9eb1aa5790",
    "zh:d0ba69b62b6db788cfe3cf8f7dc6e9a0eabe2927dc119d7fe3fe6573ee559e66",
    "zh:e28d24c1d5ff24b1d1cc6f0074a1f41a6974f473f4ff7a37e55c7b6dca68308a",
    "zh:fde8a50554960e5366fd0e1ca330a7c1d24ae6bbb2888137a5c83d83ce14fd18",
  ]
}

provider "registry.terraform.io/hashicorp/kubernetes" {
  version     = "2.16.1"
  constraints = "~> 2.10"
  hashes = [
    "h1:PO4Ye/+lu5hCaUEOtwNOldQYoA0dqL1bcBICIpdlcd8=",
    "zh:06224975f5910d41e73b35a4d5079861da2c24f9353e3ebb015fbb3b3b996b1c",
    "zh:2bc400a8d9fe7755cca27c2551564a9e2609cfadc77f526ef855114ee02d446f",
    "zh:3a479014187af1d0aec3a1d3d9c09551b801956fe6dd29af1186dec86712731b",
    "zh:73fb0a69f1abdb02858b6589f7fab6d989a0f422f7ad95ed662aaa84872d3473",
    "zh:a33852cd382cbc8e06d3f6c018b468ad809d24d912d64722e037aed1f9bf39db",
    "zh:b533ff2214dca90296b1d22eace7eaa7e3efe5a7ae9da66a112094abc932db4f",
    "zh:ddf74d8bb1aeb01dc2c36ef40e2b283d32b2a96db73f6daaf179fa2f10949c80",
    "zh:e720f3a15d34e795fa9ff90bc755e838ebb4aef894aa2a423fb16dfa6d6b0667",
    "zh:e789ae70a658800cb0a19ef7e4e9b26b5a38a92b43d1f41d64fc8bb46539cefb",
    "zh:e8aed7dc0bd8f843d607dee5f72640dbef6835a8b1c6ea12cea5b4ec53e463f7",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
    "zh:fb3ac4f43c8b0dfc0b0103dd0f062ea72b3a34518d4c8808e3a44c9a3dd5f024",
  ]
}

provider "registry.terraform.io/hashicorp/null" {
  version     = "3.2.1"
  constraints = ">= 2.1.0"
  hashes = [
    "h1:tSj1mL6OQ8ILGqR2mDu7OYYYWf+hoir0pf9KAQ8IzO8=",
    "zh:58ed64389620cc7b82f01332e27723856422820cfd302e304b5f6c3436fb9840",
    "zh:62a5cc82c3b2ddef7ef3a6f2fedb7b9b3deff4ab7b414938b08e51d6e8be87cb",
    "zh:63cff4de03af983175a7e37e52d4bd89d990be256b16b5c7f919aff5ad485aa5",
    "zh:74cb22c6700e48486b7cabefa10b33b801dfcab56f1a6ac9b6624531f3d36ea3",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:79e553aff77f1cfa9012a2218b8238dd672ea5e1b2924775ac9ac24d2a75c238",
    "zh:a1e06ddda0b5ac48f7e7c7d59e1ab5a4073bbcf876c73c0299e4610ed53859dc",
    "zh:c37a97090f1a82222925d45d84483b2aa702ef7ab66532af6cbcfb567818b970",
    "zh:e4453fbebf90c53ca3323a92e7ca0f9961427d2f0ce0d2b65523cc04d5d999c2",
    "zh:e80a746921946d8b6761e77305b752ad188da60688cfd2059322875d363be5f5",
    "zh:fbdb892d9822ed0e4cb60f2fedbdbb556e4da0d88d3b942ae963ed6ff091e48f",
    "zh:fca01a623d90d0cad0843102f9b8b9fe0d3ff8244593bd817f126582b52dd694",
  ]
}

provider "registry.terraform.io/hashicorp/random" {
  version     = "3.4.3"
  constraints = ">= 2.2.0"
  hashes = [
    "h1:tL3katm68lX+4lAncjQA9AXL4GR/VM+RPwqYf4D2X8Q=",
    "zh:41c53ba47085d8261590990f8633c8906696fa0a3c4b384ff6a7ecbf84339752",
    "zh:59d98081c4475f2ad77d881c4412c5129c56214892f490adf11c7e7a5a47de9b",
    "zh:686ad1ee40b812b9e016317e7f34c0d63ef837e084dea4a1f578f64a6314ad53",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:84103eae7251384c0d995f5a257c72b0096605048f757b749b7b62107a5dccb3",
    "zh:8ee974b110adb78c7cd18aae82b2729e5124d8f115d484215fd5199451053de5",
    "zh:9dd4561e3c847e45de603f17fa0c01ae14cae8c4b7b4e6423c9ef3904b308dda",
    "zh:bb07bb3c2c0296beba0beec629ebc6474c70732387477a65966483b5efabdbc6",
    "zh:e891339e96c9e5a888727b45b2e1bb3fcbdfe0fd7c5b4396e4695459b38c8cb1",
    "zh:ea4739860c24dfeaac6c100b2a2e357106a89d18751f7693f3c31ecf6a996f8d",
    "zh:f0c76ac303fd0ab59146c39bc121c5d7d86f878e9a69294e29444d4c653786f8",
    "zh:f143a9a5af42b38fed328a161279906759ff39ac428ebcfe55606e05e1518b93",
  ]
}

provider "registry.terraform.io/hashicorp/time" {
  version     = "0.9.1"
  constraints = ">= 0.5.0"
  hashes = [
    "h1:UHcDnIYFZ00uoou0TwPGMwOrE8gTkoRephIvdwDAK70=",
    "zh:00a1476ecf18c735cc08e27bfa835c33f8ac8fa6fa746b01cd3bcbad8ca84f7f",
    "zh:3007f8fc4a4f8614c43e8ef1d4b0c773a5de1dcac50e701d8abc9fdc8fcb6bf5",
    "zh:5f79d0730fdec8cb148b277de3f00485eff3e9cf1ff47fb715b1c969e5bbd9d4",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:8c8094689a2bed4bb597d24a418bbbf846e15507f08be447d0a5acea67c2265a",
    "zh:a6d9206e95d5681229429b406bc7a9ba4b2d9b67470bda7df88fa161508ace57",
    "zh:aa299ec058f23ebe68976c7581017de50da6204883950de228ed9246f309e7f1",
    "zh:b129f00f45fba1991db0aa954a6ba48d90f64a738629119bfb8e9a844b66e80b",
    "zh:ef6cecf5f50cda971c1b215847938ced4cb4a30a18095509c068643b14030b00",
    "zh:f1f46a4f6c65886d2dd27b66d92632232adc64f92145bf8403fe64d5ffa5caea",
    "zh:f79d6155cda7d559c60d74883a24879a01c4d5f6fd7e8d1e3250f3cd215fb904",
    "zh:fd59fa73074805c3575f08cd627eef7acda14ab6dac2c135a66e7a38d262201c",
  ]
}
