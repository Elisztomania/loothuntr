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

  tresor_LyonVaise = Quest.create!(title:"Trésor de Lyon-Vaise", description:"Le trésor de Lyon-Vaise est un ensemble d’objets précieux du IIIe siècle de l’Empire romain, trouvés à Lyon en 1992 et exposés au musée gallo-romain de Fourvière. Plus précisément daté d’après les monnaies qu’il comporte, ce trésor aurait été enseveli après 258 dans la crainte des raids barbares, peut-être lors du raid de 259. Outre les pièces de vaisselle, bijoux et monnaies qu'il contient, il a l'originalité d'inclure des statuettes en argent et acquiert ainsi une place à part dans l'ensemble des trésors du iiie siècle.", location: "20-28 Rue Masaryk, 69009 Lyon", resolved: true, creator: user_admin)
      tresor_LyonVaise.update(latitude: 45.7726, longitude: 4.8033)
      source = File.open("app/assets/images/lyon_vaise.jpeg")
      tresor_LyonVaise.photo.attach(io: source, filename: 'lyon_vaise.jpeg', content_type: 'image/jpeg')
        tresor_LyonVaise.save!
  tresor_mandrin = Quest.create!(title:"Trésor de Mandrin", description:"On raconte que Mandrin aurait pris l’habitude de cacher ses butins dans des endroits qu’il nommait ses coffres-forts. Plusieurs d’entre eux auraient été localisés !
  Ainsi, une cassette serait encore enterrée dans le jardin de sa maison natale à Saint-Etienne-de Saint-Geoirs (Isère). A Verel-de-Montbel (Savoie), il fera une cache dans les hautes roches qui entoure le village et y glissa une bourse remplie de pierres précieuses. Il enterra 25 000 livres en or en pleine forêt du Vercors là où Mandrin aimait à prendre ses quartiers.", location: "Carterie - Gadgeterie, 63600 Ambert", resolved: false, creator: user_admin)
      tresor_mandrin.update(latitude: 45.55, longitude: 5.7167)
      source = File.open("app/assets/images/mandrin.jpeg")
      tresor_mandrin.photo.attach(io: source, filename: 'mandrin.jpeg', content_type: 'image/jpeg')
        tresor_mandrin.save!
  tresor_jeanguennego = Quest.create!(title:"Trésor de Jean Guennégo de Quervien", description:"En 1863, un trésor caché depuis le XVe siècle est mis au jour à Questembert, dans le Morbihan, fortune mise à l’abri des regards par Jean Guennégo de Quervien, exerçant la double profession de maître-d’hôtel à sa mort, emportant avec lui son secret. Sa maison a passé dans des mains étrangères, et l’on ignorerait encore qu’une petite fortune y avait été cachée, si le propriétaire d’une partie du logis de Jean Guennégo, dans le but de réparations intérieures, n’avait mis à découvert la tirelire du maître-d’hôtel. Elle était en terre et contenait environ 2 200 pièces.1090 de ces pièces appartenant toutes au XVe siècle. Il nous révèle que 370 sont en billon blanchi et portent les noms de rois de France. Une seule est de Charles VII ; les autres sont des blancs de billon, au soleil ou à la couronne, de Louis XI et de Charles VIII.", location: "12 Place du Gén de Gaulle, 56230 Questembert", resolved: true, creator: user_admin)
      tresor_jeanguennego.update(latitude: 47.6667, longitude: -2.4667)
      source = File.open("app/assets/images/jeanguennego.jpeg")
      tresor_jeanguennego.photo.attach(io: source, filename: 'jeanguennego.jpeg', content_type: 'image/jpeg')
        tresor_jeanguennego.save!
  tresor_couvent_port_royal = Quest.create!(title: "Le trésor du Couvent de Port royal des Champs", description: "Le trésor du Couvent de Port royal des Champs,rasé au 17° Siècle par Louis XIV,les ruines du couvent garderaient encore d’importantes richesses jamais mises à jours.Les Sœurs sachant que le Roi allait détruire le couvent,firent enterrer le trésor dans l’ancien cimetière,l’ouvrier qui réalisa ce travail du travailler les yeux bandés pour éviter qu’il ne sache ou il enterrait le trésor.Après plusieurs interrogatoire,celui ci dit qu’il entendait roucouler pendant qu’il travaillait a enterrer le butin. Sachant que couvent avait un Superbe pigeonnier qui existe toujours de nos jours.", location: "Magny-les-Hameaux", resolved: false, creator: user_admin)
      tresor_couvent_port_royal.update(latitude: 48.7333, longitude: 2.0667)
      source = File.open("app/assets/images/port_royal.jpeg")
      tresor_couvent_port_royal.photo.attach(io: source, filename: 'port_royal.jpeg', content_type: 'image/jpeg')
        tresor_couvent_port_royal.save!
  tresor_chouette_or = Quest.create!(title: "Le trésor de la Chouette d'Or", description: "Sur la trace de la chouette d'or (marque déposée) est un jeu de sagacité organisé sous la forme d'une chasse au trésor par Max Valentin. Lancée en 1993, elle n'a pas été résolue à ce jour. Pour l'emporter, il faut résoudre onze énigmes publiées dans un ouvrage d'une quarantaine de pages.", location:"Quelque part en France",resolved: false, creator: lara )
      tresor_chouette_or.update(latitude: 45.764, longitude: 2.894)
      source = File.open("app/assets/images/chouette-or.jpg")
      tresor_chouette_or.photo.attach(io: source, filename: 'chouette-or.jpg', content_type: 'image/jpg')
        tresor_chouette_or.save!
  tresor_crypto_buse = Quest.create!(title: "Le cryptogramme de la Buse", description: "Le cryptogramme de La Buse est un document crypté que l'on attribue à Olivier Levasseur, pirate connu sous le nom de La Buse. Ce document permet de localiser son fabuleux trésor. D'après la légende orale, retranscrite par de nombreux auteurs, le pirate aurait jeté son cryptogramme dans la foule juste avant de mourir pendu le 7 juillet 1730. Tout en lançant son cryptogramme vers la foule venue assister à sa pendaison, il se serait écrié « Mon trésor à qui saura le prendre… ».", location:"Chemin Cremont", resolved: false, creator: ella )
      tresor_crypto_buse.update(latitude: 55.313052, longitude: -20.955623)
      source = File.open("app/assets/images/crypto_de_la_buse.jpg")
      tresor_crypto_buse.photo.attach(io: source, filename: 'crypto_de_la_buse.jpg', content_type: 'image/jpg')
        tresor_crypto_buse.save!
  tresor_abbaye_jumiege = Quest.create!(title: "Les ifs de l'abbaye", description: "Un trésor aurait été caché près d'un if dans le parc de l'abbaye de Jumièges pendant la révolution.", location:"Jumièges", resolved: false, creator: benjamin )
      tresor_abbaye_jumiege.update(latitude: 49.435, longitude: 0.822)
      source = File.open("app/assets/images/abbaye_jumieges.jpg")
      tresor_abbaye_jumiege.photo.attach(io: source, filename: 'abbaye_jumieges.jpg', content_type: 'image/jpg')
        tresor_abbaye_jumiege.save!
  tresor_vierges_verdun = Quest.create!(title: "La dot des vierges de Verdun", description: "Lorsque pendant la Révolution, la ville de Verdun fut investie par les troupes de Brunswick, la population accueillit l'envahisseur par des liesses et des fêtes. Une cérémonie fut donnée au cours de laquelle, des jeunes filles toutes vêtues de blanc, vinrent remettre des dragées et des bouquets de fleurs au conquérant. Parmi elles, on comptait trois sœurs issues de la classe aisée de Verdun, les sœurs Watrin. La ville fut finalement reprise par les Français et près de quarante des participants à la réception, furent dénoncés par leurs concitoyens et arrêtées.
Elles restèrent dans leurs geôles jusqu’en 1794, année au cours de laquelle elles furent finalement transférées à Paris pour y être jugées. Les plus jeunes furent condamnées à 20 ans de détention, les autres furent guillotinées.
Parmi elles se trouvaient les sœurs Watrin dites 'les vierges de Verdun'. Avant d’être arrêtées, elles avaient morcelé leurs dots en 12 dépôts cachés ou enterrés en différents endroits de Verdun. Le montant total de ces dots atteindrait 10 000 livres et 5 000 écus en monnaies ainsi que des bijoux.", location:"Verdun", resolved: false, creator: benjamin )
      tresor_vierges_verdun.update(latitude: 49.1667, longitude: 5.3833)
      source = File.open("app/assets/images/vierges_verdun.jpg")
      tresor_vierges_verdun.photo.attach(io: source, filename: 'vierges_verdun.jpg', content_type: 'image/jpg')
        tresor_vierges_verdun.save!
  tresor_ruines_bazoches = Quest.create!(title: "Les ruines de Bazoches", description: "La Commanderie de Bazoches-les-Bray aurait encore son fabuleux trésor des templiers enfouis sous les ruines du village.", location:"Bazoche-les-Bray", resolved: false, creator: ella )
      tresor_ruines_bazoches.update(latitude: 48.4, longitude: 3.1833)
      source = File.open("app/assets/images/ruines_bazoche.jpg")
      tresor_ruines_bazoches.photo.attach(io: source, filename: 'ruines_bazoche.jpg', content_type: 'image/jpg')
        tresor_ruines_bazoches.save!
  tresor_anglet = Quest.create!(title: "Les traces du camp de Blancpignon", description: "L’histoire se passe en 1814. Lors de la campagne de France, les troupes anglaises du général Wellington s’installèrent sur les hauteurs d’Anglet. Lorsqu’il leva le camp pour marcher sur Paris, le général ordonna d’enterrer l’excédent de bagages et de matériel militaire qui ne pouvait être emmené dans le cadre d’une campagne éclaire. Mais le général avait également installé sur le camp un atelier de faux monnayage dans lequel il frappait les napoléons (les pièces de l’époque) pour ses troupes. On a déjà retrouvé aux abords du bivouac, une partie de ses monnaies frappées. Le camp se trouvait au lieu-dit Blancpignon.", location:"Anglet", resolved:false, creator: indiana )
      tresor_anglet.update(latitude: 43.4833, longitude: -1.5333)
      source = File.open("app/assets/images/anglet.jpg")
      tresor_anglet.photo.attach(io: source, filename: 'anglet.jpg', content_type: 'image/jpg')
        tresor_anglet.save!
  tresor_rennes_le_chateau = Quest.create!(title: "L'abbé de Rennes-le-château", description: "Historiquement, la première trace écrite mentionnant le prétendu trésor de l'abbé Saunières date de 1936. Elle réside dans le récit des voyages de Jean Girou dans la haute vallée de l'Aude. Voici ce que l'on peut encore y lire aujourd'hui : « des maisons en ruine, un château féodal délabré surplombent et se confondent avec la falaise calcaire, puis des villas, des tours à véranda, neuves et modernes contrastent étrangement avec ces ruines : c'est la maison d'un curé qui aurait bâti cette demeure somptueuse avec l'argent d'un trésor trouvé».", location:"Rennes-le-château", resolved: false, creator: ella )
      tresor_rennes_le_chateau.update(latitude: 42.9333, longitude: 2.2667)
      source = File.open("app/assets/images/rennes_le_chateau.jpg")
      tresor_rennes_le_chateau.photo.attach(io: source, filename: 'rennes_le_chateau.jpg', content_type: 'image/jpg')
        tresor_rennes_le_chateau.save!
  tresor_auriol = Quest.create!(title: "Le trésor d'Auriol", description: "Le trésor d'Auriol est un ensemble de plusieurs milliers de monnaies antiques découvertes en 1867 non loin du village d'Auriol, dans les Bouches-du-Rhône. Produites localement, ces monnaies constituent le premier monnayage connu sur le territoire français et le point de départ de la numismatique provençale. Le dépôt, connu aujourd'hui sous le nom de « Trésor d'Auriol », a été découvert en février 1867 dans une oliveraie entre Auriol et Belcodène au lieu-dit « les Barres » au Nord du Baou-Rouge.", location:"Auriol", resolved: true, creator: user_admin )
      tresor_auriol.update(latitude: 43.3833, longitude: 5.6333)
      source = File.open("app/assets/images/auriol.jpg")
      tresor_auriol.photo.attach(io: source, filename: 'auriol.jpg', content_type: 'image/jpg')
        tresor_auriol.save!

# EXEMPLE
  # tresor_abbaye = Quest.create!(title: "", description: "", location:"", resolved: false, creator: ella )
  #     tresor_abbaye.update(latitude: , longitude: )
  #     source = File.open("app/assets/images/abbaye.jpg")
  #     tresor_abbaye.photo.attach(io: source, filename: 'abbaye.jpg', content_type: 'image/jpg')
  #       tresor_abbaye.save!


puts 'Creating guilds...'

  hunters_de_loot = Guild.create!(name:"Hunters de Loot", description:"On est des chasseurs de trésoooooors !", creator: user_admin, quest: tresor_LyonVaise)
  les_flexeurs = Guild.create!(name: "Les Flexeurs", description:"On flex sur tout le monde et sur les trésors, retrouvenez en live Twitch le mardi à 15h21", creator: user_admin, quest: tresor_mandrin)
  les_backeuses = Guild.create!(name: "Les backeuses", description:"Du talent dans des boites jaunes", creator: user_admin, quest: tresor_jeanguennego)
  fiers_de_hache = Guild.create!(name: "Les fiers de hache", description:"On va se faire le donjon de Naheulbeuk! OUAIIS!", creator: user_admin, quest: tresor_couvent_port_royal)
  les_chouetteurs = Guild.create!(name: "Les Chouetteurs", description:"Passionnés par la quête de la Chouette d'or, déterminé à trouver le mystère de Michel Becker !", creator: lara, quest: tresor_chouette_or)
  pirates_d_attaque = Guild.create!(name: "Pirates d'attaque", description:"Tipiac - Pirates !", creator: ella, quest: tresor_crypto_buse)
  les_nuls = Guild.create!(name: "Les nuls", description:"[description nulle]", creator: benjamin, quest: tresor_abbaye_jumiege)
  les_inconnus = Guild.create!(name: "Les inconnus", description:"[description inconnue]", creator: benjamin, quest: tresor_vierges_verdun)
  aventurados = Guild.create!(name: "Les Aventurados", description:"Fans d'aventures et de guacamoleq", creator: indiana, quest: tresor_anglet )
  renes_rennais = Guild.create!(name: "Renés les rennais", description:"Guilde avec uniquement des René qui viennent de Rennes-le-Château", creator: ella, quest: tresor_rennes_le_chateau)
  a_l_abordage = Guild.create!(name: "A l'abordage", description:"Tayooooooo", creator: user_admin, quest: tresor_auriol)


   # = Guild.create!(name: "", description:"", creator: , quest: )


puts 'Creating members...'

  Member.create!(guild: hunters_de_loot, user: indiana, accepted: true, cover_letter: "j'ai de l'expérienceeee")
  Member.create!(guild: les_flexeurs, user: benjamin, accepted: true, cover_letter: "Je flex du lundi au dimanche")
  Member.create!(guild: les_flexeurs, user: lara, accepted: true, cover_letter: "Je suis une flexbox lalalilalèèèère")
  Member.create!(guild: les_backeuses, user: indiana, accepted: true, cover_letter: "j'ai de fou de l'expérienceee")
  Member.create!(guild: les_backeuses, user: ella, accepted: true, cover_letter: "j'ai masse l'expérienceee")
  Member.create!(guild: fiers_de_hache, user: benjamin, accepted: true, cover_letter: "j'ai beaucoup d'expérience")
  Member.create!(guild: fiers_de_hache, user: ella, accepted: true, cover_letter: "j'ai plus d'expérienceeee")
  Member.create!(guild: les_chouetteurs, user: ella, accepted: true, cover_letter: "J'ai plus d'expérienceeee")
  Member.create!(guild: les_chouetteurs, user: indiana, accepted: true, cover_letter: "Je suis Indiana Jones pas besoin de lettre de motivation!")
  Member.create!(guild: pirates_d_attaque, user: benjamin, accepted: true, cover_letter: "J'ai faim feed meeeeeeeeeee")
  Member.create!(guild: pirates_d_attaque, user: indiana, accepted: true, cover_letter: "acceptez-moi plssssssssss")
  Member.create!(guild: a_l_abordage, user: ella, accepted: true, cover_letter: "stp stp stp stp stp stp stp stp stp")

  # Member.create!(guild: , user: , accepted: , cover_letter: "")

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
    source_a = File.open("app/assets/images/avancee_CO_3.png")
    avancee_CO_3.photos.attach(io: source_a, filename: 'avancee_CO_3.png', content_type: 'image/png')
    avancee_CO_3.save!

  avancee_CO_4 = Post.create!(user: lara, guild: les_chouetteurs, title: "Indication supplémentaire", description: "LA CHOUETTE N'EST PAS SUR UNE ÎLE. Indication supplémentaire fournie par Michel Becker, à la demande de Max Valentin, dans l'émission Coucou, c'est nous ! du 23 juin 1993 sur TF1.", category: "avancee")


puts "Creating Le Trésor de Lyon Vaise..."

  orga_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Choix de date pour prochaine sortie", description:"Quelle date vous convient le mieux?", category: "orga")

  piste_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Pièces inconnues", description: "Regardez les pièces que nous avons trouvés.. Quelqu'un s'y connait un peu et peut nous dire ce que c'est ?", category: "piste_publiee")

  avancee_LV_1 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "La découverte", description: "Ce trésor a été découvert en mars 1992, dans le dernier mois d'une fouille archéologique préventive entreprise de août 1991 à mars 19923 en vue de la construction de la ZAC de Charavay au quartier de Vaise, au nord de Lyon, proche de la Saône, en rive droite. Le site se trouve entre la rue du Chapeau rouge et la Grande rue de Vaise.", category: "avancee")
  avancee_LV_2 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "La restauration", description: "Le nettoyage des gangues de terre et des concrétions couvrant les objets a été réalisé par le centre de Recherches et d’Études archéologique de Vienne. Si les bijoux d’or ont rapidement été dégagés, les monnaies et la vaisselle d’argent ont requis des bains chimiques et un nettoyage minutieux sous loupe binoculaire.", category: "avancee" )
  avancee_LV_3 = Post.create!(user: user_admin, guild: hunters_de_loot, title: "Le trésor", description: "Les statuettes du trésor de Vaise sont toutes en argent et pour la plupart de thème religieux. Ce lot proviendrait soit d’un temple, soit d’une chapelle privée de la villa fouillée. Trois statuettes sont entières et remarquables par la qualité de leur facture, en tôle d’argent martelée, rehaussée d’une dorure sur le liséré des vêtements, les diadèmes et les fruits.
    Les bijoux sont également remarquables. Par leur facture, ces bijoux sont classés comme des productions gallo-romaines du iiie siècle. Une recherche sur l’origine des émeraudes du collier a abouti à un diagnostic inattendu.", category: "avancee")
    source_a = File.open("app/assets/images/avancee_LV_3_1.jpg")
    avancee_LV_3.photos.attach(io: source_a, filename: 'avancee_LV_3_1.jpg', content_type: 'image/jpg')
    source_a = File.open("app/assets/images/avancee_LV_3_2.jpg")
    avancee_LV_3.photos.attach(io: source_a, filename: 'avancee_LV_3_2.jpg', content_type: 'image/jpg')
    avancee_LV_3.save!


puts "Creating Le Trésor de Mandrin"

  piste_TM_1 = Post.create!(user: indiana, guild: les_flexeurs, title: "A une lieue d'Ambert", description: "Alors, le trésor a été perdu tout près du village. Voici une carte des déplacements de Mandrin et des différents endroits où il a caché des coffres qui ont été retrouvé. Pour le notre, il doit être à une lieue du village, soit environ 4 km.", category: "piste")
    source_a = File.open("app/assets/images/piste_TM_1.jpg")
    piste_TM_1.photos.attach(io: source_a, filename: 'piste_TM_1.jpg', content_type: 'image/jpg')
    piste_TM_1.save!

  orga_TM_1 = Post.create!(user: benjamin, guild: les_flexeurs, title: "Grande battue 1/12", description:"Qui est dispo ce samedi pour fouiller le 1/12e ?", category: "orga")

  avancee_TM_1 = Post.create!(user: user_admin, guild: les_flexeurs, title: "Départ du village d'Ambert", description: "La quête démarre au cœur du vieil Ambert, rue du Château. Là, grâce aux paroles d’Henri Pourrat, nous savons où aller : « La rue descend vers une placette de quincailliers, d'horlogers, de confiseurs. D'un bac de lave noirâtre, rond comme un cratère, s'élève un fût cannelé portant très haut une urne d'ancien modèle. […] Pour dominer tout cela, sur un conciliabule de quatre vieux toits, il y a la Tour de Mandrin. Moins haute et guère plus grosse qu'un pilier de clocher. Mais pour des enfants, une tour, c'est-à-dire un lieu plus secret, plus relevé, plus noble que les autres ».
Il s’agit bien sûr de la place des Minimes.", category: "avancee")
  avancee_TM_2 = Post.create!(user: user_admin, guild: les_flexeurs, title: "Escaliers et légende", description: "Ruelle des Minimes. Nous avons exploré sous l’escalier comme la légende l’indique : « Un jour d'octobre 1754, les Mandrins, contrebandiers célèbres vêtus de grandes houppelandes bleues passèrent à Ambert. Mandrin avait une amie qui habitait là et il en profita pour cacher le trésor sous l'escalier ». Mais il n’y a plus rien depuis des décennies semble-t-il. En effet, nous avons pu découvrir un autre morceau de la légende, jusqu’ici inconnu : « Un vieil homme à toque de fourrure monte pesamment, une main à la muraille qui tourne. Il va là-haut, au charnier, couper une flèche de lard. Soudainement il manque de tomber. Un des degrés a cédé sous lui. Il sacre puis regarde. Il passe la main et tire un sac de toile rousse. Si pesant, rempli de pièces d'argent frappées un peu de côté, à croix et à fleurs de lys »
Suite, au prochain épisode.", category: "avancee" )
    source_a = File.open("app/assets/images/avancee_TM_2.jpeg")
    avancee_TM_2.photos.attach(io: source_a, filename: 'avancee_TM_2.jpeg', content_type: 'image/jpeg')
    avancee_TM_2.save!


puts "Creating Le cryptogramme de la Buse..."

  orga_CB_1 = Post.create!(user: ella, guild: pirates_d_attaque, title: "Le grand voyage", description:"Bon du coup, qui est dispo pour aller sur l'île de la Réunion ?", category: "orga")

  piste_CB_1 = Post.create!(user: indiana, guild: pirates_d_attaque, title: "Pierre gravée", description: "Grâce aux indices précédents, cette pierre a été trouvé. Deux hypothèses relativement différentes peuvent être avancées :
1) La première hypothèse consiste à interprêter les signes comme des lettres : A†P ou A†Γ.
2) La deuxième hypothèse consiste à interprêter les signes comme des marques des outils symboliques de la Franc-maçonnererie.
Vous en pensez quoi ??", category: "piste")
    source_a = File.open("app/assets/images/piste_CB_1.png")
    piste_CB_1.photos.attach(io: source_a, filename: 'piste_CB_1.png', content_type: 'image/png')
    source_a = File.open("app/assets/images/piste_CB_1_2.jpg")
    piste_CB_1.photos.attach(io: source_a, filename: 'piste_CB_1_2.jpg', content_type: 'image/jpg')
    piste_CB_1.save!

  avancee_CB_1 = Post.create!(user: ella, guild: pirates_d_attaque, title: "Cryptogramme nettoyé", description: "L'étude du cryptogramme est basée sur le graphisme des lettres et des anomalies. Des analyses textuelles (traductions, sens littéral, sens littéraire, statistique, redondances, anomalies d'orthographes, grammaticale, champ lexical, etc) ont également était effectuées à partir des noms, noms propres des acteurs de l'époque (pirates, navires, lieux de mouillages connus en 1700, contexte historiques, langues, religions...). Ici, nous avons la version \"nettoyée\" du cryptogramme.", category: "avancee")
    source_a = File.open("app/assets/images/avancee_CB_1.jpg")
    avancee_CB_1.photos.attach(io: source_a, filename: 'avancee_CB_1.jpg', content_type: 'image/jpg')
    avancee_CB_1.save!
  avancee_CB_2 = Post.create!(user: ella, guild: pirates_d_attaque, title: "La Croix du Sud", description: "On isole les signes de forme d’un ‘A’ (en fait des lettres Z marquées, avec un Z comme dans l'orthographe de l'époque de \"La Buze\"). Il apparaît sans équivoque que la Croix du Sud figure dans le crypto et avec elle, les coordonnées 55.5 et 22. Avec longitude 55.5 et latitude 22, même à cette époque, il était impossible de manquer l'Ile de la Réunion. C'est vers ça qu'on oriente nos recherches.", category: "avancee")
    source_a = File.open("app/assets/images/avancee_CB_2_1.jpeg")
    avancee_CB_2.photos.attach(io: source_a, filename: 'avancee_CB_2_1.jpeg', content_type: 'image/jpeg')
    source_a = File.open("app/assets/images/avancee_CB_2_2.png")
    avancee_CB_2.photos.attach(io: source_a, filename: 'avancee_CB_2_2.png', content_type: 'image/png')
    avancee_CB_2.save!


puts "Creating Le trésor d'Auriol"

  avancee_TA_1 = Post.create!(user: user_admin, guild: a_l_abordage, title: "Découverte !", description: "Le découvreur, Monsieur Aubert cultivateur de son état, labourait son champ lorsqu'il trouva un vase brisé en argile sous une grosse pierre plate. Il décida alors de montrer sa découverte à l'Abbé Bargès pour lui demander conseil. Celui-ci rendit la découverte publique dans un article publié dans la presse locale.", category: "avancee")
  avancee_TA_2 = Post.create!(user: user_admin, guild: a_l_abordage, title: "Préfet et sénateur", description: "Le préfet des Bouches-du-Rhône dépêcha sur place pour inventorier le trésor Louis Blancard et Joseph Laugier, respectivement archiviste et conservateur du Cabinet des Monnaies et Médailles, qui publièrent un compte-rendu de la découverte dans la presse. Le sénateur M. de Saulcy, dépêcha sur place M. Charvet afin de négocier l'achat des pièces. L'abbé Bargès signale que ce dernier fit l'achat de 1 184 pièces, soit plus de la moitié du trésor dont la plus grande partie a été divisée entre plusieurs cabinets de France, le musée de Saint-Germain, le British muséum, les médailliers de MM. de Saulcy, de Clapiers, Lecomte, Blancard, et à l'étranger. Monsieur Aubert demanda à l'abbé Bargès de lui servit d'intermédiaire et de négocier les cessions pour son compte.", category: "avancee")
  avancee_TA_3 = Post.create!(user: user_admin, guild: a_l_abordage, title: "Inventaire du trésor", description: "Le trésor constitué de 2 130 monnaies divisionnaires en argent était dissimulé dans un vase en argile grise enfouie sous une grosse pierre plate. Ce qui reste du vase est aujourd'hui visible au musée de Saint-Germain-en-Laye. Les monnaies qui composent le trésor ont été émises à Massalia vers 500 avant J.C.. Elles sont en argent et anépigraphes, c’est-à-dire qu'elles ne comportent aucune inscription. La plupart d'entre elles présentent des dessins variés sur l'avers inspirés des monnaies d'Asie Mineure et représentant les emblèmes des cités d'origine et, sur le revers, une marque en forme de carré creux en « ailes de moulin » encore appelée « svastikoïde ».", category: "avancee")
    source_a = File.open("app/assets/images/avancee_TA_3.jpg")
    avancee_TA_3.photos.attach(io: source_a, filename: 'avancee_TA_3.jpg', content_type: 'image/jpg')
    avancee_TA_3.save!

puts 'Finished!'

# avancee_CB_1 = Post.create!(user: ella, guild: pirates_d_attaque, title: "", description: "", category: "")
