# Goals

Mod-Based Procedurals is a Lua mod for Dwarf 
Fortress that aims to replace the "Random Creature Profile"-based creature generators, with ones based on creature objects in the extant raw files.

"Procedurally generated creatures" will here be known as "procedurals".

## General:

- Procedurals should be based on creature raws.


- Only [NATURAL]+[MUNDANE] creatures should be used as templates.
	- Unless some setting is turned off.

- [SPECIAL] creatures are exempt.

- [DOES_NOT_EXIST] creatures are exempt.

- [MEGABEAST] creatures are exempt.

- [SEMIMEGABEAST] creatures are exempt.

- [FEATURE_BEAST] creatures are exempt.

- [UNIQUE_DEMON] creatures are exempt.


## Forgotten Beasts:

- Forgotten beasts have a set of shared tokens:
    [FEATURE_BEAST]
    [ATTACK_TRIGGER:0:0:2]
    [NAME:forgotten beast:forgotten beasts:forgotten beast]
    [CASTE_NAME:forgotten beast:forgotten beasts:forgotten beast]
    [NO_GENDER]
    [CARNIVORE]
    [DIFFICULTY:10]
	
    [NATURAL_SKILL:WRESTLING:6]
    [NATURAL_SKILL:BITE:6]
    [NATURAL_SKILL:GRASP_STRIKE:6]
    [NATURAL_SKILL:STANCE_STRIKE:6]
    [NATURAL_SKILL:MELEE_COMBAT:6]
    [NATURAL_SKILL:DODGING:6]
    [NATURAL_SKILL:SITUATIONAL_AWARENESS:6]
	
    [LARGE_PREDATOR]
	
	[AMPHIBIOUS]
	[SWIMS_INNATE]
	[NONAUSEA]
	[NOEXERT]
	[NO_DIZZINESS]
	[NOPAIN]
	[NOSTUN]
	
	[PETVALUE:2000]
	[ALL_ACTIVE]
	[NOFEAR]
	[NO_FEVERS]
	
- Forgotten beasts must remove all vermin tokens, if based on a creature that has them:
	[ARTIFICIAL_HIVEABLE]
	[CLUSTER_NUMBER]
	[COLONY_EXTERNAL]
	[COOKABLE_LIVE]
	[DIE_WHEN_VERMIN_BITE]
	[FISHITEM]
	[HIVE_PRODUCT]
	[LIGHT_GEN]
	[PENETRATEPOWER]
	[REMAINS_ON_VERMIN_BITE_DEATH]
	[SMALL_REMAINS]
	[TRIGGERABLE_GROUP]
	[VERMIN_BITE]
	[VERMIN_EATER]
	[VERMIN_FISH]
	[VERMIN_GROUNDER]
	[VERMIN_HATEABLE]
	[VERMIN_MICRO]
	[VERMIN_NOFISH]
	[VERMIN_NOROAM]
	[VERMIN_NOTRAP]
	[VERMIN_ROTTER]
	[VERMIN_SOIL]
	[VERMIN_SOIL_CATEGORY]
	[EXTRACT]

- Forgotten beasts must remove all tokens that may imply they are small creatures:
	[DIVE_HUNTS_VERMIN]
	[GOBBLE_VERMIN_CLASS]
	[GOBBLE_VERMIN_CREATURE]
	[HUNTS_VERMIN]
	[RETURNS_VERMIN_KILLS_TO_OWNER]
	[ROOT_AROUND]
	[VERMINHUNTER]
	[SLAIN_CASTE_SPEECH]
	[SLAIN_SPEECH]
	
- Forgotten beasts must remove all tokens that force a role onto it:
	[BLOODSUCKER] (unclear)
	[COMMON_DOMESTIC]
	[CONVERTED_SPOUSE]
	[DEMON]
	[EVIL]
	[EQUIPMENT_WAGON]
	[FANCIFUL]
	[FEATURE_ATTACK_GROUP]
	[GOOD]
	[LAIR]
	[LAIR_CHARACTERISTIC]
	[LAIR_HUNTER]
	[LAIR_HUNTER_SPEECH]
	[LARGE_ROAMING]
	[LOCAL_POPS_CONTROLLABLE]
	[LOCAL_POPS_PRODUCE_HEROES]
	[MEGABEAST]
	[NIGHT_CREATURE]
	[NIGHT_CREATURE_BOGEYMAN]
	[NIGHT_CREATURE_EXPERIMENTER]
	[NIGHT_CREATURE_HUNTER]
	[NIGHT_CREATURE_NIGHTMARE]
	[OUTSIDER_CONTROLLABLE]
	[PACK_ANIMAL]
	[PET]
	[PET_EXOTIC]
	[POWER]
	[SAVAGE]
	[SEMIMEGABEAST]
	[SPOUSE_CONVERSION_TARGET]
	[SPOUSE_CONVERTER]
	[TITAN]
	[TRADE_CAPACITY]
	[TRAINABLE]
	[TRAINABLE_HUNTING]
	[TRAINABLE_WAR]
	[UBIQUITOUS]
	[WAGON_PULLER]
	
- Forgotten beasts must remove all tokens that interfere with their behavior:
	[ALCOHOL_DEPENDENT]
	[AT_PEACE_WITH_WILDLIFE]
	[BEACH_FREQUENCY]
	[BENIGN]
	[BIOME]
	[CRAZED]
	[CURIOUSBEAST_EATER]
	[CURIOUSBEAST_ITEM]
	[FLEEQUICK]
	[FREQUENCY]
	- [CURIOUSBEAST_GUZZLER] is allowed since it doesn't cause the FB to leave the map.
	[GETS_INFECTIONS_FROM_ROT]
	[GETS_WOUND_INFECTIONS]
	[GRAZER]
	[IMMOBILE]
	[IMMOBILE_LAND]
	[ITEMCORPSE] since itemcorpses are often used for shenanigans, and those shenanigans shouldn't carry.
	[ITEMCORPSE_QUALITY]
	[MAGICAL]
	[MEANDERER]
	[MUNDANE]
	[NATURAL]
	[NATURAL_ANIMAL]
	[NO_AUTUMN]
	[NO_SPRING]
	[NO_SUMMER]
	[NO_WINTER]
	[OPPOSED_TO_LIFE]
	[PRONE_TO_RAGE]
	[RETRACT_INTO_BP]
	[SPECIFIC_FOOD]
	[STANDARD_GRAZER]
	[STRANGE_MOODS]
	[VEGETATION]

- Forgotten beasts must remove all tokens related to age and aging:
	[BABY]
	[BABY_NAME]
	[CHILD]
	[CHILDNAME]
	[GENERAL_BABY_NAME]
	[GENERAL_CHILD_NAME]
	[MAXAGE]
	
- Forgotten beasts have [BIOME:SUBTERRANEAN_WATER] if layer_type == 0, and [BIOME:SUBTERRANEAN_CHASM] otherwise.

- Forgotten beasts are size 10 000 000 , or the adult size of the template creature if that is bigger.

- Forgotten beasts can not be based on fully aquatic creatures.
	- Unless they are in the categories "crustacean" or "misc invertebrate".
	
- Forgotten beasts pull creatures from categories of equal weight, before pulling creatures from each category. The categories are:
	- "general shape"
	- "dinosaur"
	- "insect"
	- "arachnid"
	- "crustacean"
	- "misc invertebrate"
	- "amphibian"
	- "crocodilian"
	- "reptile"
	- "bird"
	- "mammal"
	- "other"
	- "general shapes" and "dinosaurs" use hard-coded creature templates.
		- the "general shapes" templates are:		
			- Blob
			- Quadruped
			- Humanoid
		- the "dinosaur" templates are:		
			- Pterosaur
			- Dimetrodon
			- Sauropod
			- Theropod
			- Iguanodont
			- Hadrosaurid
			- Stegosaurid
			- Ceratopsid
			- Ankylosaurid
	- Somehow, creatures from the raws are put into one of the other categories.
		- It should be possible to manually place creatures into "general shape" and "dinosaur" too.
	- All valid creatures that can't be put into another category, are put into "other".

- Forgotten beasts have a chance to be made of an inorganic material.
	- These materials may be one of the hard-coded ones.
	- These materials may be pulled from the raws.
		- [SPECIAL] materials are exempt.

- Forgotten beasts may lack skin.

- Forgotten beasts have hair/feathers/skin in random colors, pulled from the raws.
	- [SPECIAL] colors are exempt.

- Forgotten beasts have one or more extra traits; tails, antennae, external ribs, etc.
	- Forgotten beasts with external ribs should only be based on creatures with *internal* ribs.
	- Forgotten beasts with external ribs should not keep their internal ribs.
	
- Forgotten beasts each have a special attack.
	- The special attack is mentioned in the description.
	- The special attacks are:
		- Tail stinger
		- Insect stinger
		- Fire 
			- Jet of flames
			- Fire ball
			- Both
		- Webs
		- Breathe trailing flow
			- vapors
			- gas
			- dust
		- Breathe glob
		- Breathe undirected
			- vapors
			- gas
			- dust
		- Secretion
		- Poison blood
		- Poison bite
		- Proboscis blood (i.e. "hunger for warm blood")
		
- Forgotten beasts have one evil descriptor each.

## Werebeasts

- Werebeasts should end up bipedal.
- Werebeasts should only be based on mammals and reptilians, including crocodilians.


