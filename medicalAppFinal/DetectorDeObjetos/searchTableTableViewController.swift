//
//  searchTableTableViewController.swift
//  medicalAppFinal
//
//  Created by Nikhil Chandra on 4/12/19.
//  Copyright © 2019 Jhoney Lopes. All rights reserved.
//

import UIKit

var correctDiagnosis: String = " "
var data = ["Acanthosis-Nigricans", "Acccessory-Nipples", "Accessory-Nipple", "Accessory-Trachus", "Acid-Burn", "Acne", "Acne-Conglobata", "Acquired-Acral-Fibrokeratoma", "Acquired-Digital-Fibrokeratoma", "Acrocyanosis", "Acrodermatitis", "Acrokerato-elastoidosis", "Acromegaly", "Actinic", "Actinomycosis", "Acute-Generalized-Exanthematous-Pustulosis", "Acute-Paronychia", "Addison-Disease", "Adult-Linear-IgA-Bullous-Dermatosis", "AIDS-(Acquired-Immunodeficiency-Syndrome)", "Alagille_s-Syndrome", "Albinism", "Allergic-Contact-Dermatitis", "Alopecia-Areata", "Amyloidosis", "Amyloidosis--Lichenoid", "Amyloidosis--Macular", "Anagen-effluvium", "Androgenic-Alopecia", "Anetoderma", "Angiocentric-T-Cell-Lymphoma", "Angioedema", "Angiokeratomas", "Angiolymphoid-Hyperplasia-with-Eosinophila", "Anhidrotic-Ectodermal-Dysplasia", "Ant Bite", "Argyria", "Arsenical-Keratoses", "Arteriovenous-malformation", "Asteatosis", "Atabrine-Pigmentation", "Athlete_s-Foot", "Atopic-Dermatitis", "Atrophoderma", "Atrophoderma-of-Pasini-and-Perini", "Atrophy-Blanche", "Atypical-Fibroxanthoma", "Atypical-Mycobacterium", "Atypical-Nevi", "Atypical-Nevi-Dermoscopy", "Atypical-Nevi-Trunk", "Axillary-Granular-Parakeratosis", "Bacterial-Vaginosis", "Balanitis-Bacterial", "Basal-Cell-Carcinoma", "Basal-Cell-Nevus-Syndrome", "Beaus-Lines", "Bechet", "Becker-Nevus", "Benign-Familial-Chronic-Pemphigus", "Birt-Hogg-Dube", "Biting-Excoriation", "Biting-Fleas", "Biting-Insects", "Black-Hairy-Tongue", "Black-Heel", "Blue-Nails-Minocycline", "Blue-Nevus", "Blue-Nevus-Ota", "Botryomycosis-Staph", "Bowen-Disease", "Bowen_s-Disease", "Bowenoid-Papulosis", "Bullous-Pemphigoid", "Cactus-Granuloma", "Café-au-lait-Spots", "Calcifying-Epithelioma", "Calcinosis-Cutis", "Calciphylaxis", "Candida-Groin", "Candida-Penis", "Candidiasis", "Candidiasis-Chronic-Mucocutaneous", "Candidiasis-Diaper", "Candidiasis-large-Skin-Folds", "Candidiasis-Mouth", "Candidiasis-Vaginal", "Cat-Bite", "Cat-Scratch-Disease", "Caterpillar-Dermatitis", "Cellulitis", "Cement-Dermatitis-Burns", "Chancroid", "Chapped-Fissured-Feet", "Chemotherapy", "Cherry-Angioma", "Chicken-Pox", "Chilblains-Perniosis", "Cholesterol-Emboli", "Cholinergic-Urticaria", "Chondrodermatitis-Nodularis", "Chromomycosis", "Chronic-Bullous-Dermatosis-Childhood", "Chronic-Bullous-Dermatosis-of-Childhood", "Chronic-Paronychia", "Cicatricial-Bullous-Pemphigoid", "Clear-Cell-Acanthoma", "Clear-Cell-Hidradenoma", "ClearSkinDataSet", "Clubbing", "Coccidiomycosis", "Cold-Urticaria", "Collagenoma", "Colloid-Milia", "Color-Changes", "Confluent-Reticulate-Papillomatosis", "Congenital-Anomalies", "Congenital-Nevus", "Connective-Tissue-Nevus", "Contact-Airborne", "Contact-Dermatitis", "Contact-Dermatitis-Leg-Ulcers", "Corns", "Cosmetic-Fragrance-Allergy", "Cowden-Disease", "Coxsackie", "Crab-Lice", "Creeping-Eruption", "Crest-Syndrome", "Cryoglobulinemia", "CTCL-Cutaneous-T-Cell-Lymphoma", "Cutaneous-Horn", "Cutaneous-Larva-Migrans", "Cutis-Marmorata-Telangiectatica-Congenita", "Cylindroma", "Cytomegalovirus", "Darier", "Dariers-disease", "Degos-Disease", "Degos_-Disease", "Dermagraphism", "Dermatitis-Herpetiformis", "Dermatitis-Swimming", "Dermatofibroma", "Dermatofibrosarcoma", "Dermatomyositis", "Dermatosis-Papulosa-Nigra", "Desquamation", "Diabetes-Mellitus", "Diabetic-Bullae", "Diaper-Dermatitis", "Digital-Mucous-Cyst", "Discoid-Lupus", "Discoid-Lupus-Erythematosus", "Dissecting-Cellulitis", "Distal-Splitting-Hang-Nail", "Distal-Subungual-Onychomycosis", "Drug-Eruption-Photo-Sensitivity", "Drug-Eruptions", "Drug-Lichenoid-Eruption", "Dry-Nails", "Dry-Xerosis-(Dry-Skin)", "Duck-Itch", "Duhring_s-Disease", "Dupuytren-Contracture", "Dyshidrosis", "Dystrophia-Mediana-Canaliformis", "Eccrine-Poroma", "Eccrine-Spiradenoma", "Ecthyma", "Ecthyma-Gangrenosum", "Eczema", "Eczema-Acute", "Eczema-Anal", "Eczema-Areola", "Eczema-Arms", "Eczema-Asteatotic", "Eczema-Axillae", "Eczema-Chronic", "Eczema-Ears", "Eczema-Face", "Eczema-Fingertips", "Eczema-Foot", "Eczema-Hand", "Eczema-Herpeticum", "Eczema-Histology", "Eczema-Hyperkeratotic", "Eczema-Impetiginized", "Eczema-Leg", "Eczema-Lids", "Eczema-Nummular", "Eczema-Penis", "Eczema-Scrotum", "Eczema-Subacute", "Eczema-Trunk-Generalized", "Eczema-Vaccinatum", "Eczema-Vulva", "Elastosis-Perferans", "Elastosis-Perforans-Serpiginosa", "Emersion-Foot", "Endometriosis", "Enterovirus", "Epidermal-Bullosa-Acquisita", "Epidermal-Cyst", "Epidermal-Nevus", "Epidermal-Nevus-Inflammatory", "Epidermodysplasia-Verruciformis", "Epidermolysis-Bullosa", "Erosio-Interdigitalis-Blastomycetica", "Erysipelas", "Erysipeloid", "Erythema-Ab-Igne", "Erythema-Annulare-Centrifugum", "Erythema-Annulare-of-Infancy", "Erythema-Craquele", "Erythema-Dyschromium-Perstans", "Erythema-Elevatum-Diutinum", "Erythema-Induratum", "Erythema-Infectiosum", "Erythema-Multiforme", "Erythema-Neonatorum", "Erythema-Nodosum", "Erythrasma", "Erythrokeratodermia-Variabilis", "Erythromelalgia", "Erythromelanosis-Follicularis-Faciei-Colli", "Erythroplasia-Queyrat", "Erythropoietic-Protoporphyria", "Exanthem", "Exfoliative-Dermatitis", "Exfoliative-Erythroderma", "Exostosis", "Extramammary-Paget-Disease", "Extraneous-Digits", "Factitial-Dermatitis", "Fiberglass-Dermatitis", "Fibrokeratoma,-Acquired-Acral", "Fibroma", "Fibromatosis-Progressive", "Fissure", "Fixed-Drug-Eruption", "Follicular-keratosis", "Follicular-Mucinosis", "Folliculitis", "Folliculitis-Decalvans", "Folliculitis-Gram-Negative", "Fordyce-Spots", "Freckles", "Furuncles-Carbuncles", "Genital-Ulcers", "Genital-Warts", "getMedicalClasses.py", "Gianotti-Crosti", "Glucagonoma", "Gonorrhea", "Gout", "Grain-Shoveler-Itch", "Gram-Negative-Folliculitis", "Granular-Cell-Tumor", "Granulation-Tissue", "Granuloma-Annulare", "Granuloma-Faciale", "Granuloma-Hair", "Granuloma-inguinale", "Grovers-Disease", "Habit-Tic-Deformity", "Hair-Shaft", "Halo-Nevus", "Hand,-Foot-and-Mouth-Disease", "Hand-Foot-Mouth", "Hand-Foot-Mouth-Disease", "Hang-Nail", "Hansen_s-Disease", "Heels-Dry-Cracked", "Hemangioma", "Hemangioma-Infancy", "Hemangioma-Traumatized", "Hematoma-Splinter-Hem", "Henoch-Schonlein-Purpura-Vasculitis", "Henoch-Schönlein-Purpura", "Herpes", "Herpes-Simplex", "Herpes-Simplex--Congenital", "Herpes-Zoster", "Herpetic-Whitlow", "Hidradenitis-Suppurativa", "Hirsutism", "Histiocytosis-X", "Hot-Comb-Alopecia", "Hydroa-Aestivale", "Hydroa-Vacciniforme", "Hydrocystoma", "Hyperhidrosis", "Hyperkeratosis", "Hypothyroidism", "Ichthyosis-Dominant", "Ichthyosis-Other-Forms", "Ichthyosis-Sex-Linked", "Id-Reaction", "Idiopathic-Guttate-Hypomelanosis", "Impetigo", "Incontinentia-Pigmenti", "Ingrown-Eyelash", "Ingrown-Nail", "Insect-Bite-Reaction", "Interstitial-Granulomatous-Dermatitis", "Intertrigo", "Intraepidermal-Epithelioma", "Iododerma", "Irritant-Contact-Dermatitis", "Kaposi-Sarcoma", "Kaposi_s-Sarcoma", "Kawasaki-Syndrome", "Keloids", "Keratoacanthoma", "Keratolysis-Exfoliativa", "Keratosis-Pilaris", "Keratosis-Punctata", "kerion", "Klinefelter-Syndrome", "Knuckle-Pads", "KOH-Preparation", "Koilonychia", "Kyrle-Disease", "Larva-Migrans", "Leiomyomata", "Leishmaniasis", "Lentigo-Adults", "Lentigo-Children", "Lentigo-Maligna", "Leprosy", "Leser-Trelat", "Letterer-Siwe", "Leukemia", "Leukocytoclastic-Vasculitis", "Leukonychia", "Leukoplakia", "Lice--Head", "Lice--Pubic", "Lichen-Amyloidosis", "Lichen-Myxedematosus", "Lichen-Nitidus", "Lichen-Planopilaris", "Lichen-Planus", "Lichen-Planus-Drug", "Lichen-Planus-Hypertrophic", "Lichen-Planus-Oral", "Lichen-Planus-Palm-Soles", "Lichen-Planus-Penis", "Lichen-Planus-Vaginal", "Lichen-Sclerosis-Vulva", "Lichen-Sclerosus-Penis", "Lichen-Sclerosus-Skin", "Lichen-Simplex-Chronicus", "Lichen-Spinulosa", "Lichen-Striatus", "Linear-IgA-Bullous-Dermatosis", "Livido-Reticularis", "Localized-pemphigoid", "Lupus-Acute", "Lupus-Chronic-Cutaneous", "Lupus-Erythematosus", "Lupus-Erythematosus--Profundus", "Lupus-Neonatal", "Lupus-Subacute", "Lupus-Vulgaris", "Lyme-Disease", "Lymphangioma-Circumscriptum", "Lymphangitis", "Lymphocytic-Infiltrate-Jessner", "Lymphocytoma-Cutis", "Lymphogranuloma-venereum", "Lymphoma", "Lymphomatoid-Papulosis", "Lymphosarcoma", "Maceration", "Maculae-Cerulea", "Macular-Atrophy", "Majocchi-Granuloma", "Majocchi-Purpura-Tel", "Malignant-Atrophic-Papulosis", "Malignant-Melanoma", "Malum-Ulcer", "Mastocytosis", "Measles", "Median-Nail-Dystrophy", "Median-Rhomboid-Glossitis", "Meischer-Granuloma-Face", "Melanocytic-Nevi", "Melanoma-Mimic", "Melanotic-Macule", "Melasma", "Melkersson-Rosenthal", "Meningococcemia", "Merkel-Cell-Cancer", "Metal-Dermatitis", "Metastasis", "Milia", "Milroy-Disease", "Minocycline-Pigmentation", "Mixed-Connective-Tissue-Disease", "Molluscum-Contagiosum", "Mongolian-Spot", "Monilethrix", "Monilethrix--Hair-Shaft", "Monkey-Pox", "Morphea", "Morphea--Linear", "Mucha-Habermann-Disease", "Mucinosis", "Mucous-Cyst", "Muir-Torre-Syndrome", "Mycetoma", "Mycobacterium-fortuitum-Infection", "Mycosis-Fundoides", "Myiasis", "Myxedema", "Nail-Melanoma", "Natural-Rubber-Latex-Allergy", "Necrobiosis-Lipoidica", "Necrobiosis-Lipoidica-Diabeticorum", "Neurofibromas", "Neurofibromatosis", "Neurotic-Excoriations", "Nevoxanthoendothelioma", "Nevus,-Spitz-Type-1", "Nevus-Anemicus", "Nevus-Comedonicus", "Nevus-Melanocytic", "Nevus-Repigmented", "Nevus-Sebaceous", "Nevus-Spilus", "Normal-Variations", "North-American-Blastomycosis", "Notalgia-Paraesthetica", "Ochronosis", "Onychogryphosis", "Onycholysis", "Onycholysis-Distal", "Onychomycosis-1--Candida", "Orf", "Osler-node", "Otitis-Externa", "Paget-Disease-Breast", "Palmoplantar-Keratoderma", "Panniculitis", "Paracoccidiodomycosis", "Parasitosis-Psychogenic", "Patch-Testing", "Pearly-Penile-Papules", "Pediculosis-Body", "Pediculosis-Capitis", "Pediculosis-Lids", "Pediculosis-Pubic", "Pediculosis-Scalp", "Pediculus-humanus", "Pediculus-Pubis", "Pellagra", "Pemphigus", "Pemphigus-Foliaceous", "Pemphigus-Foliaceus", "Pemphigus-Vulgaris", "Perioral-Dermatitis", "Periungual-Epidermal-Cyst", "Periungual-Fibroma", "Periungual-Warts", "Perlèche", "Phlebitis-Superficial", "Phototoxic-Dermatitis", "Phototoxic-Reactions", "Phytophotodermatitis", "Piebaldism", "Pigmentation-Atabrine", "Pigmented-Bands", "Pilar-Cyst", "Pili-Annulati", "Pili-Torti", "Pincer-Nails", "Pinkus-Tumor", "Pitted-Keratolysis", "Pityriasis-Alba", "Pityriasis-Lichenoides", "Pityriasis-Lichenoides-et-Varioliformis-Acuta", "Pityriasis-Rosea", "Pityriasis-Rubra-Pilaris", "Pityrosporum-Folliculitis", "Poikiloderma-Civatte", "Poliosis-in-Vogt-Koyangi-Harada-Syndrome", "Polyarteritis-Nodosa", "Polymorphous-Light-Eruption", "Polythelia", "Polytrichia", "Pompholyx", "Porokeratosis", "Porokeratosis--Disseminated-Superficial-Actinic", "Porokeratosis-of-Mibelli", "Porphyrias", "Postinflammatory-Hyperpigmentation", "Potassium-Hydroxide-Preparation", "Pressure-Urticaria", "Pretibia-myxedema", "Prominent-Sebaceous-Glands-and-Fordyce-Spots", "Proximal-Subungual-Onychomycosis", "Prurigo-Nodularis", "Pseudocyst-Auricle", "Pseudomonas", "Pseudomonas-Cellulitis", "Pseudomonas-Folliculitis", "Pseudopelade", "Pseudoporphyria", "Pseudoxanthoma-Elasticum", "Psoriasis", "Psoriatic-Arthritis", "PUPPP-Pruritic-Urticarial-Papules-and-Plaques-of-Pregnancy", "Purpura-Vomiting", "Pyoderma-Gangrenosum", "Pyogenic-Granuloma", "Radiation-Dermatitis", "Raynaud-Disease", "Reflex-Sympathetic-Dystrophy", "Reiter-Syndrome", "Relapsing-Polychondritis", "Rheumatoid-Nodule", "Rhus-Dermatitis", "Ridging-Beading", "Rocky-Mountain-Spotted-Fever", "Rosacea", "Rosacea-Granulomatous", "Rosacea-Nose", "Rosacea-Steroid", "Roseola-Infantum", "Sarcoid", "Sarcoidosis", "Scabies", "Scarlet-Fever", "Schamberg-Disease", "Scleroderma", "Sebaceous-Hyperplasia", "Seborrheic-Dermatitis", "Seborrheic-Keratoses-Ruff", "Seborrheic-Keratoses-Smooth", "Seborrheic-Keratosis", "Seborrheic-Keratosis-Irritated", "Sheathed-Hair", "Shingles", "Shoe-Allergy", "Skin-Splitting-Fissure", "Skin-Tags-Polyps", "Small-Pox", "Spider-Angioma", "Spiders", "Spiny-keratoderma", "Spitz-Nevus", "Splinter-Hemorrhage", "Sporotrichosis", "Squamous-Cell-Carcinoma", "Squamous-Cell-Carcinoma-Ear", "Squamous-Cell-Carcinoma-Face", "Squamous-Cell-Carcinoma-Hand-Arm", "Squamous-Cell-Carcinoma-Histology", "Squamous-Cell-Carcinoma-Leg", "Squamous-Cell-Carcinoma-Lesion", "Squamous-Cell-Carcinoma-Lip", "Squamous-Cell-Carcinoma-Nose", "Squamous-Cell-Carcinoma-Scalp", "Squamous-Cell-Carcinoma-Trunk", "Squamous-Cell-Carcinoma-Vulva", "Staphylococal-Diaper-Dermatitis", "Staphylococcal-Folliculitis", "Staphylococcal-Scalded-Skin-Syndrome", "Stasis-Dermatitis-and-Ulcers", "Steatocystoma-Multiplex", "Stevens-Johnson-Syndrome", "Stinging-Insects", "Streptococci-Anal-Penis", "Striae-Distensae", "Stucco-Keratoses", "Sun-Damaged-Skin", "Sunburn", "Supernumerary-Digits", "Sweets-Syndrome", "Sycosis-Barbae", "Syphilis", "Syringoma", "Systemically-Induced-Allergic-Dermatitis", "Telangiectasias", "Telogen-Effluvium", "Temporal-Arteritis", "Terry-Nails", "Thrombosed-Vein", "Ticks", "Tinea", "Toxic-Epidermal-Necrolysis", "Traction-Alopecia", "Trauma", "Trichoepithelioma", "Trichofolliculoma", "Tricholemmoma", "Trichomycosis", "Trichorrhexis-Nodosa", "Trichothiodystrophy--Hair-Shaft", "Trichotillomania", "Tuberculosis--Cutaneous", "Tuberous-Sclerosis", "Tuberous-Sclerosis--Koenen_s-Tumor", "Tufted-folliculitis", "Twenty-Nail-Dystrophy", "Tzanck-Preparation", "Unilateral-Laterothoracic-Exanthem", "Unilateral-Telangiectasia", "Urticaria--Cold-Induced", "Urticaria-Acute", "Urticaria-Vasculitis", "Varicella", "Varicella-Infection", "Varicella-Zoster", "Vascular-Anomaly", "Vasculitis", "Vasculitis--henoch-Schonlein-Purpura", "Vasculitis--IgA", "Venous-Lake", "Venous-Malformations", "Verruca", "Verruca-Plana", "Verrucous-Carcinoma", "Viral-Exanthems", "Vitiligo", "Vogt-Koyanagi-Harada-Syndrome", "von-Recklinghausen_s-Disease", "Weathering-Nodules", "Weber-Christian", "Wegener_s-Granulomatosis", "White-Nails", "White-Superficial-Onychomycosis", "Xanthelasma", "Xanthogranuloma", "Xanthoma--Palmar-Striata", "Xanthomas", "Xanthomas-(Eruptive)", "Xerosis", "Yellow-Nails"]
class searchTableTableViewController: UITableViewController, UICollectionViewDelegate, UISearchResultsUpdating {
   
    var searchController = UISearchController()
    var resultsController = UITableViewController()
    var filteredData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: resultsController)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self as? UISearchResultsUpdating
        
        resultsController.tableView.delegate = self
        resultsController.tableView.dataSource = self
        
  
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredData = data.filter({ (data: String) -> Bool in
            if data.contains(searchController.searchBar.text!) {
                return true
            } else {
                return false
            }
        })
        
        resultsController.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == resultsController.tableView {
            return filteredData.count
        } else {
            return data.count
        }
        
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == resultsController.tableView {
            cell.textLabel?.text = filteredData[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
        }
        
        
        return cell

        // Configure the cell...

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == resultsController.tableView {
            correctDiagnosis = filteredData[indexPath.row]
        } else {
            correctDiagnosis = data[indexPath.row]
        }
        
        performSegue(withIdentifier: "cellSegue", sender: self)
    }
 
    
    
}
