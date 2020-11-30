require 'open-uri'

puts 'Cleaning database...'

  Member.destroy_all
  Post.destroy_all
  Guild.destroy_all
  Quest.destroy_all
  User.destroy_all

puts 'Creating users...'

  user_admin = User.create(username:"LootHuntr", email:"admin@loothuntr.co", password:"getschompignon", bio: "Je suis l'admin du site. Show me respect")
      avatar = File.open("app/assets/images/admin.jpg")
      user_admin.photo.attach(io: avatar, filename: 'admin.jpg', content_type: 'image/jpg')
        user_admin.save!
  indiana = User.create(username:"Indiana Jones", email:"indiana@jones.co", password:"aventure10", bio: "J'adore l'aventure !")
      avatar = File.open("app/assets/images/indiana.jpg")
      indiana.photo.attach(io: avatar, filename: 'indiana.jpg', content_type: 'image/jpg')
        indiana.save!
  benjamin = User.create(username:"Benjamin Gates", email:"ben@portail.co", password:"portail2", bio: "Passionné par l'histoire des Etats Unis")
      avatar = File.open("app/assets/images/ben.jpg")
      benjamin.photo.attach(io: avatar, filename: 'ben.jpg', content_type: 'image/jpg')
        benjamin.save!
  ella = User.create(username:"Ella Maillart", email:"e@ll.a", password:"ellaellaaa", bio: "Passionnée de voile et de ski, j'ai fondé le premier club féminin de hockey sur glace en Suisse romande.")
      avatar = File.open("app/assets/images/ella.jpg")
      ella.photo.attach(io: avatar, filename: 'ella.jpg', content_type: 'image/jpg')
        ella.save!
  lara = User.create(username:"Lara Croft", email:"lara@croft.co", password:"aventure20", bio: "Prof d'histoire, je suis passionnée d'aventure et je rêve de trouver un trésor.")
      avatar = File.open("app/assets/images/lara.jpg")
      lara.photo.attach(io: avatar, filename: 'lara.jpg', content_type: 'image/jpg')
        lara.save!
  xavier = User.create(username:"Xavier.D", email:"xav@chasseur.co", password:"aventure200", bio: "Mon détecteur de métal sous le bras, récemment à la retraite, j'ai décidé de consacrer ce précieux temps à la recherche de trésors...")
      avatar = File.open("app/assets/images/xav.jpg")
      xavier.photo.attach(io: avatar, filename: 'xav.jpg', content_type: 'image/jpg')
        xavier.save!

puts 'Creating quests...'

  tresor_LyonVaise = Quest.create!(title:"Trésor de Lyon-Vaise", description:"Le trésor de Lyon-Vaise est un ensemble d’objets précieux du IIIe siècle de l’Empire romain, trouvés à Lyon en 1992 et exposés au musée gallo-romain de Fourvière. Plus précisément daté d’après les monnaies qu’il comporte, ce trésor aurait été enseveli après 258 dans la crainte des raids barbares, peut-être lors du raid de 259. Outre les pièces de vaisselle, bijoux et monnaies qu'il contient, il a l'originalité d'inclure des statuettes en argent et acquiert ainsi une place à part dans l'ensemble des trésors du iiie siècle.", location: "20-28 Rue Masaryk, 69009 Lyon", resolved:true, creator: user_admin)
      tresor_LyonVaise.update(latitude: 42.7786521, longitude: 4.8073518)
      source = File.open("app/assets/images/lyon_vaise.jpeg")
      tresor_LyonVaise.photo.attach(io: source, filename: 'lyon_vaise.jpeg', content_type: 'image/jpeg')
        tresor_LyonVaise.save!
  tresor_mandrin = Quest.create!(title:"Trésor de Mandrin", description:"On raconte que Mandrin aurait pris l’habitude de cacher ses butins dans des endroits qu’il nommait ses coffres-forts. Plusieurs d’entre eux auraient été localisés !
  Ainsi, une cassette serait encore enterrée dans le jardin de sa maison natale à Saint-Etienne-de Saint-Geoirs (Isère). A Verel-de-Montbel (Savoie), il fera une cache dans les hautes roches qui entoure le village et y glissa une bourse remplie de pierres précieuses. Il enterra 25 000 livres en or en pleine forêt du Vercors là où Mandrin aimait à prendre ses quartiers.", location: "Carterie - Gadgeterie, 63600 Ambert", resolved:false, creator: user_admin)
      tresor_mandrin.update(latitude: 45.55, longitude: 5.7167)
      source = File.open("app/assets/images/mandrin.jpeg")
      tresor_mandrin.photo.attach(io: source, filename: 'mandrin.jpeg', content_type: 'image/jpeg')
        tresor_mandrin.save!
  tresor_jeanguennego = Quest.create!(title:"Trésor de Jean Guennégo de Quervien", description:"En 1863, un trésor caché depuis le XVe siècle est mis au jour à Questembert, dans le Morbihan, fortune mise à l’abri des regards par Jean Guennégo de Quervien, exerçant la double profession de maître-d’hôtel à sa mort, emportant avec lui son secret. Sa maison a passé dans des mains étrangères, et l’on ignorerait encore qu’une petite fortune y avait été cachée, si le propriétaire d’une partie du logis de Jean Guennégo, dans le but de réparations intérieures, n’avait mis à découvert la tirelire du maître-d’hôtel. Elle était en terre et contenait environ 2 200 pièces.1090 de ces pièces appartenant toutes au XVe siècle. Il nous révèle que 370 sont en billon blanchi et portent les noms de rois de France. Une seule est de Charles VII ; les autres sont des blancs de billon, au soleil ou à la couronne, de Louis XI et de Charles VIII.", location: "12 Place du Gén de Gaulle, 56230 Questembert", resolved:true, creator: user_admin)
      tresor_jeanguennego.update(latitude: 47.6667, longitude: -2.4667)
      source = File.open("app/assets/images/jeanguennego.jpeg")
      tresor_jeanguennego.photo.attach(io: source, filename: 'jeanguennego.jpeg', content_type: 'image/jpeg')
        tresor_jeanguennego.save!
  tresor_couvent_port_royal = Quest.create!(title: "Le trésor du Couvent de Port royal des Champs", description: "Le trésor du Couvent de Port royal des Champs,rasé au 17° Siècle par Louis XIV,les ruines du couvent garderaient encore d’importantes richesses jamais mises à jours.Les Sœurs sachant que le Roi allait détruire le couvent,firent enterrer le trésor dans l’ancien cimetière,l’ouvrier qui réalisa ce travail du travailler les yeux bandés pour éviter qu’il ne sache ou il enterrait le trésor.Après plusieurs interrogatoire,celui ci dit qu’il entendait roucouler pendant qu’il travaillait a enterrer le butin.Sachant que couvent avait un Superbe pigeonnier qui existe toujours de nos jours.", location: "78114 Magny-les-Hameaux", resolved:false, creator: user_admin)
      tresor_couvent_port_royal.update(latitude: 48.676992, longitude: 2.192863)
      source = File.open("app/assets/images/port_royal.jpeg")
      tresor_couvent_port_royal.photo.attach(io: source, filename: 'port_royal.jpeg', content_type: 'image/jpeg')
        tresor_couvent_port_royal.save!
  tresor_chouette_or = Quest.create!(title: "Le trésor de la Chouette d'Or", description: "Sur la trace de la chouette d'or (marque déposée) est un jeu de sagacité organisé sous la forme d'une chasse au trésor par Max Valentin. Lancée en 1993, elle n'a pas été résolue à ce jour. Pour l'emporter, il faut résoudre onze énigmes publiées dans un ouvrage d'une quarantaine de pages.", location:"Quelque part en France",resolved:false, creator: lara )
      tresor_chouette_or.update(latitude: 45.764, longitude: 2.894)
      source = File.open("app/assets/images/chouette-or.jpg")
      tresor_chouette_or.photo.attach(io: source, filename: 'chouette-or.jpg', content_type: 'image/jpg')
        tresor_chouette_or.save!

puts 'Creating guilds...'

  hunters_de_loot = Guild.create!(name:"Hunters de Loot", description:"On est des chasseurs de trésoooooors !", creator: user_admin, quest: tresor_LyonVaise)
  fiers_de_hache = Guild.create!(name: "Les fiers de hache", description:"On va se faire le donjon de Naheulbeuk! OUAIIS!", creator: user_admin, quest: tresor_couvent_port_royal)
  les_backeuses = Guild.create!(name: "Les backeuses", description:"Du talent dans des boites jaunes", creator: user_admin, quest: tresor_jeanguennego)
  les_chouetteurs = Guild.create!(name: "Les Chouetteurs", description:"Passionnés par la quête de la Chouette d'or, déterminé à trouver le mystère de Michel Becker !", creator: lara, quest: tresor_chouette_or)
  les_flexeurs = Guild.create!(name: "Les Flexeurs", description:"On flex sur tout le monde et sur les trésors, retrouvenez en live Twitch le mardi à 15h21", creator: user_admin, quest: tresor_mandrin)

puts 'Creating members...'

  Member.create!(guild: hunters_de_loot, user: indiana, accepted: true, cover_letter: "j'ai de l'expérienceeee")
  Member.create!(guild: fiers_de_hache, user: benjamin, accepted: true, cover_letter: "j'ai beaucoup d'expérience")
  Member.create!(guild: fiers_de_hache, user: ella, accepted: true, cover_letter: "j'ai plus d'expérienceeee")
  Member.create!(guild: les_backeuses, user: indiana, accepted: true, cover_letter: "j'ai de fou de l'expérienceee")
  Member.create!(guild: les_backeuses, user: ella, accepted: true, cover_letter: "j'ai masse l'expérienceee")
  Member.create!(guild: les_chouetteurs, user: ella, accepted: true, cover_letter: "J'ai plus d'expérienceeee")
  Member.create!(guild: les_chouetteurs, user: indiana, accepted: true, cover_letter: "Je suis Indiana Jones pas besoin de lettre de motivation!")
  Member.create!(guild: les_flexeurs, user: benjamin, accepted: true, cover_letter: "Je flex du lundi au dimanche")
  Member.create!(guild: les_flexeurs, user: xavier, accepted: true, cover_letter: "Je suis une flexbox")

puts "Creating La Chouette d'Or..."

  orga_CO_1 = Post.create!(user: lara, guild: les_chouetteurs, title: "Choix de date pour prochaine sortie", description:"Quelle date vous convient le mieux? Le samedi 12 décmebre?", category: "orga")

  piste_CO_1 = Post.create!(user: lara, guild: les_chouetteurs, title: "Deuxième énigme", description: "Mon Premier, première moitié de la moitié du premier âge,
  Précède mes Second et Troisième, cherchant leur chemin.
  Mon Quatrième s'inspire, mon Cinquième est en rage,
  Mais, sans protester, suit mon Quatrième et l'alpha romain.
  Mon Sixième, aux limites de l'ETERNITE se cache.
  Mon Septième, dressé, crache son venin.
  Pour trouver mon tout, il suffit d'être Sage,
  Car la Vérité, en vérité, ne sera pas affaire de Devin.", category: "piste")
    source_p = File.open("app/assets/images/piste2.png")
    piste_CO_1.photos.attach(io: source_p, filename: 'piste2.png', content_type: 'image/png')
    piste_CO_1.save!

  avancee_CO_1 = Post.create!(user: lara, guild: les_chouetteurs, title: "Le trésor", description: "La chouette d'or qui constitue le lot principal de cette chasse au trésor est une sculpture réalisée par Michel Becker représentant, comme son nom l'indique, une chouette ailes déployées, d'environ 50 centimètres d'envergure, pour un poids d'environ 10 kg, en or et argent, rehaussée de diamants. Michel Becker a enfoui la chouette d’or.", category: "avancee")
    source_a = File.open("app/assets/images/tresor-chouette.jpg")
    avancee_CO_1.photos.attach(io: source_a, filename: 'tresor-chouette.jpg', content_type: 'image/jpg')
    avancee_CO_1.save!

  avancee_CO_2 = Post.create!(user: lara, guild: les_chouetteurs, title: "L'origine...", description: "Lancée le 15 mai 1993, c'est à ce jour la chasse au trésor française ayant la plus grande longévité. À l'origine, son concepteur affirmait l'avoir « programmé » pour une période de huit à quatorze mois. A titre de comparaison, une chasse britannique intitulée Quest : A Zetetic Treasure Hunt aura duré treize ans et sept mois (septembre 1992 - mars 2006).", category: "avancee")

  avancee_CO_3 = Post.create!(user: lara, guild: les_chouetteurs, title: "Première énigme résolue", description: "IL N'EST DE PIRE AVEUGLE, QUE CELUI QUI NE VEUT PAS VOIR.
Sur le visuel on aperçoit une forme humaine devant un arc en ciel, il s'agit du spectre de la lumière blanche.
Les numéros des énigmes correspondent à des longueurs d'ondes en nanomètres de la couleur de la chouette correspondante à l'énigme.
En placant les numéros des énigmes sur un cercle (comme le disque de Newton ou le tableau de l ' E.U.), on s'apercoit que les longueurs d'onde des couleurs complémentaires se font face. On peut donc les associer deux par deux : 530 & 780, 470 & 580, 600 & 500, 420 & 560, 650 & 520", category: "avancee")
    source_a = File.open("app/assets/images/avancee2.png")
    avancee_CO_3.photos.attach(io: source_a, filename: 'avancee2.png', content_type: 'image/png')
    avancee_CO_3.save!

  avancee_CO_4 = Post.create!(user: lara, guild: les_chouetteurs, title: "Indication supplémentaire", description: "LA CHOUETTE N'EST PAS SUR UNE ÎLE. Indication supplémentaire fournie par Michel Becker, à la demande de Max Valentin, dans l'émission Coucou, c'est nous ! du 23 juin 1993 sur TF1.", category: "avancee")

puts "Creating Le Trésor de Lyon Vaise..."

  piste_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Pièces inconnues", description: "Regardez les pièces que nous avons trouvés.. Quelqu'un s'y connait un peu et peut nous dire ce que c'est ?", category: "piste_publiee")

  orga_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Choix de date pour prochaine sortie", description:"Quelle date vous convient le mieux?", category: "orga")

  avancee_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "La découverte", description: "Ce trésor a été découvert en mars 1992, dans le dernier mois d'une fouille archéologique préventive entreprise de août 1991 à mars 19923 en vue de la construction de la ZAC de Charavay au quartier de Vaise, au nord de Lyon, proche de la Saône, en rive droite. Le site se trouve entre la rue du Chapeau rouge et la Grande rue de Vaise.", category: "avancee")
  avancee_LV_3 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "La restauration", description: "Le nettoyage des gangues de terre et des concrétions couvrant les objets a été réalisé par le centre de Recherches et d’Études archéologique de Vienne. Si les bijoux d’or ont rapidement été dégagés, les monnaies et la vaisselle d’argent ont requis des bains chimiques et un nettoyage minutieux sous loupe binoculaire.", category: "avancee" )
  avancee_LV_4 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Le trésor", description: "Les statuettes du trésor de Vaise sont toutes en argent et pour la plupart de thème religieux. Ce lot proviendrait soit d’un temple, soit d’une chapelle privée de la villa fouillée. Trois statuettes sont entières et remarquables par la qualité de leur facture, en tôle d’argent martelée, rehaussée d’une dorure sur le liséré des vêtements, les diadèmes et les fruits.
    Les bijoux sont également remarquables. Par leur facture, ces bijoux sont classés comme des productions gallo-romaines du iiie siècle. Une recherche sur l’origine des émeraudes du collier a abouti à un diagnostic inattendu.", category: "avancee")
    source_a = File.open("app/assets/images/avancee4_1.jpg")
    avancee_LV_4.photos.attach(io: source_a, filename: 'avancee4_1.jpg', content_type: 'image/jpg')
    source_a = File.open("app/assets/images/avancee4_2.jpg")
    avancee_LV_4.photos.attach(io: source_a, filename: 'avancee4_2.jpg', content_type: 'image/jpg')
    avancee_LV_4.save!

puts "Creating Le Trésor de Lyon Vaise..."

  piste_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Pièces inconnues", description: "Regardez les pièces que nous avons trouvés.. Quelqu'un s'y connait un peu et peut nous dire ce que c'est ?", category: "piste_publiee")

  orga_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Choix de date pour prochaine sortie", description:"Quelle date vous convient le mieux?", category: "orga")

  avancee_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "La découverte", description: "Ce trésor a été découvert en mars 1992, dans le dernier mois d'une fouille archéologique préventive entreprise de août 1991 à mars 19923 en vue de la construction de la ZAC de Charavay au quartier de Vaise, au nord de Lyon, proche de la Saône, en rive droite. Le site se trouve entre la rue du Chapeau rouge et la Grande rue de Vaise.", category: "avancee")
  avancee_LV_3 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "La restauration", description: "Le nettoyage des gangues de terre et des concrétions couvrant les objets a été réalisé par le centre de Recherches et d’Études archéologique de Vienne. Si les bijoux d’or ont rapidement été dégagés, les monnaies et la vaisselle d’argent ont requis des bains chimiques et un nettoyage minutieux sous loupe binoculaire.", category: "avancee" )
  avancee_LV_4 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Le trésor", description: "Les statuettes du trésor de Vaise sont toutes en argent et pour la plupart de thème religieux. Ce lot proviendrait soit d’un temple, soit d’une chapelle privée de la villa fouillée. Trois statuettes sont entières et remarquables par la qualité de leur facture, en tôle d’argent martelée, rehaussée d’une dorure sur le liséré des vêtements, les diadèmes et les fruits.
    Les bijoux sont également remarquables. Par leur facture, ces bijoux sont classés comme des productions gallo-romaines du iiie siècle. Une recherche sur l’origine des émeraudes du collier a abouti à un diagnostic inattendu.", category: "avancee")
    source_a = File.open("app/assets/images/avancee4_1.jpg")
    avancee_LV_4.photos.attach(io: source_a, filename: 'avancee4_1.jpg', content_type: 'image/jpg')
    source_a = File.open("app/assets/images/avancee4_2.jpg")
    avancee_LV_4.photos.attach(io: source_a, filename: 'avancee4_2.jpg', content_type: 'image/jpg')
    avancee_LV_4.save!

puts "Creating Le Trésor de Mandrin"




puts 'Finished!'
