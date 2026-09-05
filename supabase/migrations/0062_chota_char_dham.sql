-- Ṛtam — the Chota Char Dham ("small four abodes"): the Uttarakhand
-- Himalayan pilgrimage circuit of Yamunotri, Gangotri, Kedarnath, and
-- Badrinath — distinct from the pan-India Char Dham (Badrinath, Dwarka,
-- Puri, Rameswaram) already tracked under the 'Char Dham' tag. All four
-- temples are already in the database under other circuits (Badrinath:
-- Char Dham/Panch Badri; Kedarnath: Jyotirlinga/Panch Kedar) or with no
-- circuit tag at all (Yamunotri, Gangotri) — this only adds the tag.

update public.temples
  set significance = significance || array['Chota Char Dham']
  where name = 'Yamunotri Temple' and not (significance @> array['Chota Char Dham']);

update public.temples
  set significance = significance || array['Chota Char Dham']
  where name = 'Gangotri Temple' and not (significance @> array['Chota Char Dham']);

update public.temples
  set significance = significance || array['Chota Char Dham']
  where name = 'Kedarnath Jyotirlinga' and not (significance @> array['Chota Char Dham']);

update public.temples
  set significance = significance || array['Chota Char Dham']
  where name = 'Badrinath Temple' and not (significance @> array['Chota Char Dham']);
