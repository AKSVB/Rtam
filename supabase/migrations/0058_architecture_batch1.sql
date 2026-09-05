-- Ṛtam — architecture style and construction century for 12 major
-- temples with well-documented building histories. Where a temple was
-- rebuilt after destruction or major renovation, construction_century
-- reflects the present visible structure, with the fuller history in the
-- style text itself. Left null where sources genuinely don't converge on
-- one clean "built in century X" answer (Tirumala).

update public.temples set
  architecture_style = 'Bhumija, with Maratha and Chalukya influences; the present five-storey structure was rebuilt after Iltutmish''s destruction',
  construction_century = 18
where name = 'Mahakaleshwar Jyotirlinga, Ujjain';

update public.temples set
  architecture_style = 'Nilachal style — a bulbous, beehive-shaped brick shikhara pioneered at this temple — rebuilt after the original stone structure was destroyed',
  construction_century = 16
where name = 'Kamakhya Temple';

update public.temples set
  architecture_style = 'Dravidian; the original shrine is Hoysala-era, with the towers rebuilt under later Vijayanagara and Mysore Wodeyar patronage',
  construction_century = 17
where name = 'Chamundeshwari Temple, Mysore';

update public.temples set
  architecture_style = 'Dravidian, developed over many centuries under Pallava, Chola, and Vijayanagara patronage'
where name = 'Sri Venkateswara Swamy Temple, Tirumala';

update public.temples set
  architecture_style = 'Hemadpanti; the original Hoysala-era shrine was destroyed and the present structure rebuilt in the 16th century',
  construction_century = 16
where name = 'Vitthal Rukmini Temple, Pandharpur';

update public.temples set
  architecture_style = 'Hemadpanti — dry basalt masonry with no mortar, typical of temples from this era in the Deccan',
  construction_century = 12
where name = 'Tulja Bhavani Temple, Tuljapur';

update public.temples set
  architecture_style = 'Chalukya style, with later Hemadpanthi-era additions and a Maratha-period renovation under Shivaji',
  construction_century = 7
where name = 'Mahalakshmi Temple, Kolhapur';

update public.temples set
  architecture_style = 'Dravidian, blending early Chera/Pandya/Chola work with later Vijayanagara-Nayak and Travancore-era rebuilding',
  construction_century = 17
where name = 'Suchindram Thanumalayan Temple';

update public.temples set
  architecture_style = 'Rajputana style blended with Mughal influence — built entirely in marble with silver doors, replacing an earlier 15th-century shrine',
  construction_century = 20
where name = 'Karni Mata Temple, Deshnoke';

update public.temples set
  architecture_style = 'Dravidian, modeled on Kakatiya-era temple architecture; the roughly thousand-year-old shrine was entirely rebuilt (2016–2022) in black granite (Krishnashila) without cement, concrete, or bricks',
  construction_century = 21
where name = 'Yadagirigutta Lakshmi Narasimha Temple';

update public.temples set
  architecture_style = 'A blend of Dravidian, Vijayanagara, Hoysala, and Kerala styles across the matha complex',
  construction_century = 14
where name = 'Sringeri Sharada Peetham';

update public.temples set
  architecture_style = 'Dravidian; the inner sanctum dates to the 5th century, the outer temple and gopurams to the 11th-century Cholas, and the 120-foot Raja Gopuram to Krishnadevaraya of Vijayanagara in 1516',
  construction_century = 11
where name = 'Sri Kalahasti Temple (Vayu Sthalam)';
