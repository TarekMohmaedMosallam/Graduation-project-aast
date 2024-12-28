class Imagetest {
  String? image;
  String? name;
  String? date;
  String? info;

  static List<Imagetest> list = [
    Imagetest('asset/imagedectect/blast.png', "Blast", "Aug 20,2022", ''' Description
Brown spot rice disease is caused by the fungus Bipolaris oryzae. It manifests as small, circular to oval brown spots on rice plants and can significantly reduce yield and grain quality.
Causes 
-High humidity and temperature
-Poor soil health (nutrient deficiencies)
-Stress factors (drought, suboptimal planting density)

prevention
-Use certified, disease-free seeds

-Clean farm equipment and tools

Spread &Impact

-Spread: Airborne spores, infected plant material, and water

-Impact: Significant yield and economic losses, threat to food security in rice-dependent regions
Management Tips
-Use resistant rice varieties
-Ensure proper water management
-Treat seeds with fungicides before planting
-Maintain field hygiene by removing and destroying infected plant debris

 '''),
    Imagetest(
        'asset/imagedectect/imagetest.png', "Blight", 'Aug 20,2022', '''Blight rice disease, also known as bacterial blight of rice, is caused by the bacterium Xanthomonas oryzae pv. oryzae. It affects the vascular system of rice plants, leading to symptoms like leaf blight, yellowing, and wilting, and can result in significant yield loss.
Causes 
-Infected seeds
-Contaminated water
-Rain and wind
prevention
-Use certified, disease-free seeds
-Sanitize farm equipment
-mplement quarantine measures to prevent the introduction of the bacterium
Spread &Impact
Spread:
-Water: Irrigation and rainwater can easily spread the bacteria.
-Wind: Wind can carry bacteria over long distances.
-Human Activity: Movement of contaminated equipment, tools, and plant materials can also contribute to the spread.

Impact:
-Yield Loss: Infected plants show reduced growth and productivity, leading to significant yield losses.
-Economic Loss: The disease can cause substantial economic losses to farmers due to reduced yields and increased management costs.
Management Tips
-Plant resistant rice varieties
-Ensure proper water management
-Use balanced fertilization
-Maintain field hygiene by removing infected debris.

  '''),
    Imagetest('asset/imagedectect/imagetest2.png', "Brown Spot", 'Aug 20,2022',
        ''' Description
Blight rice disease, also known as bacterial blight of rice, is caused by the bacterium Xanthomonas oryzae pv. oryzae. It affects the vascular system of rice plants, leading to symptoms like leaf blight, yellowing, and wilting, and can result in significant yield loss.
Causes 
-Infected seeds
-Contaminated water
-Rain and wind
prevention
-Use certified, disease-free seeds
-Sanitize farm equipment
-mplement quarantine measures to prevent the introduction of the bacterium
Spread &Impact
Spread:
-Water: Irrigation and rainwater can easily spread the bacteria.
-Wind: Wind can carry bacteria over long distances.
-Human Activity: Movement of contaminated equipment, tools, and plant materials can also contribute to the spread.

Impact:
-Yield Loss: Infected plants show reduced growth and productivity, leading to significant yield losses.
-Economic Loss: The disease can cause substantial economic losses to farmers due to reduced yields and increased management costs.
Management Tips
-Plant resistant rice varieties
-Ensure proper water management
-Use balanced fertilization
-Maintain field hygiene by removing infected debris.

 '''),
  ];

  Imagetest(this.image, this.name, this.date, this.info);
}
