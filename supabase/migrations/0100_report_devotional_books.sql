-- Ṛtam — lets the existing content-report system (already used for
-- reviews and Dharma Wall posts) cover devotional books too, so a rights
-- holder has a real, tracked way to ask for a book's removal rather than
-- just a static disclaimer with nowhere to actually act.

alter type report_target_type add value 'devotional_book';
