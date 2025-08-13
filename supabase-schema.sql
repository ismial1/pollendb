-- Enable Row Level Security

-- Drop old options tables
DROP TABLE IF EXISTS taxonomy_options CASCADE;
DROP TABLE IF EXISTS pollen_options CASCADE;
DROP TABLE IF EXISTS shape_options CASCADE;
DROP TABLE IF EXISTS aperture_options CASCADE;
DROP TABLE IF EXISTS wall_options CASCADE;
DROP TABLE IF EXISTS surface_options CASCADE;
DROP TABLE IF EXISTS ornamentation_options CASCADE;
DROP TABLE IF EXISTS wall_structure_options CASCADE;

-- Create granular options tables
CREATE TABLE families (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE pollen_units (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE dispersal_units (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE pollen_classes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE pollen_sizes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE hydrated_sizes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE polarities (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE shapes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE outlines (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE pe_ratios (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE orientations (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE aperture_numbers (
  id SERIAL PRIMARY KEY,
  value VARCHAR(50) NOT NULL UNIQUE,
  label VARCHAR(100) NOT NULL,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE aperture_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE aperture_conditions (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE aperture_peculiarities (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE wall_thicknesses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE tectum_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE infratectum_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE foot_layer_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE nexine_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE sexine_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE ornamentation_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE coating_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE lm_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE wall_structure_types (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  sort_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create plants table
CREATE TABLE plants (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id), -- Hangi kullanıcının eklediği
  name VARCHAR(255) NOT NULL,
  family VARCHAR(255) NOT NULL,
  description TEXT,
  image_url VARCHAR(500),
  
  -- Pollen Characters
  pollen_unit VARCHAR(50),
  dispersal_unit VARCHAR(50),
  pollen_class VARCHAR(50),
  size VARCHAR(50),
  hydrated_size VARCHAR(50),
  
  -- Polarity and Shape
  polarity VARCHAR(50),
  shape VARCHAR(50),
  outline_polar VARCHAR(50),
  pe_ratio VARCHAR(50),
  orientation VARCHAR(50),
  
  -- Aperture
  aperture_number VARCHAR(50),
  aperture_type VARCHAR(50),
  aperture_condition VARCHAR(50),
  aperture_peculiarities VARCHAR(50),
  
  -- LM (Ornamentation and Wall Structure)
  ornamentation_lm VARCHAR(50),
  nexine VARCHAR(50),
  sexine VARCHAR(50),
  
  -- SEM (Ornamentation)
  ornamentation VARCHAR(50),
  suprasculpture VARCHAR(50),
  
  -- TEM (Pollen Wall Structure)
  tectum VARCHAR(50),
  infratectum VARCHAR(50),
  foot_layer VARCHAR(50),
  endexine VARCHAR(50),
  intine VARCHAR(50),
  supratectal_elements VARCHAR(50),
  
  -- Peculiarities
  wall_peculiarities VARCHAR(50),
  
  -- Miscellaneous
  pollen_coatings VARCHAR(50),
  reserves VARCHAR(50),
  cell_number VARCHAR(50),
  ubisch_bodies VARCHAR(50),
  
  preparation VARCHAR(50),
  staining VARCHAR(50),
  
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create users table (extends Supabase auth.users)
CREATE TABLE users (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  full_name VARCHAR(255),
  role VARCHAR(50) DEFAULT 'user' CHECK (role IN ('user', 'moderator', 'admin')),
  avatar_url VARCHAR(500),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create submissions table
CREATE TABLE submissions (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  plant_data JSONB NOT NULL,
  status VARCHAR(50) DEFAULT 'pending',
  admin_notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create messages table
CREATE TABLE messages (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  subject VARCHAR(255),
  message TEXT NOT NULL,
  status VARCHAR(50) DEFAULT 'unread',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create RLS policies
ALTER TABLE plants ENABLE ROW LEVEL SECURITY;
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

-- Enable RLS for all granular options tables
ALTER TABLE families ENABLE ROW LEVEL SECURITY;
ALTER TABLE pollen_units ENABLE ROW LEVEL SECURITY;
ALTER TABLE dispersal_units ENABLE ROW LEVEL SECURITY;
ALTER TABLE pollen_classes ENABLE ROW LEVEL SECURITY;
ALTER TABLE pollen_sizes ENABLE ROW LEVEL SECURITY;
ALTER TABLE hydrated_sizes ENABLE ROW LEVEL SECURITY;
ALTER TABLE polarities ENABLE ROW LEVEL SECURITY;
ALTER TABLE shapes ENABLE ROW LEVEL SECURITY;
ALTER TABLE outlines ENABLE ROW LEVEL SECURITY;
ALTER TABLE pe_ratios ENABLE ROW LEVEL SECURITY;
ALTER TABLE orientations ENABLE ROW LEVEL SECURITY;
ALTER TABLE aperture_numbers ENABLE ROW LEVEL SECURITY;
ALTER TABLE aperture_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE aperture_conditions ENABLE ROW LEVEL SECURITY;
ALTER TABLE aperture_peculiarities ENABLE ROW LEVEL SECURITY;
ALTER TABLE wall_thicknesses ENABLE ROW LEVEL SECURITY;
ALTER TABLE tectum_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE infratectum_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE foot_layer_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE nexine_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE sexine_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE ornamentation_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE coating_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE lm_types ENABLE ROW LEVEL SECURITY;
ALTER TABLE wall_structure_types ENABLE ROW LEVEL SECURITY;

-- Create policies for granular options tables (public read access)
CREATE POLICY "Families are viewable by everyone" ON families FOR SELECT USING (true);
CREATE POLICY "Pollen units are viewable by everyone" ON pollen_units FOR SELECT USING (true);
CREATE POLICY "Dispersal units are viewable by everyone" ON dispersal_units FOR SELECT USING (true);
CREATE POLICY "Pollen classes are viewable by everyone" ON pollen_classes FOR SELECT USING (true);
CREATE POLICY "Pollen sizes are viewable by everyone" ON pollen_sizes FOR SELECT USING (true);
CREATE POLICY "Hydrated sizes are viewable by everyone" ON hydrated_sizes FOR SELECT USING (true);
CREATE POLICY "Polarities are viewable by everyone" ON polarities FOR SELECT USING (true);
CREATE POLICY "Shapes are viewable by everyone" ON shapes FOR SELECT USING (true);
CREATE POLICY "Outlines are viewable by everyone" ON outlines FOR SELECT USING (true);
CREATE POLICY "PE ratios are viewable by everyone" ON pe_ratios FOR SELECT USING (true);
CREATE POLICY "Orientations are viewable by everyone" ON orientations FOR SELECT USING (true);
CREATE POLICY "Aperture numbers are viewable by everyone" ON aperture_numbers FOR SELECT USING (true);
CREATE POLICY "Aperture types are viewable by everyone" ON aperture_types FOR SELECT USING (true);
CREATE POLICY "Aperture conditions are viewable by everyone" ON aperture_conditions FOR SELECT USING (true);
CREATE POLICY "Aperture peculiarities are viewable by everyone" ON aperture_peculiarities FOR SELECT USING (true);
CREATE POLICY "Wall thicknesses are viewable by everyone" ON wall_thicknesses FOR SELECT USING (true);
CREATE POLICY "Tectum types are viewable by everyone" ON tectum_types FOR SELECT USING (true);
CREATE POLICY "Infratectum types are viewable by everyone" ON infratectum_types FOR SELECT USING (true);
CREATE POLICY "Foot layer types are viewable by everyone" ON foot_layer_types FOR SELECT USING (true);
CREATE POLICY "Nexine types are viewable by everyone" ON nexine_types FOR SELECT USING (true);
CREATE POLICY "Sexine types are viewable by everyone" ON sexine_types FOR SELECT USING (true);
CREATE POLICY "Ornamentation types are viewable by everyone" ON ornamentation_types FOR SELECT USING (true);
CREATE POLICY "Coating types are viewable by everyone" ON coating_types FOR SELECT USING (true);
CREATE POLICY "LM types are viewable by everyone" ON lm_types FOR SELECT USING (true);
CREATE POLICY "Wall structure types are viewable by everyone" ON wall_structure_types FOR SELECT USING (true);

-- Create functions for automatic timestamps
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at
CREATE TRIGGER update_plants_updated_at BEFORE UPDATE ON plants FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_submissions_updated_at BEFORE UPDATE ON submissions FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Insert sample data
-- Önce admin user oluştur (UUID'yi değiştirmen gerekebilir)
INSERT INTO users (id, email, full_name, role) VALUES 
('00000000-0000-0000-0000-000000000001', 'admin@polendb.com', 'Admin User', 'admin');

-- Insert families data
INSERT INTO families (name, sort_order) VALUES
('Abietaceae', 1),
('Abolbodaceae', 2),
('Abrophyllaceae', 3),
('Acaciaceae', 4),
('Acalyphaceae', 5),
('Acanthaceae', 6),
('Acanthochlamydaceae', 7),
('Acarnaceae', 8),
('Aceraceae', 9),
('Achariaceae', 10),
('Achatocarpaceae', 11),
('Achradaceae', 12),
('Achyranthaceae', 13),
('Acmopylaceae', 14),
('Aconitaceae', 15),
('Acoraceae', 16),
('Acristaceae', 17),
('Acrostichaceae', 18),
('Actaeaceae', 19),
('Actinidiaceae', 20),
('Actiniopteridaceae', 21),
('Actinotaceae', 22),
('Adenogrammaceae', 23),
('Adiantaceae', 24),
('Adoxaceae', 25),
('Aegialitidaceae', 26),
('Aegicerataceae', 27),
('Aegilopaceae', 28),
('Aeginetiaceae', 29),
('Aegiphilaceae', 30),
('Aesculaceae', 31),
('Aextoxicaceae', 32),
('Afrothismiaceae', 33),
('Agapanthaceae', 34),
('Agavaceae', 35),
('Agdestidaceae', 36),
('Agialidaceae', 37),
('Agrimoniaceae', 38),
('Agrostidaceae', 39),
('Ailanthaceae', 40),
('Aitoniaceae', 41),
('Aizoaceae', 42),
('Ajugaceae', 43),
('Akaniaceae', 44),
('Alangiaceae', 45),
('Alchemillaceae', 46),
('Aldrovandaceae', 47),
('Alismataceae', 48),
('Alliaceae', 49),
('Allioniaceae', 50),
('Allophylaceae', 51),
('Alniphyllaceae', 52),
('Aloaceae', 53),
('Alopecuraceae', 54),
('Alpiniaceae', 55),
('Alseuosmiaceae', 56),
('Alsinaceae', 57),
('Alsodeiaceae', 58),
('Alsophilaceae', 59),
('Alstroemeriaceae', 60),
('Altingiaceae', 61),
('Alzateaceae', 62),
('Amaranthaceae', 63),
('Amaryllidaceae', 64),
('Amborellaceae', 65),
('Ambrosiaceae', 66),
('Amentotaxaceae', 67),
('Ammanniaceae', 68),
('Ammiaceae', 69),
('Amomaceae', 70),
('Ampelopsidaceae', 71),
('Amphorogynaceae', 72),
('Amygdalaceae', 73),
('Amyridaceae', 74),
('Anacampserotaceae', 75),
('Anacardiaceae', 76),
('Anagallidaceae', 77),
('Anarthriaceae', 78),
('Anchusaceae', 79),
('Ancistrocladaceae', 80),
('Andromedaceae', 81),
('Andropogonaceae', 82),
('Androstachyaceae', 83),
('Androsynaceae', 84),
('Anemarrhenaceae', 85),
('Anemiaceae', 86),
('Anemonaceae', 87),
('Angelicaceae', 88),
('Angeloniaceae', 89),
('Angiopteridaceae', 90),
('Anisophylleaceae', 91),
('Annonaceae', 92),
('Anomochloaceae', 93),
('Anopteraceae', 94),
('Anopteridaceae', 95),
('Anrederaceae', 96),
('Anthemidaceae', 97),
('Anthericaceae', 98),
('Anthobolaceae', 99),
('Anthoxanthaceae', 100),
('Antidesmataceae', 101),
('Antirrhinaceae', 102),
('Antoniaceae', 103),
('Antrophyaceae', 104),
('Aparinaceae', 105),
('Aphanopetalaceae', 106),
('Aphloiaceae', 107),
('Aphyllanthaceae', 108),
('Apiaceae', 109),
('Apocynaceae', 110),
('Apodanthaceae', 111),
('Aponogetonaceae', 112),
('Aporusaceae', 113),
('Aposeridaceae', 114),
('Apostasiaceae', 115),
('Aptandraceae', 116),
('Aquifoliaceae', 117),
('Aquilariaceae', 118),
('Aquilegiaceae', 119),
('Araceae', 120),
('Arabidaceae', 121),
('Aragoaceae', 122),
('Araliaceae', 123),
('Aralidiaceae', 124),
('Araucariaceae', 125),
('Arbutaceae', 126),
('Arceuthidaceae', 127),
('Arceuthobiaceae', 128),
('Arctostaphylaceae', 129),
('Arctotidaceae', 130),
('Ardisiaceae', 131),
('Arecaceae', 132),
('Argophyllaceae', 133),
('Arisaraceae', 134),
('Aristolochiaceae', 135),
('Aristoteliaceae', 136),
('Arjonaceae', 137),
('Armeriaceae', 138),
('Artemisiaceae', 139),
('Arthrotaxidaceae', 140),
('Artocarpaceae', 141),
('Arundinaceae', 142),
('Arundinellaceae', 143),
('Asaraceae', 144),
('Asclepiadaceae', 145),
('Ascyraceae', 146),
('Aspalathaceae', 147),
('Asparagaceae', 148),
('Asperellaceae', 149),
('Asperulaceae', 150),
('Asphodelaceae', 151),
('Aspidiaceae', 152),
('Aspidistraceae', 153),
('Aspleniaceae', 154),
('Asteliaceae', 155),
('Asteraceae', 156),
('Asteranthaceae', 157),
('Asteropeiaceae', 158),
('Astragalaceae', 159),
('Astrocarpaceae', 160),
('Athanasiaceae', 161),
('Atherospermataceae', 162),
('Athyriaceae', 163),
('Atriplicaceae', 164),
('Atropaceae', 165),
('Aucubaceae', 166),
('Aurantiaceae', 167),
('Austrobaileyaceae', 168),
('Austrotaxaceae', 169),
('Avenaceae', 170),
('Averrhoaceae', 171),
('Avetraceae', 172),
('Avicenniaceae', 173),
('Azaleaceae', 174),
('Azimaceae', 175),
('Azollaceae', 176),
('Balanitaceae', 177),
('Baeckeaceae', 178),
('Balanopaceae', 179),
('Balanophoraceae', 180),
('Balsameaceae', 181),
('Balsaminaceae', 182),
('Bambusaceae', 183),
('Barbaceniaceae', 184),
('Barbeuiaceae', 185),
('Barbeyaceae', 186),
('Barclayaceae', 187),
('Barringtoniaceae', 188),
('Basellaceae', 189),
('Bataceae', 190),
('Baueraceae', 191),
('Bauhiniaceae', 192),
('Baxteriaceae', 193),
('Begoniaceae', 194),
('Behniaceae', 195),
('Belangeraceae', 196),
('Belloniaceae', 197),
('Bembiciaceae', 198),
('Berberidaceae', 199),
('Berberidopsidaceae', 200),
('Berryaceae', 201),
('Bersamaceae', 202),
('Bertyaceae', 203),
('Berzeliaceae', 204),
('Besleriaceae', 205),
('Betaceae', 206),
('Betulaceae', 207),
('Biebersteiniaceae', 208),
('Bifariaceae', 209),
('Bignoniaceae', 210),
('Bischofiaceae', 211),
('Bixaceae', 212),
('Blakeaceae', 213),
('Blandfordiaceae', 214),
('Blattiaceae', 215),
('Blechnaceae', 216),
('Blepharocaryaceae', 217),
('Blitaceae', 218),
('Blyxaceae', 219),
('Boerlagellaceae', 220),
('Bogutchanthaceae', 221),
('Bolbitidaceae', 222),
('Bolivaraceae', 223),
('Bombacaceae', 224),
('Bonnetiaceae', 225),
('Bontiaceae', 226),
('Boopidaceae', 227),
('Boraginaceae', 228),
('Borassaceae', 229),
('Boroniaceae', 230),
('Borthwickiaceae', 231),
('Boryaceae', 232),
('Botrychiaceae', 233),
('Botryodendraceae', 234),
('Bougainvilleaceae', 235),
('Boweniaceae', 236),
('Brassicaceae', 237),
('Brachycaulaceae', 238),
('Bracteocarpaceae', 239),
('Bretschneideraceae', 240),
('Brexiaceae', 241),
('Bromaceae', 242),
('Bromeliaceae', 243),
('Browalliaceae', 244),
('Brownlowiaceae', 245),
('Brunelliaceae', 246),
('Bruniaceae', 247),
('Brunoniaceae', 248),
('Brunsvigiaceae', 249),
('Bryoniaceae', 250),
('Buchneraceae', 251),
('Bucidaceae', 252),
('Buddlejaceae', 253),
('Buglossaceae', 254),
('Bulbocodiaceae', 255),
('Bumeliaceae', 256),
('Bupleuraceae', 257),
('Burchardiaceae', 258),
('Burmanniaceae', 259),
('Burseraceae', 260),
('Butneriaceae', 261),
('Butomaceae', 262),
('Buxaceae', 263),
('Byblidaceae', 264),
('Byttneriaceae', 265),
('Cabombaceae', 266),
('Cacaoaceae', 267),
('Cactaceae', 268),
('Caesalpiniaceae', 269),
('Caladiaceae', 270),
('Calamaceae', 271),
('Calceolariaceae', 272),
('Calectasiaceae', 273),
('Calendulaceae', 274),
('Callaceae', 275),
('Callicomaceae', 276),
('Calligonaceae', 277),
('Callitridaceae', 278),
('Calochortaceae', 279),
('Calophyllaceae', 280),
('Calthaceae', 281),
('Calycanthaceae', 282),
('Calyceraceae', 283),
('Cambogiaceae', 284),
('Camelliaceae', 285),
('Campanulaceae', 286),
('Camptothecaceae', 287),
('Campynemataceae', 288),
('Canacomyricaceae', 289),
('Canellaceae', 290),
('Cannabaceae', 291),
('Cannaceae', 292),
('Canopodaceae', 293),
('Canotiaceae', 294),
('Cansjeraceae', 295),
('Capparaceae', 296),
('Caprariaceae', 297),
('Caprifoliaceae', 298),
('Cardiopteridaceae', 299),
('Carduaceae', 300),
('Caricaceae', 301),
('Carissaceae', 302),
('Carlemanniaceae', 303),
('Carlinaceae', 304),
('Carpinaceae', 305),
('Carpodetaceae', 306),
('Cartonemataceae', 307),
('Caryocaraceae', 308),
('Caryophyllaceae', 309),
('Cassiaceae', 310),
('Cassipoureaceae', 311),
('Cassythaceae', 312),
('Castaneaceae', 313),
('Castelaceae', 314),
('Casuarinaceae', 315),
('Catesbaeaceae', 316),
('Cathedraceae', 317),
('Caucaulidaceae', 318),
('Cecropiaceae', 319),
('Cedraceae', 320),
('Cedrelaceae', 321),
('Celastraceae', 322),
('Celosiaceae', 323),
('Celtidaceae', 324),
('Centaureaceae', 325),
('Centrolepidaceae', 326),
('Centroplacaceae', 327),
('Cepaceae', 328),
('Cephalanthaceae', 329),
('Cephalotaceae', 330),
('Cephalotaxaceae', 331),
('Cerastiaceae', 332),
('Ceratoniaceae', 333),
('Ceratophyllaceae', 334),
('Ceratopteridaceae', 335),
('Cerberaceae', 336),
('Cercidiphyllaceae', 337),
('Cercocarpaceae', 338),
('Cercodiaceae', 339),
('Cereaceae', 340),
('Cerinthaceae', 341),
('Ceroxylaceae', 342),
('Cervantesiaceae', 343),
('Cestraceae', 344),
('Cevalliaceae', 345),
('Chaeturaceae', 346),
('Chailletiaceae', 347),
('Chamaedoraceae', 348),
('Chamaemoraceae', 349),
('Chamelauciaceae', 350),
('Chaunochitonaceae', 351),
('Cheilanthaceae', 352),
('Cheilosaceae', 353),
('Cheiropleuriaceae', 354),
('Chelidoniaceae', 355),
('Chelonaceae', 356),
('Chenopodiaceae', 357),
('Chimonanthaceae', 358),
('Chingithamnaceae', 359),
('Chionographidaceae', 360),
('Chiranthodendraceae', 361),
('Chironiaceae', 362),
('Chlaenaceae', 363),
('Chloanthaceae', 364),
('Chloranthaceae', 365),
('Chloridaceae', 366),
('Chlorogalaceae', 367),
('Christenseniaceae', 368),
('Chrysobalanaceae', 369),
('Chrysospleniaceae', 370),
('Cibotiaceae', 371),
('Ciceraceae', 372),
('Cichoriaceae', 373),
('Cimicifugaceae', 374),
('Cinchoniaceae', 375),
('Circaeaceae', 376),
('Circaeasteraceae', 377),
('Cissaceae', 378),
('Cistaceae', 379),
('Citraceae', 380),
('Clematidaceae', 381),
('Cleomaceae', 382),
('Clethraceae', 383),
('Clusiaceae', 384),
('Cneoraceae', 385),
('Cnestidaceae', 386),
('Cnicaceae', 387),
('Cobaeaceae', 388),
('Cochlospermaceae', 389),
('Codonaceae', 390),
('Cocosaceae', 391),
('Coeleanthaceae', 392),
('Coffeaceae', 393),
('Colchicaceae', 394),
('Coldeniaceae', 395),
('Coleogynaceae', 396),
('Colocasiaceae', 397),
('Columelliaceae', 398),
('Comandraceae', 399),
('Combretaceae', 400),
('Commelinaceae', 401),
('Comocladiaceae', 402),
('Compositae', 403),
('Compsoaceae', 404),
('Conantheraceae', 405),
('Connaraceae', 406),
('Conostylidaceae', 407),
('Convallariaceae', 408),
('Convolvulaceae', 409),
('Corbichoniaceae', 410),
('Cordiaceae', 411),
('Coreopsidaceae', 412),
('Coriandraceae', 413),
('Coriariaceae', 414),
('Coridaceae', 415),
('Corispermaceae', 416),
('Cornaceae', 417),
('Corokiaceae', 418),
('Coronillaceae', 419),
('Correaceae', 420),
('Corrigiolaceae', 421),
('Corsiaceae', 422),
('Corydalaceae', 423),
('Corylaceae', 424),
('Corynocarpaceae', 425),
('Coryphaceae', 426),
('Costaceae', 427),
('Cotyledonaceae', 428),
('Coulaceae', 429),
('Coutariaceae', 430),
('Coutoubeaceae', 431),
('Crassulaceae', 432),
('Crescentiaceae', 433),
('Cressaceae', 434),
('Crinaceae', 435),
('Crocaceae', 436),
('Croomiaceae', 437),
('Crossosomataceae', 438),
('Crotonaceae', 439),
('Cruciferae', 440),
('Cryptaceae', 441),
('Crypteroniaceae', 442),
('Cryptocorynaceae', 443),
('Cryptogammaceae', 444),
('Cryptomeriaceae', 445),
('Ctenolophonaceae', 446),
('Cucurbitaceae', 447),
('Culcitaceae', 448),
('Cunninghamiaceae', 449),
('Cunoniaceae', 450),
('Cupressaceae', 451),
('Curcumaceae', 452),
('Curtisiaceae', 453),
('Cuscutaceae', 454),
('Cyananthaceae', 455),
('Cyanastraceae', 456),
('Cynanchaceae', 457),
('Cyanellaceae', 458),
('Cyatheaceae', 459),
('Cycadaceae', 460),
('Cyclanthaceae', 461),
('Cyclantheraceae', 462),
('Cyclocheilaceae', 463),
('Cydoniaceae', 464),
('Cymodoceaceae', 465),
('Cynaraceae', 466),
('Cynocrambaceae', 467),
('Cynodontaceae', 468),
('Cynoglossaceae', 469),
('Cynomoriaceae', 470),
('Cynosuraceae', 471),
('Cyperaceae', 472),
('Cyphiaceae', 473),
('Cyphocarpaceae', 474),
('Cypripediaceae', 475),
('Cyrillaceae', 476),
('Cyrtandraceae', 477),
('Cyrtanthaceae', 478),
('Cystodiaceae', 479),
('Cystopteridaceae', 480),
('Cytinaceae', 481),
('Dacrycarpaceae', 482),
('Dactylanthaceae', 483),
('Dalbergiaceae', 484),
('Daleaceae', 485),
('Damasoniaceae', 486),
('Danaeaceae', 487),
('Daphnaceae', 488),
('Daphniphyllaceae', 489),
('Dasypogonaceae', 490),
('Datiscaceae', 491),
('Daturaceae', 492),
('Daucaceae', 493),
('Davalliaceae', 494),
('Davidiaceae', 495),
('Davidsoniaceae', 496),
('Decaisneaceae', 497),
('Deeringiaceae', 498),
('Degeneriaceae', 499),
('Delimaceae', 500),
('Delphiniaceae', 501),
('Dendrophthoaceae', 502),
('Dennstaedtiaceae', 503),
('Desfontainiaceae', 504),
('Detariaceae', 505),
('Dialypetalanthaceae', 506),
('Dianellaceae', 507),
('Dianthaceae', 508),
('Diapensiaceae', 509),
('Dichapetalaceae', 510),
('Dichondraceae', 511),
('Dicksoniaceae', 512),
('Diclidantheraceae', 513),
('Dictamnaceae', 514),
('Didiereaceae', 515),
('Didymelaceae', 516),
('Didymocarpaceae', 517),
('Diegodendraceae', 518),
('Diervillaceae', 519),
('Digitalidaceae', 520),
('Dilatridaceae', 521),
('Dilleniaceae', 522),
('Dioaceae', 523),
('Dionaeaceae', 524),
('Dioncophyllaceae', 525),
('Dioscoreaceae', 526),
('Diosmaceae', 527),
('Diospyraceae', 528),
('Dipentodontaceae', 529),
('Diphylleiaceae', 530),
('Diplaziopsidaceae', 531),
('Diplolaenaceae', 532),
('Dipsacaceae', 533),
('Dipteridaceae', 534),
('Dipterocarpaceae', 535),
('Dirachmaceae', 536),
('Disanthaceae', 537),
('Diselmaceae', 538),
('Dodonaeaceae', 539),
('Dombeyaceae', 540),
('Donatiaceae', 541),
('Dorsteniaceae', 542),
('Dortmannaceae', 543),
('Doryanthaceae', 544),
('Drabaceae', 545),
('Dracaenaceae', 546),
('Dracontiaceae', 547),
('Drimyidaceae', 548),
('Droseraceae', 549),
('Drosophyllaceae', 550),
('Dryadaceae', 551),
('Drynariaceae', 552),
('Dryopteridaceae', 553),
('Duabangaceae', 554),
('Duckeodendraceae', 555),
('Dulongiaceae', 556),
('Durantaceae', 557),
('Durionaceae', 558),
('Dysphaniaceae', 559);

-- Insert other options data (basic options for now)
INSERT INTO pollen_units (name, sort_order) VALUES
('Monad', 1),
('Tetrad', 2),
('Polyad', 3),
('Massulae', 4);

INSERT INTO dispersal_units (name, sort_order) VALUES
('Single', 1),
('Compound', 2),
('Aggregate', 3),
('Massula', 4),
('Pollinium', 5);

INSERT INTO pollen_classes (name, sort_order) VALUES
('Small', 1),
('Medium', 2),
('Large', 3),
('Very Large', 4);

INSERT INTO pollen_sizes (name, sort_order) VALUES
('Small (10-25 µm)', 1),
('Medium (26-50 µm)', 2),
('Large (51-100 µm)', 3),
('Very Large (>100 µm)', 4);

INSERT INTO hydrated_sizes (name, sort_order) VALUES
('Small Hydrated (15-30 µm)', 1),
('Medium Hydrated (31-60 µm)', 2),
('Large Hydrated (61-120 µm)', 3),
('Very Large Hydrated (>120 µm)', 4);

INSERT INTO polarities (name, sort_order) VALUES
('isopolar', 1),
('heteropolar', 2);

INSERT INTO shapes (name, sort_order) VALUES
('spheroidal', 1),
('prolate', 2),
('oblate', 3);

INSERT INTO outlines (name, sort_order) VALUES
('circular', 1),
('angular', 2),
('lobate', 3);

INSERT INTO pe_ratios (name, sort_order) VALUES
('spheroidal', 1),
('prolate', 2),
('oblate', 3);

INSERT INTO orientations (name, sort_order) VALUES
('equatorial', 1),
('polar', 2);

INSERT INTO aperture_numbers (value, label, sort_order) VALUES
('1', 'Monad', 1),
('2', 'Dyad', 2),
('3', 'Triad', 3),
('4', 'Tetrad', 4),
('5', 'Pentad', 5),
('6', 'Hexad', 6);

INSERT INTO aperture_types (name, sort_order) VALUES
('colpus', 1),
('porus', 2),
('colporus', 3),
('sulcus', 4),
('ulcus', 5);

INSERT INTO aperture_conditions (name, sort_order) VALUES
('syncolpate', 1),
('parasyncolpate', 2),
('free', 3),
('aspidote', 4);

INSERT INTO aperture_peculiarities (name, sort_order) VALUES
('operculate', 1),
('annulate', 2),
('vestibulate', 3),
('labrate', 4),
('aspidote', 5);

INSERT INTO wall_thicknesses (name, sort_order) VALUES
('thin', 1),
('medium', 2),
('thick', 3),
('thicker', 4);

INSERT INTO tectum_types (name, sort_order) VALUES
('tectate', 1),
('semitectate', 2),
('intectate', 3);

INSERT INTO infratectum_types (name, sort_order) VALUES
('columellate', 1),
('granular', 2),
('alveolate', 3);

INSERT INTO foot_layer_types (name, sort_order) VALUES
('continuous', 1),
('discontinuous', 2),
('absent', 3);

INSERT INTO nexine_types (name, sort_order) VALUES
('thin', 1),
('thick', 2),
('uniform', 3),
('non-uniform', 4);

INSERT INTO sexine_types (name, sort_order) VALUES
('thinner than nexine', 1),
('as thick as nexine', 2),
('thicker than nexine', 3);

INSERT INTO ornamentation_types (name, sort_order) VALUES
('psilate', 1),
('scabrate', 2),
('echinate', 3),
('reticulate', 4);

INSERT INTO coating_types (name, sort_order) VALUES
('pollenkitt', 1),
('tryphine', 2),
('absent', 3);

INSERT INTO lm_types (name, sort_order) VALUES
('psilate', 1),
('scabrate', 2),
('granulate', 3),
('verrucate', 4);

INSERT INTO wall_structure_types (name, sort_order) VALUES
('tectate', 1),
('semitectate', 2),
('intectate', 3);

-- Plants data'ya user_id ekle
INSERT INTO plants (user_id, name, family, description, pollen_unit, dispersal_unit, pollen_class, size, hydrated_size, polarity, shape, outline_polar, pe_ratio, orientation, aperture_number, aperture_type, aperture_condition, aperture_peculiarities, ornamentation_lm, nexine, sexine, ornamentation, suprasculpture, tectum, infratectum, foot_layer, endexine, intine, supratectal_elements, wall_peculiarities, pollen_coatings, reserves, cell_number, ubisch_bodies, preparation, staining) VALUES
('00000000-0000-0000-0000-000000000001', 'Helianthus annuus', 'Asteraceae', 'Ayçiçeği, yıllık otsu bir bitkidir.', 'monad', 'single', 'medium', 'medium', 'medium_hydrated', 'isopolar', 'spheroidal', 'circular', 'spheroidal', 'equatorial', 'triaperturate', 'colporus', 'simple', 'operculate', 'echinate', 'thick', 'thicker', 'echinate', 'present', 'tectate', 'columellate', 'continuous', 'present', 'thin', 'present', 'costa', 'pollenkitt', 'starch', '3-celled', 'present', 'scabrate', 'Absent'),
('00000000-0000-0000-0000-000000000001', 'Alnus glutinosa', 'Betulaceae', 'Kızılağaç, nemli bölgelerde yetişen bir ağaç türüdür.', 'monad', 'single', 'small', 'small', 'small_hydrated', 'isopolar', 'oblate', 'polygonal', 'oblate', 'polar', 'pentaaperturate', 'pore', 'simple', 'aspidote', 'scabrate', 'thick', 'equal', 'scabrate', 'present', 'tectate', 'columellate', 'continuous', 'present', 'thin', 'present', 'arcus', 'pollenkitt', 'starch', '2-celled', 'present', 'perforate', 'Absent');
