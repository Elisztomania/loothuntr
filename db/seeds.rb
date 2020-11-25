puts 'Cleaning database...'
Member.destroy_all
Guild.destroy_all
Quest.destroy_all
User.destroy_all


puts 'Creating users...'

user_admin = User.create(username:"LootHuntr", email:"admin@loothuntr.co", password:"getschompignon", bio: "Je suis l'admin du site. Show me respect")
indiana = User.create(username:"Indiana Jones", email:"indiana@jones.co", password:"aventure10", bio: "J'adore l'aventure !")
benjamin = User.create(username:"Benjamin Gates", email:"ben@portail.co", password:"portail2", bio: "Passionné par l'histoire des Etats Unis")
ella = User.create(username:"Ella Maillart", email:"e@ll.a", password:"ellaellaaa", bio: "Passionnée de voile et de ski, j'ai fondé le premier club féminin de hockey sur glace en Suisse romande.")

puts 'Creating quests...'

tresor_LyonVaise = Quest.create!(title:"Trésor de Lyon-Vaise", description:"Le trésor de Lyon-Vaise est un ensemble d’objets précieux du IIIe siècle de l’Empire romain, trouvés à Lyon en 1992 et exposés au musée gallo-romain de Fourvière. Plus précisément daté d’après les monnaies qu’il comporte, ce trésor aurait été enseveli après 258 dans la crainte des raids barbares, peut-être lors du raid de 259.", location: "20-28 Rue Masaryk, 69009 Lyon", resolved:false, creator: user_admin)
tresor_mandrin = Quest.create!(title:"Trésor de Mandrin", description:"On raconte que Mandrin aurait pris l’habitude de cacher ses butins dans des endroits qu’il nommait ses coffres-forts. Plusieurs d’entre eux auraient été localisés !
Ainsi, une cassette serait encore enterrée dans le jardin de sa maison natale à Saint-Etienne-de Saint-Geoirs (Isère). A Verel-de-Montbel (Savoie), il fera une cache dans les hautes roches qui entoure le village et y glissa une bourse remplie de pierres précieuses. Il enterra 25 000 livres en or en pleine forêt du Vercors là où Mandrin aimait à prendre ses quartiers.", location: "Carterie - Gadgeterie, 63600 Ambert", resolved:false, creator: user_admin)
tresor_jeanguennego = Quest.create!(title:"Questembert tresor de Jean Guennégo de Quervien", description:"En 1863, un trésor caché depuis le XVe siècle est mis au jour à Questembert, dans le Morbihan, fortune mise à l’abri des regards par Jean Guennégo de Quervien, exerçant la double profession de maître-d’hôtel à ça mort, emportant avec lui son secret. Sa maison a passé dans des mains étrangères, et l’on ignorerait encore qu’une petite fortune y avait été cachée, si le propriétaire d’une partie du logis de Jean Guennégo, dans le but de réparations intérieures, n’avait mis à découvert la tirelire du maître-d’hôtel. Elle était en terre et contenait environ 2 200 pièces.1090 de ces pièces appartenant toutes au XVe siècle. Il nous révèle que 370 sont en billon blanchi et portent les noms de rois de France. Une seule est de Charles VII ; les autres sont des blancs de billon, au soleil ou à la couronne, de Louis XI et de Charles VIII.", location: "12 Place du Gén de Gaulle, 56230 Questembert", resolved:true, creator: user_admin)
tresor_couvent_port_royal = Quest.create!(title: "Le trésor du Couvent de Port royal des Champs", description: "Le trésor du Couvent de Port royal des Champs,rasé au 17° Siècle par Louis XIV,les ruines du couvent garderaient encore d’importantes richesses jamais mises à jours.Les Sœurs sachant que le Roi allait détruire le couvent,firent enterrer le trésor dans l’ancien cimetière,l’ouvrier qui réalisa ce travail du travailler les yeux bandés pour éviter qu’il ne sache ou il enterrait le trésor.Après plusieurs interrogatoire,celui ci dit qu’il entendait roucouler pendant qu’il travaillait a enterrer le butin.Sachant que couvent avait un Superbe pigeonnier qui existe toujours de nos jours.", location: "Magny-les-Hameaux, 78114", resolved:false, creator: user_admin)


puts 'Creating guilds...'
hunters_de_loot = Guild.create!(name:"Hunters de Loot", description:"On est des chasseurs de trésoooooors !", creator: user_admin, quest: tresor_LyonVaise)
fiers_de_hache = Guild.create!(name: "Les fiers de hache", description:"On va se faire le donjon de Naheulbeuk! OUAIIS!", creator: user_admin, quest: tresor_couvent_port_royal)
les_backeuses = Guild.create!(name: "Les backeuses", description:"Du talent dans des boites jaunes", creator: user_admin, quest: tresor_jeanguennego)

puts 'Creating members...'

Member.create!(user: indiana, guild: hunters_de_loot, accepted: true, cover_letter: "j'ai de l'expérienceeee")
Member.create!(user: benjamin, guild: fiers_de_hache, accepted: true, cover_letter: "j'ai beaucoup d'expérience")
Member.create!(user: indiana, guild: les_backeuses, accepted: true, cover_letter: "j'ai de fou de l'expérienceee")
Member.create!(user: ella, guild: les_backeuses, accepted: true, cover_letter: "j'ai masse l'expérienceee")
Member.create!(user: ella, guild: fiers_de_hache, accepted: true, cover_letter: "j'ai plus d'expérienceeee")

puts 'Finished!'
