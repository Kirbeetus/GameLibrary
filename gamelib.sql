DROP TABLE IF EXISTS Game CASCADE CONSTRAINTS;
DROP TABLE IF EXISTS Console CASCADE CONSTRAINTS;
DROP TABLE IF EXISTS Genre CASCADE CONSTRAINTS;
DROP TABLE IF EXISTS Controller CASCADE CONSTRAINTS;
DROP TABLE IF EXISTS Accessory CASCADE CONSTRAINTS;

CREATE TABLE ConsoleType
(
    ConsoleType VARCHAR(32) NOT NULL,
    IsPortable Boolean,
    Manufacturer VARCHAR(32) NOT NULL,
    CONSTRAINT ConsoleType_pk PRIMARY KEY (ConsoleName)
);
CREATE TABLE Console
(
    ConsoleType VARCHAR(32) NOT NULL,
    ConsoleName VARCHAR(32) NOT NULL,
    Condition Char(1) NOT NULL,
    NumControllers INT,
    IsPortable Boolean,
    Refurbished Boolean,
    Color VARCHAR(32) NOT NULL,
    Manufacturer VARCHAR(32) NOT NULL,
    CONSTRAINT Console_pk PRIMARY KEY (ConsoleName, Color),
    CONSTRAINT Console_ConsoleType_fk FOREIGN KEY (ConsoleType) REFERENCES ConsoleType(ConsoleName)
);
CREATE TABLE Game
(
    GameName VARCHAR(32) NOT NULL,
    ConsoleType VARCHAR(32) NOT NULL,
    Condition Char(1) NOT NULL,
    HasBox INT,
    HasManual Boolean,
    HasExtras Boolean,
    ExtraType VARCHAR(32),
    Rating VARCHAR(32) NOT NULL,
    ReleaseYear YEAR,
    Developer VARCHAR(32),
    Publisher VARCHAR(32),
    Played Boolean,
    Renting Boolean,
    Series VARCHAR(32),
    CONSTRAINT Game_pk PRIMARY KEY (GameName, ConsoleType),
    CONSTRAINT Game_Console_fk FOREIGN KEY (ConsoleType) REFERENCES Console(ConsoleType)
);
CREATE TABLE Genre
(
    GameName VARCHAR(32) NOT NULL,
    ConsoleType VARCHAR(32) NOT NULL,
    Genre VARCHAR(32) NOT NULL,
    CONSTRAINT Genre_Game_fk FOREIGN KEY (GameName, ConsoleType) REFERENCES Game(GameName, ConsoleType)
);
CREATE TABLE Controller
(
    ConsoleType VARCHAR(32) NOT NULL,
    Condition Char(1) NOT NULL,
    Wireless Boolean,
    Color VARCHAR(32),
    FirstParty Boolean,
    CONSTRAINT Controller_fk FOREIGN KEY (ConsoleType) REFERENCES Console(ConsoleType)
);
CREATE TABLE Accessory
(
    ConsoleType VARCHAR(32) NOT NULL,
    Condition Char(1) NOT NULL,
    Wireless Boolean,
    Color VARCHAR(32),
    FirstParty Boolean,
    CONSTRAINT Accessory_fk FOREIGN KEY (ConsoleType) REFERENCES Console(ConsoleType)
);
INSERT INTO ConsoleType VALUES ("GameBoy Advance",1, "Nintendo");
INSERT INTO ConsoleType VALUES ("DS",1, "Nintendo");
INSERT INTO ConsoleType VALUES ("3DS",1, "Nintendo");
INSERT INTO ConsoleType VALUES ("Wii",0, "Nintendo");
INSERT INTO ConsoleType VALUES ("Switch",0, "Nintendo");
INSERT INTO ConsoleType VALUES ("Xbox 360",0, "Microsoft");
INSERT INTO ConsoleType VALUES ("Playstation 2",0, "Sony");
INSERT INTO ConsoleType VALUES ("Playstation 5",0, "Sony");
INSERT INTO ConsoleType VALUES ("PC",0);

INSERT INTO Console VALUES ("GameBoy Advance","GameBoy Advance SP","A",0,1,1,"Cobalt","Nintendo");
INSERT INTO Console VALUES ("DS","DS Lite","C",0,1,0,"Black","Nintendo");
INSERT INTO Console VALUES ("DS","DS Lite","B",0,1,0,"Silver","Nintendo");
INSERT INTO Console VALUES ("3DS","2DS XL","A",0,1,0,"Black and Turquoise","Nintendo");
INSERT INTO Console VALUES ("3DS","3DS","B",0,1,0,"Purple","Nintendo");
INSERT INTO Console VALUES ("Wii","Wii","B",6,0,0,"White","Nintendo");
INSERT INTO Console VALUES ("Switch","Switch","B",5,1,0,"Black","Nintendo");
INSERT INTO Console VALUES ("Xbox 360","Xbox 360","B",5,0,0,"Black","Microsoft");
INSERT INTO Console VALUES ("Playstation 2","Playstation 2 Slim","B",5,0,0,"Black","Sony");
INSERT INTO Console VALUES ("Playstation 5","Playstation 5","A",2,0,0,"White","Sony");
INSERT INTO Console VALUES ("PC","PC","A",0,0,0,"Black","Custom");

INSERT INTO Game VALUES ("Pokemon LeafGreen","GameBoy Advance","B",0,0,0,NULL,"E",2004,"Game Freak","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Pokemon Sapphire","GameBoy Advance","C",0,0,0,NULL,"E",2003,"Game Freak","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Pokemon Mystery Dungeon Red Rescue Team","GameBoy Advance","A",0,0,0,NULL,"E",2006,"Chunsoft","Nintendo",0,0,"Pokemon");
INSERT INTO Game VALUES ("Super Mario Advance 4 Super Mario Bros. 3","GameBoy Advance","A",0,0,0,NULL,"E",2003,"Nintendo","Nintendo",0,0,"Super Mario");
INSERT INTO Game VALUES ("Super Mario Advance 3 Yoshi's Island","GameBoy Advance","A",0,0,0,NULL,"E",2002,"Nintendo","Nintendo",0,0,"Super Mario");
INSERT INTO Game VALUES ("The Legend of Zelda A Link To The Past Four Swords","GameBoy Advance","B",0,0,0,NULL,"E",2002,"Nintendo","Nintendo",0,0,"The Legend of Zelda");
INSERT INTO Game VALUES ("Golden Sun","GameBoy Advance","A",0,0,0,NULL,"E",2001,"Camelot Software Planning","Nintendo",0,0,"Golden Sun");
INSERT INTO Game VALUES ("Tony Hawk's Pro Skater 2","GameBoy Advance","C",0,0,0,NULL,"T",2001,"Neversoft","Activision",0,0,"Tony Hawk's Pro Skater");
INSERT INTO Game VALUES ("Van Helsing","GameBoy Advance","A",0,0,0,NULL,"T",2004,"Saffire","Vivendi Universal Games",0,0,"Van Helsing");
INSERT INTO Game VALUES ("Pirates of the Caribbean Dead Man's Chest","GameBoy Advance","B",0,0,0,NULL,"T",2006,"Amaze Entertainment","Buena Vista Games",0,0,"Pirates of the Caribbean");
INSERT INTO Game VALUES ("Spider-man", "GameBoy Advance","B",0,0,0,NULL,"E",2002,"Digital Eclipse", "D",)
INSERT INTO Game VALUES ("Star Wars Episode I: Jedi Power Battles","GameBoy Advance","B",0,0,0,NULL,"T",2001,"HotGen","THQ",1,0,"Star Wars");
INSERT INTO Game VALUES ("Star Wars The New Droid Army","GameBoy Advance","B",0,0,0,NULL,"E",2002,"Helixe","THQ",1,0,"Star Wars");
INSERT INTO Game VALUES ("Star Wars Flight of the Falcon","GameBoy Advance","B",0,0,0,NULL,"E",2003,"Pocket Studios","THQ",0,0,"Star Wars");
INSERT INTO Game VALUES ("The Lord Of The Rings The Third Age","GameBoy Advance","B",0,0,0,NULL,"T",2004,"Vivendi Universal Games","Vivendi Universal Games",0,0,"The Lord Of The Rings");
INSERT INTO Game VALUES ("The Lord Of The Rings The Two Towers","GameBoy Advance","B",0,0,0,NULL,"T",2002,"Griptonite Games","Electronic Arts",0,0,"The Lord Of The Rings");
INSERT INTO Game VALUES ("The Lord Of The Rings The Return Of The King","GameBoy Advance","B",0,0,0,NULL,"T",2003,"Griptonite Games","Electronic Arts",0,0,"The Lord Of The Rings");
INSERT INTO Game VALUES ("Kirby Super Star Ultra","DS","A",0,0,0,NULL,"E",2008,"HAL Laboratory","Nintendo",1,0,"Kirby");
INSERT INTO Game VALUES ("Kirby Squeak Squad","DS","B",1,1,1,"Advertisement for other DS games, Nintendo Power and a NDS safety booklet","E",2006,"HAL Laboratory","Nintendo",0,0,"Kirby");
INSERT INTO Game VALUES ("Dragon Quest IX Sentinels of the Starry Skies","DS","B",1,1,0,NULL,"E10+",2009,"Level-5","Nintendo",1,0,"Dragon Quest");
INSERT INTO Game VALUES ("Star Wars Lethal Alliance","DS","B",0,0,0,NULL,"T",2006,"Ubisoft Montreal","Ubisoft",0,0,"Star Wars");
INSERT INTO Game Values ("The Legendary Starfy","DS","B",0,0,0,NULL,"E",2009,"TOSE","Nintendo",1,0,"The Legendary Starfy");
INSERT INTO Game VALUES ("Mario Party DS","DS","B",0,0,0,NULL,"E",2007,"Hudson Soft","Nintendo",0,0,"Mario Party");
INSERT INTO Game VALUES ("LEGO Battles","DS","B",0,0,0,NULL,"E10+",2009,"Hellbent Games","Warner Bros. Interactive Entertainment",0,0,"LEGO");
INSERT INTO Game VALUES ("Pokemon White Version","DS","B",1,1,0,NULL,"E",2011,"Game Freak","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Pokemon SoulSilver Version","DS","B",1,1,0,NULL,"E",2010,"Game Freak","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Pokemon Diamond Version","DS","B",0,0,0,NULL,"E",2007,"Game Freak","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Pokemon Platinum Version","DS","B",1,1,1,"Advertisement for Rotom and a NDS safety booklet","E",2009,"Game Freak","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Pokemon Black Version","DS","B",0,0,0,NULL,"E",2011,"Game Freak","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Pokemon White Version 2","DS","B",1,1,1,"Advertisement for Genesect,Club Nintendo and a NDS safety booklet","E",2012,"Game Freak","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Pokemon Ranger Shadows of Almia","DS","B",1,1,1,"How to get Riolu Egg and Register Game","E",2008,"HAL Laboratory","Nintendo",1,0,"Pokemon");
INSERT INTO Game VALUES ("Animal Crossing Wild World","DS","B",0,0,0,NULL,"E",2005,"Nintendo EAD","Nintendo",1,0,"Animal Crossing");
INSERT INTO Game VALUES ("Mario Kart Wii","Wii","B",1,1,1,"Advertisement for Club Nintendo.","E",2008,"Nintendo EAD","Nintendo",1,0,"Mario Kart");
INSERT INTO Game VALUES ("Mario Kart Wii","Wii","B",1,1,1,"Advertisement for Club Nintendo.","E",2008,"Nintendo EAD","Nintendo",1,0,"Mario Kart");
INSERT INTO Game Values ("Mario Party 8", "Wii", "B", 1, 0, 1, "Advertisement for Club Nintendo.", "E", 2007, "Hudson Soft", "Nintendo", 1, 0, "Mario Party");
INSERT INTO Game VALUES ("Super Mario Galaxy","Wii","B",2,0,1,"Advertisement for Club Nintendo.","E",2007,"Nintendo EAD","Nintendo",1,0,"Super Mario");
INSERT INTO Game VALUES ("New Super Mario Bros. Wii","Wii","B",1,1,1,"Advertisement for Club Nintendo and other games.","E",2009,"Nintendo EAD","Nintendo",1,0,"Super Mario");
INSERT INTO Game VALUES ("Super Smash Bros. Brawl","Wii","B",1,0,0,NULL,"T",2008,"Sora Ltd.","Nintendo",1,0,"Super Smash Bros.");
INSERT INTO Game VALUES ("Sonic and the Black Knight","Wii","B",2,0,0,NULL,"E10+",2009,"Sonic Team","Sega",1,0,"Sonic");
INSERT INTO Game VALUES ("Sonic and the Secret Rings","Wii","B",2,1,0,NULL,"E",2007,"Sonic Team","Sega",1,0,"Sonic");
INSERT INTO Game VALUES ("Dragon Quest Swords The Masked Queen and the Tower of Mirrors","Wii","B",1,1,1,"Two registration cards to enter a Square Enix Raffle","T",2008,"8ing","Square Enix",1,0,"Dragon Quest");
INSERT INTO Game VALUES ("The Legend of Zelda Skyward Sword","Wii","B",1,1,1,"Includes disk labeled The Legend of Zelda 25th Anniversary Symphony. Pamphlet for Symphony,Club Nintendo and Similar Games.","E10+",2011,"Nintendo EAD","Nintendo",1,0,"The Legend of Zelda");
INSERT INTO Game VALUES ("The Legend of Zelda Twilight Princess","Wii","B",2,0,0,NULL,"T",2006,"Nintendo EAD","Nintendo",1,0,"The Legend of Zelda");
INSERT INTO Game VALUES ("Wii Sports Resort","Wii","B",1,0,0,NULL,"E",2009,"Nintendo EAD","Nintendo",1,0,"Wii Sports");
INSERT INTO Game VALUES ("Wii Sports","Wii","B",1,0,0,NULL,"E",2006,"Nintendo EAD","Nintendo",1,0,"Wii Sports");
INSERT INTO Game VALUES ("Go Vacation","Wii","B",1,0,0,NULL,"E10+",2011,"Namco Bandai Games","Namco Bandai Games",1,0,"Go Vacation");
INSERT INTO Game VALUES ("Kirby's Epic Yarn","Wii","B",1,1,1,"Pamphlet for similar games.","E",2010,"Good-Feel","Nintendo",1,0,"Kirby");
INSERT INTO Game VALUES ("Ghost Squad","Wii","B",2,1,0,NULL,"T",2007,"Sega AM2","Sega",1,0,"Ghost Squad");
INSERT INTO Game VALUES ("Super Mario All-Stars Limited Edition","Wii","F",1,0,1,"Super Mario History booklet inside soundtrack box.","E",2010,"Nintendo EAD","Nintendo",1,0,"Super Mario");
INSERT INTO Game VALUES ("WarioWare Smooth Moves","Wii","B",1,1,0,NULL,"E10+",2006,"Intelligent Systems","Nintendo",1,0,"WarioWare");
INSERT INTO Game VALUES ("Donkey Kong Country Returns","Wii","B",1,0,0,NULL,"E",2010,"Retro Studios","Nintendo",1,0,"Donkey Kong");

