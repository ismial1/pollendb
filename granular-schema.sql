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
