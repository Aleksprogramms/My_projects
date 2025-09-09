--1a
SELECT a.artist
FROM artists a
JOIN artist2album a2a on a2a.artistid = a.artistid
Join albums al on al.albumid = a2a.albumid
WHERE al.album = 'christmas in the country';

--1b
SELECT s.song
FROM artists a
JOIN artist2album a2a on a2a.artistid = a.artistid
Join albums al on al.albumid = a2a.albumid
Join cds on cds.artist2albumid = a2a.artist2albumid
Join cdtracks cdt on cdt.cdid = cds.cdid
Join songs s on s.songid = cdt.songid
where s.song LIKE '%choral%' and a.artist = 'johan sebastian bach';

--1c
SELECT cds.discid, s.song 
FROM genres g
JOIN cds on cds.genreid = g.genreid
LEFT JOIN (cdtracks cdt JOIN songs s on s.songid = cdt.songid) on cds.cdid = cdt.cdid and cdt.track = 7
WHERE g.genre = 'progressive rock' and cds.ayear = 1995;

--1d

SELECT a2.artist
FROM artists a1
JOIN artist2album a2a1 on a2a1.artistid = a1.artistid 
JOIN artist2album a2a2 on a2a2.albumid = a2a1.albumid and a2a1.artistid != a2a2.artistid
JOIN artists a2 on a2.artistid = a2a2.artistid
where a1.artist = 'britney spears'

--1e

SELECT s2.song
FROM songs s1
JOIN cdtracks cdt1 on cdt1.songid = s1.songid
JOIN cdtracks cdt2 on cdt2.cdid = cdt1.cdid and s1.songid != cdt2.songid
JOIN songs s2 on s2.songid = cdt2.songid 
where s1.song = 'auld lang syne'and cdt2.track = cdt1.track + 1
GROUP BY s2.song

--2a
--(1)

SELECT a.artist
FROM artists a
JOIN artist2album a2a ON a2a.artistid = a.artistid
WHERE EXISTS (SELECT 1
			  FROM albums al
			  WHERE al.albumid = a2a.albumid
			  AND al.album LIKE '%drop%')


--(2)
SELECT a.artist
FROM artists a
JOIN artist2album a2a on a2a.artistid = a.artistid
where a2a.albumid IN (SELECT albumid
FROM albums
WHERE album LIKE '%drop%')

--2b
--(1) 
SELECT g.genre
FROM genres g
WHERE g.genre NOT IN (
						SELECT g.genre
						FROM genres g
						JOIN cds on cds.genreid = g.genreid
						WHERE cds.ayear < 2005)
ORDER BY g.genre

--(2)

SELECT g.genre
FROM genres g
WHERE NOT EXISTS (  SELECT *
				FROM cds
				WHERE cds.ayear < 2005 and g.genreid = cds.genreid)
ORDER BY g.genre

--3a

SELECT max(ayear), avg(ayear)
FROM cds
where ayear >= 1900 and ayear <= 2012

--3b

SELECT COUNT(DISTINCT ayear)
FROM cds
where ayear > 1500

--3c

SELECT DISTINCT cds.ayear, COUNT(al.album)
FROM cds
JOIN artist2album a2a on a2a.artist2albumid = cds.artist2albumid
JOIN albums al on al.albumid = a2a.albumid
WHERE cds.ayear >= 1900 and cds.ayear <= 1999
GROUP BY cds.ayear


--3d 
SELECT a.artist, COUNT(al.album) 
FROM artists a
JOIN artist2album a2a on a2a.artistid = a.artistid
JOIN albums al on al.albumid = a2a.albumid
WHERE a.artist LIKE 'rad%' 
GROUP BY a.artist
HAVING  COUNT(al.album) >  1

--3f
SELECT g.genre, count(cds.cdid)
FROM genres g
Join cds on cds.genreid = g.genreid
GROUP BY g.genre
HAVING  count(cds.cdid) > 1000
ORDER BY g.genre
