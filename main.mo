import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor PlantGarden {
    type Plant = {
        name: Text;
        growthStage: Nat;
        waterLevel: Nat;  // Su seviyesi (0-100)
        sunlightLevel: Nat;  // Güneş ışığı seviyesi (0-100)
        fertilizerLevel: Nat;  // Gübre seviyesi (0-100)
        maxGrowthStage: Nat;  // Maksimum gelişim seviyesi
    };

    stable var plants: [Plant] = [];

    public func createPlant(name: Text) : async Nat {
        let newPlant: Plant = {
            name = name;
            growthStage = 0;
            waterLevel = 50;
            sunlightLevel = 50;
            fertilizerLevel = 50;
            maxGrowthStage = 5;
        };
        plants := Array.append<Plant>(plants, [newPlant]);
        return Array.size(plants) - 1;
    };

    public func careForPlant(plantId: Nat, water: Nat, sunlight: Nat, fertilizer: Nat) : async Text {
        if (plantId < Array.size(plants)) {
            var plant = plants[plantId];
            plant := {
                name = plant.name; // Var olan özellikleri koru
                growthStage = plant.growthStage;
                waterLevel = Nat.min(100, plant.waterLevel + water);
                sunlightLevel = Nat.min(100, plant.sunlightLevel + sunlight);
                fertilizerLevel = Nat.min(100, plant.fertilizerLevel + fertilizer);
                maxGrowthStage = plant.maxGrowthStage;
            };

            // Gelişim aşamasını güncelle
            if (plant.waterLevel > 60 and plant.sunlightLevel > 60 and plant.fertilizerLevel > 60) {
                plant.growthStage := Nat.min(plant.maxGrowthStage, plant.growthStage + 1);
            };

            // Güncellenmiş bitkiyi diziye ata
            plants[plantId] := plant;
            return "Bitkinin bakımı yapıldı!";
        } else {
            return "Bitki bulunamadı!";
        }
    };

    public func getPlantStatus(plantId: Nat) : async ?Plant {
        if (plantId < Array.size(plants)) {
            return ?plants[plantId];
        } else {
            return null;
        }
    };

    public func killPlant(plantId: Nat) : async Text {
        if (plantId < Array.size(plants)) {
            let plant = plants[plantId];
            if (plant.waterLevel == 0 or plant.sunlightLevel == 0 or plant.fertilizerLevel == 0) {
                plants := Array.filter<Plant>(plants, func(p: Plant, i: Nat) : Bool { i != plantId });
                return "Bitki öldü!";
            } else {
                return "Bitki hala sağlıklı!";
            }
        } else {
            return "Bitki bulunamadı!";
        }
    };
};

