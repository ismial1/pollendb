-- Insert other options data
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
