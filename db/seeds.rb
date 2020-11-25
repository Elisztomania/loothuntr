puts 'Cleaning database...'
Member.destroy_all
Guild.destroy_all
Quest.destroy_all
User.destroy_all


puts 'Creating user...'

user_admin = User.create(username:"LootHuntr", email:"admin@loothuntr.co", password:"getschompignon", bio: "Je suis l'admin du site. Show me respect")

puts 'Creating quest...'

tresor_LyonVaise = Quest.create!(title:"Trésor de Lyon-Vaise", description:"Le trésor de Lyon-Vaise est un ensemble d’objets précieux du IIIe siècle de l’Empire romain, trouvés à Lyon en 1992 et exposés au musée gallo-romain de Fourvière. Plus précisément daté d’après les monnaies qu’il comporte, ce trésor aurait été enseveli après 258 dans la crainte des raids barbares, peut-être lors du raid de 259.", location: "20-28 Rue Masaryk, 69009 Lyon", resolved:false, creator: user_admin)

tresor_mandrin = Quest.create!(title:"Trésor de Mandrin", description:"On raconte que Mandrin aurait pris l’habitude de cacher ses butins dans des endroits qu’il nommait ses coffres-forts. Plusieurs d’entre eux auraient été localisés !
Ainsi, une cassette serait encore enterrée dans le jardin de sa maison natale à Saint-Etienne-de Saint-Geoirs (Isère). A Verel-de-Montbel (Savoie), il fera une cache dans les hautes roches qui entoure le village et y glissa une bourse remplie de pierres précieuses. Il enterra 25 000 livres en or en pleine forêt du Vercors là où Mandrin aimait à prendre ses quartiers.", location: "Carterie - Gadgeterie, 63600 Ambert", resolved:false, creator: user_admin)

puts 'Creating guild...'
hunters_de_loot = Guild.create!(name:"Hunters de Loot", description:"On est des chasseurs de trésoooooors !", creator: user_admin, quest: tresor_LyonVaise)

puts 'Finished!'
