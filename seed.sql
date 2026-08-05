-- RateYourTools.org — Seed Data
-- Run: wrangler d1 execute rateyourtools-db --remote --file=seed.sql

-- ─── Additional Brands ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO brands (name, slug) VALUES
  ('Metabo HPT',        'metabo-hpt'),
  ('Skilsaw',           'skilsaw'),
  ('Kobalt',            'kobalt'),
  ('Craftsman',         'craftsman'),
  ('Rikon',             'rikon'),
  ('Harvey',            'harvey'),
  ('Baileigh',          'baileigh'),
  ('Oliver',            'oliver'),
  ('Felder',            'felder'),
  ('Minimax',           'minimax'),
  ('Lie-Nielsen',       'lie-nielsen'),
  ('Veritas',           'veritas'),
  ('Narex',             'narex'),
  ('Suizan',            'suizan'),
  ('Gyokucho',          'gyokucho'),
  ('Starrett',          'starrett'),
  ('Bessey',            'bessey'),
  ('Jorgensen',         'jorgensen'),
  ('Kreg',              'kreg'),
  ('Oneida',            'oneida'),
  ('Nova',              'nova'),
  ('Dremel',            'dremel'),
  ('Skil',              'skil'),
  ('Worx',              'worx'),
  ('Metabo',            'metabo'),
  ('Festool',           'festool'),
  ('Woodcraft',         'woodcraft'),
  ('General',           'general'),
  ('Swanson',           'swanson'),
  ('FastCap',           'fastcap'),
  ('Bridge City',       'bridge-city'),
  ('Blue Spruce',       'blue-spruce'),
  ('Crown Tools',       'crown-tools'),
  ('Two Cherries',      'two-cherries'),
  ('Ashley Iles',       'ashley-iles'),
  ('Irwin',             'irwin'),
  ('Empire',            'empire'),
  ('Shinwa',            'shinwa'),
  ('Hart',              'hart'),
  ('Hercules',          'hercules');

-- ─── TABLE SAWS ──────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DWE7491RS 10" Jobsite Table Saw', 'dewalt-dwe7491rs',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Portable jobsite table saw with rolling stand and 32.5" rip capacity'),

  ('DWE7480 10" Compact Table Saw', 'dewalt-dwe7480',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Compact 10" table saw with 20" rip capacity and site-pro modular guarding'),

  ('4100XC-10 Gravity-Rise Table Saw', 'bosch-4100xc-10',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Portable table saw with gravity-rise wheeled stand and 25" rip capacity'),

  ('2705X1 10" Contractor Table Saw', 'makita-2705x1',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" table saw with large aluminum table and dust collection port'),

  ('ICS51230 Industrial Cabinet Saw', 'sawstop-ics51230',
   (SELECT id FROM brands WHERE slug='sawstop'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Industry-leading flesh-detection safety with 52" T-glide fence, 5HP motor'),

  ('PCS175-PFA30 Professional Cabinet Saw', 'sawstop-pcs175',
   (SELECT id FROM brands WHERE slug='sawstop'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Professional cabinet saw with 36" fence and SawStop safety system, 1.75HP'),

  ('CNS175-TGP236 Contractor Saw', 'sawstop-cns175',
   (SELECT id FROM brands WHERE slug='sawstop'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'SawStop safety in a portable contractor saw format, 1.75HP'),

  ('PM2000T 10" Table Saw', 'powermatic-pm2000t',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Cast iron table saw with T-square fence system, 3HP, made in USA'),

  ('JTS-315SP Table Saw', 'jet-jts-315sp',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" table saw with scoring blade, T-fence, and integrated stand'),

  ('G0771Z 10" Cabinet Table Saw', 'grizzly-g0771z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Cabinet table saw with 3HP motor, cast iron top, and riving knife'),

  ('G700 10" Cabinet Table Saw', 'harvey-g700',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Professional cabinet saw with magnetic switch and riving knife system'),

  ('Fusion F3 Table Saw', 'laguna-fusion-f3',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Cabinet table saw with proprietary fence system and integrated riving knife'),

  ('R4514 10" Table Saw', 'ridgid-r4514',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Portable table saw with padded carrying handles and blade storage'),

  ('RTS21G 10" Table Saw', 'ryobi-rts21g',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Budget-friendly 10" table saw with folding stand and 24" rip capacity');

-- ─── BAND SAWS ───────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('14|12 Bandsaw', 'laguna-1412-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with ceramic guides, 12" resaw capacity, and 1.75HP motor'),

  ('18|36 Bandsaw', 'laguna-1836-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Heavy-duty 18" bandsaw with 36" resaw height and 3HP motor'),

  ('10-305 10" Bandsaw', 'rikon-10-305',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '10" bandsaw with fence and miter gauge, 4.5" resaw height, 1/3HP'),

  ('10-326 14" Bandsaw', 'rikon-10-326',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with 6" resaw capacity, fence, and miter gauge'),

  ('JWBS-14DXPRO 14" Bandsaw', 'jet-jwbs-14dxpro',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with Pro fence, 6" resaw height, and quick-release blade tension'),

  ('G0513X2BF 17" Bandsaw', 'grizzly-g0513x2bf',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '17" bandsaw with 12" resaw capacity, ball-bearing guides, and fence'),

  ('PM1500 15" Bandsaw', 'powermatic-pm1500',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '15" bandsaw with 12" resaw capacity, EZ-Lock quick-change guide system'),

  ('WEN 3962 10" Bandsaw', 'wen-3962-bandsaw',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Entry-level 10" bandsaw with fence, miter gauge, and work light'),

  ('28-400 14" Bandsaw', 'delta-28-400',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with 6" resaw height and quick-release blade tension');

-- ─── PLANERS ─────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DW735X 13" Thickness Planer', 'dewalt-dw735x',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='planers'),
   'Two-speed 13" thickness planer with three-knife cutter head, extra knives included'),

  ('DW734 12-1/2" Planer', 'dewalt-dw734',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='planers'),
   'Portable 12.5" planer with four-column carriage lock and fan-assisted chip ejection'),

  ('2012NB 12" Planer', 'makita-2012nb',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='planers'),
   'Quiet 12" planer with 8,500 RPM and four-post design for reduced snipe'),

  ('WEN 6550 15" Planer', 'wen-6550-planer',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='planers'),
   '15" benchtop planer with three-knife cutter head and 30" depth capacity'),

  ('JWP-15BHH 15" Planer', 'jet-jwp-15bhh',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='planers'),
   'Helical head 15" planer with 4-row carbide insert cutter head'),

  ('PM2244 22" Planer', 'powermatic-pm2244',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='planers'),
   '22" industrial planer with helical cutter head and digital readout'),

  ('G0453Z 15" Planer', 'grizzly-g0453z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='planers'),
   '15" planer with helical cutter head and built-in mobile base'),

  ('R4331 13" Planer', 'ridgid-r4331',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='planers'),
   '13" thickness planer with three-knife cutter head and dust port');

-- ─── JOINTERS ────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('PM-54A 6" Jointer', 'powermatic-pm54a',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with parallelogram tables and rabbet ledge, 1HP'),

  ('PM-708HH 8" Jointer', 'powermatic-pm708hh',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '8" jointer with helical cutter head, parallelogram tables, 2HP'),

  ('JJ-6HHDX 6" Jointer', 'jet-jj-6hhdx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with helical cutter head and quick-set fence'),

  ('G0490X 6" Jointer', 'grizzly-g0490x',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with spiral cutter head and cast iron tables'),

  ('37-071 6" Jointer', 'delta-37-071',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with parallelogram table design and rabbeting ledge'),

  ('20-100H 6" Jointer', 'rikon-20-100h',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" helical head jointer with long cast iron table and 1HP motor'),

  ('JJP-10BTOS Planer/Jointer', 'jet-jjp-10btos',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '10" combination jointer/planer with over/under design, saves shop space');

-- ─── ROUTER TABLES ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('1617EVSPK Router Kit', 'bosch-1617evspk',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='router-tables'),
   'Variable-speed combination router kit with fixed and plunge bases'),

  ('OF 1400 EQ Router', 'festool-of1400',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='router-tables'),
   'Plunge router with through-the-base dust extraction and fine depth adjustment'),

  ('DW618PK Router Kit', 'dewalt-dw618pk',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='router-tables'),
   '12-amp router kit with fixed and plunge bases and soft-start motor'),

  ('RT0701CX7 Router Kit', 'makita-rt0701cx7',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='router-tables'),
   'Compact router kit with six bases, 1.25HP, ideal for trimming and edge work'),

  ('MOF001 3-1/4 HP Router', 'triton-mof001',
   (SELECT id FROM brands WHERE slug='triton'),
   (SELECT id FROM categories WHERE slug='router-tables'),
   'Plunge router with above-table height adjustment and winding shaft'),

  ('PRS2100 Benchtop Router Table', 'kreg-prs2100',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='router-tables'),
   'Precision router table with adjustable steel fence and insert plate'),

  ('RA1181 Benchtop Router Table', 'bosch-ra1181',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='router-tables'),
   'Aluminum-top router table with two featherboards and mounting hardware');

-- ─── SANDERS ─────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('RO 150 FEQ Random Orbit Sander', 'festool-ro150',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'Rotex dual-mode sander with aggressive removal and fine finishing modes'),

  ('ETS 125 REQ Random Orbit Sander', 'festool-ets125',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'Compact 5" random orbit sander with low vibration and Systainer compatibility'),

  ('BO5041 5" Random Orbit Sander', 'makita-bo5041',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '3-amp random orbit sander with two-finger trigger and dustbag'),

  ('DWES213 5" Random Orbit Sander', 'dewalt-dwes213',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '3-amp variable speed random orbit sander with paper punch system'),

  ('ROS20VSK 5" Random Orbit Sander', 'bosch-ros20vsk',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'Vibration control random orbit sander with microfilter dust canister'),

  ('10-20 Plus 10"x20" Drum Sander', 'jet-1020-plus',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'Open-end drum sander with variable speed feed and sand up to 20" width'),

  ('16-32 Plus 16"x32" Drum Sander', 'laguna-16-32',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'Wide drum sander with conveyor feed and 16" single pass or 32" double pass'),

  ('G0459 Drum Sander', 'grizzly-g0459',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'Benchtop drum sander with open-end design and variable speed feed'),

  ('BPST07 Belt/Disc Sander', 'wen-bpst07',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '1" x 30" belt and 5" disc combination sander with cast iron table');

-- ─── DRILLS & DRIVERS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('M18 FUEL 1/2" Drill/Driver', 'milwaukee-m18-fuel-drill',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Brushless M18 drill with POWERSTATE motor, 1,200 in-lbs torque'),

  ('DCD791D2 20V Drill/Driver', 'dewalt-dcd791d2',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Brushless 20V MAX drill with 3-speed transmission and LED light'),

  ('XFD131 18V Drill/Driver', 'makita-xfd131',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Compact 18V LXT brushless drill with 2-speed transmission, 530 in-lbs'),

  ('GSR18V-300B12 18V Drill', 'bosch-gsr18v-300',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Compact brushless 18V drill with Bosch EC brushless motor'),

  ('T 18+3 Basic Drill', 'festool-t18',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Cordless drill with 3-speed gearbox, centrotec chuck system, and AIRSTREAM'),

  ('K4 Pocket-Hole Jig', 'kreg-k4',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Classic pocket-hole jig with adjustable drill guide and material clamp'),

  ('K5 Pocket-Hole Jig', 'kreg-k5',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Upgraded pocket-hole jig with built-in clamp and removable dust collection'),

  ('Domino DF 500 Joiner', 'festool-domino-df500',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Loose tenon joinery system for fast, precise mortise-and-tenon joints');

-- ─── LATHES ──────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('JWL-1221VS 12" Variable Speed Lathe', 'jet-jwl-1221vs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12"x21" variable speed lathe with electronic speed control, 1HP'),

  ('JWL-1840EVS 18" Lathe', 'jet-jwl-1840evs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '18"x40" EVS lathe with electronic variable speed and digital readout'),

  ('Comet II Variable Speed Lathe', 'nova-comet-ii',
   (SELECT id FROM brands WHERE slug='nova'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12"x16" mini lathe with 4-speed pulley system and Nova chuck compatibility'),

  ('Revo 18|36 Lathe', 'laguna-revo-1836',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '18"x36" variable speed lathe with outboard turning capability, 2HP'),

  ('PM2014 20" Lathe', 'powermatic-pm2014',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '20"x37" variable speed lathe with digital RPM readout and 2HP motor'),

  ('LA3424 14" x 20" Lathe', 'wen-la3424',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='lathes'),
   'Variable speed lathe with 5-speed electronic control and 3/4HP motor'),

  ('70-105 10" Variable Speed Lathe', 'rikon-70-105',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '10"x18" midi lathe with variable speed and indexing head, 1/2HP'),

  ('46-460 12" Variable Speed Lathe', 'delta-46-460',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12.5"x20" variable speed lathe with digital RPM display, 1HP motor');

-- ─── SCROLL SAWS ─────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DW788 20" Scroll Saw', 'dewalt-dw788',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='scroll-saws'),
   'Heavy-duty 20" variable-speed scroll saw with parallel arm design, 1.3-amp'),

  ('JWSS-22B 22" Scroll Saw', 'jet-jwss-22b',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='scroll-saws'),
   '22" scroll saw with parallel-arm design and built-in blower, 1.6-amp'),

  ('10-600VS 16" Scroll Saw', 'rikon-10-600vs',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='scroll-saws'),
   '16" variable-speed scroll saw with quick-change blade system'),

  ('WEN 3922 16" Scroll Saw', 'wen-3922-scroll-saw',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='scroll-saws'),
   '16" variable-speed scroll saw with dust blower and flexible work light'),

  ('40-694 20" Scroll Saw', 'delta-40-694',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='scroll-saws'),
   '20" variable-speed scroll saw with upper arm lift for easy blade changes');

-- ─── HAND TOOLS ──────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('No. 4 Smoothing Plane', 'lie-nielsen-no4',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Premium A2 tool steel blade, ductile iron body, made in Warren, Maine'),

  ('No. 5 Jack Plane', 'lie-nielsen-no5',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Versatile jack plane for stock removal and rough dimensioning, A2 steel'),

  ('No. 7 Jointer Plane', 'lie-nielsen-no7',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '22" jointer plane for flattening large surfaces and edge jointing'),

  ('Low-Angle Jack Plane', 'veritas-low-angle-jack',
   (SELECT id FROM brands WHERE slug='veritas'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Bevel-up design accepts multiple blade angles, PM-V11 blade available'),

  ('Low-Angle Block Plane', 'veritas-low-angle-block',
   (SELECT id FROM brands WHERE slug='veritas'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Adjustable mouth, 12° bed angle, excellent for end grain work'),

  ('Wheel Marking Gauge', 'veritas-wheel-marking-gauge',
   (SELECT id FROM brands WHERE slug='veritas'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Micro-adjustable marking gauge with hardened steel wheel cutter'),

  ('6-Piece Bevel Edge Chisel Set', 'narex-6pc-chisels',
   (SELECT id FROM brands WHERE slug='narex'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Czech-made chrome-manganese steel chisels, 1/4" to 1-1/4", excellent value'),

  ('Blue Chip Chisel Set', 'two-cherries-blue-chip',
   (SELECT id FROM brands WHERE slug='two-cherries'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'German chrome vanadium steel chisels, hand-lapped backs, hornbeam handles'),

  ('Japanese Pull Saw', 'suizan-japanese-pull-saw',
   (SELECT id FROM brands WHERE slug='suizan'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Ryoba double-edge pull saw with crosscut and rip teeth, replaceable blade'),

  ('372 Ryoba Saw', 'gyokucho-372',
   (SELECT id FROM brands WHERE slug='gyokucho'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Professional Japanese ryoba saw with impulse-hardened teeth for longevity'),

  ('12" Combination Square', 'starrett-c11h-12',
   (SELECT id FROM brands WHERE slug='starrett'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Precision machined combination square with hardened blade, made in USA'),

  ('PMS-16 Tape Measure', 'fastcap-pms-16',
   (SELECT id FROM brands WHERE slug='fastcap'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Standard/metric tape measure with bold easy-read numbers and flat-back design'),

  ('Speed Square', 'swanson-speed-square',
   (SELECT id FROM brands WHERE slug='swanson'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Original 7" speed square in aluminum, includes rafter table book'),

  ('Marples Blue Chip Chisel Set', 'irwin-marples-chisels',
   (SELECT id FROM brands WHERE slug='irwin'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Budget-friendly chrome vanadium chisels with blue plastic handles, 4-piece'),

  ('Marking Knife', 'blue-spruce-marking-knife',
   (SELECT id FROM brands WHERE slug='blue-spruce'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Handcrafted marking knife with cocobolo handle and 01 tool steel blade'),

  ('HP-6v2 Mortise/Marking Gauge', 'bridge-city-hp6v2',
   (SELECT id FROM brands WHERE slug='bridge-city'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Precision marking gauge with micro-adjust and hardened steel pins');

-- ─── DUST COLLECTION ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('CT 26 E Dust Extractor', 'festool-ct26',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'HEPA-class dust extractor with auto-start and 6.9-gallon capacity'),

  ('CT 36 AC Dust Extractor', 'festool-ct36',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'HEPA dust extractor with Bluetooth antistatic hose and 9.5-gallon tank'),

  ('Ultimate Dust Deputy', 'oneida-dust-deputy',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Cyclone separator that removes 99%+ of debris before the shop vac filter'),

  ('DC-1100VX 1.5HP Dust Collector', 'jet-dc-1100vx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1.5HP dust collector with 660 CFM and remote control, 70-gallon drum'),

  ('DC-1200VX-CK 1.5HP Collector', 'jet-dc-1200vx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'High-capacity 1.5HP collector with canister filter and 1,100 CFM airflow'),

  ('G0562Z 2HP Dust Collector', 'grizzly-g0562z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '2HP dust collector with canister filter and 1,280 CFM, mobile base included'),

  ('PM1900TX-BK 3HP Dust Collector', 'powermatic-pm1900tx',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP dust collector with 1,900 CFM, HEPA canister filter, and Wye fitting'),

  ('P-Flux 3 Dust Collector', 'laguna-pflux3',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP collector with cyclonic filtration and 1,843 CFM airflow, remote start'),

  ('WEN 3401 5-Amp Dust Collector', 'wen-3401',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Budget-friendly 660 CFM collector with 12-gallon bag and 3-micron filter');

-- ─── CLAMPS ──────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('K Body REVO 24" Parallel Clamp', 'bessey-krevo-24',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Industry-standard parallel clamp with 900 lbs clamping force, KRev design'),

  ('K Body REVO 50" Parallel Clamp', 'bessey-krevo-50',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   '50" parallel clamp for wide glue-ups, 900 lbs clamping force'),

  ('GZ40 40" I-Beam Bar Clamp', 'bessey-gz40',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Steel I-beam bar clamp with 1,000 lbs clamping force and non-marring pads'),

  ('3706 Bar Clamp 6-Pack', 'jorgensen-3706',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Classic steel bar clamps with malleable iron heads, 6" capacity, 6-pack'),

  ('Quick-Grip 6" Clamp', 'irwin-quick-grip-6',
   (SELECT id FROM brands WHERE slug='irwin'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'One-handed bar clamp with 150 lbs clamping force and micro-adjust'),

  ('Quick-Grip XP 18" Clamp', 'irwin-quick-grip-xp-18',
   (SELECT id FROM brands WHERE slug='irwin'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Heavy-duty one-hand clamp with 300 lbs force and wire form handle');

-- ─── MEASURING & LAYOUT ──────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('12" Engineer Square', 'woodpeckers-12-square',
   (SELECT id FROM brands WHERE slug='woodpeckers'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'One-time tool precision machined aluminum square, accurate to .001"'),

  ('505A-7 Combination Square', 'starrett-505a-7',
   (SELECT id FROM brands WHERE slug='starrett'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   '7" precision combination square with hardened and ground blade, USA made'),

  ('e3994 48" Level', 'empire-e3994',
   (SELECT id FROM brands WHERE slug='empire'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   '48" aluminum level with block vials and milled top/bottom edges'),

  ('No. 620 Digital Angle Gauge', 'general-no620',
   (SELECT id FROM brands WHERE slug='general'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Digital angle gauge with magnetic base, reads in degrees and percent'),

  ('Precision Marking Gauge', 'veritas-precision-marking-gauge',
   (SELECT id FROM brands WHERE slug='veritas'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Dual-rod marking gauge with locking wedge and hardened steel wear strip'),

  ('PMA-48 48" Aluminum Rule', 'shinwa-pma-48',
   (SELECT id FROM brands WHERE slug='shinwa'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Japanese aluminum rule with millimeter graduations, easy-read markings'),

  ('PW-12 Precision Router Lift', 'woodpeckers-pw12',
   (SELECT id FROM brands WHERE slug='woodpeckers'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Precision winder router lift with micro-adjust and above-table height change');

-- ─── SAFETY EQUIPMENT ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('3M WorkTunes Hearing Protector', '3m-worktunes',
   (SELECT id FROM brands WHERE slug='general'),
   (SELECT id FROM categories WHERE slug='safety'),
   'AM/FM radio hearing protector with NRR 24 and digital tuning'),

  ('Uvex Skyper Safety Glasses', 'uvex-skyper',
   (SELECT id FROM brands WHERE slug='general'),
   (SELECT id FROM categories WHERE slug='safety'),
   'Safety glasses with anti-fog coating and wraparound lens, ANSI Z87.1'),

  ('SB-7A Half-Mask Respirator', 'moldex-sb7a',
   (SELECT id FROM brands WHERE slug='general'),
   (SELECT id FROM categories WHERE slug='safety'),
   'Reusable half-mask respirator for dust and organic vapors, adjustable straps'),

  ('PF-400 Face Shield', 'jet-pf400',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='safety'),
   'Full-face shield for lathe and turning work, adjustable headband');
