INSERT INTO `items` (`itemId`, `itemData`, `name`) VALUES
(1,   0, 'Stone'),
(2,   0, 'Grass Block'),
(3,   0, 'Dirt'),
(3,   1, 'Coarse Dirt'),
(3,   2, 'Podzol'),
(4,   0, 'Cobblestone'),
(5,   0, 'Oak Wood Planks'),
(5,   1, 'Spruce Wood Planks'),
(5,   2, 'Birch Wood Planks'),
(5,   3, 'Jungle Wood Planks'),
(5,   4, 'Acacia Wood Planks'),
(5,   5, 'Dark Oak Wood Planks'),
(20,  0, 'Glass'),
(35,  0, 'White Wool'),
(35,  1, 'Orange Wool'),
(35,  2, 'Magenta Wool'),
(35,  3, 'Light Blue Wool'),
(35,  4, 'Yellow Wool'),
(35,  5, 'Lime Wool'),
(35,  6, 'Pink Wool'),
(35,  7, 'Gray Wool'),
(35,  8, 'Light Gray Wool'),
(35,  9, 'Cyan Wool'),
(35, 10, 'Purple Wool'),
(35, 11, 'Blue Wool'),
(35, 12, 'Brown Wool'),
(35, 13, 'Green Wool'),
(35, 14, 'Red Wool'),
(35, 15, 'Black Wool'),
(41,  0, 'Gold Block'),
(42,  0, 'Iron Block'),
(45,  0, 'Bricks'),
(46,  0, 'TNT'),
(47,  0, 'Bookshelf'),
(49,  0, 'Obsidian'),
(56,  0, 'Diamond Ore'),
(57,  0, 'Diamond Block'),
(264, 0, 'Diamond'),
(265, 0, 'Iron Ingot'),
(266, 0, 'Gold Ingot'),
(280, 0, 'Stick'),
(287, 0, 'String'),
(288, 0, 'Feather'),
(289, 0, 'Gunpowder'),
(296, 0, 'Wheat'),
(297, 0, 'Bread'),
(298, 0, 'Leather Helmet'),
(299, 0, 'Leather Chestplate'),
(300, 0, 'Leather Leggings'),
(301, 0, 'Leather Boots'),
(320, 0, 'Cooked Porkchop'),
(322, 0, 'Golden Apple'),
(331, 0, 'Redstone'),
(332, 0, 'Snowball'),
(334, 0, 'Leather'),
(337, 0, 'Clay'),
(338, 0, 'Sugar Cane'),
(341, 0, 'Slimeball'),
(344, 0, 'Egg'),
(346, 0, 'Fishing Rod'),
(348, 0, 'Glowstone Dust'),
(350, 0, 'Cooked Fish'),
(351, 0, 'Ink Sac'),
(352, 0, 'Bone'),
(353, 0, 'Sugar'),
(354, 0, 'Cake'),
(360, 0, 'Melon'),
(361, 0, 'Pumpkin Seeds'),
(362, 0, 'Melon Seeds'),
(367, 0, 'Rotten Flesh'),
(369, 0, 'Blaze Rod'),
(370, 0, 'Ghast Tear'),
(371, 0, 'Gold Nugget'),
(372, 0, 'Nether Wart'),
(374, 0, 'Glass Bottle'),
(375, 0, 'Spider Eye'),
(377, 0, 'Blaze Powder'),
(378, 0, 'Magma Cream'),
(379, 0, 'Brewing Stand'),
(380, 0, 'Cauldron'),
(381, 0, 'Eye of Ender'),
(382, 0, 'Glistering Melon'),
(384, 0, 'Bottle o Enchanting'),
(385, 0, 'Fire Charge'),
(388, 0, 'Emerald'),
(389, 0, 'Item Frame'),
(390, 0, 'Flower Pot'),
(391, 0, 'Carrot'),
(392, 0, 'Potato'),
(393, 0, 'Baked Potato'),
(394, 0, 'Poisonous Potato'),
(395, 0, 'Map'),
(396, 0, 'Golden Carrot'),
(397, 0, 'Mob Head'),
(398, 0, 'Carrot on a Stick'),
(399, 0, 'Nether Star'),
(400, 0, 'Pumpkin Pie'),
(401, 0, 'Firework Rocket'),
(402, 0, 'Firework Star'),
(403, 0, 'Enchanted Book'),
(406, 0, 'Quartz'),
(409, 0, 'Prismarine Shard'),
(410, 0, 'Prismarine Crystals'),
(411, 0, 'Rabbit'),
(412, 0, 'Cooked Rabbit'),
(413, 0, 'Rabbit Stew'),
(414, 0, 'Rabbit Foot'),
(415, 0, 'Rabbit Hide'),
(416, 0, 'Armor Stand'),
(417, 0, 'Iron Horse Armor'),
(418, 0, 'Golden Horse Armor'),
(419, 0, 'Diamond Horse Armor'),
(420, 0, 'Lead'),
(421, 0, 'Name Tag'),
(422, 0, 'Command Block Minecart'),
(423, 0, 'Mutton'),
(424, 0, 'Cooked Mutton'),
(425, 0, 'Banner');

INSERT INTO `users` (`id`, `name`) VALUES
(1,  'AlexCraft'),
(2,  'BuilderMax'),
(3,  'RedstoneGirl'),
(4,  'DarkKnight'),
(5,  'MinerPro'),
(6,  'PixelFox'),
(7,  'Steve42'),
(8,  'CreeperKing'),
(9,  'DiamondJoe'),
(10, 'LunaCraft'),
(11, 'OakMaster'),
(12, 'EnderBoy'),
(13, 'BlockQueen'),
(14, 'Wolfy'),
(15, 'IronMan'),
(16, 'FarmLord'),
(17, 'SkyBuilder'),
(18, 'NetherMage'),
(19, 'CraftyCat'),
(20, 'RedFox'),
(21, 'BlueDragon'),
(22, 'GoldHunter'),
(23, 'StoneBuilder'),
(24, 'ZombieSlayer'),
(25, 'EmeraldGuy');

INSERT INTO `trader_signs`
(`id`, `x`, `y`, `z`, `itemId`, `itemData`,
 `status`, `destroyer`, `price`, `stack`, `total`)
VALUES

-- AlexCraft / zone spawn
(1,  120, 64,  250, 35, 0,  'active',   NULL,  8.00,  16,  1248),
(2,  124, 64,  250, 35, 4,  'active',   NULL, 10.00,  16,  736),
(3,  128, 64,  250, 264, 0, 'active',   NULL, 25.00,  1,   183),
(4,  132, 64,  250, 265, 0, 'active',   NULL,  5.00,  8,   640),

-- BuilderMax
(5,  300, 70,  420, 5,  0,  'active',   NULL,  4.00,  32,  2144),
(6,  304, 70,  420, 5,  1,  'active',   NULL,  4.00,  32,  1760),
(7,  308, 70,  420, 4,  0,  'active',   NULL,  2.00,  32,  3296),
(8,  312, 70,  420, 20, 0, 'destroyed', 5,     6.00,  16,   432),

-- RedstoneGirl
(9,  -80, 63,  110, 331, 0, 'active',    NULL,  3.00,  16,  2816),
(10, -76, 63,  110, 265, 0, 'active',    NULL,  7.00,  16,  1152),
(11, -72, 63,  110, 266, 0, 'active',    NULL,  9.00,  16,   928),
(12, -68, 63,  110, 388, 0, 'active',    NULL, 12.00,  8,    704),

-- DarkKnight
(13, 500, 65, -200, 49,  0, 'active',    NULL,  8.00,  16,  2080),
(14, 504, 65, -200, 57,  0, 'active',    NULL, 40.00,  1,    212),
(15, 508, 65, -200, 264, 0, 'destroyed', 7,   22.00,  1,     95),

-- MinerPro
(16, 720, 68,  340, 56,  0, 'active',    NULL, 15.00,  1,    328),
(17, 724, 68,  340, 264, 0, 'active',    NULL, 20.00,  1,    452),
(18, 728, 68,  340, 388, 0, 'active',    NULL, 18.00,  8,    816),
(19, 732, 68,  340, 265, 0, 'destroyed', 4,    6.00,  8,    264),

-- PixelFox
(20, -420, 64,  80, 297, 0, 'active',    NULL,  5.00,  16,  1488),
(21, -416, 64,  80, 320, 0, 'active',    NULL,  9.00,  16,   976),
(22, -412, 64,  80, 393, 0, 'active',    NULL,  7.00,  16,   688),
(23, -408, 64,  80, 391, 0, 'active',    NULL,  4.00,  16,   912),

-- Steve42
(24, 100, 72, -500, 1,   0, 'active',    NULL,  1.00,  64,  3584),
(25, 104, 72, -500, 3,   0, 'active',    NULL,  1.00,  64,  2752),
(26, 108, 72, -500, 4,   0, 'destroyed', 12,    2.00,  64,   832),

-- CreeperKing
(27, -200, 75, -300, 46,  0, 'active',    NULL,  6.00,  1,     96),
(28, -196, 75, -300, 289, 0, 'active',    NULL,  4.00,  16,   448),
(29, -192, 75, -300, 369, 0, 'active',    NULL, 10.00,  8,    312),

-- DiamondJoe
(30, 850, 64,  850, 264, 0, 'active',    NULL, 18.00,  1,    742),
(31, 854, 64,  850, 57,  0, 'active',    NULL, 65.00,  1,    137),
(32, 858, 64,  850, 266, 0, 'active',    NULL, 14.00,  16,   528),

-- LunaCraft
(33, -650, 70,  400, 35,  14, 'active',    NULL, 11.00,  16,   864),
(34, -646, 70,  400, 35,  1,  'active',    NULL, 10.00,  16,   592),
(35, -642, 70,  400, 35,  11, 'active',    NULL, 13.00,  16,   336),

-- OakMaster
(36, 420, 68,  600, 5,   0, 'active',    NULL,  3.00,  32,  2912),
(37, 424, 68,  600, 5,   2, 'active',    NULL,  4.00,  32,  1664),
(38, 428, 68,  600, 5,   5, 'destroyed', 20,    5.00,  32,   608),

-- EnderBoy
(39, 900, 80, -100, 381, 0, 'active',    NULL, 20.00,  1,    144),
(40, 904, 80, -100, 399, 0, 'active',    NULL, 50.00,  1,     72),
(41, 908, 80, -100, 264, 0, 'active',    NULL, 22.00,  1,    318),

-- BlockQueen
(42, -900, 65, -450, 20,  0, 'active',    NULL,  5.00,  32,  1920),
(43, -896, 65, -450, 45,  0, 'active',    NULL,  6.00,  32,  1248),
(44, -892, 65, -450, 47,  0, 'active',    NULL,  8.00,  16,   736),

-- Wolfy
(45, 150, 64,  900, 334, 0, 'active',    NULL,  3.00,  16,  1024),
(46, 154, 64,  900, 350, 0, 'active',    NULL,  7.00,  16,   512),
(47, 158, 64,  900, 320, 0, 'destroyed', 9,     8.00,  16,   192),

-- IronMan
(48, -350, 66, 700, 42,  0, 'active',    NULL, 35.00,  1,    104),
(49, -346, 66, 700, 265, 0, 'active',    NULL,  5.00,  16,   896),
(50, -342, 66, 700, 41,  0, 'active',    NULL, 90.00,  1,     48),

-- FarmLord
(51, 600, 64, 100, 296, 0, 'active',    NULL,  2.00,  32,  3520),
(52, 604, 64, 100, 391, 0, 'active',    NULL,  3.00,  32,  2180),
(53, 608, 64, 100, 392, 0, 'active',    NULL,  3.00,  32,  2016),

-- SkyBuilder
(54, -100, 100, 600, 20,  0, 'active',    NULL,  4.00,  32,  1488),
(55, -96,  100, 600, 49,  0, 'active',    NULL,  7.00,  16,   896),
(56, -92,  100, 600, 57,  0, 'destroyed', 3,    45.00,  1,    112),

-- NetherMage
(57, 300, 70, -700, 372, 0, 'active',    NULL,  8.00,  16,   640),
(58, 304, 70, -700, 369, 0, 'active',    NULL, 15.00,  8,    256),
(59, 308, 70, -700, 377, 0, 'active',    NULL,  9.00,  16,   448),

-- CraftyCat
(60, 700, 65, -600, 338, 0, 'active',    NULL,  2.00,  64,  4096),
(61, 704, 65, -600, 360, 0, 'active',    NULL,  3.00,  32,  1824),
(62, 708, 65, -600, 400, 0, 'active',    NULL,  6.00,  16,   576),

-- RedFox
(63, -700, 64, -700, 35,  14, 'active',    NULL,  9.00,  16,   912),
(64, -696, 64, -700, 35,  4,  'active',    NULL,  8.00,  16,   704),
(65, -692, 64, -700, 35,  0,  'destroyed', 16,    7.00,  16,   384),

-- BlueDragon
(66, 450, 75, -850, 388, 0, 'active',    NULL, 10.00,  8,    528),
(67, 454, 75, -850, 57,  0, 'active',    NULL, 55.00,  1,    164),
(68, 458, 75, -850, 399, 0, 'active',    NULL, 48.00,  1,     88),

-- GoldHunter
(69, 950, 65, 250, 266, 0, 'active',    NULL, 12.00,  16,   736),
(70, 954, 65, 250, 41,  0, 'active',    NULL, 75.00,  1,     64),
(71, 958, 65, 250, 371, 0, 'active',    NULL,  4.00,  32,   960),

-- StoneBuilder
(72, -250, 64, 950, 1,   0, 'active',    NULL,  1.00,  64,  5248),
(73, -246, 64, 950, 4,   0, 'active',    NULL,  1.50,  64,  3968),
(74, -242, 64, 950, 45,  0, 'active',    NULL,  5.00,  32,  1216),

-- ZombieSlayer
(75, 200, 70, 1100, 367, 0, 'active',    NULL,  2.00,  32,  1120),
(76, 204, 70, 1100, 375, 0, 'active',    NULL,  5.00,  16,   432),
(77, 208, 70, 1100, 352, 0, 'active',    NULL,  3.00,  32,   768);
