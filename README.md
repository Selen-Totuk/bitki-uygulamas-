# PlantGarden - Motoko Bahçe Simülasyonu

**PlantGarden** Motoko dilinde yazılmış bir bahçe simülasyonudur. Bu aktör, kullanıcıların sanal bitkiler oluşturmasına, bakım yapmasına, durumlarını sorgulamasına ve ölen bitkileri silmesine olanak tanır. Bitkilerin bakımında su, güneş ışığı ve gübre seviyeleri ile bitkilerin gelişim aşamaları yönetilmektedir.

## Özellikler
- **Bitki Oluşturma**: Yeni bitkiler ekleyin.
- **Bitki Bakımı**: Su, güneş ışığı ve gübre seviyelerini ayarlayarak bitkilerin gelişim aşamalarını artırın.
- **Bitki Durumu Sorgulama**: Bitkinin mevcut durumu ve gelişim aşamasını öğrenin.
- **Bitki Ölümü**: Yetersiz bakım nedeniyle ölen bitkileri kaldırın.

## Kullanılan Tipler

### `Plant`
`Plant` tipi bir bitkinin tüm özelliklerini temsil eder:
- **`name`**: Bitkinin adı.
- **`growthStage`**: Bitkinin mevcut gelişim aşaması (0'dan 5'e kadar).
- **`waterLevel`**: Su seviyesi (0-100 arası).
- **`sunlightLevel`**: Güneş ışığı seviyesi (0-100 arası).
- **`fertilizerLevel`**: Gübre seviyesi (0-100 arası).
- **`maxGrowthStage`**: Bitkinin ulaşabileceği maksimum gelişim aşaması.

## Fonksiyonlar

### `createPlant(name: Text) : async Nat`
Yeni bir bitki oluşturur ve bu bitkinin benzersiz ID'sini döner.

**Parametreler**:
- `name`: Bitkinin adı.

**Dönüş**:
- Bitkinin oluşturulduğu ID.

### `careForPlant(plantId: Nat, water: Nat, sunlight: Nat, fertilizer: Nat) : async Text`
Belirtilen bitkiye bakım yapar. Su, güneş ışığı ve gübre seviyelerini artırır. Eğer bu seviyeler yüksekse, bitkinin gelişim aşaması bir artırılır.

**Parametreler**:
- `plantId`: Bakım yapılacak bitkinin ID'si.
- `water`: Eklenen su miktarı.
- `sunlight`: Eklenen güneş ışığı miktarı.
- `fertilizer`: Eklenen gübre miktarı.

**Dönüş**:
- Bakım yapıldığına dair bir mesaj.

### `getPlantStatus(plantId: Nat) : async ?Plant`
Belirtilen bitkinin mevcut durumunu (adı, gelişim aşaması, su, güneş ışığı ve gübre seviyeleri) döner.

**Parametreler**:
- `plantId`: Durumunu sorgulamak istenen bitkinin ID'si.

**Dönüş**:
- Bitkinin mevcut durumu ya da `null` (bitki bulunamadıysa).

### `killPlant(plantId: Nat) : async Text`
Belirtilen bitkinin ölüp ölmediğini kontrol eder. Eğer bitkinin su, güneş ışığı veya gübre seviyesi sıfırsa, bitki ölür ve sistemden kaldırılır.

**Parametreler**:
- `plantId`: Ölmesi gereken bitkinin ID'si.

**Dönüş**:
- Bitkinin öldüğü ya da sağlıklı olduğu ile ilgili bir mesaj.

## Kurulum ve Çalıştırma

1. **Motoko Ortamı**:
   - Bu projeyi çalıştırmak için Motoko ortamına sahip olmanız gerekir.
   - Motoko'yu kurmak için [Motoko Kurulum Kılavuzu'nu](https://internetcomputer.org/docs/current/motoko/quickstart/) takip edebilirsiniz.

2. **Proje Yükleme**:
   - Projeyi indirip yerel ortamınıza kurun.

3. **Kodun Çalıştırılması**:
   - Bitki oluşturmak ve bakımlarını yapmak için ilgili fonksiyonları çağırabilirsiniz.

## Kullanıcı Örneği

```motoko
// Bitki oluşturma
let plantId = await PlantGarden.createPlant("Orkide");

// Bitki bakımını yapma
let result = await PlantGarden.careForPlant(plantId, 20, 30, 40);
