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
  ('Hercules',          'hercules'),
  ('SuperMax',          'supermax');

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

  ('Jobsite Saw Pro JSS', 'sawstop-jss',
   (SELECT id FROM brands WHERE slug='sawstop'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'SawStop safety in a portable jobsite package. 15A/120V, 25-1/2" rip capacity, one-turn blade elevation, active dust collection blade guard, and integrated mobile cart. Starts at $1,699'),

  ('Compact Table Saw CTS', 'sawstop-cts',
   (SELECT id FROM brands WHERE slug='sawstop'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Smallest, most portable saw in the SawStop lineup. 10" blade, 24-1/2" rip capacity, rack & pinion fence with micro-adjust, on-saw storage, optional folding stand. Starts at $899'),

  ('Contractor Saw CNS', 'sawstop-cns',
   (SELECT id FROM brands WHERE slug='sawstop'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Most configurable SawStop — cast iron top with steel wings, 1.75HP, 30"/36"/52" fence options, T-Glide or T-Glide Advance available. The versatile mid-range choice. Starts at $1,999'),

  ('Professional Cabinet Saw PCS', 'sawstop-pcs',
   (SELECT id FROM brands WHERE slug='sawstop'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Top-selling SawStop cabinet saw. Cast iron top and wings, 1.75HP or 3HP, 30" premium or 36"/52" T-Glide fence options. Unmatched fit and finish. Starts at $3,025'),

  ('Industrial Cabinet Saw ICS', 'sawstop-ics',
   (SELECT id FROM brands WHERE slug='sawstop'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Heaviest, most powerful SawStop — built for industrial duty. Cast iron top, 3HP to 7.5HP (1ph or 3ph), 36" or 52" T-Glide fence, heaviest build quality in the lineup. Starts at $5,154'),

  ('64B 10" Table Saw', 'powermatic-64b',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Classic Powermatic 10" cabinet saw — cast iron top, 1.75HP, 30" or 50" rip, 115/230V. The legendary saw that built Powermatic''s reputation'),

  ('PM1000 10" Table Saw', 'powermatic-pm1000',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Modern evolution of the 64B. 10" cabinet saw, 1.75HP, 115/230V, available in 30" or 52" rip configurations. Cast iron top and wings'),

  ('PM1000T 10" Table Saw', 'powermatic-pm1000t',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'ArmorGlide version of the PM1000 — low-friction, corrosion-resistant table surface. 1.75HP, 115/230V, 30" rip. Enhanced material control and slide'),

  ('PM2000B 10" Table Saw', 'powermatic-pm2000b',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Powermatic''s workhorse cabinet saw. 10", 3HP or 5HP, 230V (1ph or 3ph), 30" or 50" rip. Optional workbench or router lift configurations available'),

  ('PM2000BT 10" Table Saw', 'powermatic-pm2000bt',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'ArmorGlide PM2000B — same 3HP or 5HP power with low-friction corrosion-resistant table coating. 30" or 50" rip, optional router lift and workbench configs'),

  ('PM3000B 14" Table Saw', 'powermatic-pm3000b',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Powermatic''s largest cabinet saw — 14" blade, 7.5HP, 230/460V 3ph, 50" rip. Built for production shops with maximum cutting capacity'),

  ('PM3000T 14" Table Saw', 'powermatic-pm3000t',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'ArmorGlide PM3000B — 14" industrial cabinet saw with 7.5HP, 230V 3ph, 50" rip, and low-friction corrosion-resistant ArmorGlide table surface'),

  ('JTS-315SP Table Saw', 'jet-jts-315sp',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" table saw with scoring blade, T-fence, and integrated stand'),

  ('JPS-10 ProShop II Table Saw', 'jet-jps-10',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'ProShop II 10" contractor-style table saw with 1.75HP, cast iron wings, riving knife, and 30" or 52" rip capacity. Runs on 115V'),

  ('JTAS-10 Deluxe Xacta 3HP Table Saw', 'jet-jtas-10-3hp',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" Deluxe Xacta cabinet saw with 3HP, 230V, Poly-V belt drive, quick-release riving knife, and cast iron wings. Available in 30" or 50" rip configurations'),

  ('JTAS-10 Deluxe Xacta 5HP Table Saw', 'jet-jtas-10-5hp',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" Deluxe Xacta cabinet saw with 5HP, 230V, Poly-V belt drive, quick-release riving knife, and cast iron wings. Available in 30" or 50" rip configurations'),

  ('JTAS-12-DX 12" Xacta Table Saw', 'jet-jtas-12-dx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '12" Xacta cabinet saw with 5HP, 1ph 230V, riving knife, cast iron wings, and Xacta II fence system — JET''s largest woodworking table saw'),

  ('G0771Z 10" 2HP Hybrid Table Saw', 'grizzly-g0771z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Hybrid table saw combining contractor and cabinet saw features, 2HP TEFC motor, T-shaped fence, runs on 120V'),

  ('G0869 10" 2HP Benchtop Table Saw', 'grizzly-g0869',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Compact benchtop table saw, 2HP, 120V — portable option for job site or small shops with 25" rip capacity'),

  ('G0962 10" 2HP Open-Stand Hybrid Table Saw', 'grizzly-g0962',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Open-stand hybrid table saw, 2HP, 240V — cabinet-mounted trunnions with open base, good mid-range value'),

  ('G0715P 10" Hybrid Table Saw (Polar Bear)', 'grizzly-g0715p',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Hybrid table saw, Polar Bear series — cabinet-mounted trunnion, riving knife, polar white finish. Contractor-friendly 120/240V'),

  ('G0690 10" 3HP Cabinet Table Saw', 'grizzly-g0690',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '3HP 220V cabinet table saw with riving knife, 29.5" rip capacity — Grizzly''s most popular cabinet saw'),

  ('G0691 10" 3HP Cabinet Table Saw (Long Rails)', 'grizzly-g0691',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '3HP 220V cabinet table saw with riving knife and long fence rails, 50" rip capacity — same as G0690 with extended rails'),

  ('G1023RL 10" 3HP Cabinet Table Saw', 'grizzly-g1023rl',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '3HP 240V cabinet table saw, 32" rip right/14" left, 4,200 RPM arbor — Fine Woodworking Best Value award winner'),

  ('G1023RLX5 10" 5HP Cabinet Table Saw', 'grizzly-g1023rlx5',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '5HP 240V cabinet table saw with 7'' fence rails — Grizzly''s most powerful 10" cabinet saw for production shops'),

  ('ALPHA HW110TC 10" 3HP Cabinet Table Saw', 'harvey-alpha-hw110tc',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Cabinet saw with nickel-plated cast iron top, cabinet-mounted trunnion, and COMPASS miter gauge. Available in 36" and 52" rip fence configurations'),

  ('ALPHA HW110LC-36 Pro Table Saw', 'harvey-alpha-hw110lc-36-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" left-tilt cabinet table saw, 3HP, 36" rip capacity, nickel-plated cast iron top, cabinet-mounted trunnion, and COMPASS fence system'),

  ('ALPHA HW110TC-36 Pro Table Saw', 'harvey-alpha-hw110tc-36-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" right-tilt cabinet table saw, 3HP, 36" rip capacity, nickel-plated cast iron top, cabinet-mounted trunnion, and COMPASS fence system'),

  ('ALPHA HW110TC-52 Pro Table Saw', 'harvey-alpha-hw110tc-52-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" right-tilt cabinet table saw, 3HP, 52" rip capacity, nickel-plated cast iron top, cabinet-mounted trunnion, and COMPASS fence system'),

  ('ALPHA HW110S-36 Pro Table Saw', 'harvey-alpha-hw110s-36-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" cabinet table saw with integrated sliding table, 3HP, 36" rip capacity, nickel-plated cast iron top, and COMPASS fence system'),

  ('ALPHA HW110S-52 Pro Table Saw', 'harvey-alpha-hw110s-52-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" cabinet table saw with integrated sliding table, 3HP, 52" rip capacity, nickel-plated cast iron top, and COMPASS fence system'),

  ('F1 Fusion Table Saw', 'laguna-f1-fusion',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" hybrid table saw with 1.75HP motor, 30" rip capacity, and Laguna fence system — entry-level Fusion'),

  ('F2 Fusion Table Saw', 'laguna-f2-fusion',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" cabinet table saw with 3HP motor, 36" rip capacity, cast iron top, and Laguna fence system'),

  ('F3 Fusion Table Saw', 'laguna-f3-fusion',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" cabinet table saw with 3HP motor, 36" rip capacity, T-glide fence system, and integrated riving knife'),

  ('F3 Fusion 53" Table Saw', 'laguna-f3-fusion-53',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" cabinet table saw with 3HP motor, extended 53" rip capacity, T-glide fence system — ideal for sheet goods'),

  ('R4514 10" Table Saw', 'ridgid-r4514',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Portable table saw with padded carrying handles and blade storage'),

  ('RTS21G 10" Table Saw', 'ryobi-rts21g',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Budget-friendly 10" table saw with folding stand and 24" rip capacity'),

  ('10-205 10" Contractor Saw', 'rikon-10-205',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   'Left-tilt 10" contractor saw with 1-3/4HP motor (120/240V), precision cast iron table, 29-1/2" rip capacity, riving knife, and built-in mobile base. 260 lbs');

-- ─── BAND SAWS ───────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('V10 Bandsaw', 'laguna-v10-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Compact 10" bandsaw with ceramic guides, 6" resaw capacity, and 1HP motor — entry-level Laguna'),

  ('14|12 Bandsaw', 'laguna-1412-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with ceramic guides, 12" resaw capacity, and 1.75HP motor'),

  ('14|BX Bandsaw', 'laguna-14bx-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with 13.5" resaw capacity, ceramic guides, and 1.75HP motor — workhorse of the 14" line'),

  ('14|CX Bandsaw', 'laguna-14cx-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" closure-series bandsaw with 13.5" resaw capacity, ceramic guides, and 1.75HP motor — enclosed cabinet design'),

  ('18|BX Bandsaw', 'laguna-18bx-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '18" bandsaw with 16" resaw capacity, ceramic guides, and 3HP motor'),

  ('18|CX Bandsaw', 'laguna-18cx-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '18" closure-series bandsaw with 16" resaw capacity, ceramic guides, 3HP motor, and enclosed cabinet'),

  ('24|BX Bandsaw', 'laguna-24bx-bandsaw',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '24" industrial bandsaw with 21" resaw capacity, ceramic guides, and 5HP motor — top of the Laguna line'),

  ('10-305 10" Bandsaw', 'rikon-10-305',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '10" bandsaw with fence and miter gauge, 4.5" resaw height, 1/3HP'),

  ('10-326 14" Bandsaw', 'rikon-10-326',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with 6" resaw capacity, fence, and miter gauge'),

  ('10-310 10" Bandsaw with Stand', 'rikon-10-310',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Entry-level 10" bandsaw with stand, cast iron table, tool-less blade guides, rip fence, and miter gauge. 1/3HP, 4-5/8" resaw capacity'),

  ('10-3062S 10" Deluxe Bandsaw with Stand', 'rikon-10-3062s',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Deluxe 10" bandsaw with stand, SP coated cast iron table, 2 speeds (1,515/3,280 ft/min), tool-less guides, and quick-release blade tension. 1/2HP, 5" resaw capacity. Lifetime warranty'),

  ('10-324TG 14" Bandsaw', 'rikon-10-324tg',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Most popular Rikon 14" bandsaw. 1-1/2HP, dual speed (1,445/2,950 ft/min), 13" resaw capacity, tool-less bearing guides, 6" tall rip fence with resaw bar. Runs 115/230V'),

  ('10-1414 14" Deluxe Bandsaw', 'rikon-10-1414',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Upgraded 14" deluxe bandsaw with 14" resaw capacity, SP coated table, quick-adjust drift fence, 2 speeds (1,476/3,280 ft/min), 1-3/4HP TEFC motor. Lifetime warranty'),

  ('10-353 14" Professional Bandsaw', 'rikon-10-353',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Professional 14" bandsaw with 3HP TEFC motor, 14" resaw capacity, 4,300 ft/min, keyed safety switch, foot brake, and tool-less spring-loaded guide system. 220V'),

  ('10-342 18" Deluxe Bandsaw', 'rikon-10-342',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Entry-level 18" bandsaw with 2HP TEFC motor, 13" resaw capacity, 17-1/2" throat, tool-less blade guides, and quick-release tension. 220V single phase'),

  ('10-342EVS 18" Wood/Metal Bandsaw', 'rikon-10-342evs',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Variable speed 18" bandsaw for wood and metal. 2.5HP, electronic variable speed 82–3,280 ft/min, digital readout, electronic brake stops blade in under 5 seconds. Cuts wood, metal, plastic, foam, and composites. 220V'),

  ('10-347 18" Professional Bandsaw', 'rikon-10-347',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Top-of-line 18" professional bandsaw. 4HP, 19" resaw capacity, 4,920 ft/min, massive cast iron table, foot brake with micro-switch, keyed safety switch. 498 lbs. 220V'),

  ('JWBS-14CS 14" Bandsaw', 'jet-jwbs-14cs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Entry-level 14" bandsaw, 1HP, 115/230V, 6" resaw capacity, graphite-coated table, rip fence and miter gauge included'),

  ('JWBS-14SFX 14" Bandsaw', 'jet-jwbs-14sfx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" steel frame bandsaw, 1.75HP, 115/230V, 6" resaw capacity, tool-less blade guides and quick-release blade tension'),

  ('JWBS-14DXPRO 14" Bandsaw', 'jet-jwbs-14dxpro',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" deluxe pro bandsaw, 1.75HP, 115/230V, 13.5" resaw capacity, Pro fence system, precision blade guides and cast iron table'),

  ('JWBS-15 15" Bandsaw', 'jet-jwbs-15',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '15" bandsaw, 1.75HP, 115/230V, large cast iron table, precision blade guidance and quick-release blade tension'),

  ('JWBS-15-3 15" Bandsaw', 'jet-jwbs-15-3',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '15" bandsaw with 3HP, 230V, cast iron fence system, large resaw capacity — top of the 15" JET line'),

  ('JWBS-18SFX 18" Bandsaw', 'jet-jwbs-18sfx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '18" bandsaw, 1.75HP, 115V, safety brake stops blade in under 5 seconds, steel frame construction'),

  ('JWBS-18SFX-3 18" Bandsaw', 'jet-jwbs-18sfx-3',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '18" bandsaw, 3HP, 230V, safety brake stops blade in under 5 seconds, steel frame — more power for heavy resawing'),

  ('JWBS-20-3 20" Bandsaw', 'jet-jwbs-20-3',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '20" floor-standing bandsaw, 3HP, 230V, large cast iron table, precision-balanced wheels for smooth blade tracking'),

  ('JWBS-20-5 20" Bandsaw', 'jet-jwbs-20-5',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '20" floor-standing bandsaw, 5HP, 230V, 16" resaw capacity, 27-1/4" x 20" cast iron table — JET''s most powerful bandsaw'),

  ('G0555 14" 1HP Bandsaw', 'grizzly-g0555',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw, 1HP, two blade speeds (1,500 & 3,200 FPM), 6" resaw capacity, 14"x14" cast iron table — Grizzly''s entry-level 14"'),

  ('G0555XH 14" 1-3/4HP Extreme Resaw Bandsaw', 'grizzly-g0555xh',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" extreme series bandsaw, 1.75HP, 12" resaw capacity without riser kit — taller frame than standard G0555'),

  ('G0513Z 17" 2HP Bandsaw with Resaw Fence', 'grizzly-g0513z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '17" bandsaw, 2HP, 16-1/8" throat, 12-1/8" resaw capacity, cast iron resaw fence and aluminum bar fence included'),

  ('G0513X2 17" 2HP Bandsaw', 'grizzly-g0513x2',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '17" bandsaw, 2HP, cast iron trunnion, 23-5/8"x17-1/4" cast iron table, 12-1/8" cutting height, 5° left/45° right tilt'),

  ('G0513X2BF 17" 2HP Bandsaw with Foot Brake', 'grizzly-g0513x2bf',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '17" extreme series bandsaw, 2HP, cast iron trunnion, foot brake — adds quick-stop safety to the G0513X2 platform'),

  ('G0514X 19" 3HP Extreme Series Bandsaw', 'grizzly-g0514x',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '19" extreme series bandsaw, 3HP, cast iron wheels, double-row ball-bearing blade guides, rack-and-pinion table tilt, resaw fence'),

  ('PWBS-14CS 14" Bandsaw', 'powermatic-pwbs-14cs',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Entry-level Powermatic 14" bandsaw. 1.5HP, 115/230V, cast iron construction, precision blade guidance. Starting at $1,979'),

  ('PM1500 15" Bandsaw', 'powermatic-pm1500',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '15" cabinet bandsaw with 3HP motor, 230V, cast iron construction and precision blade guidance. Starting at $4,179'),

  ('PM1500T 15" Bandsaw', 'powermatic-pm1500t',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'ArmorGlide 15" bandsaw — same 3HP 230V platform as PM1500 with low-friction corrosion-resistant table coating. Starting at $4,729'),

  ('PM1800B 18" Bandsaw', 'powermatic-pm1800b',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '18" cabinet bandsaw with 5HP motor, 230V or 230/460V 3ph, cast iron construction. Starting at $7,776'),

  ('PM1800BT 18" Bandsaw', 'powermatic-pm1800bt',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'ArmorGlide 18" bandsaw — 5HP, 230V or 230/460V 3ph, with low-friction corrosion-resistant table coating. Starting at $8,359'),

  ('PM2013B 20" Bandsaw', 'powermatic-pm2013b',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '20" cabinet bandsaw with 5HP motor, 230V or 230/460V 3ph, cast iron construction and precision blade guidance. Starting at $8,469'),

  ('PM2013BT 20" Bandsaw', 'powermatic-pm2013bt',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'ArmorGlide 20" bandsaw — 5HP, 230V or 230/460V 3ph, with low-friction corrosion-resistant table coating. Starting at $9,129'),

  ('PM2415B 24" Bandsaw', 'powermatic-pm2415b',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '24" industrial cabinet bandsaw with 5HP motor, 230V or 230/460V 3ph. Powermatic''s largest bandsaw. Starting at $9,151'),

  ('PM2415BT 24" Bandsaw', 'powermatic-pm2415bt',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'ArmorGlide 24" bandsaw — 5HP, 230V or 230/460V 3ph, with low-friction corrosion-resistant table coating. Starting at $9,899'),

  ('WEN 3962 10" Bandsaw', 'wen-3962-bandsaw',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'Entry-level 10" bandsaw with fence, miter gauge, and work light'),

  ('28-400 14" Bandsaw', 'delta-28-400',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with 6" resaw height and quick-release blade tension'),

  ('AMBASSADOR C14 Pro Bandsaw', 'harvey-ambassador-c14-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" bandsaw with 13.5" resaw capacity, carbide-tipped guides, 1.5HP motor, and cast iron table — Harvey entry-level Pro series'),

  ('ALPHA HW615 Pro Bandsaw', 'harvey-alpha-hw615-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '15" bandsaw with 14" resaw capacity, ceramic blade guides, 2HP motor, and precision-ground cast iron table'),

  ('ALPHA A-15 Bandsaw', 'harvey-alpha-a15',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '15" bandsaw with 14" resaw capacity, 2HP motor, European-style blade guides, and large cast iron table — Harvey flagship 15" bandsaw');

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

  ('Model 209 20" Planer', 'powermatic-209',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='planers'),
   '20" thickness planer with straight knife cutterhead, 5HP, 230V (1ph or 3ph). Powermatic''s entry into the 20" class. Starting at $5,169'),

  ('209BHH 20" Helical Planer', 'powermatic-209bhh',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='planers'),
   '20" thickness planer with helical carbide insert cutterhead, 5HP, 230V (1ph or 3ph 230/460V). Superior surface finish over straight knife. Starting at $6,299'),

  ('G0453Z 15" 3HP Planer with Spiral Cutterhead', 'grizzly-g0453z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='planers'),
   '15" planer, 3HP, 4-row spiral cutterhead with 74 indexable carbide inserts, 4,800 RPM, up to 1/8" per pass'),

  ('G0453ZX 15" 3.7HP Planer with Spiral Cutterhead', 'grizzly-g0453zx',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='planers'),
   '15" planer, 3.7HP, 4-row spiral cutterhead with 74 indexable carbide inserts, 4,800 RPM — more powerful than G0453Z'),

  ('G1033Z 20" 5HP Planer', 'grizzly-g1033z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='planers'),
   '20" planer, 5HP, 4 HSS straight knives, triple v-belt drive — Grizzly''s 20" straight-knife production planer'),

  ('G0454Z 20" 5HP Planer with Spiral Cutterhead', 'grizzly-g0454z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='planers'),
   '20" planer, 5HP, 4-row spiral cutterhead with 98 indexable carbide inserts, 4,800 RPM — premium finish with helical head'),

  ('R4331 13" Planer', 'ridgid-r4331',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='planers'),
   '13" thickness planer with three-knife cutter head and dust port'),

  ('PX|12 Planer', 'laguna-px12',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='planers'),
   '12" benchtop thickness planer with Sheartec helical carbide insert cutterhead and 2HP motor'),

  ('PX|16 Planer', 'laguna-px16',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='planers'),
   '16" thickness planer with Sheartec helical carbide insert cutterhead, 3HP motor, and digital readout'),

  ('PX|20 Planer', 'laguna-px20',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='planers'),
   '20" industrial thickness planer with Sheartec helical carbide insert cutterhead and 5HP motor'),

  ('PX|22 Planer', 'laguna-px22',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='planers'),
   '22" wide-body industrial planer with Sheartec helical carbide insert cutterhead and 7.5HP motor');

-- ─── JOINTERS ────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('54A 6" Jointer', 'powermatic-54a',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with straight knife cutterhead, 1HP, 115/230V. Starting at $2,199'),

  ('54HH 6" Helical Jointer', 'powermatic-54hh',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with helical carbide insert cutterhead, 1HP, 115/230V. Starting at $2,199'),

  ('60C 8" Jointer', 'powermatic-60c',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '8" jointer with straight knife cutterhead, 2HP, 230V. Starting at $3,343'),

  ('60HH 8" Helical Jointer', 'powermatic-60hh',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '8" jointer with helical carbide insert cutterhead, 2HP, 230V. Starting at $2,999'),

  ('PJ882 8" Parallelogram Jointer', 'powermatic-pj882',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '8" parallelogram jointer with straight knife cutterhead, 2HP, 230V. Starting at $4,509'),

  ('PJ882T 8" Parallelogram Jointer', 'powermatic-pj882t',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   'ArmorGlide 8" parallelogram jointer with straight knife cutterhead, 2HP, 230V. Starting at $5,169'),

  ('PJ-882HH 8" Parallelogram Helical Jointer', 'powermatic-pj882hh',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '8" parallelogram jointer with helical carbide insert cutterhead, 2HP, 230V. Starting at $4,499'),

  ('PJ-882HHT 8" Parallelogram Helical Jointer', 'powermatic-pj882hht',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   'ArmorGlide 8" parallelogram jointer with helical carbide insert cutterhead, 2HP, 230V. Starting at $4,699'),

  ('1285 12" Parallelogram Jointer', 'powermatic-1285',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '12" parallelogram jointer, 3HP, 230V (1ph or 3ph). Available with straight knife or helical carbide insert cutterhead. Starting at $8,579'),

  ('1285T 12" Parallelogram Jointer', 'powermatic-1285t',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   'ArmorGlide 12" parallelogram jointer, 3HP, 230V (1ph or 3ph 230/460V). Available with straight knife or helical cutterhead. Starting at $6,999'),

  ('PJ1696 16" Parallelogram Jointer', 'powermatic-pj1696',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '16" parallelogram jointer with helical carbide insert cutterhead, 7.5HP, 230/460V 3ph. Starting at $9,999'),

  ('PJ1696T 16" Parallelogram Jointer', 'powermatic-pj1696t',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='jointers'),
   'ArmorGlide 16" parallelogram jointer with helical carbide insert cutterhead, 7.5HP, 230/460V 3ph. Starting at $11,999'),

  ('JJ-6HHDX 6" Jointer', 'jet-jj-6hhdx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with helical cutter head and quick-set fence'),

  ('G0814 6" Jointer with Cabinet Stand', 'grizzly-g0814',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6"x48" jointer with cabinet stand, precision-ground cast iron tables on dovetail ways, stops at 45°/90°/135°'),

  ('G1182 6" Heavy-Duty Jointer', 'grizzly-g1182',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" heavy-duty jointer with 1.5HP motor, 3-knife cutterhead — robust construction for shop use'),

  ('G0490X 8" Jointer', 'grizzly-g0490x',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '8"x76" parallelogram jointer with 4-row spiral cutterhead, 40 indexable carbide inserts, 3HP'),

  ('37-071 6" Jointer', 'delta-37-071',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with parallelogram table design and rabbeting ledge'),

  ('20-100 6" Jointer', 'rikon-20-100',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with long cast iron tables, rabbeting ledge, and 1HP motor. Straight knife head; helical upgrade available as 20-600HSP'),

  ('JJP-10BTOS Planer/Jointer', 'jet-jjp-10btos',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '10" combination jointer/planer with over/under design, saves shop space'),

  ('JX|6 Quadtec: II Jointer', 'laguna-jx6-quadtec-ii',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" jointer with Quadtec four-sided insert carbide cutterhead, 1.5HP motor, and parallelogram table adjustment'),

  ('JX|8 Quadtec: II Jointer', 'laguna-jx8-quadtec-ii',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '8" jointer with Quadtec four-sided insert carbide cutterhead, 2HP motor, and long cast iron tables'),

  ('JX|8 Sheartec: II Jointer', 'laguna-jx8-sheartec-ii',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '8" jointer with Sheartec II helical spiral cutterhead, 2HP motor, and parallelogram table for premium surface finish'),

  ('JX|12 Sheartec: II Jointer', 'laguna-jx12-sheartec-ii',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '12" wide jointer with Sheartec II helical spiral cutterhead, 3HP motor, and long cast iron tables for wide stock');

-- ─── DRILL PRESSES ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('JWDP-12 12" Benchtop Drill Press', 'jet-jwdp-12',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '12" benchtop drill press, 1/2HP, 115V, variable speed — compact with cast iron table and adjustable depth stop'),

  ('JDP-15B 15" Benchtop Drill Press', 'jet-jdp-15b',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '15" benchtop drill press, 3/4HP, 115V, 16-speed poly-V belt, 210–3,500 RPM, 3-1/8" spindle travel, 12-1/2"x17" cast iron table'),

  ('JDP-17 17" Floor Drill Press', 'jet-jdp-17',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '17" floor drill press, 3/4HP, 115V, 16-speed, 210–3,580 RPM — workhorse floor model with large cast iron table'),

  ('JDP-17MF 17" Floor Drill Press', 'jet-jdp-17mf',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '17" floor drill press, 3/4HP, 115/230V, 16-speed, 200–3,630 RPM — dual-voltage with mortising fence capability'),

  ('JDP-20MF 20" Floor Drill Press', 'jet-jdp-20mf',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '20" floor drill press, 1.5HP, 115/230V, 12-speed, 150–4,200 RPM, MT-3 spindle, 3/4" chuck — heavy-duty floor model'),

  ('JDP-20S 20" Smart Drill Press', 'jet-jdp-20s',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '20" smart drill press, 1.5HP, 115/230V, variable speed, 6" spindle travel — JET''s first smart drill press with digital controls and programmable settings');

-- ─── PLANER/JOINTER COMBOS ───────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('JJP-8BT 8" Benchtop Jointer/Planer Combo', 'jet-jjp-8bt',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='planer-jointer-combos'),
   '8" benchtop jointer/planer combo, 13A, 120V, straight knife cutterhead at 18,000 cuts/min, 19.5 FPM feed rate — quick-change between modes'),

  ('JJP-10BTOS 10" Jointer/Planer Combo with Stand', 'jet-jjp-10btos',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='planer-jointer-combos'),
   '10" jointer/planer combo with steel stand, 13A, 120V, 9,000 RPM cutterhead — larger capacity with quick-changeover between jointing and planing'),

  ('JPJ-12B 12" Planer/Jointer', 'jet-jpj-12b',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='planer-jointer-combos'),
   '12" planer/jointer combo, 3HP, 230V, straight knife cutterhead — large aluminum extruded fence, integrated dust chute handles both modes'),

  ('JPJ-12BHH 12" Planer/Jointer with Helical Head', 'jet-jpj-12bhh',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='planer-jointer-combos'),
   '12" planer/jointer combo, 3HP, 230V, 42-insert helical carbide cutterhead — quieter, smoother finish than straight knives with indexable carbide inserts');

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

  ('ETS EC 150/3 EQ Random Orbit Sander', 'festool-ets-ec-150',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '6" brushless EC motor random orbit sander — quieter and more efficient than brushed models, 3mm orbit for fine finishing'),

  ('RO 90 DX Detail Sander', 'festool-ro90-dx',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'Multi-mode 90mm delta/random orbit detail sander — switches between random orbit and delta pad for tight corners and detail work'),

  ('LS 130 EQ Linear Sander', 'festool-ls130',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '130mm linear/stroke sander for finishing flat surfaces with the grain — ideal for final passes before finish application'),

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
   '1" x 30" belt and 5" disc combination sander with cast iron table'),

  ('19/38 Drum Sander', 'supermax-19-38',
   (SELECT id FROM brands WHERE slug='supermax'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '19" open-end drum sander — sand 19" in a single pass or up to 38" by flipping the workpiece. Variable speed conveyor feed, 1.5HP'),

  ('25/50 Drum Sander with Closed Stand', 'supermax-25-50-closed-stand',
   (SELECT id FROM brands WHERE slug='supermax'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '25" open-end drum sander — sand 25" in a single pass or up to 50" by flipping. Variable speed conveyor, 3HP motor, enclosed stand with storage'),

  ('JWDS-1632 16" Drum Sander with Stand', 'jet-jwds-1632',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '16" drum sander — sand 16" single pass or 32" double pass. Variable speed conveyor up to 10 ft/min, toolless parallelism adjustment, Sandsmart load monitoring'),

  ('JWDS-1836 18" Drum Sander with Stand', 'jet-jwds-1836',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '18" drum sander — sand 18" single pass or 36" double pass. 1.75HP, 1,720 RPM, 5" drum diameter, variable speed conveyor, Sandsmart overload protection'),

  ('JWDS-2244 22" Drum Sander with Stand', 'jet-jwds-2244',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '22" drum sander — sand 22" single pass or 44" double pass. 1.75HP, 1,725 RPM, variable speed conveyor, Sandsmart load monitoring, mirrored dust hood'),

  ('JWDS-2244OSC 22" Oscillating Drum Sander', 'jet-jwds-2244osc',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '22" oscillating drum sander with closed stand — oscillation eliminates drum marks. 1.75HP, sands up to 44" double pass, Sandsmart overload protection'),

  ('JWDS-2550 25" Drum Sander with Stand', 'jet-jwds-2550',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '25" drum sander — sand 25" single pass or 50" double pass. 1.75HP, variable speed conveyor, Sandsmart load monitoring — largest in the JWDS line');

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
  ('JWL-1015VS 10" Variable Speed Lathe', 'jet-jwl-1015vs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '10"x15" mini variable speed lathe, 1/2HP, 115V — compact benchtop model for small projects and beginners'),

  ('JWL-1221VS 12" Variable Speed Lathe', 'jet-jwl-1221vs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12"x21" variable speed lathe, 1HP, 115V — midi lathe with electronic speed control and reversible motor'),

  ('JWL-1236 12" Wood Lathe with Stand', 'jet-jwl-1236',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12"x34-1/2" wood lathe with stand, 3/4HP, 115/230V — longer bed for spindle work with 4-speed step pulley'),

  ('JWL-1440VS 14" Variable Speed Lathe', 'jet-jwl-1440vs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '14"x40" variable speed lathe, 1HP, 115/230V, 400–3,000 RPM — versatile mid-size lathe for spindles and bowls'),

  ('JWL-1640EVS 16" EVS Lathe', 'jet-jwl-1640evs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '16"x40" electronic variable speed lathe, 1.5HP, 115V, 40–3,200 RPM — cast iron headstock, reversible spindle'),

  ('JWL-1840EVS 18" EVS Lathe', 'jet-jwl-1840evs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '18"x40" electronic variable speed lathe, 2HP, 40–3,200 RPM — large swing for bowl turning with digital RPM readout'),

  ('JWL-1642-2EVS 16" EVS Pro Lathe', 'jet-jwl-1642-2evs',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '16"x42" EVS Pro lathe, 2HP, sliding headstock for outboard turning — JET''s most capable production lathe'),

  ('Comet II Variable Speed Lathe', 'nova-comet-ii',
   (SELECT id FROM brands WHERE slug='nova'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12"x16" mini lathe with 4-speed pulley system and Nova chuck compatibility'),

  ('Revo 10|14 Lathe', 'laguna-revo-1014',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '10"x14" variable speed mini lathe with electronic speed control, 1HP motor, and cast iron construction'),

  ('Revo 12|16 Lathe', 'laguna-revo-1216',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12"x16" variable speed midi lathe with electronic speed control, 1HP motor, and indexing head'),

  ('Revo 15|24 Lathe', 'laguna-revo-1524',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '15"x24" variable speed lathe with 1.5HP motor, outboard turning capability, and cast iron bed'),

  ('Revo 18|36 110V Lathe', 'laguna-revo-1836-110v',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '18"x36" variable speed lathe with 2HP motor, outboard turning, and electronic speed control — runs on standard 110V'),

  ('Revo 18|36 220V Lathe', 'laguna-revo-1836-220v',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '18"x36" variable speed lathe with 2HP motor, outboard turning, and electronic speed control — 220V for full power'),

  ('Revo 24|36 220V Lathe', 'laguna-revo-2436-220v',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '24"x36" variable speed lathe with 3HP motor, outboard turning capability, and heavy cast iron construction — 220V'),

  ('PM2014B 14"x20" Benchtop Lathe', 'powermatic-pm2014b-benchtop',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '14"x20" variable speed benchtop lathe with digital RPM readout. Starting at $2,449'),

  ('PM2014B 14"x20" Lathe with Stand', 'powermatic-pm2014b-stand',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '14"x20" variable speed lathe with stand and digital RPM readout. Starting at $2,849'),

  ('2020B 20"x20" Lathe', 'powermatic-2020b',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '20"x20" wood lathe, 2HP, 220V 1ph, variable speed with digital RPM readout and outboard turning capability. Starting at $5,939'),

  ('3520C 20"x35" Lathe', 'powermatic-3520c',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '20"x35" wood lathe, 2HP, 220V 1ph, variable speed with digital RPM readout — Powermatic''s iconic mid-size lathe. Starting at $5,999'),

  ('4224B 24"x42" Lathe', 'powermatic-4224b',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '24"x42" EVS wood lathe, 3HP, 220V 1ph — Powermatic''s largest lathe with electronic variable speed and outboard turning. Starting at $8,799'),

  ('LA3424 14" x 20" Lathe', 'wen-la3424',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='lathes'),
   'Variable speed lathe with 5-speed electronic control and 3/4HP motor'),

  ('70-105 10" Mini Lathe', 'rikon-70-105',
   (SELECT id FROM brands WHERE slug='rikon'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '10"x18" mini lathe with 5-speed pulley system, cast iron construction, and 1/2HP motor'),

  ('46-460 12" Variable Speed Lathe', 'delta-46-460',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12.5"x20" variable speed lathe with digital RPM display, 1HP motor'),

  ('TURBO T-40 Lathe', 'harvey-turbo-t40',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '16"x40" variable speed lathe with 2HP motor, digital RPM readout, outboard turning, and cast iron construction'),

  ('TURBO T-60S Lathe', 'harvey-turbo-t60s',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '20"x60" variable speed lathe with 3HP motor, digital RPM readout, sliding headstock, outboard turning — Harvey flagship lathe');

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

-- ─── MITER SAWS ──────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('JMS-10SCMS 10" Sliding Dual-Bevel Compound Miter Saw', 'jet-jms-10scms',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '10" sliding dual-bevel compound miter saw, 15A, 4800 RPM, Green XACTA Laser, detent stops at 0/15/22.5/31.6/45° left and right'),

  ('JMS-12SCMS 12" Sliding Dual-Bevel Compound Miter Saw', 'jet-jms-12scms',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" sliding dual-bevel compound miter saw, 15A, laser guide, quick cam miter lock with 10 positive stops'),

  ('JMS-10X 10" Sliding Dual-Bevel Compound Miter Saw', 'jet-jms-10x',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '10" sliding dual-bevel compound miter saw, 15A, 115V, updated enclosed linear bearings for smooth slide operation, crosscut capacity 10" x 4"'),

  ('JMS-12X 12" Sliding Dual-Bevel Compound Miter Saw', 'jet-jms-12x',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" sliding dual-bevel compound miter saw, 15A, 115V, red laser guide, crosscut capacity 14" x 4", adjustable fence with extensions');

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
   'Precision marking gauge with micro-adjust and hardened steel pins'),

  -- Jorgensen Hand Planes — ductile iron body, 3.0mm O1 steel blade
  ('No. 101 Mini Block Plane', 'jorgensen-no101',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Compact mini block plane, ductile iron body, 3.0mm O1 steel blade — palm-sized for trimming, chamfering, and small surface work'),

  ('No. 60-1/2 Low Angle Block Plane', 'jorgensen-no60half',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Low angle block plane, 6.3" sole, 1-3/8" O1 steel blade, adjustable mouth, ductile iron body — excels at end grain and fine trimming'),

  ('No. 4 Smooth Plane', 'jorgensen-no4',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Bench smooth plane, ductile iron body, 3.0mm O1 steel blade — workhorse smoothing plane for final surface prep before finish'),

  ('No. 5 Jack Plane', 'jorgensen-no5',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Bench jack plane, ductile iron body, 3.0mm O1 steel blade — versatile stock-removal plane for rough dimensioning and flattening'),

  -- Jorgensen Chisels — chromium alloy steel, HRC 60–64, hardwood handle with metal ferrule
  ('3-Piece Woodworking Chisel Set', 'jorgensen-chisels-3pc',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Chromium alloy steel chisels, HRC 60–64, hardwood handle with metal ferrule — 1/2", 3/4", 1" sizes. Electrophoresis coating resists corrosion'),

  ('4-Piece Woodworking Chisel Set', 'jorgensen-chisels-4pc',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Chromium alloy steel chisels, HRC 60–64, beveled edge, hardwood handle with metal ferrule — 1/4", 1/2", 3/4", 1" sizes'),

  ('4-Piece Expansion Chisel Set', 'jorgensen-chisels-4pc-expansion',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Chromium alloy steel chisels in wider sizes — 3/8", 5/8", 1-1/4", 1-1/2". Pairs with standard 4-piece set for a complete 8-size collection'),

  ('Chisel Knife', 'jorgensen-chisel-knife',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Full-tang marking/chisel knife, extra-thick high-carbon steel blade, impact-resistant handle — for precise layout lines and light paring');

-- ─── DUST COLLECTION ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('CT 26 E Dust Extractor', 'festool-ct26',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'HEPA-class dust extractor with auto-start and 6.9-gallon capacity'),

  ('CT MINI HEPA Dust Extractor', 'festool-ct-mini-hepa',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Compact HEPA dust extractor, 15L, class L/M/H, 110 CFM, Bluetooth auto-start — Festool''s smallest extractor, ideal for job site use'),

  ('CT MIDI I HEPA Dust Extractor', 'festool-ct-midi-hepa',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Mid-size HEPA dust extractor, 350–1,200W, 130 CFM, 96" static water lift — balances capacity and portability for shop or site'),

  ('CT 26 E Dust Extractor', 'festool-ct26',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'HEPA-class dust extractor with auto-start and 6.9-gallon capacity'),

  ('CT 36 AC Dust Extractor', 'festool-ct36',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'HEPA dust extractor with Bluetooth antistatic hose and 9.5-gallon tank'),

  ('CT 48 AC Dust Extractor', 'festool-ct48',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Large HEPA dust extractor, 12.7-gallon capacity — same platform as CT 26/36 with maximum bag volume for heavy production use'),

  ('CTC MIDI Cordless Dust Extractor', 'festool-ctc-midi',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Cordless HEPA dust extractor, 36V (18V x 2), 109 CFM — most powerful cordless extractor in the CT line for untethered job site work'),

  ('Ultimate Dust Deputy', 'oneida-dust-deputy',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Cyclone separator that removes 99%+ of debris before the shop vac filter'),

  ('DC-1100VX 1.5HP Dust Collector', 'jet-dc-1100vx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1.5HP dust collector with 660 CFM and remote control, 70-gallon drum'),

  ('DC-650 1HP Dust Collector', 'jet-dc-650',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Entry-level 1HP single-stage dust collector, 650 CFM, 115/230V, 30-micron bag filter, 4 casters — compact and quiet for small shops'),

  ('DC-1200VX-CK 2HP Dust Collector', 'jet-dc-1200vx',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '2HP single-stage dust collector with Vortex Cone chip separation, 2-micron canister filter, 230V'),

  ('JCDC-1.5 Cyclone Dust Collector', 'jet-jcdc-1-5',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1.5HP two-stage cyclone dust collector, 115V — compact cyclone with pre-separation keeps fine dust out of the filter'),

  ('JCDC-3 Cyclone Dust Collector', 'jet-jcdc-3',
   (SELECT id FROM brands WHERE slug='jet'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP two-stage cyclone dust collector, 230V, 2-micron filter, 66-gallon drum, RF remote control with auto-shutoff timer up to 8 hours'),

  ('G0562Z 2HP Dust Collector', 'grizzly-g0562z',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '2HP dust collector with canister filter and 1,280 CFM, mobile base included'),

  ('G0562ZP 3HP Double Canister Dust Collector', 'grizzly-g0562zp',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP double canister dust collector, Polar Bear series, aluminum impeller — upgraded airflow and filter area over G0562Z'),

  ('PM1300TX TurboCone Dust Collector', 'powermatic-pm1300tx',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'TurboCone 1-3/4HP dust collector, 115/230V, 1,300 CFM. Available with 30-micron bag or 2-micron canister filter. Starting at $1,099'),

  ('PM1900TX TurboCone Dust Collector', 'powermatic-pm1900tx',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'TurboCone 3HP dust collector, 230V or 230/460V 3ph, 1,891 CFM. Available with 30-micron bag or 2-micron canister filter. Starting at $1,836'),

  ('PM2200HK Cyclone Dust Collector', 'powermatic-pm2200hk',
   (SELECT id FROM brands WHERE slug='powermatic'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Cyclone dust collector with 1-micron HEPA filtration, 3HP, 230V 1ph, 1,543 CFM — Powermatic''s top-of-line dust solution. Starting at $4,564'),

  ('A|Flux: 12 Dust Collector', 'laguna-aflux-12',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Portable 1.5HP dust collector with 1,200 CFM, canister filter, and compact footprint for small shops'),

  ('B|Flux Dust Collector', 'laguna-bflux',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1.5HP wall-mount or floor-standing dust collector with cyclone separator and remote control'),

  ('C|Flux: 1 Dust Collector', 'laguna-cflux-1',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1HP cyclone dust collector with 800 CFM, canister filter, and space-saving design for hobbyist shops'),

  ('C|Flux: 2 Dust Collector', 'laguna-cflux-2',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '2HP cyclone dust collector with 1,400 CFM and canister filtration for small to mid-size shops'),

  ('C|Flux: 3 Dust Collector', 'laguna-cflux-3',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP cyclone dust collector with 1,850 CFM, remote start, and high-efficiency canister filter'),

  ('D|Flux: 1 Dust Collector', 'laguna-dflux-1',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1HP ducted cyclone dust collector designed for integrated shop duct systems, 800 CFM'),

  ('D|Flux: 3 Dust Collector', 'laguna-dflux-3',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP ducted cyclone dust collector for permanent shop installations, 1,850 CFM and remote control'),

  ('P|Flux: 1 Dust Collector', 'laguna-pflux-1',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1HP portable cyclone dust collector with built-in separator, 800 CFM — entry-level Flux series'),

  ('P|Flux: 2 Dust Collector', 'laguna-pflux-2',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '2HP portable cyclone dust collector with 1,400 CFM and remote start capability'),

  ('P|Flux: 3 Dust Collector', 'laguna-pflux-3',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP portable cyclone dust collector with 1,843 CFM, canister filter, and remote start'),

  ('X|Flux: 5 Dust Collector', 'laguna-xflux-5',
   (SELECT id FROM brands WHERE slug='laguna'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '5HP industrial cyclone dust collector with 3,000+ CFM for production shops and multi-machine setups'),

  ('WEN 3401 5-Amp Dust Collector', 'wen-3401',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Budget-friendly 660 CFM collector with 12-gallon bag and 3-micron filter'),

  ('GYRO AIR G-700 Dust Processor', 'harvey-gyro-air-g700',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Gyroscopic cyclone dust processor with 700 CFM, HEPA filtration, and wall-mount design — separates fine dust before it reaches the filter'),

  ('GYRO AIR G-700 Pro Dust Processor', 'harvey-gyro-air-g700-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Upgraded gyroscopic cyclone dust processor with 700 CFM, HEPA filtration, remote start, and enhanced motor for continuous operation'),

  ('GYRO AIR G-800 Pro Dust Processor', 'harvey-gyro-air-g800-pro',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Gyroscopic cyclone dust processor with 800 CFM, HEPA filtration, remote start, and high-capacity drum for larger shops'),

  ('GYRO AIR G-1000 Dust Processor', 'harvey-gyro-air-g1000',
   (SELECT id FROM brands WHERE slug='harvey'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'High-capacity gyroscopic cyclone dust processor with 1,000 CFM, HEPA filtration, and industrial-grade motor — Harvey flagship dust processor');

-- ─── CLAMPS ──────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  -- K Body KRE (REVOlution) Parallel Clamps — 1,700 lbs force, 3-3/4" throat, reversible jaw
  ('KRE3512 K Body KRE 12" Parallel Clamp', 'bessey-kre3512',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'K Body REVOlution parallel clamp, 12" capacity, 1,700 lbs clamping force, 3-3/4" throat, 2K composite handle, reversible to spreader'),

  ('KRE3518 K Body KRE 18" Parallel Clamp', 'bessey-kre3518',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'K Body REVOlution parallel clamp, 18" capacity, 1,700 lbs clamping force, 3-3/4" throat, 2K composite handle, reversible to spreader'),

  ('KRE3524 K Body KRE 24" Parallel Clamp', 'bessey-kre3524',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'K Body REVOlution parallel clamp, 24" capacity, 1,700 lbs clamping force, 3-3/4" throat, 2K composite handle, reversible to spreader'),

  ('KRE3531 K Body KRE 31" Parallel Clamp', 'bessey-kre3531',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'K Body REVOlution parallel clamp, 31" capacity, 1,500 lbs clamping force, 3-3/4" throat, 2K composite handle, reversible to spreader'),

  ('KRE3540 K Body KRE 40" Parallel Clamp', 'bessey-kre3540',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'K Body REVOlution parallel clamp, 40" capacity, 1,700 lbs clamping force, 3-3/4" throat — wide glue-up workhorse'),

  ('KRE3550 K Body KRE 50" Parallel Clamp', 'bessey-kre3550',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'K Body REVOlution parallel clamp, 50" capacity, 1,700 lbs clamping force, 3-3/4" throat — for large panels and casework'),

  ('KRE3560 K Body KRE 60" Parallel Clamp', 'bessey-kre3560',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'K Body REVOlution parallel clamp, 60" capacity, 1,700 lbs clamping force, 3-3/4" throat — Bessey''s longest standard KRE'),

  -- GearKlamp GK Series — patented gear mechanism, 450 lbs force, 2-3/8" throat
  ('GK15 GearKlamp 6" Bar Clamp', 'bessey-gk15',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'GearKlamp, 6" capacity, 450 lbs force, 2-3/8" throat — patented enclosed gear mechanism keeps handle outside the work area'),

  ('GK30 GearKlamp 12" Bar Clamp', 'bessey-gk30',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'GearKlamp, 12" capacity, 450 lbs force, 2-3/8" throat — quick-release button with rail-mounted rotating handle for tight spaces'),

  ('GK45 GearKlamp 18" Bar Clamp', 'bessey-gk45',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'GearKlamp, 18" capacity, 450 lbs force, 2-3/8" throat — gear mechanism separates spindle from handle for greater clearance'),

  ('GK60 GearKlamp 24" Bar Clamp', 'bessey-gk60',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'GearKlamp, 24" capacity, 450 lbs force, 2-3/8" throat — largest GearKlamp, dust-sealed gear mechanism for shop use'),

  -- GZ Pivot Handle Clamps — all-steel, 4-3/4" throat, handle folds up to 90°
  ('GZ30-12PH Pivot Handle Clamp 12"', 'bessey-gz30-12ph',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'All-steel pivot handle clamp, 12" capacity, 4-3/4" throat — handle folds up to 90° for clamping in tight or awkward spaces'),

  ('GZ40-12PH Pivot Handle Clamp 16"', 'bessey-gz40-12ph',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'All-steel pivot handle clamp, 16" capacity, 4-3/4" throat — ergonomic swivel handle for rapid force build-up'),

  ('GZ50-12PH Pivot Handle Clamp 20"', 'bessey-gz50-12ph',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'All-steel pivot handle clamp, 20" capacity, 4-3/4" throat — mid-size pivot handle for furniture and joinery work'),

  ('GZ60-12PH Pivot Handle Clamp 24"', 'bessey-gz60-12ph',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'All-steel pivot handle clamp, 24" capacity, 4-3/4" throat — largest GZ pivot handle, ideal for panel and case assembly'),

  -- LC Rapid Action Lever Clamps — vibration-resistant, stays put under power tool use
  ('LC4 Lever Clamp 4"', 'bessey-lc4',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Rapid-action lever clamp, 4" capacity, 400 lbs force — compact all-steel lever clamp, vibration-resistant for welding and power tool work'),

  ('LC8 Lever Clamp 8"', 'bessey-lc8',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Rapid-action lever clamp, 8" capacity — all-steel construction, lever mechanism sets clamping force without turning a screw'),

  ('LC12 Lever Clamp 12"', 'bessey-lc12',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Rapid-action lever clamp, 12" capacity, 1,200 lbs force, 5-1/2" throat — vibration-resistant, ideal where workpieces may shift'),

  ('LC20 Lever Clamp 20"', 'bessey-lc20',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Rapid-action lever clamp, 20" capacity, 1,200 lbs force, 4-3/4" throat — largest standard LC, spans wide assemblies without a screw'),

  -- TGC Enhanced Clutch Style Bar Clamps — 2.5" throat, 700 lbs, 15% stronger casting vs standard clutch clamps
  ('TGC2.512 Clutch Style Bar Clamp 12"', 'bessey-tgc2-512',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Enhanced clutch style bar clamp, 12" capacity, 2.5" throat, 700 lbs — heavier bar stock and heavy-duty ACME screw vs economy GSCC'),

  ('TGC2.524 Clutch Style Bar Clamp 24"', 'bessey-tgc2-524',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Enhanced clutch style bar clamp, 24" capacity, 2.5" throat, 700 lbs — optimized geometry 15% stronger than standard clutch clamps'),

  ('TGC2.530 Clutch Style Bar Clamp 30"', 'bessey-tgc2-530',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Enhanced clutch style bar clamp, 30" capacity, 2.5" throat, 700 lbs — spans wide panels and case assemblies with clutch convenience'),

  ('TGC2.536 Clutch Style Bar Clamp 36"', 'bessey-tgc2-536',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Enhanced clutch style bar clamp, 36" capacity, 2.5" throat, 700 lbs — longest TGC for large case work and wide glue-ups'),

  -- EHKL360 Rotating Trigger Clamps — 360° rotating handle, 300 lbs, 3-1/8" throat
  ('EHKL360-06 Rotating Trigger Clamp 6"', 'bessey-ehkl360-06',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'One-hand trigger clamp, 6" capacity, 300 lbs, 3-1/8" throat — 360° rotating handle with 12-detent positions, fiberglass-reinforced body'),

  ('EHKL360-12 Rotating Trigger Clamp 12"', 'bessey-ehkl360-12',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'One-hand trigger clamp, 12" capacity, 300 lbs, 3-1/8" throat — rotating handle clears adjacent clamps in confined spaces'),

  ('EHKL360-18 Rotating Trigger Clamp 18"', 'bessey-ehkl360-18',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'One-hand trigger clamp, 18" capacity, 300 lbs, 3-1/8" throat — mid-size rotating handle trigger clamp for panel and frame work'),

  ('EHKL360-24 Rotating Trigger Clamp 24"', 'bessey-ehkl360-24',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'One-hand trigger clamp, 24" capacity, 300 lbs, 3-1/8" throat — longest standard EHKL360, handle rotates 180° to clear next clamp'),

  -- Pipe Clamps — fit standard black iron pipe, sold as fixture head only
  ('PC-2 Traditional Style Pipe Clamp Head (1/2")', 'bessey-pc12-2',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Pipe clamp head for 1/2" black iron pipe — traditional style, deep reach design, pairs with any length pipe for unlimited clamping capacity'),

  ('PC-2 Traditional Style Pipe Clamp Head (3/4")', 'bessey-pc34-2',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Pipe clamp head for 3/4" black iron pipe, 2-3/8" throat, 440 lbs — traditional style, industry standard for glue-ups of any width'),

  ('BPC-H12 H-Style Pipe Clamp Head (1/2")', 'bessey-bpc-h12',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'H-style pipe clamp head for 1/2" black iron pipe — extra-high base lifts work off the bench for better clearance during clamping'),

  ('BPC-H34 H-Style Pipe Clamp Head (3/4")', 'bessey-bpc-h34',
   (SELECT id FROM brands WHERE slug='bessey'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'H-style pipe clamp head for 3/4" black iron pipe — extra-high base, wider jaw spacing than traditional style for improved stability'),

  ('3706 Bar Clamp 6-Pack', 'jorgensen-3706',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Classic steel bar clamps with malleable iron heads, 6" capacity, 6-pack'),

  -- E-Z Hold Light Duty — steel rail, composite jaws, 3-3/8" throat, ~150 lbs
  ('E-Z Hold Light Duty 6" Bar Clamp', 'jorgensen-ezhold-light-6',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Light-duty E-Z Hold one-hand bar clamp, 6" capacity, 3-3/8" throat, reversible to spreader — entry-level trigger clamp'),

  ('E-Z Hold Light Duty 12" Bar Clamp', 'jorgensen-ezhold-light-12',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Light-duty E-Z Hold one-hand bar clamp, 12" capacity, 3-3/8" throat, reversible to spreader'),

  ('E-Z Hold Light Duty 18" Bar Clamp', 'jorgensen-ezhold-light-18',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Light-duty E-Z Hold one-hand bar clamp, 18" capacity, 3-3/8" throat, reversible to spreader'),

  -- E-Z Hold Medium Duty (#334XX) — 300 lbs, 3-3/8" throat, 1/4"x3/4" steel rail, expandable/linkable
  ('E-Z Hold Medium Duty 6" Bar Clamp', 'jorgensen-ezhold-med-6',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty E-Z Hold bar clamp (#33406), 6" capacity, 300 lbs, 3-3/8" throat — two clamps link together for 2x opening capacity'),

  ('E-Z Hold Medium Duty 12" Bar Clamp', 'jorgensen-ezhold-med-12',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty E-Z Hold bar clamp (#33412), 12" capacity, 300 lbs, 3-3/8" throat, 1/4"x3/4" steel rail, cushioned pads'),

  ('E-Z Hold Medium Duty 18" Bar Clamp', 'jorgensen-ezhold-med-18',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty E-Z Hold bar clamp (#33418), 18" capacity, 300 lbs, 3-3/8" throat — one-hand operation, reversible to spreader'),

  ('E-Z Hold Medium Duty 24" Bar Clamp', 'jorgensen-ezhold-med-24',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty E-Z Hold bar clamp (#33424), 24" capacity, 300 lbs, 3-3/8" throat — workhorse size for panel and frame assembly'),

  ('E-Z Hold Medium Duty 36" Bar Clamp', 'jorgensen-ezhold-med-36',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty E-Z Hold bar clamp (#33436), 36" capacity, 300 lbs, 3-3/8" throat — longest medium-duty E-Z Hold for wide glue-ups'),

  -- E-Z Hold Heavy Duty (#337XX) — 600 lbs, double the clamping force of medium duty
  ('E-Z Hold Heavy Duty 6" Bar Clamp', 'jorgensen-ezhold-hd-6',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Heavy-duty E-Z Hold bar clamp (#33706), 6" capacity, 600 lbs — double the force of medium duty, same one-hand convenience'),

  ('E-Z Hold Heavy Duty 12" Bar Clamp', 'jorgensen-ezhold-hd-12',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Heavy-duty E-Z Hold bar clamp (#33712), 12" capacity, 600 lbs, reversible to spreader'),

  ('E-Z Hold Heavy Duty 18" Bar Clamp', 'jorgensen-ezhold-hd-18',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Heavy-duty E-Z Hold bar clamp (#33718), 18" capacity, 600 lbs, reversible to spreader'),

  ('E-Z Hold Heavy Duty 24" Bar Clamp', 'jorgensen-ezhold-hd-24',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Heavy-duty E-Z Hold bar clamp (#33724), 24" capacity, 600 lbs — strong enough for hardwood edge glue-ups under load'),

  ('E-Z Hold Heavy Duty 36" Bar Clamp', 'jorgensen-ezhold-hd-36',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Heavy-duty E-Z Hold bar clamp (#33736), 36" capacity, 600 lbs — maximum E-Z Hold force over long span'),

  -- E-Z Hold Platinum (#339XX) — aluminum body, clamping force indicator, 5 sizes
  ('E-Z Hold Platinum 6" Bar Clamp', 'jorgensen-ezhold-plat-6',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Platinum E-Z Hold bar clamp (#33906), 6" capacity, aluminum body with built-in clamping force indicator — premium one-hand trigger clamp'),

  ('E-Z Hold Platinum 12" Bar Clamp', 'jorgensen-ezhold-plat-12',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Platinum E-Z Hold bar clamp (#33912), 12" capacity, aluminum body, force indicator, reversible to spreader'),

  ('E-Z Hold Platinum 18" Bar Clamp', 'jorgensen-ezhold-plat-18',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Platinum E-Z Hold bar clamp (#33918), 18" capacity, aluminum body, force indicator, reversible to spreader'),

  ('E-Z Hold Platinum 24" Bar Clamp', 'jorgensen-ezhold-plat-24',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Platinum E-Z Hold bar clamp (#33924), 24" capacity, aluminum body, force indicator — top-tier E-Z Hold for precision work'),

  ('E-Z Hold Platinum 36" Bar Clamp', 'jorgensen-ezhold-plat-36',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Platinum E-Z Hold bar clamp (#33936), 36" capacity, aluminum body, force indicator — Jorgensen''s flagship trigger clamp'),

  -- Steel F Clamps Light Duty — cast iron heads, multi-disc clutch, 2" throat, 300 lbs
  ('Steel F Clamp Light Duty 6"', 'jorgensen-f-light-6',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Light-duty steel F clamp, 6" capacity, 2" throat, 300 lbs — cast iron heads, multi-disc clutch, high-carbon steel bar'),

  ('Steel F Clamp Light Duty 8"', 'jorgensen-f-light-8',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Light-duty steel F clamp, 8" capacity, 2" throat, 300 lbs — cast iron heads, multi-disc clutch, high-carbon steel bar'),

  ('Steel F Clamp Light Duty 12"', 'jorgensen-f-light-12',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Light-duty steel F clamp, 12" capacity, 2" throat, 300 lbs — cast iron heads, orange powder-coat finish, multi-disc clutch'),

  -- Steel F Clamps Medium Duty — cast iron heads, 80,000 psi high-carbon bar, copper-plated screw
  ('Steel F Clamp Medium Duty 6"', 'jorgensen-f-med-6',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty steel F clamp, 6" capacity, cast iron heads, 80,000 psi high-carbon steel bar, copper-plated screw and swivel'),

  ('Steel F Clamp Medium Duty 12"', 'jorgensen-f-med-12',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty steel F clamp, 12" capacity, cast iron heads, 80,000 psi bar, copper-plated screw — resists weld spatter'),

  ('Steel F Clamp Medium Duty 18"', 'jorgensen-f-med-18',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty steel F clamp, 18" capacity, cast iron heads, 80,000 psi bar, multi-disc clutch holds at any point on rail'),

  ('Steel F Clamp Medium Duty 24"', 'jorgensen-f-med-24',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty steel F clamp, 24" capacity, cast iron heads — traditional workhorse for woodworking and welding applications'),

  ('Steel F Clamp Medium Duty 30"', 'jorgensen-f-med-30',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty steel F clamp, 30" capacity, cast iron heads, 80,000 psi bar — spans wide assemblies'),

  ('Steel F Clamp Medium Duty 36"', 'jorgensen-f-med-36',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Medium-duty steel F clamp, 36" capacity, cast iron heads — longest standard medium-duty F clamp in the Jorgensen line'),

  -- Steel F Clamps Deep Reach — extra throat depth (5", 7", 9") for clamping away from the edge
  ('Steel F Clamp Deep Reach 12"', 'jorgensen-f-deep-12',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Deep-reach steel F clamp, 12" capacity, available in 5", 7", and 9" throat depths — clamps well away from the workpiece edge'),

  ('Steel F Clamp Deep Reach 24"', 'jorgensen-f-deep-24',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Deep-reach steel F clamp, 24" capacity, extra throat depth — ideal for panel work, drawer bottoms, and frame assembly'),

  ('Steel F Clamp Deep Reach 36"', 'jorgensen-f-deep-36',
   (SELECT id FROM brands WHERE slug='jorgensen'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Deep-reach steel F clamp, 36" capacity, extra throat depth — longest deep-reach option for large case and panel clamping'),

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

-- ─── TRACK SAWS ──────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('TS 55 FEQ-F-Plus Track Saw', 'festool-ts55-feq',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   'Corded plunge-cut track saw, 1200W, 55mm max depth, 0–47° bevel, 160mm blade — Festool''s most popular track saw'),

  ('TS 60 KEB-F-Plus Track Saw', 'festool-ts60-keb',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   'Corded plunge-cut track saw, 1600W, 60mm max depth, -1–47° bevel, KickbackStop anti-kickback protection — widest bevel range in the lineup'),

  ('TS 75 EQ-F-Plus Track Saw', 'festool-ts75-eq',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   'Corded plunge-cut track saw, 1600W, 75mm max depth, 210mm blade — for thick material, engineered lumber, and stacked cuts'),

  ('TSC 55 KEB Track Saw', 'festool-tsc55-keb',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   'Cordless plunge-cut track saw, 18V, 55mm max depth, KickbackStop — same cut quality as TS 55 without the cord'),

  ('HKC 55 Track Saw', 'festool-hkc55',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   'Compact cordless track saw, 18V, 55mm max depth — lighter and more maneuverable than TSC 55, ideal for site work');

-- ─── ROUTERS ─────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('OF 1010 EQ Router', 'festool-of1010',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='routers'),
   'Compact plunge router, 720W, accepts 1/4" and 8mm collets — lightweight precision router for edge work and inlays'),

  ('OF 1400 EQ-F-Plus Router', 'festool-of1400-router',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='routers'),
   'Mid-size plunge router, 1400W, accepts 1/4", 1/2", and 8mm collets — through-the-base dust extraction, fine depth adjustment'),

  ('OF 2200 EB-F-Plus Router', 'festool-of2200',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='routers'),
   'Heavy-duty plunge router, 2200W — production-grade power for large profiles, raised panel doors, and deep mortises'),

  ('MFK 700 EQ-Set Edge Router', 'festool-mfk700',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='routers'),
   'Modular trim/edge router, 720W, 6.0A, variable speed, detachable cord — excels at edge profiling, veneers, and laminate trimming');

-- ─── JIGSAWS ─────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('PS 300 EQ Trion Jigsaw', 'festool-ps300',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   'Corded body-grip jigsaw (Trion), 500W, variable speed, 4-orbit pendulum action — compact and balanced for precision cuts'),

  ('PSB 300 EQ Trion Jigsaw', 'festool-psb300',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   'Corded bow-handle jigsaw (Trion), 500W, variable speed, 4-orbit pendulum action — traditional handle for two-handed control'),

  ('PS 420 EBQ Carvex Jigsaw', 'festool-ps420',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   'Corded body-grip jigsaw (Carvex), variable speed, 1,000–3,800 spm, 120mm wood cutting depth, 0–45° bevel — Festool''s premium jigsaw line'),

  ('PSBC 420 HPC Carvex Cordless Jigsaw', 'festool-psbc420',
   (SELECT id FROM brands WHERE slug='festool'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   'Cordless bow-handle jigsaw (Carvex), 18V, 1,000–3,800 spm, 120mm wood depth, 0–45° bevel — full Carvex performance without cord');

-- ─── GRIZZLY LATHES ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('G0462 16"x46" Wood Lathe with DRO', 'grizzly-g0462',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '16"x46" wood lathe, 2HP, digital readout, 600–2,400 RPM — mid-size shop lathe with digital speed display'),

  ('G0733 18"x47" Heavy-Duty Wood Lathe', 'grizzly-g0733',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '18"x47" heavy-duty wood lathe, 2HP, 240V, dual speed range: 100–1,200 RPM / 330–3,200 RPM — Grizzly''s most popular full-size lathe'),

  ('G0766 22"x42" Variable-Speed Wood Lathe', 'grizzly-g0766',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '22"x42" variable-speed wood lathe — large swing for bowl turning, variable speed for fine control at low RPM'),

  ('G0835 24"x24" Bowl-Turning Lathe', 'grizzly-g0835',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '24"x24" bowl-turning wood lathe — massive 24" swing for large bowls and platters, short bed optimized for face-plate turning');

-- ─── GRIZZLY DRILL PRESSES ───────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('G0925 8" Benchtop Drill Press', 'grizzly-g0925',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '8" benchtop drill press, 1/3HP, 5-speed, 740–3,140 RPM — compact entry-level benchtop model'),

  ('G0794 14" Floor Drill Press with Laser and DRO', 'grizzly-g0794',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '14" floor drill press, 3/4HP, 12-speed, 140–3,050 RPM, laser guide and digital readout — feature-rich mid-size floor model'),

  ('G0784 15" Heavy-Duty Floor Drill Press', 'grizzly-g0784',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '15" heavy-duty floor drill press, 2HP, 220V, 12-speed — built for drilling through cast iron and mild steel in production environments'),

  ('G7948 20" Floor Drill Press', 'grizzly-g7948',
   (SELECT id FROM brands WHERE slug='grizzly'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '20" floor drill press, 1.5HP, 12-speed, 180–3,240 RPM, 1-1/4" max drill capacity through cast iron or mild steel');

-- ─── KREG POCKET-HOLE JIGS ───────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Pocket-Hole Jig R3', 'kreg-r3',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Entry-level pocket-hole jig, single-hole guide, works with 1/2"–1-1/2" material — compact and portable, ideal for beginners'),

  ('Pocket-Hole Jig 520PRO', 'kreg-520pro',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Mid-range pocket-hole jig, 3-hole drill guide, 360° rotating handle (VersaGrip), preset material thickness settings for 1/2"–1-1/2" — step up from the K4'),

  ('Pocket-Hole Jig 720PRO', 'kreg-720pro',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Premium pocket-hole jig, Automaxx® dual-action auto-clamping adjusts to exact material thickness (1/2"–1-1/2"), GripMaxx™ anti-slip surface, docking station with material support wings'),

  ('Foreman Pocket-Hole Machine', 'kreg-foreman',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Benchtop pocket-hole machine, motorized single-step drilling and clamping, auto-eject, handles 1/2"–1-1/2" material — production-focused for high-volume joinery'),

  ('Pocket-Hole Jig Micro', 'kreg-micro',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='drills-drivers'),
   'Micro pocket-hole jig for thin stock (1/2"–3/4"), uses 3/32" micro drill bit — designed for face frames, cabinet doors, and lightweight assemblies');

-- ─── KREG CLAMPS ─────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('3" Bench Clamp KBC3', 'kreg-kbc3',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='clamps'),
   '3" bench clamp with Automaxx® self-adjusting jaw — automatically adjusts to material thickness, designed for securing workpieces to the bench or jig'),

  ('6" Bench Clamp KBC6', 'kreg-kbc6',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='clamps'),
   '6" bench clamp with Automaxx® self-adjusting jaw — longer reach for wider panels, works as a standard bench or assembly clamp'),

  ('Right-Angle Clamp KHCRA', 'kreg-khcra',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='clamps'),
   'Right-angle clamp with Automaxx® auto-adjust, holds panels at perfect 90° for pocket-hole assembly — ideal for face frames and cabinet carcasses'),

  ('8" Sliding Clamp KSC8', 'kreg-ksc8',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='clamps'),
   '8" sliding bar clamp with Automaxx® auto-adjust jaw, one-handed operation — quick-action clamping for assembly and glue-ups');

-- ─── KREG MEASURING & LAYOUT ─────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Rip-Cut KMA2400', 'kreg-kma2400',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Circular saw rip guide (Rip-Cut), adjustable 0"–24" from edge, rides along factory edge of sheet goods — cuts consistent rips without a table saw'),

  ('Accu-Cut KMA2700', 'kreg-kma2700',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   '48" circular saw guide track (Accu-Cut), aluminum rail, works with most circular saws — square crosscuts and diagonal cuts on plywood and panels'),

  ('Accu-Cut XL KMA3700', 'kreg-kma3700',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Extended circular saw guide track (Accu-Cut XL), longer rail for full sheet goods, includes square-cut attachment — handles 4×8 sheets in a single pass');

-- ─── KREG JOINERY ────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Shelf Pin Jig KMA3225', 'kreg-kma3225',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Shelf pin drilling jig, 1/4" spacing, self-indexing design — drills perfectly aligned shelf pin holes in cabinet sides without measuring'),

  ('Drawer Slide Jig KHI-SLIDE', 'kreg-khi-slide',
   (SELECT id FROM brands WHERE slug='kreg'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Drawer slide mounting jig, works with all standard undermount and side-mount slides, compatible with face-frame and frameless cabinets — eliminates layout and guesswork');

-- ─── BOSCH TABLE SAWS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('GTS15-10 Jobsite Table Saw', 'bosch-gts15-10',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" jobsite table saw, 15A, 3,800 RPM, 4HP max, 32-1/8" rip capacity, rack-and-pinion fence, Gravity-Rise wheeled stand, 3-9/16" depth of cut — cuts 4× lumber in one pass'),

  ('4100XC-10 Jobsite Table Saw', 'bosch-4100xc-10',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" jobsite table saw, 15A, 4HP max, 29" rip capacity, Gravity-Rise wheeled stand — portable but powerful, established pro jobsite standard');

-- ─── BOSCH MITER SAWS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('GCM12SD Dual-Bevel Glide Miter Saw', 'bosch-gcm12sd',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" dual-bevel sliding compound miter saw, 15A, 4,000 RPM, Axial-Glide™ system (no rear clearance needed), 52°L/60°R miter, 47°L/47°R bevel — Bosch''s flagship corded miter saw'),

  ('GCM18V-12GDCN PROFACTOR Cordless Miter Saw', 'bosch-gcm18v-12gdcn',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" cordless dual-bevel glide miter saw, 18V PROFACTOR, BITURBO Brushless™, Axial-Glide™ system, 3.5" depth × 13.5" crosscut — cordless version of the GCM12SD with full corded performance'),

  ('GCM18V-12SDN PROFACTOR Cordless Miter Saw', 'bosch-gcm18v-12sdn',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" cordless dual-bevel sliding compound miter saw, 18V PROFACTOR, 3.5" depth × 14" crosscut, 5.5" tall fence, shadow LED cut line — sliding rail design for maximum crosscut capacity');

-- ─── BOSCH TRACK SAWS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('GKT13-225L Track Saw', 'bosch-gkt13-225l',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   '6-1/2" corded plunge track saw, 13A, Constant Response circuitry maintains speed under load, -1° to +47° bevel, dust extraction port, 12ft cord — table-saw quality cuts in sheet goods');

-- ─── BOSCH ROUTERS ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('1617EVSPK Combo Router Kit', 'bosch-1617evspk',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='routers'),
   '2.25HP combo router kit, 12A, variable speed, includes fixed base (RA1161) and plunge base (RA1166), 1/4" and 1/2" collets, Constant Response circuitry — the most popular router combo kit in woodworking'),

  ('MRC23EVSK Modular Router Kit', 'bosch-mrc23evsk',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='routers'),
   '2.3HP modular router kit, 15A, variable speed, includes fixed and plunge base, Afterlock microfine depth adjustment, 1-5/8" continuous depth range — Bosch''s most powerful router system'),

  ('PR20EVS Colt Trim Router', 'bosch-pr20evs',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='routers'),
   '1.0HP palm trim router, 5.6A, variable speed, soft start, Constant Response, 1/4" collet — compact and lightweight for edge profiling, pattern routing, and laminate trimming');

-- ─── BOSCH JIGSAWS ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('JS572EBK Barrel-Grip Jigsaw Kit', 'bosch-js572ebk',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   '7.2A barrel-grip jigsaw, Constant Response circuitry, aluminum gearbox, counterbalancing mechanism for low vibration, soft-grip front area — barrel grip favored for visibility and maneuverability'),

  ('JS470E Top-Handle Jigsaw', 'bosch-js470e',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   '7.0A top-handle jigsaw, variable speed, ideal for curve cutting and general-purpose woodworking — traditional grip for two-handed control on larger cuts'),

  ('JS365 Top-Handle Jigsaw', 'bosch-js365',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   '6.5A top-handle jigsaw, variable speed, precision plunge for low vibration, tool-free T-shank blade change — entry-level corded jigsaw with core Bosch features');

-- ─── BOSCH SANDERS ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('ROS20VSK 5" Random Orbit Sander', 'bosch-ros20vsk',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '5" random orbit sander, 2.5A, 7,500–12,000 OPM variable speed, integral pad-dampening brake to eliminate swirl marks, hook-and-loop pad — compact palm sander for finish work'),

  ('ROS65VC-5 5" Random Orbit Sander', 'bosch-ros65vc-5',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '5" random orbit sander, 3.3A, 5,500–12,000 OPM variable speed, exclusive Vibration Control suspension system, pad-dampening brake — rear-handle ergonomics for extended sanding sessions'),

  ('GSS20-40 1/4-Sheet Finishing Sander', 'bosch-gss20-40',
   (SELECT id FROM brands WHERE slug='bosch'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '1/4-sheet orbital finishing sander, 2.0A, 12,000 OPM, through-the-pad dust collection, microfilter canister — preferred finishing sander for detail and flat-panel work');

-- ─── DELTA TABLE SAWS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('36-6013 10 in. Portable Job Site Table Saw', 'delta-36-6013',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" portable jobsite table saw, 15A, rack-and-pinion fence, 24-1/2" rip capacity — Delta''s entry-level portable saw for the jobsite or small shop'),

  ('36-725T2 15-Amp 10 in. Table Saw', 'delta-36-725t2',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" contractor table saw, 1.75HP, 15A, 3,450 RPM, 30" right rip capacity, T-square 3-point locking fence, cast iron 27"×20" table, steel extension wing — best-selling Delta stationary table saw'),

  ('36-5100T2 10 in. Contractor Table Saw', 'delta-36-5100t2',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" contractor table saw, 2HP induction motor, 50" rip capacity option, cast iron table and wings, T-square fence — heavy-duty step up from the 36-725T2 for serious shop use'),

  ('36-L336 3-HP UNISAW® with 36 in. BIESEMEYER® Fence', 'delta-36-l336',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" left-tilt cabinet table saw (UNISAW®), 3HP, 240V, 36" BIESEMEYER® T-square fence, cast iron table and wings, enclosed cabinet base — Delta''s iconic professional cabinet saw'),

  ('36-L552 5-HP UNISAW® with 52 in. BIESEMEYER® Fence', 'delta-36-l552',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" left-tilt cabinet table saw (UNISAW®), 5HP, 240V, 52" BIESEMEYER® T-square fence, cast iron table and wings, enclosed cabinet base — top-of-line UNISAW for production cabinet shops');

-- ─── DELTA MITER SAWS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('26-2310 10 in. Dual Bevel Sliding Cruzer Miter Saw', 'delta-26-2310',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '10" dual bevel sliding compound miter saw (Cruzer), 15A, blade brake, 50°L/60°R miter with 10 detents, 45°L/R bevel, 16" crosscut capacity — Delta''s compact sliding miter saw'),

  ('26-2312 12 in. Dual Bevel Sliding Cruzer Miter Saw', 'delta-26-2312',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" dual bevel sliding compound miter saw (Cruzer), 15A, blade brake, 50°L/60°R miter, 47°L/R bevel with 7 positive stops, industry-best 18" crosscut capacity — largest cuts in Delta''s miter saw lineup');

-- ─── DELTA BAND SAWS ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('28-400 14 in. 1-HP Steel Frame Bandsaw', 'delta-28-400',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '14" steel frame bandsaw, 1HP dual-voltage (120V/240V) TEFC motor, two speeds (1,620/3,340 FPM), 15-3/4"×18-7/8" cast iron table, 6" max cut thickness, 93-1/2" blade — classic Delta 14" shop bandsaw');

-- ─── DELTA JOINTERS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('37-071 6 in. Midi-Bench Jointer', 'delta-37-071',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6" benchtop jointer, cast iron table, 3-knife cutterhead, rabbeting capacity, fence tilts 45°–90° — compact but capable bench jointer for the home shop');

-- ─── DELTA PLANERS ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('22-555 13 in. Portable Thickness Planer', 'delta-22-555',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='planers'),
   '13" portable thickness planer, two-speed feed, three-knife cutterhead, 1/32" depth-of-cut scale, infeed/outfeed tables included — entry-level Delta planer for the small shop'),

  ('22-590X 13 in. Portable Planer', 'delta-22-590x',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='planers'),
   '13" portable thickness planer, 15A, three-knife cutterhead, 1/8" max cut at 96 FPM or 1/16" at 26 FPM two-speed feed, fan-assisted chip ejection — upgraded version with better chip clearing');

-- ─── DELTA LATHES ────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('46-460 12-1/2 in. Variable Speed MIDI-LATHE®', 'delta-46-460',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '12-1/2" variable speed midi lathe (MIDI-LATHE®), 1HP, 250–4,000 RPM electronic variable speed, 16-1/2" between centers, optional bed extension, MT2 headstock/tailstock — Delta''s iconic midi lathe');

-- ─── DELTA DRILL PRESSES ─────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('18-900L 18 in. Laser Drill Press', 'delta-18-900l',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '18" floor drill press, 3/4HP, 16-speed (170–3,000 RPM), 20"×14" cast iron table, 6" quill stroke, cross-hair laser guide — Delta''s premium floor drill press with laser positioning');

-- ─── DELTA SCROLL SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('40-694 20 in. Variable Speed Scroll Saw', 'delta-40-694',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='scroll-saws'),
   '20" variable speed scroll saw, 1.3A, 500–1,750 SPM, accepts pin-end and plain-end blades, tool-free blade change, 45° tilting table — Delta''s full-size scroll saw for fretwork and intricate cuts');

-- ─── DELTA DUST COLLECTION ───────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('50-767 1-1/2 HP Dust Collector', 'delta-50-767',
   (SELECT id FROM brands WHERE slug='delta'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1.5HP TEFC induction motor dust collector, 2-micron filtration bags with sewn-in bag rings, two 4" intake ports, large 8" wheels — single-stage shop dust collector for small to mid-size shops');

-- ─── DEWALT TABLE SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DWE7485 8-1/4 in. Compact Jobsite Table Saw', 'dewalt-dwe7485',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '8-1/4" compact jobsite table saw, 15A, 5,800 RPM, rack-and-pinion fence, 24-1/2" rip capacity, 2-9/16" depth at 90°, 45 lbs — ultra-portable for tight jobsite spaces'),

  ('DWE7491RS 10 in. Jobsite Table Saw with Rolling Stand', 'dewalt-dwe7491rs',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" jobsite table saw, 15A, 4,800 RPM, 32-1/2" rip capacity, 3-1/8" depth at 90°, rack-and-pinion telescoping fence, site-pro rolling stand — one of the best-selling jobsite table saws'),

  ('DCS7485B FLEXVOLT 60V MAX 8-1/4 in. Table Saw', 'dewalt-dcs7485b',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '8-1/4" cordless table saw, FLEXVOLT 60V MAX, brushless, 5,150 RPM, 24" rip capacity, 0–50° bevel — cuts sheet goods cordlessly on the jobsite without sacrificing power');

-- ─── DEWALT MITER SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DWS779 12 in. Sliding Compound Miter Saw', 'dewalt-dws779',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" dual bevel sliding compound miter saw, 15A, 3,800 RPM, 49° bevel, 2×16" crosscut at 90° / 2×12" at 45° — the most popular corded miter saw in professional woodworking'),

  ('DWS780 12 in. Double Bevel Sliding Compound Miter Saw', 'dewalt-dws780',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" double bevel sliding compound miter saw, 15A, 3,800 RPM, 60° bevel capacity, XPS LED cut-line indicator, integrated dust bag — lighter and more precise than DWS779, DeWalt''s premium miter saw');

-- ─── DEWALT TRACK SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DWS520K 6-1/2 in. Track Saw Kit', 'dewalt-dws520k',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   '6-1/2" corded track saw kit, plunge action, anti-splinter edge, 0°–45° bevel, works with DeWalt guide rail system — corded track saw for consistent sheet goods cuts'),

  ('DCS520T1 FLEXVOLT 60V MAX 6-1/2 in. Track Saw Kit', 'dewalt-dcs520t1',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   '6-1/2" cordless plunge track saw, FLEXVOLT 60V MAX, brushless, 2-1/8" max cut depth, magnesium base, works with DeWalt guide rail — delivers corded track saw performance without a cord');

-- ─── DEWALT ROUTERS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DWP611 1-1/4 HP Compact Router', 'dewalt-dwp611',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='routers'),
   '1-1/4HP compact trim router, 7A, variable speed 16,000–27,000 RPM, 1/4" collet, dual LEDs illuminate work surface, 1-1/2" depth travel, 1/64" adjustment ring — the most popular trim router in woodworking'),

  ('DW618 2-1/4 HP EVS Fixed Base Router', 'dewalt-dw618',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='routers'),
   '2-1/4HP full-size fixed base router, 12A, electronic variable speed 8,000–24,000 RPM, soft start, 1/4" and 1/2" collets, 1/64" depth adjustment — DeWalt''s workhorse full-size router');

-- ─── DEWALT PLANERS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DW735X 13 in. Two-Speed Thickness Planer', 'dewalt-dw735x',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='planers'),
   '13" two-speed portable thickness planer, 15A, 20,000 RPM motor / 10,000 RPM cutterhead, 3-knife head (30% longer knife life), two feed speeds: 96 CPI (finish) or 179 CPI (material removal) — the benchmark portable planer');

-- ─── DEWALT JIGSAWS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DCS331B 20V MAX Cordless Jigsaw', 'dewalt-dcs331b',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   '20V MAX cordless jigsaw, up to 3,000 SPM, 4-position orbital action, all-metal lever-action keyless blade change, LED light — reliable 20V platform jigsaw for everyday cuts'),

  ('DCS334B 20V MAX XR Brushless Jigsaw', 'dewalt-dcs334b',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   '20V MAX XR brushless cordless jigsaw, up to 3,200 SPM, 4-position orbital action, keyless shoe bevel with detents at 0°/15°/30°/45°, all-metal blade clamp — premium brushless jigsaw with extended runtime');

-- ─── DEWALT BAND SAWS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DCS374B 20V MAX XR Brushless Deep Cut Band Saw', 'dewalt-dcs374b',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   '20V MAX XR brushless deep cut band saw, 5"×4-3/4" rectangular / 4" round cutting capacity, 44-7/8" blade, variable speed, LED work light, tool-free blade change — cordless deep cut band saw for metal and wood');

-- ─── DEWALT SANDERS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('DWE6421K 5 in. Random Orbit Sander', 'dewalt-dwe6421k',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '5" corded random orbit sander, 2.0A, 8,000–12,000 OPM variable speed, hook-and-loop pad, dust sealed switch, rubber overmold grip — compact and affordable corded finish sander'),

  ('DCW210B 20V MAX XR Brushless 5 in. Random Orbit Sander', 'dewalt-dcw210b',
   (SELECT id FROM brands WHERE slug='dewalt'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '5" 20V MAX XR brushless cordless random orbit sander, 8-hole hook-and-loop pad, low profile for access to work surfaces, extended runtime via brushless motor — premium cordless finish sander');

-- ─── LIE-NIELSEN BENCH PLANES ────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('No. 3 Bench Plane', 'lie-nielsen-no3',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'No. 3 smoothing plane, ductile iron body, 9" long, 1-3/4" A2 blade (RC 60-62, cryogenically treated), 3.5 lbs — the smallest standard smoother, ideal for lighter work and smaller hands'),

  ('No. 4 Smooth Plane', 'lie-nielsen-no4',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'No. 4 smoothing plane, ductile iron body, 9-1/2" long, 2" A2 blade (RC 60-62, cryogenically treated), 4 lbs — the most-used bench plane in hand-tool woodworking, Lie-Nielsen''s most popular'),

  ('No. 4-1/2 Smooth Plane', 'lie-nielsen-no4-5',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'No. 4-1/2 smoothing plane, ductile iron body, 10-3/8" long, 2-3/8" A2 blade (.140" thick), 5.5 lbs — wider and heavier than the No. 4, preferred for wide panels and figured wood'),

  ('No. 5 Jack Plane', 'lie-nielsen-no5',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'No. 5 jack plane, ductile iron body, 14" long, 2" A2 blade (RC 60-62), 5.5 lbs — the all-purpose workhorse plane for rapid stock removal and initial flattening'),

  ('No. 5-1/2 Jack Plane', 'lie-nielsen-no5-5',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'No. 5-1/2 jack plane, ductile iron body, 14-3/4" long, 2-3/8" A2 blade (.140" thick), 7 lbs — wider jack plane for heavier stock removal on wide boards'),

  ('No. 6 Fore Plane', 'lie-nielsen-no6',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'No. 6 fore plane, ductile iron body, 2-3/8" A2 blade, 7.5 lbs — bridges the gap between jack and jointer, useful for truing long edges before the No. 7'),

  ('No. 7 Jointer Plane', 'lie-nielsen-no7',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'No. 7 jointer plane, ductile iron body, 22" long, 2-3/8" A2 blade (.140" thick), 8.25 lbs — standard jointer length for flattening panels and truing long edges'),

  ('No. 8 Jointer Plane', 'lie-nielsen-no8',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'No. 8 jointer plane, ductile iron body, 24" long, 2-5/8" A2 blade (.170" thick), 10 lbs — the longest and heaviest standard bench plane, for the flattest and truest surfaces on large work');

-- ─── LIE-NIELSEN BLOCK PLANES ────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('No. 60-1/2 Low Angle Adjustable Mouth Block Plane', 'lie-nielsen-no60-5',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Low angle block plane, ductile iron body, 6-1/4" long, 1-3/8" A2 blade, 12° bed angle, adjustable mouth — the go-to block plane for end grain, chamfers, and fine trimming'),

  ('No. 60-1/2 Rabbet Block Plane with Nicker', 'lie-nielsen-no60-5-rn',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Low angle rabbet block plane, open sides, 6-1/4" long, 1-3/4" full-width A2 blade, 12° bed, two A2 nickers for cross-grain scoring, 1.65 lbs — cuts rabbets and dadoes right to the shoulder'),

  ('No. 102 Low Angle Block Plane', 'lie-nielsen-no102',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Compact low angle block plane, ductile iron body, 1-1/4" A2 blade (1/8" thick), 25° bevel — small and nimble for chamfers, trimming plugs, and one-handed work');

-- ─── LIE-NIELSEN BEVEL EDGE CHISELS ─────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('1/4" Bevel Edge Socket Chisel', 'lie-nielsen-chisel-be-14',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '1/4" bevel edge socket chisel, A2 tool steel (RC 60-62, cryogenically treated), Hard Maple handle, 9" overall, 30° flat-ground bevel — based on the Stanley 750, the benchmark bevel edge chisel'),

  ('3/8" Bevel Edge Socket Chisel', 'lie-nielsen-chisel-be-38',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '3/8" bevel edge socket chisel, A2 tool steel (RC 60-62), Hard Maple handle, 9" overall, 30° flat-ground bevel, backs ground flat at 400 grit — clean dovetails and precise joinery work'),

  ('1/2" Bevel Edge Socket Chisel', 'lie-nielsen-chisel-be-12',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '1/2" bevel edge socket chisel, A2 tool steel (RC 60-62), Hard Maple handle, 9" overall, 30° flat-ground bevel — the single most-used chisel size in most shops'),

  ('3/4" Bevel Edge Socket Chisel', 'lie-nielsen-chisel-be-34',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '3/4" bevel edge socket chisel, A2 tool steel (RC 60-62), Hard Maple handle, 9" overall, 30° flat-ground bevel — ideal for paring larger tenon cheeks and wide mortise walls'),

  ('1" Bevel Edge Socket Chisel', 'lie-nielsen-chisel-be-1',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '1" bevel edge socket chisel, A2 tool steel (RC 60-62), Hard Maple handle, 9" overall, 30° flat-ground bevel — the widest standard bevel edge chisel for wide paring and cleaning up dados');

-- ─── LIE-NIELSEN MORTISE CHISELS ─────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('1/4" Mortise Chisel', 'lie-nielsen-chisel-mortise-14',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '1/4" mortise chisel, A2 tool steel (RC 60-62), Hard Maple handle, 10.5" overall, 30° bevel, parallel sides thicker than wide — stays straight under mallet blows for clean mortise walls'),

  ('3/8" Mortise Chisel', 'lie-nielsen-chisel-mortise-38',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '3/8" mortise chisel, A2 tool steel (RC 60-62), Hard Maple handle, 10.5" overall, 30° bevel, cabinetmaker''s grind with parallel sides — the most commonly used mortise chisel size'),

  ('1/2" Mortise Chisel', 'lie-nielsen-chisel-mortise-12',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '1/2" mortise chisel, A2 tool steel (RC 60-62), Hard Maple handle, 10.5" overall, 30° bevel — for wider mortises in furniture legs and heavy timber joinery');

-- ─── LIE-NIELSEN FISHTAIL CHISELS ────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('3/8" Fishtail Chisel', 'lie-nielsen-chisel-ft-38',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '3/8" fishtail chisel, A2 tool steel (RC 60-62), Hard Maple handle, 8" overall, 25° bevel, flared tip for reaching back corners — essential for cleaning half-blind dovetail sockets'),

  ('1/2" Fishtail Chisel', 'lie-nielsen-chisel-ft-12',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '1/2" fishtail chisel, A2 tool steel (RC 60-62), Hard Maple handle, 8" overall, 25° bevel — reaches into tight corners that standard chisels cannot access'),

  ('5/8" Fishtail Chisel', 'lie-nielsen-chisel-ft-58',
   (SELECT id FROM brands WHERE slug='lie-nielsen'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '5/8" fishtail chisel, A2 tool steel (RC 60-62), Hard Maple handle, 8" overall, 25° bevel — the widest fishtail, for larger dovetail sockets and wide paring in confined spaces');

-- ─── MAKITA TABLE SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('2705X1 10 in. Contractor Table Saw with Stand', 'makita-2705x1',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" contractor table saw, 15A, 4,800 RPM, 25" max rip, 3-5/8" depth at 90°, electric brake, 24-5/8"×22-1/4" table — Makita''s flagship corded jobsite table saw');

-- ─── MAKITA MITER SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('LS1019L 10 in. Dual-Bevel Sliding Compound Miter Saw', 'makita-ls1019l',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '10" dual bevel sliding compound miter saw, 15A, 3,200 RPM, soft start, electric brake, 12" crosscut at 90°, 6-5/8" crown nested, 5-1/4" baseboard vertical, 2-steel rail sliding system — compact and precise');

-- ─── MAKITA TRACK SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('SP6000J1 6-1/2 in. Plunge Circular Saw Kit', 'makita-sp6000j1',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   '6-1/2" corded plunge track saw kit, 12A, soft start, 2,000–5,200 RPM variable speed, 2-3/16" at 90° / 1-9/16" at 45°, -1°–48° bevel, includes 55" guide rail — Makita''s corded track saw standard');

-- ─── MAKITA ROUTERS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('RT0701C 1-1/4 HP Compact Router', 'makita-rt0701c',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='routers'),
   '1-1/4HP compact router, variable speed 10,000–30,000 RPM, 1/4" collet, electronic speed control, soft start — widely used in CNC router mounts and hand-held trim routing; one of the most popular compact routers'),

  ('RP2301FC 3-1/4 HP Plunge Router', 'makita-rp2301fc',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='routers'),
   '3-1/4HP plunge router, 15A, 9,000–22,000 RPM variable speed, 0"–2-3/4" plunge depth, linear ball bearings for smooth plunge, LED lights, electric brake — Makita''s full-size production plunge router');

-- ─── MAKITA PLANERS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('2012NB 12 in. Portable Planer', 'makita-2012nb',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='planers'),
   '12" portable thickness planer, 15A, 8,500 RPM, Interna-Lok automated head clamp eliminates snipe, 1/8" max cut depth, 12"×30-3/8" table, 61.9 lbs — known for exceptionally smooth surfaces and snipe-free performance');

-- ─── MAKITA JIGSAWS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('4350FCT Top-Handle Jigsaw', 'makita-4350fct',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   '6.3A corded top-handle jigsaw, 800–2,800 SPM variable speed, 3 orbital settings + straight, tool-less blade change, LED light, 5-5/16" wood capacity, dynamically balanced for 40% less vibration'),

  ('XVJ03Z 18V LXT Cordless Jigsaw', 'makita-xvj03z',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   '18V LXT cordless jigsaw, 0–2,600 SPM variable speed, 1" stroke, orbital action, tool-less blade change, LED light, 5-5/16" wood capacity, 6.1 lbs — Makita''s standard 18V LXT platform jigsaw');

-- ─── MAKITA SANDERS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('BO5041 5 in. Random Orbit Sander', 'makita-bo5041',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '5" corded random orbit sander, 3.0A, 4,000–12,000 OPM variable speed, D-handle, hook-and-loop pad, through-the-pad dust collection — one of the most popular corded random orbit sanders in professional woodworking'),

  ('9903 3"×21" Belt Sander', 'makita-9903',
   (SELECT id FROM brands WHERE slug='makita'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '3"×21" corded belt sander, 8.8A, 690–1,440 ft/min variable speed, electronic speed control maintains constant speed under load, 84 dB — one of the quietest belt sanders in its class');

-- ─── MILWAUKEE TABLE SAWS ────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('M18 FUEL 8-1/4 in. Table Saw 2736-20', 'milwaukee-2736-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '8-1/4" M18 FUEL cordless table saw, POWERSTATE brushless, 6,300 RPM, 24-1/2" rip capacity, 2-1/2" depth at 90° / 1-3/4" at 45°, 47° max bevel, 41.6 lbs, ONE-KEY compatible — industry''s first smart cordless table saw');

-- ─── MILWAUKEE MITER SAWS ────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('6955-20 12 in. Dual-Bevel Sliding Compound Miter Saw', 'milwaukee-6955-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" dual bevel sliding compound miter saw, 15A, 3.3HP max, 3,200 RPM, 13-1/2" crosscut at 90°, 0–55°L/0–60°R miter, 0–45°L/0–48°R bevel, digital readout accurate to 0.1° — Milwaukee''s flagship corded miter saw');

-- ─── MILWAUKEE TRACK SAWS ────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('M18 FUEL 6-1/2 in. Plunge Track Saw 2831-20', 'milwaukee-2831-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='track-saws'),
   '6-1/2" M18 FUEL cordless plunge track saw, POWERSTATE brushless, 6,300 RPM, 2-1/4" max cut depth, 9.1 lbs bare, compatible with Milwaukee guide rail system — cordless track saw with over 90% dust collection efficiency');

-- ─── MILWAUKEE ROUTERS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('M18 FUEL Compact Router 2723-20', 'milwaukee-2723-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='routers'),
   'M18 FUEL compact router, 1.25HP, POWERSTATE brushless, up to 31,000 RPM, 1/4" collet — cordless compact router for edge profiling, trimming, and use in router tables');

-- ─── MILWAUKEE PLANERS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('M18 3-1/4 in. Planer 2623-20', 'milwaukee-2623-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='planers'),
   'M18 cordless 3-1/4" handheld power planer, 14,000 RPM, 0–5/64" cut depth (20 locking positions), 27/64" rabbet cut capacity, bevel/edge guide for 0–45° cuts — cordless replacement for corded handheld planers');

-- ─── MILWAUKEE JIGSAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('M18 FUEL D-Handle Jig Saw 2737-20', 'milwaukee-2737-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='jigsaws'),
   'M18 FUEL cordless D-handle jigsaw, POWERSTATE brushless, 3,500 SPM, 1" stroke, 5 orbital settings, 5-1/2" wood capacity, toolless blade change and bevel, LED light, 6.25 lbs — faster than most corded jigsaws');

-- ─── MILWAUKEE BAND SAWS ─────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('M18 FUEL Deep Cut Band Saw 2729-20', 'milwaukee-2729-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='band-saws'),
   'M18 FUEL cordless deep cut band saw, POWERSTATE brushless, 380 FPM, 5"×5" cutting capacity, 44-7/8" blade, 5-speed dial, 15 lbs — the go-to cordless band saw for cutting pipe, conduit, and dimensional lumber');

-- ─── MILWAUKEE SANDERS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('M18 FUEL 5 in. Random Orbital Sander 2837-20', 'milwaukee-2837-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'M18 FUEL cordless 5" random orbital sander, POWERSTATE brushless, 12,000 OPM max, 5-mode variable speed (4K–12K OPM), 95% dust collection, 3/32" orbit — corded performance in a cordless sander'),

  ('M18 FUEL 3"×18" Belt Sander 2832-20', 'milwaukee-2832-20',
   (SELECT id FROM brands WHERE slug='milwaukee'),
   (SELECT id FROM categories WHERE slug='sanders'),
   'M18 FUEL cordless 3"×18" belt sander, POWERSTATE brushless, 750–1,350 SFM variable speed, 80%+ dust collection, equivalent to 8A corded performance — the best-in-class cordless belt sander for aggressive stock removal');

-- ─── ONEIDA AIR SYSTEMS DUST COLLECTORS ──────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Benchtop Variable-Speed Personal Dust Collector', 'oneida-benchtop-dc',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'Benchtop source-capture dust collector, variable-speed multi-fan motor array, 120V, MERV-12/MERV-15/HEPA-GFM filter options, pre-filter stage prolongs filter life — captures fine dust at-source for sanders, grinders, scroll saws, and rotary tools without dust ports; creates "Clean Zone" around the operator; Made in USA'),

  ('1.5HP Mini-Gorilla 22-Gallon HEPA-GFM Cyclone Dust Collector', 'oneida-mini-gorilla',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '1.5HP portable cyclone dust collector, HEPA-GFM filtration, 22-gallon collection bin, high-efficiency cyclone separator removes over 99% of fine dust before the filter — portable enough to move between machines in a small shop; Made in USA'),

  ('Dust Cobra High-Pressure HEPA Cyclone Dust Collector', 'oneida-dust-cobra',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'High-pressure hybrid vacuum/dust collector with HEPA cyclone, portable with rolling stand, suits small shops running workbench and mobile tools — delivers vacuum-level suction with dust collector capacity; Made in USA'),

  ('Supercell High-Pressure HEPA-GFM Cyclone Dust Collector', 'oneida-supercell',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   'High-pressure HEPA-GFM cyclone dust collector, connects to tools with 1"–5" dust ports, wall-mount or portable stand, first universal dust collector design — works on both large stationary tools and small handheld tools simultaneously; Won Popular Mechanics Top Tool Award; Made in USA'),

  ('V-System 3000 3HP HEPA-GFM Cyclone Dust Collector', 'oneida-v-system-3000',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP 230V cyclone dust collector, HEPA-GFM filter with non-stick membrane, over 99% cyclone separation efficiency, 74 dBA at 10 ft with sound filters, 35 or 55 gallon bin, RF remote included, handles 2 tools simultaneously via 4"–6" ports — the gold standard stationary cyclone for serious home shops; Made in USA'),

  ('V-System 3000 SMART Boost 3HP HEPA-GFM Cyclone Dust Collector', 'oneida-v-system-3000-smart',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '3HP SMART Boost cyclone dust collector with HEPA-GFM filtration, automated variable-speed that boosts suction to 5HP equivalent on demand, over 99% cyclone separation, 35 or 55 gallon bin — intelligent dust collection that saves energy at low loads and delivers full power when needed; Made in USA'),

  ('5HP Dust Gorilla Pro SMART Boost HEPA-GFM Cyclone Dust Collector', 'oneida-dust-gorilla-pro-5hp',
   (SELECT id FROM brands WHERE slug='oneida'),
   (SELECT id FROM categories WHERE slug='dust-collection'),
   '5HP SMART Boost cyclone dust collector, HEPA-GFM filtration, automated variable-speed motor, over 99% cyclone separation efficiency, 35 or 55 gallon drum — Oneida''s award-winning flagship for medium to large shops; multiple Fine Woodworking Tool of the Year awards; Made in USA');

-- ─── RIDGID TABLE SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('R4518 15 Amp 10 in. Portable Table Saw with Folding Stand', 'ridgid-r4518',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" jobsite table saw, 15A, 3.1HP, 5,000 RPM, 26" rip capacity, 3-3/8" depth at 90° / 2-1/2" at 45°, SOFTstart motor ramp-up, folding stand, 75 lbs — RIDGID''s entry-level jobsite saw backed by Lifetime Service Agreement with registration'),

  ('R4514 15 Amp 10 in. Pro Jobsite Table Saw with Stand', 'ridgid-r4514',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" pro jobsite table saw, 15A, 3.1HP, 5,000 RPM, 30" rip capacity, 3-1/2" depth at 90° / 2-1/4" at 45°, SOFTstart technology, single-step release mobile stand, 95 lbs — RIDGID''s flagship jobsite saw; Lifetime Service Agreement with registration');

-- ─── RIDGID MITER SAWS ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('R4113 15 Amp 10 in. Dual Bevel Compound Miter Saw', 'ridgid-r4113',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '10" dual bevel compound miter saw, 15A, 5,000 RPM, 0–50° miter L/R, 0–48° bevel L/R, 9 positive miter stops, 7 positive bevel stops, LED cut line, cuts 2×6 at 90° / 2×4 at 45°, 32 lbs — lightweight and affordable with Lifetime Service Agreement'),

  ('R4222 15 Amp 12 in. Dual Bevel Sliding Miter Saw', 'ridgid-r4222',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" dual bevel sliding compound miter saw, 15A, 4,000 RPM, industry-leading 70° miter capacity L/R, 0–48° bevel L/R, 13 positive miter stops, 9 positive bevel stops, LED cut line, electric brake, cuts 2×16 at 90° / 2×12 at 45°, 64 lbs — RIDGID''s top corded miter saw with Lifetime Service Agreement');

-- ─── RIDGID JOINTERS ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('JP0610 6 Amp 6-1/8 in. Jointer/Planer', 'ridgid-jp0610',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='jointers'),
   '6-1/8" benchtop jointer/planer, 6A, 1HP, 3,450 RPM, 3-blade straight-knife cutterhead, 45" long tabletop, dual bevel fence with stops at 45°/90°/135°, cast iron base, enclosed motor resists dust contamination, 208 lbs — RIDGID''s only jointer; Lifetime Service Agreement with registration');

-- ─── RIDGID SANDERS ──────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('EB4424 5 Amp Oscillating Edge Belt/Spindle Sander', 'ridgid-eb4424',
   (SELECT id FROM brands WHERE slug='ridgid'),
   (SELECT id FROM categories WHERE slug='sanders'),
   '5A oscillating edge belt/spindle sander, 1,725 RPM, 4"×24" belt, spindle sleeves 1/2"–2", tool-free belt-to-spindle conversion, beveling die-cast aluminum table with 5 positive angle stops, oscillating motion prevents burn marks on edges and curves, 40.2 lbs — Lifetime Service Agreement with registration');

-- ═══════════════════════════════════════════════════════════════════════════════
-- RYOBI TOOLS
-- ═══════════════════════════════════════════════════════════════════════════════

-- ─── RYOBI TABLE SAWS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('PBLTS01B 18V ONE+ HP Brushless 8-1/4 in. Table Saw', 'ryobi-pblts01b',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '8-1/4" cordless table saw, 18V ONE+ HP brushless motor, 4,500 RPM, 12" rip capacity, 2-1/4" depth at 90° / 1-3/4" at 45°, self-aligning fence, 240 linear feet per charge on (2) 4Ah batteries — Ryobi''s premium cordless table saw; part of the 300+ tool ONE+ ecosystem'),

  ('RTS08 13 Amp 8-1/4 in. Compact Table Saw', 'ryobi-rts08',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '8-1/4" compact corded table saw, 13A, 5,600 RPM, no stand included — Ryobi''s most affordable entry-level table saw; lightweight and portable for basic ripping and crosscutting tasks'),

  ('RTS12 15 Amp 10 in. Table Saw with Folding Stand', 'ryobi-rts12',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" corded table saw, 15A, 5,000 RPM, folding stand with wheels — mid-range Ryobi jobsite saw offering a 10" blade and folding stand at a budget-friendly price'),

  ('RTS23 15 Amp 10 in. Expanded Capacity Table Saw with Rolling Stand', 'ryobi-rts23',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='table-saws'),
   '10" corded table saw, 15A, 3HP, 5,000 RPM, 27" rip capacity, 3" depth at 90° / 2-1/2" at 45°, integrated dust chute, rolling stand with wheels, 50.95 lbs — Ryobi''s flagship corded jobsite table saw; best value for DIYers needing full rip capacity');

-- ─── RYOBI MITER SAWS ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('PBLMS01B 18V ONE+ HP Brushless 10 in. Sliding Compound Miter Saw', 'ryobi-pblms01b',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '10" cordless sliding compound miter saw, 18V ONE+ HP brushless motor, 4,100 RPM, 47° miter L/R, 0–45° single bevel, 2×12 crosscut at 90°, 2×8 at compound 45°, up to 550 cuts per charge on 4Ah battery — Ryobi''s most capable cordless miter saw'),

  ('TSS103 14 Amp 10 in. Sliding Compound Miter Saw', 'ryobi-tss103',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '10" corded sliding compound miter saw, 14A, 5,500 RPM, 47° bi-directional miter, 12" crosscut capacity — capable corded sliding saw at a competitive price for home workshops'),

  ('TSS121 15 Amp 12 in. Sliding Compound Miter Saw with LED', 'ryobi-tss121',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '12" corded sliding compound miter saw, 15A, 3,800 RPM, LED cut-line indicator — Ryobi''s largest corded miter saw; ideal for trim work and large stock crosscuts where a 12" blade is needed'),

  ('TS1346 14 Amp 10 in. Compound Miter Saw with LED', 'ryobi-ts1346',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='miter-saws'),
   '10" corded compound miter saw (non-sliding), 14A, 5,500 RPM, LED cut-line indicator, cuts 2×6 or 4×4 at 90° / 2×4 at 45° — Ryobi''s budget corded miter saw for general crosscutting and miter work');

-- ─── RYOBI PLANERS ───────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('AP1305 15 Amp 12-1/2 in. Thickness Planer', 'ryobi-ap1305',
   (SELECT id FROM brands WHERE slug='ryobi'),
   (SELECT id FROM categories WHERE slug='planers'),
   '12-1/2" benchtop thickness planer, 15A, 18,800 RPM, 1/20" depth-of-cut control, 4-column frame reduces snipe, 31" combined infeed/outfeed support, dust hood included, ~70 lbs — Ryobi''s only thickness planer; discontinued but widely available secondhand; excellent entry-level value');

-- ═══════════════════════════════════════════════════════════════════════════════
-- ROB COSMAN TOOLS
-- ═══════════════════════════════════════════════════════════════════════════════

-- ─── Rob Cosman brand ────────────────────────────────────────────────────────
INSERT OR IGNORE INTO brands (name, slug) VALUES
  ('Rob Cosman', 'rob-cosman');

-- ─── Hand-tool subcategories ─────────────────────────────────────────────────
INSERT OR IGNORE INTO categories (name, slug, icon) VALUES
  ('Hand Saws',      'hand-saws',      '🪚'),
  ('Chisels',        'chisels',        '🔨'),
  ('Marking Gauges', 'marking-gauges', '📏'),
  ('Hand Planes',    'hand-planes',    '🪵');

-- ─── ROB COSMAN SAWS ─────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Dovetail Saw', 'rob-cosman-dovetail-saw',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Signature dovetail backsaw, 15 TPI, .010" plate, stainless steel back, Australian hardwood handle — designed after teaching thousands of students; available in regular and 3/4 size. Rob''s most iconic saw, purpose-built for cutting dovetails in furniture-grade hardwood'),

  ('Joinery Crosscut Saw', 'rob-cosman-joinery-crosscut-saw',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Crosscut backsaw for joinery work, .010" plate, stainless steel back, Australian hardwood handle — designed as a companion to the dovetail saw for a minimum 3-saw kit (dovetail, tenon, crosscut); available in regular and 3/4 size'),

  ('Bench Crosscut Saw', 'rob-cosman-bench-crosscut-saw',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Larger crosscut backsaw for bench use, longer plate than Joinery Crosscut, stainless steel back, Australian hardwood handle — Rob''s choice for crosscutting wider stock at the bench'),

  ('Tenon Saw (Medium)', 'rob-cosman-tenon-saw-medium',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Medium tenon backsaw, rip-filed teeth, stainless steel back, Australian hardwood handle — ideal for cutting tenon cheeks and shoulders on most furniture joinery; paired with Rob''s joinery crosscut for a complete joinery saw kit'),

  ('Tenon Saw (Large)', 'rob-cosman-tenon-saw-large',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Large tenon backsaw, rip-filed teeth, stainless steel back, Australian hardwood handle — for cutting tenons in thicker or wider stock where extra plate length and weight improve tracking'),

  ('Hand Saw (Crosscut)', 'rob-cosman-hand-saw-crosscut',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Panel saw for crosscutting, .035" thick SK85 spring steel plate, crosscut-filed teeth for dry furniture-grade hardwoods and softwoods, shaped Australian hardwood handle — Rob''s full-size crosscut panel saw for breaking down stock'),

  ('Hand Saw (Rip Cut)', 'rob-cosman-hand-saw-rip',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Panel saw for ripping, .035" thick SK85 spring steel plate, rip-filed teeth for cutting with the grain, shaped Australian hardwood handle — complements the crosscut panel saw; the pair covers all full-size hand-sawing tasks'),

  ('Kerf X-10', 'rob-cosman-kerf-x10',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Speciality saw for cleaning up half-blind dovetail sockets, 10 TPI, inspired by master craftsman Tage Frid''s technique — runs in the existing kerf and cleans the shoulder line of the pin board without tear-out; available in regular and 3/4 size'),

  ('Fret Saw', 'rob-cosman-fret-saw',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   'Deep-throat fret saw for removing dovetail waste, 12-point skip-tooth blades — Rob''s preferred method for clearing tail-board waste (faster and less effort than chopping with a chisel alone); frame design holds tension across the cut');

-- ─── ROB COSMAN CHISELS ──────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('IBC Bench Chisel', 'rob-cosman-ibc-bench-chisel',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='chisels'),
   'Premium bevel-edge bench chisel co-designed with IBC, available 1/16" through 1", A2 tool steel, socket handle design, hand-fitted — Rob calls it the best woodworking bench chisel on the market; handles made from figured wood, individually fitted to each socket'),

  ('IBC 17-Degree Chisel', 'rob-cosman-ibc-17-degree-chisel',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='chisels'),
   'Specialty chisel ground to 17° (vs standard 25°), co-designed with IBC — purpose-built for chopping soft wood fibers that collapse under a standard bevel angle; prevents the frustrating fiber fold-back when working pine, cedar, poplar; available 1/4", 1/2", 3/4"'),

  ('IBC Half-Blind Chisel', 'rob-cosman-ibc-half-blind-chisel',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='chisels'),
   'Specialty chisel for cleaning half-blind dovetail pin sockets, skewed blade profile reaches into tight corners standard chisels cannot access, IBC steel — eliminates the #1 challenge of half-blind dovetails; available in 3/8" and 5/8" (also available in Cosmanized WoodRiver version)'),

  ('IBC Mortise Chisel', 'rob-cosman-ibc-mortise-chisel',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='chisels'),
   'Heavy-duty mortise chisel co-designed with IBC, thick rectangular section resists racking, socket handle, available 3/16" through 7/16" — designed for lever-prying waste out of deep mortises without blade flex; pairs with the IBC bench chisel set for a complete chisel kit');

-- ─── ROB COSMAN MARKING GAUGES ───────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Rob Cosman''s Marking Gauge', 'rob-cosman-marking-gauge',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='marking-gauges'),
   'Signature wheel marking gauge, micro-adjust thumbscrew, interchangeable cutter rods, fine wheel cutter severs wood fibers cleanly — Rob''s production-model gauge designed after years of teaching; the gauge line becomes part of the finished joint so precision is critical'),

  ('Mortise & Tenon Gauge', 'rob-cosman-mortise-tenon-gauge',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='marking-gauges'),
   'Rob Cosman''s signature marking gauge fitted with the Mortise & Tenon Attachment — marks both walls of a mortise or tenon simultaneously with two independent wheel cutters; the attachment also fits the Cosmanized WoodRiver gauge and most other marking gauges'),

  ('Cosmanized WoodRiver Marking Gauge', 'rob-cosman-woodriver-marking-gauge',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='marking-gauges'),
   'WoodRiver marking gauge tuned and modified by Rob Cosman''s shop — shaped fence face, polished beam, fitted with Rob''s wheel cutter system; Rob''s recommended entry point for students who want a high-performance gauge at a lower price than his signature model');

-- ─── ROB COSMAN HAND PLANES ──────────────────────────────────────────────────
-- Note: All planes are WoodRiver V3 bodies sold & prepared by Rob Cosman;
-- Canada-only due to Woodcraft distribution agreement.
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Cosmanized WoodRiver No. 4 Smoothing Plane', 'rob-cosman-wr-no4-smoothing-plane',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   'WoodRiver V3 No. 4 smoothing plane tuned by Rob''s shop — flattened sole, back iron set, blade honed; ductile iron body, Norris-style adjuster, 2" blade — Rob''s recommended workhorse smoother for most furniture work; Canada-only'),

  ('Cosmanized WoodRiver No. 4-1/2 Smoothing Plane', 'rob-cosman-wr-no4-5-smoothing-plane',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   'WoodRiver V3 No. 4-1/2 wider smoothing plane tuned by Rob''s shop — 2-3/8" blade, heavier body for harder woods and figured grain, full prep service; Canada-only'),

  ('Cosmanized WoodRiver No. 5 Jack Plane', 'rob-cosman-wr-no5-jack-plane',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   'WoodRiver V3 No. 5 jack plane tuned by Rob''s shop — versatile do-everything plane, 2" blade, longer body for flattening and rough dimensioning; Canada-only'),

  ('Cosmanized WoodRiver No. 5-1/2 Jack Plane', 'rob-cosman-wr-no5-5-jack-plane',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   'WoodRiver V3 No. 5-1/2 wider jack plane tuned by Rob''s shop — 2-3/8" blade, longer sole, heavier than the #5 for truing wide boards; Rob''s most popular plane; Canada-only'),

  ('Cosmanized WoodRiver No. 6 Fore Plane', 'rob-cosman-wr-no6-fore-plane',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   'WoodRiver V3 No. 6 fore plane tuned by Rob''s shop — 2-3/8" blade, long sole ideal for flattening wide panels before switching to smoother; Canada-only'),

  ('Cosmanized WoodRiver No. 7 Jointer Plane', 'rob-cosman-wr-no7-jointer-plane',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   'WoodRiver V3 No. 7 jointer plane tuned by Rob''s shop — 2-3/8" blade, 22" sole for truing long edges before glue-up, the standard edge-jointing plane for hand-tool woodworking; Canada-only'),

  ('WoodRiver Block Plane (Low Angle)', 'rob-cosman-wr-block-plane-low-angle',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   'WoodRiver V3 low-angle block plane with prep service — 12° bed angle, adjustable mouth, 1-5/8" blade, fits in one hand for chamfering, end-grain cleanup, and fitting joints; Rob''s recommended block plane'),

  ('WoodRiver Shoulder Plane (Medium)', 'rob-cosman-wr-shoulder-plane-medium',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   'WoodRiver shoulder plane for trimming tenon cheeks, rabbet walls, and dado floors — blade runs full width of sole so it registers cleanly in corners; Rob''s recommended size for most furniture tenon work; available small, medium, and large');

-- ─── ROB COSMAN MALLET ───────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Rob Cosman''s Carver''s Mallet', 'rob-cosman-carvers-mallet',
   (SELECT id FROM brands WHERE slug='rob-cosman'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   'Carver''s-style round mallet, solid wood head, balanced for chisel work — Rob prefers the round head over a rectangular joiner''s mallet because any face contacts the chisel regardless of wrist angle; available in regular and small sizes');

-- ═══════════════════════════════════════════════════════════════════════════════
-- FLAGSHIP TOOL SEED — batch added 2026-08-05
-- Brands: Blue Spruce, Bridge City, Empire, FastCap, Irwin, Nova, Shinwa,
--         Starrett, Suizan, Swanson, Triton, Two Cherries, Veritas, Wen,
--         Woodpeckers
-- ═══════════════════════════════════════════════════════════════════════════════

-- ─── BLUE SPRUCE ─────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Round Mallet', 'blue-spruce-round-mallet',
   (SELECT id FROM brands WHERE slug='blue-spruce'),
   (SELECT id FROM categories WHERE slug='hand-tools'),
   '13 oz or 16 oz turned round mallet with resin-infused curly maple head — polymer treatment increases maple density by 80% over untreated wood; machined steel rod extends deep through both sections, epoxied for added mass and rigidity; round head contacts chisel from any wrist angle without re-positioning; handle and head species selectable; made in USA'),

  ('Optima Bench Chisel Set', 'blue-spruce-optima-bench-chisel-set',
   (SELECT id FROM brands WHERE slug='blue-spruce'),
   (SELECT id FROM categories WHERE slug='chisels'),
   '4-piece bench chisel set in 1/4", 1/2", 3/4", and 1"; blades machined from A2 tool steel, double-tempered and cryogenically treated to RC 60–62; bevels ground and honed to 30°; backs lapped flat to light-band tolerance — never requires flattening; resin-infused curly maple handles with stainless steel ferrule; made in USA');

-- ─── BRIDGE CITY ─────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('TS-2v2 Try Square', 'bridge-city-ts2v2-try-square',
   (SELECT id FROM brands WHERE slug='bridge-city'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   '8" stainless steel blade hardened to resist marking-knife scoring, set in a two-piece mirrored aluminum handle — blade pierced with an 8:1 dovetail ratio profile for direct dovetail layout reference; rounded blade corners prevent flaring if dropped; four-screw handle allows field re-squaring; Bridge City''s signature try square and one of their most iconic tools');

-- ─── EMPIRE ──────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('E2994 7" Rafter Speed Square', 'empire-e2994-speed-square',
   (SELECT id FROM brands WHERE slug='empire'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Die-cast aluminum 7" rafter/speed square with high-definition laser-etched markings — degree scale, common rafter, hip/valley, and jack rafter tables on the tool face; lipped fence registers cleanly on board edges for 90° and 45° lines; Empire''s flagship layout tool and one of the best-selling speed squares in North American framing and carpentry');

-- ─── FASTCAP ─────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('ProCarpenter Lefty/Righty Tape Measure', 'fastcap-pssr16-lefty-righty',
   (SELECT id FROM brands WHERE slug='fastcap'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   '16 ft tape measure with dual-direction blade printing — measurements readable whether the tape is pulled from the right or left hand, eliminating awkward flipping on the job; features lever-action belt clip, dual-lock system, built-in pencil sharpener, and erasable notepad on the case; 1"-wide heavy-duty blade; FastCap''s most recognized innovation');

-- ─── IRWIN ───────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('7" Rafter Speed Square', 'irwin-7-speed-square',
   (SELECT id FROM brands WHERE slug='irwin'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Die-cast aluminum 7" speed square for framing, rafter layout, and stair stringers — laser-etched degree scale with common, hip/valley, and jack rafter tables; lipped fence for clean 90° and 45° references off board edges; a standard jobsite layout companion to Irwin''s clamp and chisel lines');

-- ─── NOVA ────────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('1624-44 Variable Speed Wood Lathe', 'nova-1624-44',
   (SELECT id FROM brands WHERE slug='nova'),
   (SELECT id FROM categories WHERE slug='lathes'),
   '16" swing, 44" between-centers mid-size floor lathe with 1.5 HP motor and 8-step pulley system — 215 to 3,600 RPM speed range; 3/4" x 16 TPI spindle; 16" onboard bowl capacity, 29" outboard with optional outrigger; accepts full Nova chuck range; field-upgradeable to DVR electronic variable-speed motor; Nova''s benchmark mid-size lathe');

-- ─── SHINWA ──────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('62009 Stainless Steel Try Square', 'shinwa-62009-try-square',
   (SELECT id FROM brands WHERE slug='shinwa'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   '150mm (6") stainless steel try square manufactured to JIS Grade 2 precision standard — three times more accurate than a standard carpenter''s square; accuracy within ±0.035 mm per 100 mm; blade and stock precision-ground in Japan; widely used for machine setup and fine woodworking layout');

-- ─── STARRETT ────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('C604R-12 Spring Tempered Steel Rule', 'starrett-c604r-12-rule',
   (SELECT id FROM brands WHERE slug='starrett'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   '12" x 1" spring-tempered steel rule with satin chrome multi-plate finish — graduated 64ths and 32nds on one side, 16ths and 8ths on the other; black-filled graduation lines so uniform that individual 1/64" marks are easily distinguished at a glance; the standard reference rule in Starrett''s machinist lineup, used alongside their combination squares');

-- ─── SUIZAN ──────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Ryoba Double Edge Pull Saw 9.5"', 'suizan-ryoba-9-5',
   (SELECT id FROM brands WHERE slug='suizan'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   '9.5" (240mm) double-edge Japanese pull saw — rip teeth (9 TPI) on one edge for with-grain cuts, crosscut teeth (15 TPI) on the other; 0.02" blade thickness, 0.03" kerf; impulse-hardened Japanese steel, replaceable blade; cane-wrapped handle; manufactured in Japan by craftsmen in a town with over 100 years of saw-making tradition'),

  ('Dozuki Pull Saw 9.5"', 'suizan-dozuki-9-5',
   (SELECT id FROM brands WHERE slug='suizan'),
   (SELECT id FROM categories WHERE slug='hand-saws'),
   '9.5" spine-reinforced dozuki for precision crosscutting — fine teeth (approx. 24 TPI) produce a kerf as thin as 1/32"; rigid spine prevents blade flex for accurate joinery, tenons, and dovetail cuts; pull-stroke action keeps blade in tension; Japanese impulse-hardened steel, replaceable blade; made in Japan');

-- ─── SWANSON ─────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('TC132 12" Combination Square', 'swanson-tc132-combo-square',
   (SELECT id FROM brands WHERE slug='swanson'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   '12" combination square with cast zinc body and stainless steel blade — blade precision-etched in 1/16" graduations accurate to within 0.001"; 45° and 90° reference faces CNC-machined for reliability; acrylic bubble vial, brass lock bolt, and removable hardened scribe stored in the handle; Swanson''s finish-carpentry and furniture companion to their Speed Square');

-- ─── TRITON ──────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('TRA001 2400W Dual Mode Plunge Router', 'triton-tra001-router',
   (SELECT id FROM brands WHERE slug='triton'),
   (SELECT id FROM categories WHERE slug='routers'),
   '3-1/4 HP (2400W) electronically controlled dual plunge/fixed-base router — above-table height adjustment when table-mounted via winding rod through the base; side air vents reduce dust ingestion when inverted; quick-fit pins for rapid installation in router table fence; fully compatible with Triton RTA300 Router Table; Triton''s flagship production router'),

  ('TPT125 12.5" Benchtop Thickness Planer', 'triton-tpt125-planer',
   (SELECT id FROM brands WHERE slug='triton'),
   (SELECT id FROM categories WHERE slug='planers'),
   '12.5" (317mm) benchtop thickness planer with 1.5 HP motor, 17,500 cuts per minute — 4-post column design for smooth, accurate vertical movement; depth-of-cut adjustable in 1/16" increments; maximum single pass 1/8"; built-in dust chute; large infeed and outfeed tables for material support; Triton''s core thicknessing machine');

-- ─── TWO CHERRIES ────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('4-Piece Heavy Pattern Mortise Chisel Set', 'two-cherries-mortise-chisel-set',
   (SELECT id FROM brands WHERE slug='two-cherries'),
   (SELECT id FROM categories WHERE slug='chisels'),
   '4-piece heavy-pattern mortise chisel set solid-forged from high-quality carbon steel, hardened to 61 HRC — thick rectangular section resists racking and lateral movement during mortise paring; hornbeam handle with leather shock-absorber disc absorbs mallet blows; steel ferrule on handle end; overall length approx. 13"; made in Germany; Two Cherries has produced edge tools since 1858');

-- ─── VERITAS ─────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('Bevel-Up Smoother Plane', 'veritas-bevel-up-smoother',
   (SELECT id FROM brands WHERE slug='veritas'),
   (SELECT id FROM categories WHERE slug='hand-planes'),
   '10" sole, 3-1/8" wide stress-relieved ductile iron body — 12° bed angle with 38° blade bevel yields 50° cutting angle to suppress tear-out on difficult grain; 2-1/4" wide A2 tool steel blade lapped to 0.0002" flatness; adjustable mouth with front locking knob and stop-screw to restore exact setting; weighs 4 lb 14 oz; accepts optional 25°, 50°, and toothed blades for varied grain strategies');

-- ─── WEN ─────────────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('4214T 12" Variable Speed Drill Press', 'wen-4214t-drill-press',
   (SELECT id FROM brands WHERE slug='wen'),
   (SELECT id FROM categories WHERE slug='drill-presses'),
   '12" swing benchtop drill press with 5 Amp induction motor, mechanical variable speed 580–3,200 RPM — 3-1/8" spindle travel; 5/8" chuck with MT2 taper and onboard chuck key storage; X-pattern laser centers drill on mark; LED work light; 9-1/2" x 9-1/2" cast iron table bevels 45° left and right; LCD displays current RPM; weighs 85 lb; one of WEN''s top-selling shop tools');

-- ─── WOODPECKERS ─────────────────────────────────────────────────────────────
INSERT OR IGNORE INTO tools (name, slug, brand_id, category_id, description) VALUES
  ('SERX Precision Straight Edge Rule', 'woodpeckers-serx-straight-edge',
   (SELECT id FROM brands WHERE slug='woodpeckers'),
   (SELECT id FROM categories WHERE slug='measuring-layout'),
   'Machined aluminum straight edge rule held to 0.0015" flatness tolerance per foot — vee-groove profile on base edge provides stable footing and a clear view of surface high/low spots; laser-engraved scale accurate to ±0.004" over full length; available in multiple lengths; machined and individually inspected at Woodpeckers'' Strongsville, Ohio facility');
