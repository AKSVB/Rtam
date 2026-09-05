-- Ṛtam — fill the last few identity-field gaps: one temple was missing its
-- sthala purana entirely, two were missing a native-script name.

update public.temples
set sthala_purana = 'According to the Skanda Purana and Padma Purana, the demon Durgamasura tormented the region until the goddess Shakambari — worshipped here as Banashankari, an incarnation of Parvati — emerged from a sacrificial fire to slay him and restore peace. A separate local tradition holds she later appeared in a dream to a Chalukya king, instructing him to build a temple in her honour. Banashankari became the kuladevata (family deity) of the Kalyana Chalukyas; the original shrine here, built by the 7th-century Badami Chalukyas, was later rebuilt in 1750 CE.',
    sthala_purana_source = 'Skanda Purana, Padma Purana, and local/regional tradition'
where name = 'Badami Banashankari Temple' and sthala_purana is null;

update public.temples set native_name = 'ਦੁਰਗਿਆਣਾ ਮੰਦਰ' where name = 'Durgiana Temple, Amritsar' and native_name is null;
update public.temples set native_name = 'কামাখ্যা দেৱালয়' where name = 'Kamakhya Temple' and native_name is null;

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes)
select id, 'Banashankari Devi Jatra', 1, 2, 'The temple''s largest annual fair, drawing devotees and tourists from across the region.'
from public.temples where name = 'Badami Banashankari Temple'
  and not exists (
    select 1 from public.temple_festivals f where f.temple_id = public.temples.id and f.name = 'Banashankari Devi Jatra'
  );
