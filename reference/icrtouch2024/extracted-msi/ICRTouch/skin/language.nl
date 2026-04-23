VERSION=6100

; Language definition file for ICRTouch
; Created 24/2/2006

; Each language file consists of
; LANGID=MAXLENGTH=Text

; LANGID - Is the unique language identifier
; MAXLENGTH - is the maximum length of the text
;             all text over this will be truncated changing this field WILL result in system instability 

; The entire text line is imported up to the end of the line.  White spaces at the end of the line are imported also.

; [TYPE ID] - Is purely added to aid human readablility

; Any line that does not begin with a numeric {0-9} is tread as a comment line


; NOTE - USER CHANGES
; -------------------
; If you make changes to this file it is possible {likely} that these changes may get overwritten when you apply
; an ICRTouch update in the future.
; 
; To ensure your changes aren't lost you should copy and paste the changed line {no need for headers or anything}
; into a new file called CustomLanguage.def that will reside in the same folder
;
; The CustomerLanguage.def file is loaded AFTER the main language file, overwriting any language texts this file is never
; overwritten during an update


#####################################################################
# ICRTouch Version 2.530 - 15/3/2006                                #
#####################################################################


[FILE NAMES]

1=24=PLU
2=24=PLU Hoofdgroep
3=24=Verkoper
4=24=Verkoper Rapport
5=24=PLU Lijst
6=24=BTW
7=24=Batch Rapport
8=24=Printer Logos
9=24=Lichtkrant
10=24=Cheque Printen
11=24=Level Namen
12=24=Vast karakter
13=24=Foutmelding
14=24=Nota tekst
15=24=Vaste totalen
16=24=Afrekentoets
17=24=Transactie toets
18=24=Status toets
19=24=Groep
20=24=Dagdelen
21=24=Dagdelen Links
22=24=Korting bij aantal
23=24=Taak uitvoeren
24=24=Toetsenbord
25=24=Systeemvlaggen
26=24=Verkoper taken
27=24=Verkoper shiften
28=24=Weegartikel
29=24=Korting bij aantal 2
30=24=Tafels
31=24=Klant
32=24=Klant met totalen
33=24=Klanten groep
34=24=Terminal aangesloten
35=24=IO Parameter
36=24=Apparaat aangesloten
37=24=PLU Voorraad
38=24=PLU Voorraad aanpassing
39=24=Screensaver afbeelding
40=24=Plattegrond Afbeelding 1
41=24=Grafisch Logo
42=24=Plattegrond Afbeelding 2
43=24=Plattegrond Afbeelding 3
44=24=Plattegrond Afbeelding 4
45=24=Plattegrond Afbeelding 5
46=24=Plattegrond Afbeelding 6
47=24=Plattegrond Afbeelding 7
48=24=Plattegrond Afbeelding 8
49=24=Plattegrond Afbeelding 9
50=24=Plattegrond Afbeeld. 10
51=24=Verkoper Font 1
52=24=Verkoper Font 2
53=24=Verkoper Font 3
54=24=Verkoper Font 4
55=24=Verkoper Font 5
56=24=Verkoper Font 6
57=24=Verkoper Font 7
58=24=Verkoper Font 8
59=24=Software uitvoeren
60=24=Iconen
61=24=Software slot
62=24=Datum en Tijd
63=24=Afgekort PLU 1
64=24=Afgekort PLU 2
65=24=Afgekort PLU 4
66=24=Afgekort Verkoper 1
67=24=Afgekort Verkoper 2
68=24=Afgekort Toetsenbord 1
69=24=Afgekort Toetsenbord 2
70=24=Willekeurige Codes
71=24=Systeem instellen
72=24=Vaste toets


[DISPLAY MESSAGES]

101=40=U bent niet ingeklokt, wilt u inklokken?
102=40=U heeft pauze, pauze starten?
103=24=INKLOKKEN
104=24=EINDE PAUZE
105=24=UITKLOKKEN
106=24=START PAUZE
107=24=VOER CAISSIERE NR. IN
108=20=VERPLAATS NAAR
109=24=NOTA GEPRINT
110=24=NOTA PER KLANT GEPRINT
111=24=AANTAL NOTA'S
112=40=Voer aub nieuwe nota in
113=24=SUB TOTAAL:
114=24=DOORGAAN?
115=20=VOER TEKST IN
116=40=Voer nota in
117=24=HUIDIGE VERKOOP
118=30=SCALE.DLL CHECKSUM:
119=24=CHECKSUM OK
120=24=CHECKSUM VERKEERD
121=24=VOER GEWICHT IN (kg)
122=40=ER STAAT EEB TAFEL OPEN, DOORGAAN?
123=40=ACCOUNT KLANT, DOORGAAN?
124=12=TOTAAL:
125=12=TEKORT:
126=5=TL:
127=20=Wacht op poort
128=20=Buffer wissen
129=40=Reset alle verkoop data, weet u zeker?
130=24=Verkoop Data Reset
131=40=TOTALEN RESETTEN
132=40=Wis alles in het geheugen?
133=24=MRS
134=40=STANDAARD PROGRAMMA LADEN
135=40=BEPAAL TERMINAL NR
136=3=NR#
137=24=Voer aub naam in
138=40=Wachten aub.
139=40=Programma laden van een andere terminal?
140=24=Auto programma start
141=40=TouchPoint gestart als demo 
142=24=Demo stand
143=40=Verkoop data wordt niet opgeslagen
144=24=GEEN NUMMER
145=40=SLUIT LADE
146=40=Wachten aub, flash geheugen wordt gewist
147=40=Wachten aub, grafisch logo laden
148=40=INITIALISEER MODEM
149=24=ANTWOORD:
150=10=NUMMER:
151=40= ONBEKENDE KLANT
152=40=Geen vaste telefoonnummers beschikbaar
153=12=Zwarte lijst
154=24=Van klantnummer?
155=24=Naar klantnummer?
156=12=Verplaats
157=4=naar
158=16=klant
159=30=PUNTEN:
160=30=SALDO:
161=30=BESCHIKBAAR:
162=40=Voer klantnummer in
163=40=NIEUWE KLANT AANMAKEN?
164=40=AUTO KLANT AANMAKEN
165=40=VOER VOORNAAM IN
166=40=VOER ACHTERNAAM IN
167=40=SELECTEER KLANT GROEP
168=40=VOER ADRES REGEL 1 IN
169=40=VOER ADRES REGEL 2 IN
170=40=VOER ADRES REGEL 3 IN
171=40=VOER ADRES REGEL 4 IN
172=40=VOER POSTCODE IN
173=40=VOER TELEFOONNUMMER IN
174=40=Wachten op antwoord ...
175=3=PTS
176=4=BAL:
177=50=Alles wordt geconverteerd naar Euros, doorgaan?
178=24=EURO converteren
179=40=data converteren, wachten aub ...
180=24=Selecteer bestemming
181=24=Floppy Disk
182=24=Data Backup
183=24=Geprogrammeerde Locatie
184=40=Wilt u een cheque printen?
185=40=Voer cheque in slipprinter in
186=40=Schrijf cheque nr op achterkant van cheq
187=40=Handtekening & Datum OK?
188=24=OPEN
189=24=VERPLAATS
190=24=SPLITS ARTIKELEN
191=24=PRINT NOTA
192=24=LAAT INFO ZIEN
193=24=PRINT SLIP
194=24=PRINT PER KLANT
195=24=DEZE NOTA IS VRIJ
196=24=DEZE TAFEL IS VRIJ
197=12=ARTIKELEN:
198=12=TEKST:
199=12=GEOPEND DOOR
200=20=NOTA GEPRINT: JA
201=20=NOTA GEPRINT: NEE
202=20=VERKOOP AFGESLOTEN
203=20=NOTA BESCHIKBAAR: JA
204=40=Verwijder deze tafel?
205=12=VAN
206=40=voer aub nota nummer in
207=1=R
208=24=SELECTEER AUB FOLIO
209=12=FOLIO
210=24=VOER KAMER # IN
211=24=SELECTEER AUB SHIFT
212=24=VOER BOOKING REF IN
213=40=KAMER STATUS OPVRAGEN, WACHTEN AUB
214=40=POSTEN, WACHTEN AUB
215=9=ZONDAG
216=9=MAANDAG
217=9=DINSDAG
218=9=WOENSDAG
219=9=DONDERDAG
220=9=VRIJDAG
221=9=ZATERDAG
222=9=JANUARI
223=9=FEBRUARI
224=9=MAART
225=9=APRIL
226=9=MEI
227=9=JUNI
228=9=JULI
229=9=AUGUSTUS
230=9=SEPTEMBER
231=9=OKTOBER
232=9=NOVEMBER
233=9=DECEMBER
234=5=VAN:
235=12=TermnlNR
236=16=Online PC
237=16=Inline PC
238=16=HOTEL SERVER
239=20=VERKOPER AFGEMELD
240=16=START VAN:
241=24=Inline Functies
242=24=IRC Initialiseren
243=24=Nota bezig reset
244=24=Tafel bezig reset
245=24=Verkoper bezig reset
246=24=Zend voorraad teller
247=24=Verk. nota/tafel verpl.
248=24=Resync nota verblijf
249=24=Voer nota nummer in
250=24=Voer tafel nummer in
251=12=BEZIG RESET:
252=5=TAFEL
253=5=NOTA
254=24=Verplaats van verkoper
255=24=Verplaats naar verkoper
256=40=Initialiseren IRC
257=24=Verkoper Functies
258=24=Wis Auto-Verk. toetsen
259=24=Welke Terminal?
260=24=Alle Terminals
261=24=Programma bestanden
262=24=Alle Programma's
263=24=Bestand sturen,
264=24=Bestand ontvangen,
265=24=Backup/Laden
266=24=Data Backup
267=24=Data Laden
268=24=Backup Locatie
269=24=Laden Locatie
270=16=Backup Bestand,
271=16=Laden Bestand,
272=16=BESTAND
273=24=Selecteer aub een locatie
274=24=Geen rapport link
275=40=Code bestaat niet. Nw artikel aanmaken?
276=24=RECORD NR.
277=24=BEREIK PROGRAMMA
278=8=JA
279=8=NEE
280=24=GEEN PLU GESELECTEERD
281=24=VERKEERD INGEVOERD
282=24=GEEN LINK
283=24=Dallas sl. niet ingevoerd
284=24=Dallas sl. ingevoerd
285=24=Dallas sl. erop drukken  
286=40=Reindexing PLU bestand, wachten aub.
287=40=Bereik Programmeren, wachten aub.
288=40=Exporteren klanten bestand, wachten aub.
289=24=Weegartikel
290=24=Kies bestand type
291=30=Code bestaat van Record Nr
292=24=. Wijzig deze Record?
293=40=Druk op cel waarmee u wilt samenvoegen
294=20=Kopieer Screen Lvl -
295=16=in deze level?
296=24=Scherm Levels
297=40=Selecteer aub End Box, OK?
298=24=Select Start PLU
299=4=TEXT
300=24=PLU per bereik
301=24=Functie toets Wizard
302=24=Geen functie
303=40=Kopieer Start Box eigenschappen?
304=24=Zend TOETSENBORD BESTAND NAAR
305=24=FUNCTIE TYPE
306=40=NIEUWE STATUS TOETS GEMAAKT IN RECORD
307=4=REF:
308=4=TFL:
309=4=GST:
310=40=VOER VERKOPER NUMMER IN
311=3=NAAR:
312=10=Vandaag
313=12=Morgen
314=30=BOEKING TIJD (UU:MM)
315=30=PERIODE
316=30=GASTEN
317=30=BOOKING REF
318=40=Verwijder de geselecteerde reservering?
319=40=Deze reservering botst met
320=12=Gereserveerd
321=12=Open Tafel
322=24=Deze reservering?
323=24=Reservering functies
324=24=Bekijk details
325=24=Wijzig Reservering
326=24=Verwijder reservering
327=24=Wijzig Notities
328=24=Neem storting
329=24=Reservering notities
330=30=RESERVERING
331=16=REFERENTIE:
332=16=TAFEL NUMMER:
333=10=GASTEN:
334=20=STORTING:
335=40=NOTITIE;
336=40=VOER STORTING IN
337=40=Selecteer aub betaalwijze
338=40=Indexeren PLU bestand
339=40=Voer aub betaalcode in voor licentienr
340=50=De 28 dagen verlenging is toegepast
341=20=UW SERVER IS
342=24=HUIDIGE ACTIEVE VERKOPERS
343=20=BON GEPRINT
344=24=Prijs Level
345=24=Einde van de dag
346=24=X-stand Rapporten
347=24=Z-stand Reporten
348=24=Verborgen functies
349=40=ANNULEERL, OK?
350=24=Verwijder muis
351=24=Gebruik muis
352=24=Verwijder NET Drivers
353=24=Gebruik NET Drivers
354=24=Schakel journaal uit
355=24=Schakel journaal in
356=24=Compleet resetten
357=24=Voer betaalccode in
358=24=Minimaliseer TouchPoint
359=24=Afsluiten naar Windows
360=50=Alle verkoop data resetten
361=24=Programmeer stand
362=12=, Actief
363=50=Programma afsluiten, weet u het zeker?
364=20=******* KASSA ******
365=20=***** GESLOTEN *****
366=40=Download grafisch logo naar de bonprinter?
367=40=Verwijder toeslag van deze nota?
368=40=Koppel toeslag aan deze nota?
369=24=Selecteer zoek hoofdgroep
370=24=Alle hoofdgroepen
371=24=Selecteer een artikel
372=24=Selecteer aub bestemming 
373=24=Geprinte Tekst logo
374=24=Email een Terminal
375=50=NIEUWE PLU MET DEZE CODE AANMAKEN?
376=24=PLU NIET GEVONDEN
377=40=VOER NAAM IN
378=40=VOER PRIJS IN
379=24=SELECTEER GROEP
380=24=SELECTEER HOOFDGROEP
381=40=Credit Card swipen aub
382=40=Voer kaartnummer in
383=40=Voer vervaldatum in, MMJJ
384=40=VOER NAAM KLANT IN
385=24=LOYALITEIT KAART:
386=40=LOYALITEIT KAART NR
387=40=Terminal Z gesloten, wachten aub
388=6=DEMO
389=3=lic
390=40=** Verkoop in tijdelijke buffer **
391=40=Aanmelden aub
392=8=KLANT
393=4=KLNT
394=3=CK1
395=3=CK2
396=16=APPARAAT FOUT!
397=40=Voer geldteruggave in
398=40=Wachten op resultaat transactie
399=24=VAN BETAALWIJZE
400=24=NAAR BETAALWIJZE

3901=40=Punten afgelost
3902=40=Data updaten wachtwn aub.

[PRINTER MESSAGES]

401=20=INKLOKKEN   
402=20=UITKLOKKEN  
403=20=START PAUZE
404=20=EINDE PAUZE  
405=20=FOUT      
406=24=GEEN DETAILS
407=24=VERKOOP NR:
408=1=T
409=24=KORTINGSBEDRAG:
410=24=PUNTEN VERKREGEN:
411=6=Nr
412=24=VERKOOP TOTAAL
413=12=VAN
414=24=NIEUW SALDO
415=12=OPEN
416=24=VORIG SALDO
417=24=TOTAAL
418=24=SUB TOTAAL
419=6=NOTA
420=6=VAN
421=40=DOORGAAN ...
422=20=... DOORGAAN
423=6=Waarde
424=12=SPLITS
425=24=* EINDE GESPLITSTE NOTA *
426=10= INGEVOERD
427=24=NOTA GEOPEND AANTAL:
428=24=HUIDIGE NOTA TOTAAL:
429=20=VERKOOP GESLOTEN,NR:
430=24=*** RETOUR STAND *** 
431=40= !!! VOLLEDIGE VERKOOP DATA RESET !!!
432=10=START:
433=19=* KLANT OPVRAGEN *
434=16=TELEFOONNUMMER:
435=24=Laatste Trans. datum:
436=24=Uitgegeven tm datum:
437=24=Uitgegeven aan korting:
438=24=Korting totaal tm datum:
439=12=PUNTEN:
440=16=Dit is waard
441=24=Saldo:
442=24=Credits:
443=24=Debits:
444=24= Zwarte lijst klant:
445=24= Klant verplaats:
446=24= Naar:
447=24=Uitgegeven vandaag:
448=30=Aantal keren gebruikt vandaag:
449=6=Uit
450=14=Volgende verk.
451=12=Gebruikt:
452=12=Waarde:
453=12=Debiteuren:
454=12=Crediteuren:
455=12=Verplichting:
456=12=Totaal:
457=16=Totaal punten:
458=20=Totaal uitgegeven:
459=20=Totaal credits:
460=20=Totaal debits:
461=20=Debiteuren totaal:
462=20=Crediteuren totaal:
463=20=Totaal verplicht:
464=20=Totaal gebruikt:
465=24=KORTING
466=12=OUDE PUNTEN:
467=12=NW PUNTEN:
468=9=OUD SLD:
469=9=NW SLD:
470=9=SALDO:
471=24=TEKORT
472=6=WISSEL
473=24=GELD TERUGGAVE
474=24=GRATIS
475=16=TIJD:
476=16=BONNUMMER:
477=16=GEBRUIKT DOOR:
478=16=VERKOOP ART.:
479=24=PLU HOOFDGROEP TOTALEN:
480=24=GROEP TOTALEN:
481=24=VERKOOP TOTALEN:
482=24=KORTING TOTAAL:
483=24=TOESLAG:
484=40=        * VERKOPERS DOOR ELKAAR *
485=40=     VERKOPER NOTA/TAFEL VERPLAATS
486=5=VAN:
487=5=NAAR:
488=20=Terminal aangesloten
489=40=    NR    NAAM           F/C  NOTA SYS  
490=10=LOCATIE
491=4=JA
492=4=NEE
493=10=ZELF
494=10=SLAVE
495=10=MASTER
496=10=BACKUP
497=16=KLANT MASTER:
498=16=KLANT BACKUP:
499=18=TIJD & AAN MASTER:
500=18=TIJD & AAN BACKUP:
501=24=GEEN VERKOPER
502=40=            ** kopie bon **
503=6=KP
504=19=*** RETOUR STAND ***
505=12=*RETOUR STAND*
506=12=**TRAINING**
507=12=RETOUR ART.
508=6=ART.
509=6=VAN
510=9=TICKET
511=30=STORTING ONTVANGEN, TAFEL:
512=12=MEDIA
513=20=VERK. AFGESLOTEN,NR:
514=20=NIET GEBRUIKT
515=5=AANT:
516=8=VSLD:
517=8=Nr:
518=18=WIJZIG STAND,
519=18=REG STAND
520=18=RETOUR STAND
521=18=X STAND
522=18=Z STAND
523=18=MANAGER STAND
524=18=THUIS STAND
525=18=PGM 1 STAND
526=18=PGM 2 STAND
527=18=PGM 3 STAND
528=18=PGM 4 STAND
529=18=PGM 5 STAND
530=18=PGM 6 STAND
531=18=PGM 7 STAND
532=24=TOUCHPOINT GESLOTEN:
533=40= ********  TOUCHPOINT GESLOTEN  *******
534=40=       Toeslag verwijderd
535=40=       Toeslag ingesteld
536=16=KLANT NAAM:
537=16=KAART NUMMER:
538=16=VERVAL DATUM:
539=24=PRIJS LEVEL GEWIJZIGD,
540=24=ONBEKEND
541=12=BETAALWIJZE,
542=20=WIJZIG TIJD:


[REPORT DISPLAY MESSAGES]

601=40=PLU Report printen
602=24=SELECTEER VAN GROEP
603=24=ALLE GROEPEN
604=24=SELECTEER TM GROEP
605=24=ALLE OVERIGE GROEPEN
606=24=SELECT VAN PLU HOOFDGR.
607=24=ALLE PLU HOOFDGROEPEN
608=24=SELECT TM PLU HOOFDGR.
609=24=ALLE OVERIGE PLU HFDGR.
610=24=SELECTEER VERKOPER
611=24=DEZE VERKOPER
612=24=KASDECLARATIE CONTANT
613=20=KASDECLARATIE
614=24=PLU ophalen
615=24=PLU Hoofdgroep ophalen
616=24=Verk. rapport ophalen
617=24=BTW tabel ophalen
618=24=vaste totalen ophalen
619=24=Betaalwijzes ophalen
620=24=Transacties ophalen
621=24=Groepen ophalen
622=24=Dagdelen ophalen
623=24=Korting x aant. ophalen
624=24=Korting x aant.2 ophalen
625=24=ELEK. JOURNAAL RESET
626=40=Printen PLU Hoofdgroep Rapport
627=40=Printen verkoper Rapport
628=40=Printen BTW tabel Rapport
629=40=Printen Vaste totalen Rapport
630=40=Printen Betaalwijze Rapport
631=40=Printen Transacties Rapport
632=40=Printen Groepen Rapport
633=40=Printen Dagdelen Rapport
634=40=Printen Korting x Aantal Rapport
635=40=Printen Korting x Aantal2 Rapport
636=40=Printen Systeem Fout Log
637=40=Z Resetten, weet u het zeker?
638=40=wachten totdat de printer buffer is gewist
639=24=Voer toegangscode in
640=24=Kies locatie aub
641=24=Deze locatie
642=24=Alle Locaties
643=40=UPDATE KLANTEN BESTAND VAN MASTER?
644=40=ONTVANGEN TIJD & ATT TRAN LOG
645=24=WELKE KLANTEN?
646=24=ALLE KLANTEN
647=24=EEN KLANTEN GROEP
648=24=ALLE ACCOUNT KLANTEN
649=24=DEBET KLANTEN
650=24=EEN ENKELE KLANT
651=24=SELECTEER KLANT GROEP
652=24=TRANSACTIE BEREIK
653=24=ALLE TRANSACTIES
654=24=VAN DE AFGELOPEN MAAND
655=24=ONBETAALDE TRANSACTIES
656=24=VANAF EEN BEPAALDE DATUM
657=24=Datum, DDMMJJJJ
658=24=LAAT GEGEVENS ZIEN?
659=24=GEEN GEGEVENS
660=24=ALLE GEGEVENS
661=24=ALLEEN GROEP TOTALEN
662=24=ALLEEN HOOFDGROEP TOTALEN
663=40=ONTVANGEN KLANT DTL GEGEVENS
664=40=ONTVANGEN KLANTEN DTL ARTIKELEN
665=40=Printen Elektronisch Journaal
666=24=Tijd, UUMM
667=24=Kies type toets
668=24=voer informatie in
669=40=Voer zoektekst in
670=10=INFO :
671=40=ONTVANGEN NOTA INDEXEN
672=40=PRINT OPEN NOTA RAPPORT
673=40=PRINT KLANTEN RAPPORT
674=40=PRINT KLANT GEGEVENS

[REPORT TITLES]

701=24=Vaste tellers
702=24=Betaalwijze toets
703=24=Transactie toets
704=24=PLU Hoofdgroep
705=24=Groep
706=24=Verkoper Rapport
707=24=Verk. Rapp., enkele vrk
708=24=Dagdelen Rapport
709=24=Korting x Aantal
710=24=Korting x Aantal 2
711=24=BTW Tabel
712=24=PLU Rapporten
713=24=Open Nota Rapport
714=24=Journaal Rapporten
715=24=Klanten Rapporten
716=24=Tijd & Aanwezig
717=24=Foutmeldingen
718=24=Alle PLU'S
719=24=Alleen PLU Totalen
720=3=PLU
721=24=PLU Voorraad
722=24=PLU lager dan min. vrrd
723=24=Sorteren?
724=24=Niet sorteren
725=24=Sorteer per groep
726=24=Sorteer per hoofdgroep
727=24=Volledig journaal
728=24=achterstevoren printen
729=24=Alleen resetten
730=24=vanaf datum/tijd
731=24=Voor een specifieke dag
732=24=Voor een specifieke verk.
733=24=Voor een product/functie
734=24=NIET GEBRUIKT
735=24=Klant besteed tm datum
736=24=Totaal van klant besteed
737=24=Credits
738=24=Debits
739=24=Gratis maaltijd gebruik
740=24=Klant punten
741=24=Te besteden Punten totaal
742=24=Klant Saldo
743=24=Debiteuren
744=24=Geblokkeerde kaarten
745=24=Transactie historie
746=24=Pin Rapporten
747=24=Live Store, opgeteld
748=24=Live Store, details
749=24=Wachten trnsfr, opgeteld
750=24=Wachten trnsfr, detail
751=24=Tijd & Aanwezig
752=24=Ingeklokt
753=24=Gewerkte uren
754=24=Audit trail


[REPORT PRINTING]

801=40=Volledige PLU Periode? Reset Rapport
802=40=Volledige PLU Periode? Lees Rapport
803=40=PLU Totalen Periode? Reset Rapport
804=40=PLU Totalen Periode? Lees Rapport
805=40=PLU Voorraad Reset Rapport
806=40=PLU Voorraad Lees Rapport
807=40=Lager dan Minimale Voorraad Rapport
808=40=PLU Prijs Level # Periode? Lees Rapport
809=12=VAN GROEP: 
810=12=TM GROEP:   
811=12=VAN HFDGRP:
812=12=TM HFDGRP:  
813=3=CUR
814=3=MIN
815=8=TOTAAL:
816=10=LOCATIE :
817=24=ALLE LOCATIES
818=5=OK
819=5=NG
820=40= KASDECLARATIE TOTALEN
821=10=DCLR VOOR
822=10=TL IN
823=10=VERSCHIL
824=5=ONDER
825=5=OVER
826=14=  Bereik, van:
827=5=tm:
828=40=** Fout Log Reset
829=40=** PLU Voorraad Totalen Reset
830=20=ALLE KLANTEN
831=20=ALLE ACCOUNT KLANTEN
832=20=ALLE DEBET ACCOUNT KLANTEN
833=20=ENKELE KLANT GP:
834=20=ENKELE KLANT:
835=40=** Klant  Bestand Periode? Ttl Reset
836=40=** Klant Punten Periode? Ttl Reset
837=40=** Klant Besteed Periode? Ttl Reset
838=40=** Klant Credits Periode? Ttl Reset
839=40=** Klant Debits Periode? Ttl Reset
840=40=** Klant Saldo Reset
841=40=** Klant Debiteur Saldo Reset
842=40=** Klant geblokkeerde kaart Reset
843=40=** Klant gratis maaltijd Periode? Reset
844=40=** PLU Periode? Ttl Reset
845=40=** PLU Hoofdgroep Periode? Ttl Reset
846=40=** Verkoper Rapport Periode? Ttl Reset
847=40=** BTW Tabel Periode? Ttl Reset
848=40=** Tafelbeheer Bestand Reset
849=40=** vaste Tellers Periode? Ttl Reset
850=40=** Betaalwijze toets Periode? Ttl Reset
851=40=** Transactie toets Periode? Ttl Reset
852=40=** Groep Periode? Ttl Reset
853=40=** Dagdelen Periode? Ttl Reset
854=40=** Korting x Aantal Periode? Ttl Reset
855=40=** Korting x Aantal 2 Periode? Ttl Reset
856=5=GEMID
857=40=        *** EINDE PAUZE ***   
858=40=PLU Hoofdgroep Periode? Reset Rapport
859=40=PLU Hoofdgroep Periode? Lees Rapport
860=40=Verkoper Rapport Periode? Reset Rapport
861=40=Verkoper Rapport Periode? Lees Rapport
862=40=BTW Tabel Periode? Reset Rapport
863=40=BTW Tabel Periode? Lees Rapport
864=40=Open Nota Reset Rapport
865=40=Open Nota Lees Rapport
866=40=Open Saldo Rapport
867=40=Vaste Tellers Periode? Reset Rapport
868=40=Vaste Tellers Periode? Lees Rapport
869=40=Betaalwijze toets Periode? Reset Rapport
870=40=Betaalwijze toets Periode? Lees Rapport
871=40=Transactie toets Periode? Reset Rapport
872=40=Transactie toets Periode? Lees Rapport
873=40=Groep Periode? Reset Rapport
874=40=Groep Periode? Lees Rapport
875=40=Dagdelen Periode? Reset Rapport
876=40=Dagdelen Periode? Lees Rapport
877=40=Korting x Aantal Periode? Reset Rapport
878=40=Korting x Aantal Periode? Lees Rapport
879=40=Korting x Aantal2 Periode? Reset Rapport
880=40=Korting x Aantal2 Periode? Lees Rapport
881=40=Systeem Fout Log
882=40=TAAK:
883=40=BESTAND:
884=40=NETSTORING
885=40=XMS INIT FOUT
886=40=XMS ALLOC FOUT
887=40=NET GEEN ANTWOORD
888=40=FOUT DATA PAKKET
889=40=PAKKET NIET VERZONDEN
890=40=MODEM INIT FOUT
891=40=MODEM TIMOUT
892=40=ONBEKENDE MODEM FOUT
893=40=TRNSLT DB OPEN FOUT
894=40=CONTROLEER DETAIL GEHEUGEN
895=40=ONBEKENDE FOUT
896=40=Journaal Lees Rapport, voor info
897=40=Elek. Journaal Lees Rapport, per Verk.
898=40=Elek. Journaal Rapport, per dag
899=40=Elek. Jnl Lees Rapport, per Datum/Tijd
900=40=Elek. Journaal Reset Rapport
901=40=Elek. Journaal Lees Rapport
902=40= ** RAPPORT NIET GERESET !!!!!!
903=12=RAPP. VOOR:
904=12=ALLE TERMIN.
905=9=KLOK IN
906=9=KLOK UIT
907=9=PAUZE ED
908=9=PAUZE ST
909=40=VERKOPER, INGEKLOKT
910=40=VERKOPER, GEWERKTE UREN
911=40=TIJD & AANWEZIG, AUDIT TRAIL
912=10=MET PAUZE
913=9=TIJD WIJZ
914=16=TIJD GEWERKT:
915=12=SHIFT:
916=24=INBREUK:
917=40= MOGELIJK GEWIJZIGD DOOR TIJDSWIJZIGING
918=5=NAAR
919=8=TL TIJD:
920=20=ABNORMAAL RECORD
921=20=ABNORMALE RECORDS
922=6=TIJD:
923=4=IN: 
924=4=UIT:
925=1=b
926=1=i
927=40=** Tijd en aanwezig reset
928=24=GEEN VERKOPER
929=40=Klant Transactie Historie
930=24= HUIDIG SALDO:
931=40=** Klant gegevens reset
932=8=VERK TL
933=8=SLD WIJZ
934=8=NW SALDO
935=12=VAN :
936=24=Voor de datum,
937=40=Klant Punten, Periode? Reset Rapport
938=40=Klant Punten, Periode? Lees Rapport
939=40=Klant Pt Totaal, Periode? Reset Rapport
940=40=Klant Pt Totaal, Periode? Lees Rapport
941=40=Klant besteed, Periode? Reset Rapport
942=40=Klant besteed, Periode? Lees Report
943=40=Klant besteed Ttl, Periode? Reset Rapp.
944=40=Klant besteed Ttl, Periode? Lees Rapport
945=40=Klant Credits, Periode? Reset Rapport
946=40=Klant Credits, Periode? Lees Report
947=40=Klant Debits, Periode? Reset Rapport
948=40=Klant Debits, Periode? Lees Rapport
949=40=Klant Saldo, Reset Rapport
950=40=Klant Saldo, Lees Rapport
951=40=Klant Debiteuren, Reset Rapport
952=40=Klant Debiteuren, Lees Rapport
953=40=Geblokkeerde Kaarten Rapport
954=40=Klant gegevens Lees Rapport
955=40=Gratis Maaltijd Reset Rapport
956=40=Gratis Maaltijd Lees Rapport
957=40= ** Gegevens Reset
958=20=Geheim Nummer:
959=40=     PLU Omschrijving Pgm Rapport
960=40=       PLU Prijs Pgm Rapport
961=40=       PLU Hoofdgroep Pgm Rapport
962=40=       Verkoper Pgm Rapport
963=40=       Clerk Detail Program Rapport
964=40=       PLU Lijst Pgm Rapport
965=40=     Bonlogo Pgm Rapport
966=40=     Level Namen Pgm Rapport
967=40=     Vaste karakter Pgm Rapport
968=40=    Foutmeldingen Pgm Rapport
969=40=     Vaste Tellers Pgm Rapport
970=40=      Betaalwijze toets Pgm Rapport
971=40=      Transactie toets Pgm Rapport
972=40=      Status toets Pgm Rapport
973=40=      Groep Pgm Rapport       
974=40=** EJ RESET       


[SYSTEM CONTROL 1]

1001=50=SysteemVlag 1
1002=50=Lade verplicht sluiten voor registreren?
1003=50=Lade open bij totaal bedrag = 0.00?
1004=50=Dezelfde artikelen optellen in scherm en op KP?
1005=50=Slechts 1x retour boeken in retour stand?
1006=50=Altijd bon in retour stand?
1007=50=Reset bonnummer, na Z1 Vaste Tellers?
1008=50=Start bonnummer na een reset
1009=50=Automatisch verkoper afmelden na (sec)
1010=50=Verkopers door elkaar uitschakelen?
1011=50=Alleen verkopers door elkaar op deze terminal?
1012=50=Screensaver verschijnt na (sec)
1013=50=Scherm uitschakelen na (uren)
1014=50=Scherm inschakelen na (uren)
1015=50=Lade open alarm gaat af na (sec)
1016=50=Standaard Level in REG stand
1017=50=Direct selecteren zonder op OK te drukken
1018=50=Lade gaat open bij verkoper in training?
1019=50=Prijs level 1 als prijs is 0.00 in huidige level?


[SYSTEM CONTROL 2]

1031=50=Systeemvlag 2
1032=50=Aantal decimalen in bedragen
1033=50=Korting verwerken in PLU, groep, hoofdgroep rapp.?
1034=50=Afrondingsmethode
1035=50=BTW handmatig per toets laten berekenen?
1036=50=Verkopers aanmelden via Dallassleutel?
1037=50= Verkoper afmelden na verwijderen Dallassleutel?
1038=50=Gebruik Sharp UP5900 verkoper sleutels?
1039=50=Gebruik Sharp UP5900/X500 Magneetkaartlezer?
1040=50=Gebruik Sharp UP-X500 verkoper sleutels?
1041=50=Gebruik TEC ST60 Magneetkaartlezer?
1042=50=Gebruik XN900 Dallassleutels?
1043=50=Gebruik XN900 Magneetkaartlezer?
1044=50=Geen geluid na indrukken van een toets?
1045=50=Terminal uitzetten als Windows wordt afgesloten?
1046=50=Lees niet track 1 van de magneetkaart?
1047=50=Lees niet track 2 van de magneetkaart?


[TICKET ISSUANCE]

1071=50=Enkele bon (1 artikel per bon)
1072=50=Print de prijs op de enkele bon
1073=50=Print enkele bon ook bij aantal (bijv. 3-delig)
1074=50= Verhoog enkele bonnr per geprinte enkele bon
1075=50=Print extra grote karakters (max. 15 per regel)
1076=50=Print het enkele bonnummer
1077=50=Reset het enkele bonnr na een Z1-Fin. Rapport?
1078=50=Print tekst bovenaan bonlogo op enkele bon
1079=50=Pr. alleen 1ste regel bovenaan op enkele bon
1080=50=Print grafisch logo op enkele bon
1081=50=Print tekst onderaan bonlogo op enkele bon
1082=50=Pr. alleen 1ste regel onderaan op enkele bon
1083=50=Snij af tussen de enkele bonnen
1084=50=Print stippellijn onderaan de enkele bon
1085=50=Star TSP700 detecteren start van de enkele bon
1086=50=Star TSP700 print extra zwart
1087=50=Print info zoals verkoper, datum en tijd
1088=50=Print info onderaan de enkele bon
1089=50=Print info zoals tafelnr, bonnr, klanten
1090=50=Enkele bon printer 2 gebruikt nr van printer 1
1091=50=Print totaal aantal enkele bonnen
1092=50=Bon links uitlijnen
1093=50=Aantal lege regels voordat bon wordt afgesneden


[SLIP PRINT]

1101=50=Slip Printer systeemvlag
1102=50=Aantal regels bovenaan overslaan
1103=50=Maximaal aantal regels op een slip nota
1104=50=Print tekst bonlogo bovenaan de slip nota?
1105=50=Print commercieel logo bovenaan de slip nota?
1106=50=Print tekst bonlogo onderaan de slip nota?
1107=50=Print BTW nummer?
1108=50=Print BTW symbool?


[ORDER CONTROL]

1121=50=Order vlag
1122=50=Automatisch nieuw ordernr berekenen?
1123=50= Verplicht ordernummer gebruiken?
1124=50=Alleen ordernummer bij PLUs op keukenprinter?
1125=50=Alleen ordernummer bij verplicht aantal klanten?
1126=50=Print in Retour stand op keukenprinter?
1127=50=Print op KP karakters dubbel breed
1128=50=Print op KP karakters dubbel hoog
1129=50=Print Ordernummer dubbel hoog
1130=50=Print nota/tafel nummer dubbel hoog
1131=50=Voeg een lege regel toe tussen KP artikelen
1132=50=Print automatisch een KP-bon voor KP artikelen?
1133=50=Reset Ordernummer, na Z1 vaste totalen?
1134=50=Start ordernummer na Z1 Vaste Tellers
1135=50=Dubbel grote kar. kleiner als niet op bon past?
1136=50=Vragen om KP locatie na einde transactie?
1137=50=Sorteer op KP per groep?
1138=50=Sorteer op KP per PLU Hoofdgroep?
1139=50=KP bon comprimeren?
1140=50=KP bon automatisch afsnijden?
1141=50=Print stippellijn onderaan op elke KP bon?
1142=50=Issue FF at end of order?
1143=50=Laat pieptoon horen bij KP bon?
1144=50=Aantal lege regels bovenaan op KP bon
1145=50=Aantal lege regels onderaan op KP bon
1146=50=Andere taal op KP bon
1147=50=KV Type
1148=50= Nummer bovenaan is


[REPORT CONTROL]

1161=50=Rapport vlag
1162=50=Print niet rapportnummer in X-Rapport
1163=50=Print niet rapportnummer in Z-Rapport
1164=50=Kasdeclaratie verplicht voor X/Z Fin. Rapport
1165=50=Print niet rapporten in EJ
1166=50= Print niet tekst bonlogo van rapport in EJ
1167=50= Print niet reset regels van rapport in EJ
1168=50=Print niet de tijd in de rapporten?
1169=50=Print niet de datum in de rapporten?
1170=50=Print niet bonnummer in de rapporten?
1171=50=Sorteer kasdeclaratie per eenheid?
1172=50=kasdeclaratie eenheden bij elkaar optellen?


[CHECK TRACKING]

1191=50=Tafelbeheer
1192=50=Laat tafelnummer zien op tafel plattegrond?
1193=50=Alleen klant verplichting bij tafels?
1194=50=Laat aantal klanten zien op tafel plattegrond?
1195=50=Tafelnummer is notanummer?
1196=50=standaard plattegrond die verschijnt
1197=50=Gebruik notabeheer ipv tafelbeheer?
1198=50=Z Open Tafel Rapport mag geprint worden?
1199=50=Automatisch een tafelnota printen?
1200=50=Automatisch tafel sluiten na afmelden verkoper?
1201=50=Print niet de tijd op de nota?
1202=50=Print niet de datum op de nota?
1203=50=Print niet bonnummer op de nota?
1204=50=Print automatisch een nota na afrekenen tafel?
1205=50=Couvert (betaald) gebruiken
1206=50=Couvert is vast bedrag (Nee = % van ttl bedrag)?
1207=50=Couvert optellen bij netto bedrag?
1208=50=Couvert alleen berekenen na indrukken [COUVERT]?
1209=50=Alleen couvert na invoeren aantal klanten?
1210=50=Couvert (%) berekenen over alle artikelen?
1211=50=Couvert alleen bij specifiek artikel 1?
1212=50=Couvert alleen bij specifiek artikel 2?
1213=50=Couvert alleen bij specifiek artikel 3?
1214=50=Couvert alleen bij specifiek artikel 4?
1215=50=Couvert alleen bij specifiek artikel 5?
1216=50=Tekst invoer bij nieuwe nota?
1217=50=Tekst invoer bij nieuwe tafel?
1218=50=Tekst invoer bij aanwezig?
1219=50=Automatisch notanummer?
1220=50=Reset automatisch notanummer na Z1 Dag Rapport?
1221=50=Klanten=1 als geen klanten worden ingevoerd?


[PRINT CONTROL]

1241=50=Print vlag
1242=50=Print grafisch logo?
1243=50=Print tekstlogo bovenaan de bon?
1244=50=Print commerciele tekst?
1245=50=Print tekstlogo onderaan de bon?
1246=50=Print BTW Nummer?
1247=50=Print KOPIE op bon achteraf?
1248=50=Print tekstlogo boveaan in een rapport?
1249=50=Print BTW Symbool?
1250=50=Print niet de tijd op de bonnen?
1251=50=Print niet de datum op de bonnen?
1252=50=Print niet bonnummer op de bonnen?
1253=50=Print ordernummer dubbel hoog op de bonnen?
1254=50=Print nota/tafelnummer dubbel hoog op de bonnen?


[AUTOBROADCAST]

1271=50=Auto zenden in IRC
1272=50=Auto zenden IRC, PLU
1273=50=Auto zenden IRC, PLU Hoofdgroep
1274=50=Auto zenden IRC, Verkopers
1275=50=Auto zenden IRC, Verkoper rapport
1276=50=Auto zenden IRC, PLU Lijst
1277=50=Auto zenden IRC, BTW Tabel
1278=50=Auto zenden IRC, Batch XZ
1279=50=Auto zenden IRC, Printer Logos
1280=50=Auto zenden IRC, Lichtkrant
1281=50=Auto zenden IRC, Cheque Printen
1282=50=Auto zenden IRC, Toetsenbord Level Namen
1283=50=Auto zenden IRC, Vaste karakters
1284=50=Auto zenden IRC, Foutmeldingen
1285=50=Auto zenden IRC, Nota tekst
1286=50=Auto zenden IRC, Vaste tellers
1287=50=Auto zenden IRC, Betaalwijze toetsen
1288=50=Auto zenden IRC, Transactie toetsen
1289=50=Auto zenden IRC, Status toetsen
1290=50=Auto zenden IRC, Groepen
1291=50=Auto zenden IRC, Dagdelen
1292=50=Auto zenden IRC, Korting bij aantal
1293=50=Auto zenden IRC, Taak uitvoeren
1294=50=Auto zenden IRC, Toetsenbord
1295=50=Auto zenden IRC, Systeemvlaggen
1296=50=Auto zenden IRC, Verkoper Taken/Shiften
1297=50=Auto zenden IRC, Weegartikel
1298=50=Auto zenden IRC, Tafelplattegronden
1299=50=Auto zenden IRC, Klanten
1300=50=Auto zenden IRC, Klanten groep
1301=50=Auto zenden IRC, IO Parameter
1302=50=Auto zenden IRC, Aangesloten apparaten


[COMMS CONTROL]

1321=50=Communicatie vlag
1322=50=Map voor programma backup
1323=50=Map voor schermen
1324=50=Modem init string
1325=50=---------- Muntautomaat controle ----------
1326=50=Gebruik muntautomaat controle?
1327=50=Map voor muntautomaat controle bestand


[CUSTOMER FILE]

1341=50=Klanten
1342=50=Voornaam
1343=50=Achternaam
1344=50=Account nummer
1345=50=Klanten groep
1346=50=Adres 1:
1347=50=Adres 2:
1348=50=Adres 3:
1349=50=Adres 4:
1350=50=Postcode
1351=50=Telefonnummer
1352=50=Op zwarte lijst?
1353=50=Nieuwe klant?
1354=50=Gebruik specifiek artikel 5 niet toegestaan?


[CUSTOMER GROUPS]

1371=50=Klanten Groepen


[CUSTOMER CONTROL]

1501=50=Klanten vlag
1502=50=Automatisch een bon bij gebruik van klanten?
1503=50=Geef de waarde aan van 100 punten
1504=50=Identifier voor de klanten magneetkaarten     
1505=50=Z open saldo rapport mag geprint worden?
1506=50=Automatisch nieuwe klant aanmaken?
1507=50=Popup vragen voor klanten groep?
1508=50=Popup vragen om adres?
1509=50=Popup vragen om telefoonnummer?
1510=50=Waarschuwen bij afrekenen van een account klant?
1511=50=Gebruik ook letters in accountnummer?
1512=50=Laat klantinfo zien bij gebruik Caller ID?
1513=50=------- Indeling Mag klanten kaart -------
1514=50=Gebruik track 1 van de klanten magneetkaart?
1515=50=Gebruik track 2 van de klanten magneetkaart?
1516=50=Indeling van de klanten kaart?
1517=50=Map voor afbeeldingen van klanten


[SCANNING PLU]

1531=50=PLU vlag
1532=50=Scanning PLU's programmeren vanaf dit volgnummer
1533=50=Scanning PLU's programmeren tot dit volgnummer
1534=50=PLU's met onbekende barcode direct programmeren?
1535=50=Kassa blokkeren bij onbekende barcode?
1536=50=Controle bit C van de barcode niet scannen?
1537=50=Print PLU/barcode op de klantenbon?
1538=50=Print PLU/barcode in het EJ?
1539=50=Enkel verkoop PLU afrekenen met deze toets
1540=50=Map voor afbeeldingen van PLU's
1541=50=Bij open prijs geen tweede keer registreren?


[EFT CONTROL]

1551=50=Pin vlag
1552=50=Type gekoppelde pinautomaat
1553=50=Gebruik TCP/IP (Alleen Commidea)?
1554=50=Server IP Adres
1555=50=Server Map
1556=50=EFT Account Number
1557=50=Accountnummer (alleen Commidea)
1558=50=Popup voor contant uitbetaling?
1559=50=Uitbetaling toevoegen aan lade totaal in Rapport?
1560=50=Uitbetaling verrekenen met geld in lade in Rapp.?
1561=50=Popup voor invoeren van fooi?
1562=50=Fooi toevoegen aan lade totaal in Rapport?
1563=50=Klant niet aanwezig transacties
1564=50=Saldo open tafels afrekenen (Commidea)?
1565=50= Zend open nota's (Commidea)
1566=50= Zend open tafels (Commidea)
1567=50= Zend open tafels met geprinte nota's (Commidea)
1568=50=Gebruik de portable Thyron?
1569=50=Gebruik Ocius pinautomaat?


[REINDEX PLU]

1581=50=Bereik PLU PGM
1582=50=Alfabetisch sorteren PLU bestand OK?
1583=50=Alfabetisch sorteren PLU bestand
1584=50=Van PLU
1585=50=tm PLU
1586=50=Bereik OK?


[RANGE PROGRAMMING CLERK]

1601=50=Bereik verkoper PGM
1602=50=Van verkoper
1603=50=tm verkoper


[EXPORT CUSTOMER FILE]

1611=50=Exporteer Klanten bestand
1612=50=Exporteer alleen naam en adres?
1613=50=Exporteer naam en adres met verkoopgegevens?


[RANGE PROGRAMMING CUSTOMER]

1621=50=Bereik Klanten PGM
1622=50=Van klant
1623=50=tm klant


[CURRENCY EXCHANGE]

1631=50=Wisselkoers
1632=50=---------- Vreemde valuta ----------
1633=50=Vreemde valuta aantal decimalen
1634=50=Laat vreemde valuta totaal in reg.scherm zien?
1635=50=Print vreemde valuta op de bon en EJ?
1636=50=Laat vreemde valuta in klantendisplay zien?
1637=50=Wisselgeld in vreemde valuta (Nee=Euro)?
1638=50=Vreemde valuta in tweede geldlade?
1639=50=Laat wisselgeld in beide valuta zien?
1640=50=Converteer alle prijzen naar vreemde valuta?
1641=50=---------- Vreemde valuta ----------
1642=50=Euro naar valuta 1 wisselkoers
1643=50=Aantal decimalen valuta 1
1644=50=Valuta 1 gebruikt de tweede geldlade?
1645=50=Euro naar valuta 2 wisselkoers
1646=50=Aantal decimalen valuta 2
1647=50=Valuta 2 gebruikt de tweede geldlade?
1648=50=Euro naar valuta 3 wisselkoers
1649=50=Aantal decimalen valuta 3
1650=50=Valuta 3 gebruikt de tweede geldlade?
1651=50=Euro naar valuta 4 wisselkoers
1652=50=Aantal decimalen valuta 4
1653=50=Valuta 4 gebruikt de tweede geldlade?
1654=50=Euro naar valuta 5 wisselkoers
1655=50=Aantal decimalen valuta 5
1656=50=Valuta 5 gebruikt de tweede geldlade?
1657=50=Euro naar valuta 6 wisselkoers
1658=50=Aantal decimalen valuta 6
1659=50=Valuta 6 gebruikt de tweede geldlade?
1660=50=Euro naar valuta 7 wisselkoers
1661=50=Aantal decimalen valuta 7
1662=50=Valuta 7 gebruikt de tweede geldlade?
1663=50=Euro naar valuta 8 wisselkoers
1664=50=Aantal decimalen valuta 8
1665=50=Valuta 8 gebruikt de tweede geldlade?
1666=50=Euro naar valuta 9 wisselkoers
1667=50=Aantal decimalen valuta 9
1668=50=Valuta 9 gebruikt de tweede geldlade?
1669=50=Euro naar valuta 10 wisselkoers
1670=50=Aantal decimalen valuta 10
1671=50=Valuta 10 gebruikt de tweede geldlade?


[HOTEL POSTING]

1681=50=Hotel koppeling
1682=50=Hotel systeem
1683=50=Map van hotel server
1684=50=Gebruik van letters in kamernummers?
1685=50=Zend hoofdgroepen naar hotel server (nee=groepen)?
1686=50=Melding van bepaalde shift zoals ontbijt of lunch?
1687=50=Velden tussen " inbegrepen in CSV export bestand?
1688=50=Bij gebruik reservering Z dag rapport zenden?
1689=50=Hotel audit print alleen ---------
1690=50=Print verkoopgegevens?
1691=50=Print groep/hoofdgroep totalen?
1692=50=Snij de bon af na iedere transactie?


[SPLIT REPORTING]

1711=50=Rapport splitsen
1712=50=Maak gebruik van rapport splitsen?
1713=50=Rapport 1 toevoegen aan periode 1 verkoop?
1714=50=Rapport 1 toevoegen aan periode 2 verkoop?
1715=50=Rapport 1 toevoegen aan periode 3 verkoop?
1716=50=Rapport 2 toevoegen aan periode 1 verkoop?
1717=50=Rapport 2 toevoegen aan periode 2 verkoop?
1718=50=Rapport 2 toevoegen aan periode 3 verkoop?
1719=50=Stop elektronisch journaal 1 tijdens rapport 2?
1720=50=Stop elektronisch journaal 2 tijdens rapport 2?
1721=50=Stop journaal printer tijdens rapport 2?
1722=50=Stop bonnummer tijdens rapport 2?
1723=50=Zondag --------------------
1724=50=Maandag --------------------
1725=50=Dinsdag --------------------
1726=50=Woensdag --------------------
1727=50=Donderdag --------------------
1728=50=Vrijdag --------------------
1729=50=Zaterdag --------------------
1730=50=Rapport 2 start tijd
1731=50=Rapport 2 einde tijd


[POCKETTOUCH]

1741=50=PocketTouch
1742=50=Type Menu registratie
1743=50=Alfabetisch sorteren?
1744=50=Level shiften in menu levels laten zien?
1745=50=Mag alleen nota's openen?
1746=50=Mag alleen tafels openen?
1747=50=Mag alleen tafels op een plattegrond openen?
1748=50=Zelfde verkoper aanmelden na opnieuw opstarten?
1749=50=PLU venster blijft op het scherm tot annuleren?
1750=50=Toegangscode om PocketTouch af te sluiten
1751=50=PocketTouch gebruikt TCP/IP (IPX&PTGateway)?


[FIDELITY]

1761=50=Fidelity
1762=50=Gebruik Fidelity magneetkaarten?
1763=50=Kaartnummer prefix ID (5 karakters)
1764=50=Verplicht SKU# invoeren?


[PASSWORDS]

1771=50=Toegangscodes
1772=50=PGM Stand Master toegangscode
1773=50=Verborgen menu toegangscode
1774=50=Periode 1 rapporten toegangscode
1775=50=Periode 2 rapporten toegangscode
1776=50=Periode 3 rapporten toegangscode


[MIXANDMATCH]

1781=50=Korting bij aantal


[TIMEZONES]

1811=50=Dagdeel Tijden
1812=50=Dagdeel Start Tijd
1813=50=Dagdeel Eind Tijd


[TIMEZONESDETAILLINK]

1821=50=Dagdeel Rapport
1822=50=Rapport koppeling


[JOURNAL CONTROL]

1831=50=Journaal vlag
1832=50=Print niet de tijd in het EJ?
1833=50=Print niet de datum in het EJ?
1834=50=Print niet bonnummer in het EJ?
1835=50=Gebruik niet journaal 2?


[NON PLU TABLE]

1841=50=Gewogen artikel
1842=50=BARCODE INDELING:
1843=50=Code is gewicht? (Nee=prijs)
1844=50=Aantal decimalen


[PLU PRICES]

1851=50=PLU Prijzen
1852=50=Eerste prijs    
1853=50=Tweede prijs
1854=50=Derde prijs


[SET DATE AND TIME]

1861=50=Stel datum en tijd in
1862=50=Stel de tijd in
1863=50=Stel de datum in


[PLU PRICE LEVEL COPY]

1865=50=PLU Prijs Level kopie
1866=50=Kopie van Prijs Level
1867=50=Kopie naar Prijs Level
1868=50=Van PLU
1869=50=tm PLU
1870=50=          OK?


[PLU STOCK]

1875=50=Voer voorraad in om toe te voegen en druk ENTER
1876=50=Voeg PLU Voorraad toe
1877=50=Voer voorraad in om af te schrijven en druk ENTER
1878=50=Schrijf PLU Voorraad af


[PLU NAMES]

1891=50=PLU Namen
1892=50=Omschrijving
1893=50=Update toetsenbord tekst?


[CLERK NAMES]

1895=50=Verkoper namen
1896=50=Omschrijving


[SCROLLING MESSAGE]

1901=50=Lichtkrant
1902=50=Bericht       
1903=50=Klantendisplay bericht  ->


[RECEIPT MESSAGE]

1905=50=Logos
1906=50=Tekst logo bovenaan -----------------------
1907=50=Bon commercieel bericht --------------
1908=50=Tekst logo onderaan ---------------
1909=50=PIN logo bovenaan -------------------
1910=50=PIN logo onderaan, kopie zaak ---------
1911=50=Pin logo onderaan, kopie klant ---------
1912=50=Rapport logo bovenaan ----------------------
1913=50=Handtekening ----------------------
1914=50=BTW nummer ----------------------


[ERROR MESSAGE]

1921=50=Foutmeldingen
1922=50=Foutmelding 1
1923=50=Foutmelding 2


[FIXED CHARACTER]

1931=50=Vaste karakter 1
1932=50=------------ Prijs shiften
1933=50=Vaste karakter 
1934=50=------------ Seriele poort namen
1935=50=------------ Valuta symbolen
1936=50=Vaste karakter 6
1937=50=Vaste karakter 8
1938=50=------------ Sleutelstanden
1939=50=------------ Prijs levels
1940=50=------------ Terminal locaties
1941=50=------------ Klant locaties
1942=50=------------ Verscheidene symbolen
1943=50=------------ Hotel Shiften
1944=50=------------ Valuta tekst voor cheques
1945=50=Vaste karakter 2


[PLU GROUPS]

1951=50=PLU Hoofdgroep
1952=50=Omschrijving


[MENU LEVEL NAMES]

1961=50=Menu Level Namen
1962=50=Home stand Level
1963=50=X stand Level
1964=50=Z stand Level
1965=50=Manager stand Level
1966=50=Verkoper stand Level 


[CHECK TEXT]

1971=50=Nota tekst
1972=50=Nota type
1973=50=Nota nummer
1974=50=Tekst


[EMPLOYEE JOBS]

1981=50=Verkoper taken
1982=50=Taak tekst
1983=50=Shift


[EMPLOYEE SHIFTS]

1985=50=Verkoper Shiften
1986=50=Shift tekst
1987=50=Shift start tijd
1988=50=Shift eind tijd
1989=50=Start van pauzes
1990=50=Einde pauzes
1991=50=Pauze is toegestaan
1992=50=Start tijd te laat (minuten)
1993=50=Eind tijd te laat (minuten)


[TIMEANDATTENDANCE]

1995=50=Tijd & Aanwezig
1996=50=Rounding of times (minutes)
1997=50=Tijd wijzigingen systeem klok vastleggen?
1998=50=Registreer niet meer dan 14 werkuren per dag?
1999=50=Print korte bon na inklokken?


[IRC CONTROL]

2011=50=IRC vlag
2012=50=Automatisch IRC initialiseren na opstarten?
2013=50=Na automatisch IRC initialiseren, bon printen?


[3RD PARTY CUSTOMER SERVER CONTRO]

2021=50=Externe koppeling klantenkaarten
2022=50=Map voor server bestanden
2023=50=terminal nummer
2024=50=Velden met " inbegrepen in CSV export bestand?
2025=50=Gebruik track 1 magneetkaarten?
2026=50=Gebruik track 2 magneetkaarten?
2027=50=Autom. bon als een klantenkaart wordt gebruikt?
2028=50=Interface met Fidelity's ILAPopup.dll?


[MIX AND MATCH 2]

2041=50=Korting bij aantal 2


[MEMORY ALLOCATION]

2081=50=Geheugenindeling


[TABLE RESERVATIONS]

2091=50=Tafel Reservering
2092=50=---------- Tijd periode ----------
2093=50=Reservering tijd periode start
2094=50=Reservering tijd periode einde
2095=50=---------- Stortingen ----------
2096=50=Transactie toets voor ontvangen stortingen
2097=50=Storting van reservering in de nota?
2098=50=Reservering storting bij geld in lade in rapport
2099=50=Tijd tabel is gereserveerd voor boeking
2100=50=Standaard duur van een boeking
2101=50=---------- Dagdelen ----------
2102=50=Tafels gereserveerd per dagdeel (nee=per tijd)?
2103=50=Dagdeel
2104=50=start tijd
2105=50=Waarschuwing bij openen van gereserveerde tafel?


[status keys]

2121=50=Status toets programmeren
2122=50=Omschrijving
2123=50=Update toetsenbord tekst?
2124=50=Toets Type
2125=50=Print op bon?
2126=50=Inclusief couvert?
2127=50=Subtotaal is vreemde valuta?
2128=50=Schakelen tussen Euro en vreemde valuta?
2129=50=Invoeren letters is toegestaan?
2130=50=Print op klantenbon?
2131=50=Print op KP1?
2132=50=Print op KP2?
2133=50=Print op KP3?
2134=50=Print op KP4?
2135=50=Print op KP5?
2136=50=Print op KP6?
2137=50=Print op KP7?
2138=50=Print top KP8?
2139=50=Print in rood op keukenprinters
2140=50=Print op KV1?
2141=50=Print op KV2?
2142=50=Genereer een volgende ordernummer?
2143=50=Stuur een melding naar de terminals?
2144=50=Popup naam van de klant?
2145=50=Print een korte bon?
2146=50=     met gedeelte voor handtekening?
2147=50=Alleen handmatig invoeren?
2148=50=Gebruik willekeurige PLU Codes (Nee=geheugen nr)?
2149=50=Zoek in gekoppelde PLU Hoofdgroep
2150=50=In alfabetische volgorde?
2151=50=Kijk alleen naar aangemelde verkopers
2152=50=Prijs Shift
2153=50=Vaste verkoper
2154=50=Print op bon/journaal
2155=50=Gebruik Accountnummer (Nee=geheugen nr)?
2156=50=Gebruik externe koppeling klantenkaart (NIET ICRTouch)?
2157=50=Vaste klantennummer
2158=50=------------------------------- Klantenbon
2159=50=Sorteer per hoofdgroep?
2160=50=Sorteer per groep?
2161=50=Sorteer alleen met totalen?
2162=50=---------------------------- Tafelbeheer nota's
2163=50=Zelfde artikelen optellen?
2164=50=Print Datum/Tijd scheidingsteken?
2165=50=Print alleen toegevoegde artikelen?
2166=50=Alleen voor aangemelde klant?
2167=50=Automatisch nieuwe nota?
2168=50=Geen numerieke ingave mogelijk?
2169=50=Gekoppelde menuscherm
2170=50=Menuscherm laten zien tot ESC?
2171=50=Verwijder couvert?
2172=50=Couvert instellen?
2173=50=Valuta
2174=50=Menu Shift
2175=50=Prijs Level
2176=50=Alleen van invloed op huidige verkoop?
2177=50=Laat huidige prijs level op toetsenbord tekst zien?
2178=50=Bereken geen BTW 1?
2179=50=Bereken geen BTW 2?
2180=50=Bereken geen BTW 3?
2181=50=Bereken geen BTW 4?
2182=50=Bereken geen BTW 5?
2183=50=Wijzig naar Prijs Level
2184=50=Artikel lijst nummer
2185=50=Gebruik geprogrammeerde locatie map?
2186=50=Verwijder bestand na gebruik?
2187=50=Popup aantal rekeningen?
2188=50=Mag een nota openen?
2189=50=Laat alleen nota's van deze verkoper zien?
2190=50=Laat nota bestand 1 zien (nota)?
2191=50=Laat nota bestand 2 zien (tafel)?
2192=50=Laat nota bestand 3 zien (toekomst)?
2193=50=Laat nota bestand 4 zien (toekomst)?
2194=50=Data backup?
2195=50=Data inlezen?
2196=50=----------------------------------------- Locatie
2197=50=Floppy Drive?
2198=50=Data Backup gedeelte?
2199=50=PGM3 Programmeerbaar gedeelte?
2200=50=Lade totalen
2201=50=Open lade als er geen bedrag is ingevoerd?
2202=50=Voeg vaste tellers toe aan kasdeclaratie?
2203=50=Vaste eenheid
2204=50=Verplicht X toets bij vermenigvuldigen?
2205=50=Preset Rapport
2206=50=Sorteer Rapport
2207=50=Popup Groepen bereik?
2208=50=Popup PLU Hoofdgroep bereik?
2209=50=Popup klanten groep bereik?
2210=50=Print alleen voor aangemelde verkoper?
2211=50=Laat in display zien?
2212=50=Print rapport per terminal individueel?
2213=50=Tel de rapporten van de terminals bij elkaar op
2214=50=Alleen een rapport voor deze locatie?
2215=50=Print een rapport van alle locaties?
2216=50=Samengesteld rapport


[TRANSACTION KEY]

2231=50=Transactie toets programmeren
2232=50=Omschrijving
2233=50=Update toetsenbord tekst?
2234=50=Toets type
2235=50=Verplicht Eat In/Take Out?
2236=50=Prijs mag verhoogd worden?
2237=50=Prijs mag verlaagd worden?
2238=50=Waarde
2239=50=Vaste prijs mag overschreven worden?
2240=50=Slechts 1 keer per transactie gebruiken?
2241=50=Negatief saldo toegestaan?
2242=50=Plus           %
2243=50=Toepassen op alle artikelen?
2244=50=Toepassen op specifiek artikel1?
2245=50=Toepassen op specifiek artikel2?
2246=50=Toepassen op specifiek artikel3?
2247=50=Toepassen op specifiek artikel4?
2248=50=Toepassen op specifiek artikel5?
2249=50=Eerst SUB TOTAAL verplicht indrukken?
2250=50=Niet toegestaan nadat SUB TOTAAL is ingedrukt?
2251=50=Negatief           %
2252=50=Korting berekenen over alle artikelen?
2253=50=Korting mag over specifiek artikel1?
2254=50=Korting mag over specifiek artikel2?
2255=50=Korting mag over specifiek artikel3?
2256=50=Korting mag over specifiek artikel4?
2257=50=Korting mag over specifiek artikel5?
2258=50=Fout per regel (Nee=per stuk)?
2259=50=Gebruik altijd geldlade 1?
2260=50=Gebruik altijd geldlade 2?
2261=50=Print extra bon met gedeelte voor handtekening?


[FINALISE KEYS]

2281=50=Afreken toets programmeren
2282=50=vast bedrag
2283=50=Bedragbegrenzing (hoog)
2284=50=Vaste kamernummer
2285=50=Geld in de geldlade
2286=50=Geld uit de geldlade
2287=50=Open geldlade?
2288=50=Verplicht wisselgeldberekening?
2289=50=Gedeeltelijk betalen niet toegestaan?
2290=50=Niet afrekenen met deze toets?
2291=50=SUB TOTAAL verplicht?
2292=50=Automatisch een bon printen?
2293=50=Waaarschuw als een nota openstaat?
2294=50=Print Cheque?
2295=50=Alleen afrekenen bij voldoende krediet?
2296=50=Print BTW tabel (Canada)?
2297=50=Verplicht een SKU# invoeren?
2298=50=Geregistreerde bedragen in vreemde valuta?
2299=50=Popup numeriek toetsenbord bij afrekenen?
2300=50=Gebruik boekingsreferentie (nee=kammernummer)?
2301=50=Bedragbegrenzing (laag)


[CUSTOMER GROUP]

2321=50=Klanten Groepen
2322=50=Groep naam
2323=50=Type Loyaliteit
2324=50=---------- Kortingen ------------
2325=50=Kortingstarief, Alle artikelen
2326=50=Kortingstarief, Specifiek artikel 1
2327=50=Kortingstarief, Specifiek artikel 2
2328=50=Kortingstarief, Specifiek artikel 3
2329=50=Kortingstarief, Specifiek artikel 4
2330=50=--------- Loyaliteit punten ----------
2331=50=Punten per Euro, All artikelen
2332=50=Punten per Euro, Specifiek artikel 1
2333=50=Punten per Euro, Specifiek artikel 2
2334=50=Punten per Euro, Specifiek artikel 3
2335=50=Punten per Euro, Specifiek artikel 4
2336=50=Korting totaal
2337=50=Minimaal bedrag spenderen voor korting
2338=50=Print alleen een bon na berekenen korting
2339=50=Kortingstarief(1), Alle artikelen
2340=50=Kortingstarief(1), Specifiek artikel 1
2341=50=Kortingstarief(1), Specifiek artikel 2
2342=50=Kortingstarief(2), Alle artikelen
2343=50=Kortingstarief(2), Specifiek artikel 1
2344=50=Kortingstarief(2), Specifiek artikel 2
2345=50=Deze dag is start van de week
2346=50=Bedrag iedere dag afschrijven van klant
2347=50=Alleen gebruiken gedurende dagdeel?
2348=50=---------- Dagdeel 1 ------------
2349=50=Start tijd
2350=50=Eind tijd
2351=50=Toepassen op maandag?
2352=50=Toepassen op dinsdag?
2353=50=Toepassen op woensdag?
2354=50=Toepassen op donderdag?
2355=50=Toepassen op vrijdag?
2356=50=Toepassen op zaterdag?
2357=50=Toepassen op zondag?
2358=50=---------- Dagdeel 2 ------------
2359=50=Maximaal te besteden bedrag 's morgens?
2360=50=Limiet bedrag voor 's morgens
2361=50=Morgen eindigt om
2362=50=Maximaal te besteden bedrag per dag?
2363=50=Limiet bedrag voor de dag
2364=50=Prijs level
2365=50=Account klant?
2366=50=Debet Limiet
2367=50=Popup afbeelding van klant als deze aanwezig is?
2368=50=--------- Printen op de klantenbon ----------
2369=50=Print laatste transactie datum op de bon
2370=50=Print vandaag besteed op de bon
2371=50=Print aantal keren gebruikt vandaag op de bon
2372=50=Print totaal gespendeerd tm vandaag op de bon
2373=50=Print gespendeerd aan korting op de bon
2374=50=Print korting totaal op de bon
2375=50=Print adres van de klant op de bon
2376=50=Print telefoonnummer op de bon
2377=50=Print naam van de klant op de KP
2378=50=Print adres van de klant op de KP
2379=50=Print account nummer op de bon


[FILE MIX AND MATCH]

2401=50=Korting bij aantal
2402=50=Omschrijving
2403=50=Type korting
2404=50=Aantal waarvoor korting geldig is
2405=50=Bedrag
2406=50=Kortingstarief (%)
2407=50=Van invloed op BTW tabel (Canadees)
2408=50=Inclusief tweede en derde prijs van artikelen?
2409=50=Inclusief geregistreerde artikelen in nota?
2410=50=Melding dat er een aanbieding is van dit artikel?
2411=50=Aanbieding alleen geldig tijdens dag/tijd?
2412=50= Start tijd aanbieding
2413=50= Eind tijd aanbieding
2414=50= Toepassen op zondag?
2415=50= Toepassen op maandag?
2416=50= Toepassen op dinsdag?
2417=50= Toepassen op woensdag?
2418=50= Toepassen op donderdag?
2419=50= Toepassen op vrijdag?
2420=50= Toepassen op zaterdag?


[FILE MIX AND MATCH 2]

2431=50=Korting bij aantal 2
2432=50=Aantal voor aanbieding
2433=50=PLU Nr
2434=50=  Toepassen op aanbiedingsnummer


[PLU]

2451=50=Gekoppelde groep
2452=50=Gekoppelde PLU Hoofdgroep
2453=50=Menuscherm Link 1
2454=50=Menuscherm Link 2
2455=50=Menuscherm Link 3
2456=50=Menuscherm Link 4
2457=50=Menuscherm Link 5
2458=50=Menuscherm Link 6
2459=50=Menuscherm blijft tot indrukken ESC?
2460=50=Voorraad artikel?
2461=50=Foutmelding als minimale voorraad is bereikt?
2462=50=Geen verkoop als voorraad lager is dan minimum?
2463=50=Laat voorraad van PLU op de toets zien?
2464=50=Momenteel in voorraad
2465=50=Minimale voorraad
2466=50=BTW arief
2467=50=Korting bij aantal
2468=50=Mag verkocht worden als prijs=0.00?
2469=50=Prijs is negatief?
2470=50=Prijs mag overschreven worden?
2471=50= Maximale open prijs
2472=50=PLU is een kondiment?
2473=50=Print niet op bonnen en nota's?
2474=50=PLU is een weegartikel?
2475=50=Gewicht moet handmatig worden ingevoerd?
2476=50=Popup afbeelding na registreren en bevestig?
2477=50=Enkel verkoop (direct afrekenen)?
2478=50=Aantal bij Prijs 1
2479=50=Aantal bij Prijs 2
2480=50=Aantal bij Prijs 3
2481=50=Print in rood op de keukenprinter?
2482=50=Print op KP1?
2483=50=Print op KP2?
2484=50=Print op KP3?
2485=50=Print op KP4?
2486=50=Print op KP5?
2487=50=Print op KP6?
2488=50=Print op KP7?
2489=50=Print op KP8?
2490=50=Print op KV1?
2491=50=Print op KV2?
2492=50=Print op Ticket (entree/stomerij) Printer 1?
2493=50=Print op Ticket (entree/stomerij)Printer 2?
2494=50=Specifiek Artikel 1
2495=50=Specifiek Artikel 2
2496=50=Specifiek Artikel 3
2497=50=Specifiek Artikel 4
2498=50=Specifiek Artikel 5
2499=50=Commissie 1
2500=50=Commissie 2
2501=50=Commissie 3
2502=50=Commissie 4


[DEPT]

2511=50=Omschrijving


[CLERK]

2521=50=Code voor aanmelden
2522=50=Ga naar scherm na aanmelden
2523=50=Prijs level na aanmelden
2524=50=Defaults to floor plan at sign on?
2525=50=Plattegrond laten zien na aanmelden
2526=50=Verplicht een ordernummer invoeren
2527=50=Verplicht aantal klanten invoeren
2528=50=Verplicht nota of tafel openen
2529=50=Popup registreren klant na aanmelden
2530=50=Popup Eatin/Take Out na aanmelden
2531=50=Verkoper afmelden na einde transactie?
2532=50=Mag nota/tafel van een andere verkoper openen?
2533=50=Deze verkoper gebruikt lade 2?
2534=50=Deze verkoper is manager?
2535=50=Deze verkoper werkt in training?
2536=50=Verkoper mag herstellen in een nota of tafel?
2537=50=Verk. mag alleen laatst ingevoerd art. herstellen?
2538=50=Commissie tarief 1 (%)
2539=50=Commissie tarief 2 (%)
2540=50=Commissie tarief 3 (%)
2541=50=Commissie tarief 4 (%)
2542=50=Popup verkoper inklokken na aanmelden?
2543=50=Verkoper moet verplicht inklokken?
2544=30=Verkoper taak
2545=50=Mag LADE OPEN gebruiken
2546=50=Mag FOUT gebruiken
2547=50=Mag HERSTEL gebruiken
2548=50=Mag ANNULEER gebruiken
2549=50=Mag RETOUR gebruiken
2550=50=Mag PRIJS SHIFT gebruiken
2551=50=Mag PRIJS LEVELS gebruiken
2552=50=Mag MENU SCHERMEN gebruiken
2553=50=Mag lijst met actiever verkopers bekijken
2554=50=Mag een nieuwe nota of tafel openen
2555=50=Mag een eerder geopende nota of tafel openen
2556=50=Mag NIEUW/OUD nota of tafel gebruiken
2557=50=Mag een nota of tafel verplaatsen
2558=50=Mag een nota of tafel splitsen
2559=50=Mag een toeslagbedrag (+) berekenen
2560=50=Mag een kortingsbedrag (-) berekenen
2561=50=Mag een toeslagpercentage (+%) berekenen
2562=50=Mag een kortingspercentage (-%) berekenen
2563=50=Mag punten uitbetalen
2564=50=Mag zichzelf in de wacht zetten
2565=50=Mag UIT KAS gebruiken
2566=50=Mag IN KAS gebruiken
2567=50=Mag STORTEN gebruiken
2568=50=Mag BETAAL ACCOUNT gebruiken
2569=50=Mag klantengegevens op de bon printen
2570=50=Mag ZWARTE LIJST gebruiken
2571=50=Mag KLANT VERPLAATS gebruiken
2572=50=Mag WIJZIG PRIJS gebruiken
2573=50=Mag COUVERT gebruiken
2574=50=Mag journaal data van een klant bekijken
2575=50=Mag in het EJ van een andere kassa kijken
2576=50=Mag Credit Card gegevens opslaan (niet aan te bevelen)
2577=50=Mag artikelen gratis verkopen
2578=50=Mag een lijst met open nota's en tafels bekijken
2579=50=Mag de omschrijving van een nota of tafel wijzigen
2580=50=Mag CONTANT2 gebruiken
2581=50=Mag TouchPoint minimaliseren naar de Taakbalk
2582=50=Mag MENU SHIFT 2 gebruiken
2583=50=Mag UITBETALING gebruiken
2584=50=Heeft toegang tot REG stand
2585=50=Heeft toegang tot Retour stand
2586=50=Heeft toegang tot X stand 
2587=50=Heeft toegang tot Z stand
2588=50=Mag Manager functies gebruiken
2589=50=Heeft toegang tot PGM stand - Prijzen
2590=50=Heeft toegang tot PGM stand - Teksten
2591=50=Heeft toegang tot PGM stand - Alle programmeringen
2592=50=Heeft toegang tot PGM stand - Toetsenbord
2593=50=Heeft toegang tot PGM stand - Systeem stand
2594=50=Heeft toegang tot PGM stand - PGM printen
2595=50=Code van Dallassleutel
2596=30=Rapport Link Nr.


[PROGRAM SECTION2]

2601=50=ARTIKEL  
2602=50=Teller niet resetten na Z-Rapport?
2603=50=Teller niet printen in de rapporten?
2604=50=Rapport Nr         
2605=50=Periode {1-3}
2606=50=Type Rapport
2607=50=Tijd om prijs te wijzigen:
2608=50=Ga naar prijs level
2609=50=Naam van de zaak
2610=50=Cheque Printer Type
2611=50=--------------- Datum---------------
2612=50=------------ Naam Zaak -------------
2613=50=------- Bedrag omschrijving --------
2614=50=--------- Bedrag in waarde ---------
2615=50=Print?
2616=50=X Positie
2617=50=Y Positie
2618=50=Tarief %
2619=50=BTW is inclusief (VAT), Nee=achteraf?
2620=50=Terminal NR
2621=50=Locatie
2622=50=Terminal naam
2623=50=Verkopers door elkaar?
2624=50=Nota's en tafels centraliseren (nee=eigen tafels)?
2625=50=Deze terminal is de master voor nota's en tafels?
2626=50=Klantenbestand centraliseren (nee=eigen klanten)?
2627=50=Deze terminal is de master voor klantenbestand?
2628=50=Tijd en aanwezigheid centraliseren?
2629=50=Deze terminal is de master voor tijd en aanwezig?
2630=50=Gebruik TCP/IP (nee=IPX/SPX)?
2631=50=VLAN nummer (eigen netwerk)
2632=50=------------ Bonp rinter ------------
2633=50=---------- Rapport printer ----------
2634=50=----------- Klantendisplay ----------
2635=50=------------ Slip Printer -----------
2636=50=--------- Journaal Printer ----------
2637=50=-------------- Geldlade -------------
2638=50=----------- Ticket Printer 1 -----------
2639=50=----------- Ticket Printer 2 -----------
2640=50=----------- Hotel Printer/PMS ----------
2641=50=------ Pinautomaat (Direct RS232) ------
2642=50=Aangesloten op terminal nr.
2643=50=Aangesloten op 
2644=50=Aangesloten op Poort Nr.
2645=50=Backup - aangesloten op terminal nr.
2646=50=Backup - aangesloten op poort.
2647=50=Gebruik WAV geluiden (Nee=pieptoon)?
2648=50=Scherm uit GFX in Sys RAM (nee=Vid RAM)?
2649=50=Systeem bevat een mix van schermgroottes?
2650=50=Keuken Printer nr.
2651=50=Keuken Video No.
2652=50=Keuken Printer naam
2653=50=Seriele Poort nr.    
2654=50=Baud Rate
2655=50=Pariteit  
2656=50=Data Bits
2657=50=Stop Bit
2658=50=Aangesloten apparaat


[ERROR MESSAGES]

4001=40=Controleer aub de Rapport Printer
4002=40=Geen antwoord, wilt u blijven wachten?
4003=12=GEEN ANTWOORD, 
4004=12=, OPNIEUW?
4005=40=Geen antwoord van Tijd en Aanwezigheid Master
4006=40=Er is geen Tijd en Aanwezigheid Master
4007=24=Fout
4008=40=KLANT NAW GEGEVENS BESTAND IS VOL
4009=40=KLANT GEGEVENS ARTIKEL BESTAND IS VOL
4010=40=GEEN KLANT MASTER
4011=40=Geen antwoord van klant Master
4012=40=Er bestaat geen Journaal data voor die datum!
4013=60=Geen geheugen beschikbaar voor tafelbeheer Index Bestand
4014=40=RUN IRC INITIALISEREN
4015=40=Geen tafelbeheer Master!
4016=40=Printer fout, opnieuw?
4017=40=Geen antwoord van de tafelbeheer Master
4018=40=FOUT, Scale.Dll niet gevonden
4019=24=Dll fout
4020=40=Geen pointer voor weegschaal functies
4021=40=WEEGSCHAAL CHECKSUM IS VERKEERD!!!
4022=40=WEEGSCHAAL COMMUNICATIE WORDT UITGESCHAKELD
4023=40=Scale.dll niet geinitialiseerd
4024=40=Fout met apparaat aangesloten op poort
4025=40=Er zijn fouten in het licentie bestand
4026=24=Licentie bestand fout
4027=50=Geen geheugen voor Poort Output Buffers
4028=40=Printer time out
4029=40=TIMEOUT WACHTEN OP ANTWOORD
4030=40=Kan  SerialDr.dll niet lokaliseren
4031=40=SerialDr.dll
4032=60=FOUT, er is geen pointer voor alle dll functies
4033=40=Er zijn geen gegevens van deze klant
4034=40=Kan niet klanten output bestand maken
4035=40=Klanten server uitgeschakeld
4036=40=Verkeerd bestand formaat
4037=40=Kan niet ILAPopUp.Dll initialiseren
4038=50=Er is momenteel een pin transactie uitgesteld
4039=60=Geen geheugen voor plattegrond achtergrond afbeelding
4040=40=De plattegrond kan alleen worden gewijzigd op de 
4041=40=hogere resolutie machines
4042=40=NIET TIJDENS EEN VERKOOP
4043=40=ER STAAT AL EEN NOTA OPEN
4044=40=GEEN ACTIEVE VERKOOP
4045=40=GEEN SLIP PRINTER AANGESLOTEN
4046=60=Geen geheugen voor Font Set
4047=40=Fout tijdens openen Systeem font
4048=60=Kan niet standaard lade initialiseren
4049=40=HOTEL SERVER OFFLINE
4050=40=Kan niet output bestand openen
4051=40=KAMER NUMMER NIET GEVONDEN
4052=40=GEEN FOLIOS VOOR DEZE KAMER GEVONDEN
4053=40=KAN NIET KAMER ACCOUNT BESTAND OPENEN
4054=40=KAMER IS NIET BEZET
4055=40=Communicatie fout met de PMS server
4056=40=Geen antwoord van de hotel server
4057=40=ER MAG NIET GEBOEKT WORDEN OP DEZE KAMER
4058=60=Kan niet Dallassleutels initialiseren
4059=60=FOUT, er is geen pointer voor alle TMEX functies
4060=40=Geen geheugen voor iconen
4061=40=KAN NIET RESOURCE BESTAND, ICONS.RSC OPENEN
4062=60=Geen geheugen voor PLU bestand
4063=60=Geen geheugen voor Verkoper Rapport bestand
4064=60=Geen geheugen voor nota en tafel tekst
4065=60=Geen geheugen voor dagdelen
4066=60=Geen geheugen voor dagdeel Links
4067=60=Geen geheugen voor dagdeel Rapport
4068=60=Geen geheugen voor Verkoper taken
4069=60=Geen geheugen voor Verkoper Shiften
4070=60=Geen geheugen voor Verkoper transacties
4071=60=Geen geheugen voor Korting bij aantal
4072=60=Geen geheugen voor weegartikelen
4073=60=Geen geheugen voor Toetsenbord bestand
4074=60=Geen geheugen voor Multi toepassing gebied
4075=60=Geen geheugen voor Optie Scherm Lijst
4076=60=Geen geheugen voor Data Buffer
4077=60=Geen geheugen voor Optie Scherm Buffer
4078=60=Geen geheugen voor Display Buffer
4079=60=Geen geheugen voor programmmering lijst
4080=60=Geen geheugen voor PLU omschrijving Index
4081=60=Geen geheugen voor IDC Bestand
4082=60=Geen geheugen voor Klanten gegevens
4083=60=Geen geheugen voor customer artikelen
4084=60=Geen geheugen voor Reg Buffers
4085=60=Geen geheugen voor Bon Buffers
4086=60=Geen geheugen voor KP Buffers
4087=60=Geen geheugen voor Screen Saver Berichten
4088=60=Geen geheugen voor Plattegrond Achtergrond Afbeelding
4089=60=WSAStartup fout!
4090=60=WinSock fout
4091=60=De IPX Protocol is niet geinstalleerd
4092=60=Het systeem is nu ingesteld voor TCP/IP netwerken
4093=60=De netwerk poort is al in gebruik
4094=60=Deze terminal heeft geen netwerkaansluiting
4095=60=Poort fout
4096=60=verbindingsfout
4097=60=De TCP/IP Protocol is niet geinstalleerd
4098=60=De netwerk poort is al in gebruik
4099=14=Tafel Master,
4100=10=Afgesloten
4101=60=Netwerken is uitgeschakeld, nu inschakelen?
4102=60=Er is geen tafelbeheer Master toegewezen!
4103=40=Geen handhelds
4104=40=Geen backup apparaten
4105=40=Verkeerde locatie / disk onbeschrijfbaar
4106=40=Disk schrijf fout
4107=40=Disk fout
4108=40=Nieuwe Disk invoeren aub
4109=40=Disk is vol
4110=40=Disk IO fout
4111=40=Bestemming Drive vol
4112=24=wordt niet opgeslagen.
4113=24=Dit bestand is een systeem bestand
4114=40=KP fout, opnieuw?
4115=24=GEEN ANTWOORD, TERMINAL,
4116=24=KP FOUT,
4117=40=KEUKEN VIDEO
4118=40=BONPRINTER FOUT
4119=40=RAPPORT PRINTER FOUT
4120=40=SLIP PRINTER FOUT
4121=40=TICKET PRINTER FOUT
4122=40=HOTEL BOEKING PRINTER FOUT
4123=40=SMARTPHONE OFFLINE
4124=24=CONTROLEER AUB KP,
4125=50=CONTROLEER AUB BONPRINTER, OPNIEUW?
4126=50=CONTROLEER AUB RAPPORT PRINTER, OPNIEUW?
4127=50=CONTROLEER AUB SLIP PRINTER, OPNIEUW?
4128=50=CONTROLEER AUB TICKET PRINTER, OPNIEUW?
4129=50=CONTROLEER AB HOTEL BOEKING PRINTER, OPNIEUW?
4130=50=SMARTPHONE OFFLINE, OPNIEUW?
4131=40=NIET GENOEG GEHEUGEN
4132=40=Geen geheugen meer voor PLUs met barcode
4133=40=Deze twee boxen zijn niet hetzelfde.
4134=40=Deze cel kan niet worden geplitst!
4135=40=STATUS TOETS BESTAND VOL
4136=50=Selecteer eerst aub een tafel
4137=50=Verkeerde tijd ingevoerd
4138=50=Deze reservering is al gebruikt
4139=24=Kan niet Prog bestand openen,
4140=50=Verkeerde of geen Dongle
4141=50=Dit is geen TouchPoint licentie
4142=50=er staan fouten in uw licence bestand
4143=50=De juiste betalingscode is al ingevoerd
4144=50=de 28 dagen verlenging is al gebruikt
4145=24=Verkeerde betalingscode
4146=50=De software kan niet langer worden gebruikt
4147=50=U heeft de verkeerde code ingevoerd
4148=12=U heeft
4149=30=dagen om de juiste code in te voeren
4150=50=Kan niet Sharp UP5900 POS Driver initialiseren
4151=50=Kan niet Sharp UP-X500 POS Driver initialiseren
4152=50=Bestand mist, splash.rsc
4153=50=Splash.Rsc is niet groot genoeg voor deze resolutie
4154=50=Corrupt bestand, splash.rsc
4155=50=X of Z stand is niet toegestaan
4156=50=Manager stand is niet toegestaan
4157=50=Verkoper bestaat niet
4158=50=Programmeren is niet toegestaan
4159=50=Er bestaat geen afbeelding voor deze PLU
4160=50=Retour stand is niet toegestaan
4161=50=Bonprinter niet aangesloten op deze terminal!
4162=50=er is geen bonprinter aangesloten
4163=50=PLU NIET GEVONDEN!
4164=50=Verkeerde kaart
4165=50=De transactie was geannuleerd
4166=50=De transactie werd afgewezen
4167=50=Kan de transactie niet uitstellen
4168=50=Pinautomaat bestaat niet of is offline
4169=50=Pinautomaat reageert niet
4170=50=Pinautomaat verwierp de transactie
4171=50=Timeout wachten op antwoord van apparaat
4172=50=Het apparaat verwerkt al een transactie
4173=50=Onbekend antwoord
4174=50=Kan niet TransLtr.Dll lokaliseren
4175=50=Er is geen pointer voor alle vertaal functies
4176=50=Kan vertaal database niet openen
4177=50=Kan niet MSPOS_USB.DLL vinden
4178=50=Kan niet alle USB geldlade functies krijgen
4179=50=Geldlade bestaat niet
4180=50=Kan niet alle webserver functies krijgen
4181=50=Kan niet MPLEX.DLL openen

[BUTTON TEXTS]

4301=9=EINDE
4302=12=OPEN
4303=12=VERPLAATS
4304=12=INFO
4305=12=SPLITS
4306=21=REKENING
4307=12=SLIP
4308=12=DELEN
4309=5=POS
4310=5=AFM
4311=5=WIS
4312=12=ANNULEER
4313=11=*TYPE*
4314=11=SAMENVOEG
4315=11=KOPIE LVL
4316=11=PASTE LVL
4317=11=SPLITS
4318=11=Wyzig tekst
4319=9=CAPS
4320=9=SHIFT
4321=9=BACKSP
4322=9=ENTER
4323=9=ESC
4324=9=PLAATJE
4325=12=NIEUW RSRV
4326=12=FUNCTIES
4327=12=SLUIT
4328=12=DATUM:
4329=12=OP
4330=12=NEER
4331=12=OPEN TAFEL
4332=9=VORIG
4333=9=VOLGEND
4334=9=SLOT

[FUNCTION KEY TYPES]

4401=24=PLU LIJST
4402=24=MENU LEVEL SHIFT

[PGM MENU NAMES]

4501=24=Programmering lezen
4502=24=Artikel & omschrijving
4503=24=Karakter & Bericht
4504=24=Systeem Programmering
4505=24=PLU Prijs
4506=24=Functie toetsen
4507=24=PLU omschrijving
4508=24=Van PLU
4509=24=tm PLU
4510=24=      OK?
4511=24=Teller niet resetten?
4512=24=Teller niet in rapporten printen?
4513=24=Toets type:
4514=24=In geldlade:
4515=24=Uit geldlade:
4516=24=Waarde:
4517=24=PLU
4518=24=Betaalwijze toets
4519=24=Transactie toets
4520=24=Status toets
4521=24=Groep
4522=24=Verkoper instellingen
4523=24=Verkoper autorisatie
4524=24=Sleutelstand
4525=24=Verkoper Dallassleutel
4526=24=PLU Lijst
4527=24=Vaste Teller
4528=24=Korting bij aantal
4529=24=Batch Rapport
4530=24=Taak uitvoeren
4531=24=Klanten
4532=24=Klant groepen
4533=24=BTW tabel
4534=24=Weegartikel
4535=24=Verkoper
4536=24=PLU Hoofdgroep
4537=24=Dagdelen
4538=24=Dagdeel Rapport
4539=24=Nota Tekst
4540=24=Verkoper Taak
4541=24=Verkoper Shift
4542=24=Korting bij aantal 2
4543=24=Alle Programmeringen
4544=24=Systeemvlaggen
4545=24=Cheque Print
4546=24=Systeem Configuratie
4547=24=Apparaat aansluiten
4548=24=Keukenprinters
4549=24=I/O Parameter
4550=24=Verkoper Rapport 1
4551=24=Verkoper Rapport 2
4552=24=Verkoper bereik
4553=24=Systeemvlag 1
4554=24=Systeemvlag 2
4555=24=Order vlag
4556=24=Rapport vlag
4557=24=Tafelbeheer
4558=24=Print vlag
4559=24=Slip print vlag
4560=24=Journaal vlag
4561=24=Automatisch zenden
4562=24=Comms vlag
4563=24=PLU vlag
4564=24=EFT vlag
4565=24=Wisselkoersen
4566=24=Hotel boeking
4567=24=Splits rapport
4568=24=PocketTouch
4569=24=Fidelity
4570=24=Ticket uitgifte
4571=24=Toegangscodes
4572=24=Tijd & aanwezigheid
4573=24=IRC Netwerk
4574=24=Externe koppeling klantenkaart
4575=24=Tafel Reserveringen
4576=24=Klant instellingen
4577=24=Klant vlag
4578=24=bereik klant instellingen
4579=24=Exporteer klantenbestand
4580=24=Verkoper bereik programmering
4581=24=PLU Programmering
4582=24=PLU bereik
4583=24=Reindex PLU bestand
4584=24=Korting x aantal - Type1
4585=24=Korting x aantal - Type2
4586=24=Prijzen & Voorraad
4587=24=PLU Prijs Level kopie
4588=24=PLU Prijzen bereik
4589=24=PLU Voorraad toevoegen
4590=24=PLU Voorraad eraf
4591=24=Set Systeem Datum & Tijd
4592=24=Tekst programmeren
4593=24=Verkoper namen
4594=24=Lichtkrant
4595=24=Logos
4596=24=Foutmeldingen 1
4597=24=Foutmeldingen 2
4598=24=Vaste karakter 1
4599=24=Vaste karakter 2
4600=24=Menu Level Namen 1
4601=24=Menu Level Namen 2
4602=24=Systeem stand
4603=24=File grootte


[PGM MENU OPTIONS]

4701=24=Gekoppelde Groep
4702=24=Gekoppelde PLU Hoofdgroep
4703=24=GEEN FUNCTIE
4704=24=CONTANT
4705=24=CHEQUE
4706=24=PIN
4707=24=ACCOUNT
4708=24=HOTEL VERPLAATS
4709=24=CONTANT2
4710=24=ANNULEER
4711=24=FOUT
4712=24=LADE OPEN
4713=24=RETOUR
4714=24=NOTA VERPLAATS
4715=24=TAFEL SLUIT
4716=24=+ BEDRAG
4717=24=- BEDRAG
4718=24=+%
4719=24=-%
4720=24=PUNTEN UITBETALEN
4721=24=UIT KAS
4722=24=IN KAS
4723=24=STORTEN
4724=24=ACCOUNT BETALEN
4725=24=WIJZIG PRIJS
4726=24=GRATIS ARTIKEL
4727=24=UITBETALING
4728=24=SUB TOTAAL
4729=24=BON AAN/UIT
4730=24=VERKOPER NUMMER
4731=24=AFMELDEN
4732=24=AUTO VERKOPER
4733=24=WIJZIG VERKOPER
4734=24=MENU LEVEL SHIFT
4735=24=MENU LEVEL SHIFT 2
4736=24=ESCAPE
4737=24=PRIJS SHIFT
4738=24=PRIJS LEVEL WIJZIG
4739=24=VALUTA SHIFT
4740=24=BTW
4741=24=WISSELKOERS
4742=24=REG WIN PIJL BOVEN
4743=24=REG WIN PIJL BENEDEN
4744=24=PERIODE 1 RAPPORTEN
4745=24=PERIODE 2 RAPPORTEN
4746=24=PERIODE 3 RAPPORTEN
4747=24=BATCH RAPPORT
4748=24=INLINE PERIODE 1 RAPPORT
4749=24=INLINE PERIODE 2 RAPPORT
4750=24=INLINE PERIODE 3 RAPPORT
4751=24=INLINE BATCH RAPPORT
4752=24=KASDECLARATIE
4753=24=KASDECLARATIE 2
4754=24=BEKIJK JOURNAAL
4755=24=AFSTAND JOURN. BEKIJKEN
4756=24=BON PRINT
4757=24=SLIP PRINT
4758=24=REKENING DELEN PRINT
4759=24=VALIDATIE PRINT
4760=24=NIEUWE NOTA
4761=24=OUDE NOTA
4762=24=NIEUWE/OUDE NOTA
4763=24=SPLITS NOTA
4764=24=COUVER
4765=24=PLATTEGROND
4766=24=WIJZIG NOTA TEKST
4767=24=BEKIJK OPEN NOTA'S
4768=24=TAFEL RESERVERING
4769=24=BEKIJK ACTIEVE VERKOPERS
4770=24=ORDER NUMMER
4771=24=KLANTEN
4772=24=TEKST BERICHT
4773=24=SKU NUMMER (#)
4774=24=CREDIT CARD OPSLAAN
4775=24=LOCATIE
4776=24=KLANTNUMMER
4777=24=KLANTEN PRINTNE
4778=24=KLANT ZWARTE LIJST
4779=24=KLANT VERPLAATS
4780=24=BEKIJK KLANT GEGEVENS
4781=24=KLANT CALLER ID AANMELDEN
4782=24=FIDELITY LOYALTY CARD
4783=24=VERMENIGVULDIG
4784=24=GEWICHT
4785=24=PLU NUMMER
4786=24=PLU HOOFDGROEP ZOEKEN
4787=24=PLU LIJST
4788=24=PRIJS OPVRAGEN
4789=24=PLU AFBEELDING OPVRAGEN
4790=24=PLU NOTITIES OPVRAGEN
4791=24=WACHTEN
4792=24=DOORGAAN
4793=24=EAT IN
4794=24=TAKE OUT
4795=24=DOWNLOAD GRAFISCH LOGO
4796=24=VERKOPER FUNCTIES
4797=24=STUUR PROGRAMMERING
4798=24=ONTVANG PROGRAMMERING
4799=24=DATA BACKUP/INLEZEN
4800=24=INLINE FUNCTIES
4801=24=WIJZIG PLATTEGROND
4802=24=MINIMALISEER TOUCHPOINT
4803=24=INKLOKKEN
4804=24=UITKLOKKEN
4805=24=PAUZE START
4806=24=PAUZE EINDE
4807=24=ARTIKELEN LIJST IMPORT
4808=24=REG STAND
4809=24=X/Z STAND
4810=24=PROGRAM STAND
4811=24=HOME STAND
4812=24=TERMINAL AFSLUITEN
4813=24=RETOUR STAND
4814=24=MANAGER FUNCTIES
4815=24=In Lade Link
4816=24=Rapporten
4817=24=Geen Rapport
4818=24=Prijs Level
4819=24=Prijs lvl niet gewijzigd
4820=24=Popup voor prijs level
4821=24=Apparaat
4822=24=Geen apparaat aangesloten
4823=24=MPAD Keuken Video
4824=24=Modem
4825=24=Direct PC
4826=24=Barcodescanner
4827=24=Magnetische Kaartlezer
4828=24=CRB Muntautomaat
4829=24=Hotel PMS (MICROS 4700)
4830=24=Thyron Paycell
4831=24=Avery FX120 Weegschaal
4832=24=Crucible Tech CID Unit
4833=24=Bestand Lijst
4834=24=Geen bestand
4835=24=ONGEBRUIKT
4836=24=Geen Link
4837=24=Baudrate
4838=24=Pariteit
4839=24=GEEN
4840=24=EVEN
4841=24=ONEVEN
4842=24=Data Bits
4843=24=Stop Bit
4844=20=Poort
4845=24=Niet aangesloten
4846=24=Klanten Groep Link
4847=24=Toetsenbord Menu Shifts
4848=24=Standaard menu level
4849=24=ONGEBRUIKT
4850=24=1st@ Prijs
4851=24=2e@ Prijs
4852=24=3e@ Prijs
4853=24=Preset verkoper
4854=24=Verkoper aanmelden
4855=24=Preset Batch Rapport
4856=24=Popup voor Rapport
4857=24=Inline Rapporten
4858=24=Popup voor een groep
4859=24=Zoek in alle groepen
4860=24=BTW tarief
4861=24=Geen BTW
4862=24=Types Loyaliteit
4863=24=Standaard korting
4864=24=Punten
4865=24=Joes
4866=24=Borellis
4867=24=Schoolmaaltijden
4868=24=ONGEBRUIKT
4869=24=Dag van de week
4870=24=Aangesloten op Terminal
4871=24=Mijn apparaat
4872=24=GEEN NAAM
4873=20=Terminal NT
4874=24=lade Poort
4875=24=Geen lade aangesloten
4876=24=Apparaat op COM1
4877=24=Apparaat op COM2
4878=24=Apparaat op COM3
4879=24=Apparaat op COM4
4880=24=Apparaat op COM5
4881=24=Apparaat op COM6
4882=24=Sorteren
4883=24=Niet sorteren
4884=24=Sorteer per groep
4885=24=Sorteer per hoofdgroep
4886=24=Locaties
4887=24=HOTEL SYSTEEM
4888=24=TOUCHPOINT SERVER SPEC
4889=24=AFSTAND AUDIT PRINTER
4890=24=MICROS 4700 EMULATIE
4891=24=QT2000 Emltn (IPL v4.00)
4892=24=GUESTLINE/REZLYNX
4893=24=GUESTMASTER PRTL (1.0.4)
4894=10=Valuta
4895=24=Types werking
4896=24=Menu levels
4897=24=Groepen
4898=24=PLU Hoofdgroepen
4899=24=ONGEBRUIKT
4900=24=Types korting bij aantal 
4901=24=Korting bedrag 
4902=24=Korting % 
4903=24=Voer prijs in
4904=24=Korting bedrag goedkoops
4905=24=Korting % goedkoop
4906=24=Korting bdr laatst art.
4907=24=Korting % laatst artikel
4908=24=Type Keuken Video
4909=24=MPAD - SPS1000 Emulatie
4910=24=Nummer is
4911=24=Order nummer
4912=24=Nota/Tafel nummer
4913=24=Bonnummer
4914=24=Afronidngs methode
4915=24=Afronden op (4/5)
4916=24=Naar boven afronden
4917=24=Naar beneden afronden
4918=24=Type nota
4919=24=Verkoper Shiften
4920=24=Geen shift
4921=24=Verkoper taken
4922=24=ONGEBRUIKT
4923=24=PIN SYSTEEM
4924=24=COMMIDEA WINTI
4925=24=COMMIDEA ILINK/BILL MGR
4926=24=COMMIDEA DRCT TO VERIFNE




#####################################################################
# ICRTouch Version 2.531 - 5/4/2006                                 #
#####################################################################



[FILE NAMES]

73=24=Toetsenbord 2
74=3=PLU
75=3=FIN
76=3=TRN
77=3=STS
78=3=FXD
79=8=GEEN FNC
80=8=VERKEERD	

[TICKET ISSUANCE]

1094=50=Print naam klant

[3RD PARTY CUSTOMER SERVER CONTRO]

2029=50=Klant nummers met letters?
2030=50=Gebruik Rebound Barcodescanner?

[status keys]

2217=50=Batch bestand nummer
2218=50=Wachten totdat Batch klaar is
2219=50=Batch bestand verbergen

[CUSTOMER GROUP]

2380=50=Print telefoonnummer op KP

[CLERK]

2597=50=Mag Batch starten

[SKIN PROGRAM]

2701=50=Huidige layout

[DISPLAY MESSAGES]

3903=40=Font
3904=40=Afbeelding
3905=40=Geen afbeelding
3906=40=Toets vorm

[ERROR MESSAGES]

4182=40=Kan niet BarcodeReader.Exe uitvoeren

[BUTTON TEXTS]

4335=24=Type
4336=24=Font
4337=24=Vorm
4338=24=Tekst kleur
4339=24=Achtergrond kleur

[PGM MENU NAMES]

4604=24=Layout

[PGM MENU OPTIONS]

4927=24=Start Batch bestand


#####################################################################
# ICRTouch Version 2.533 - 16/1/2007                                #
#####################################################################

[PRINTER MESSAGES]

543=24=EAT IN/TAKE OUT GEWIJZIGD,

[SYSTEM CONTROL 2]

1048=50=verkoop totaal afronden 

[TICKET ISSUANCE]

1095=50=Regels doorvoeren voor afsnijden

[AUTOBROADCAST]

1303=50=Auto zenden IRC, IP Printers

[EFT CONTROL]

1570=50=Gebruik Verkoopnr in zaak ref?

[FIXED CHARACTER]

1946=50=------------ Eat In/Take Out

[status keys]

2220=50=Wissel BTW tarieven (1-5 => 6-10)?
2221=50=Laat eat in/take out op de toets zien?

[CLERK]

2598=50=Selecteer standaard Eat In of Take Out

[IPPRINTERS PROGRAM]

2751=50=Naam
2752=50=IP Adres

[DISPLAY MESSAGES]

3907=24=Niet gebruikt

[ERROR MESSAGES]

4183=40=Komt door te weinig opslagcapaciteit
4184=40=journaal 2 is uitgeschakeld

[PGM MENU OPTIONS]

4928=24=Standaard Eat In/Take Out
4929=24=TouchKitchen

4930=24=Niet afronden
4931=24=Afronden op 0,5,10
4932=24=Afronden op 0,10 (4/5)
4933=24=Afronden op 0,50,100
4934=24=Afronden op 0,25,50,75,100


#####################################################################
# ICRTouch Version 2.534 - 7/6/2007                                 #
#####################################################################

[ORDER CONTROL]

1149=50=Niet in het Nederlands printen?

[CHECK TRACKING]

1222=50=Print niet aantal artikelen op de nota's?
1223=50=Print niet Z reset Open Nota's in batch rapporten?

[PRINT CONTROL]

1255=50=Print niet aantal artikelen op klantenbon?

[CUSTOMER CONTROL]

1518=50=Zoek acc nummer bij onbekende track1 MCR?
1519=50=Zoek acc nummer bij onbekende track2 MCR?
1520=50=Local area code

[JOURNAL CONTROL]

1836=50=Print niet aantal artikelen in EJ?

[status keys]

2222=50=Subtotaal na shift?

[PROGRAM SECTION2]

2659=50=Niet optellen bij totaal in lade?

[TRANSACTION KEY]

2262=50=Vaste stortingen in lade totalen

[PGM MENU OPTIONS]

4935=24=Vaste instellingen In Lade Link
4936=24=Altijd popup


#####################################################################
# ICRTouch Version 2.535 - 25/9/2007                                #
#####################################################################

[REPORT PRINTING]

975=40=CHECK BUP MSTR DOWN
976=40=SWITCHED TO CHECK BUP

[PRINT CONTROL]

1256=50= Centreren?
1257=50= Centreren?
1258=50= Centreren?
1259=50=Centreer handtekening?
1260=50= Centreer?
1261=50= Centreer?

[PASSWORDS]

1777=50=Codes opnieuw invoeren na vastzetten terminal

[CLERK]

2599=50=Mag klant gegevens wijzigen
2600=50=Mag handmatig punten wijzigen

[TRANSACTION KEY]

2263=50=Vast punten bedrag
2264=50=Optellen bij punten? {nee=aftrekken}
2265=50=Ingevoerde waarde is bedrag? {nee=punten}

[PROGRAM SECTION2]

2660=50=Deze terminal is Nota Backup Master?

[DISPLAY MESSAGES]

3908=24=Gebruik backup Nota Mstr
3909=24=Stuur nota bst backup
3910=40=Stuur Indexen
3911=40=Stuur Detail
3912=50=Nota Backup Master is nu Master
3913=50=Is dit incorrect, neem dan contact op met uw dealer!
3914=40=Stuur Tafel reserveringen
3915=16=Opwaardeer unit
3916=24=Seconden?
3917=24=Programmeer Dallassltl
3918=24=Code weer gebruiken

[ERROR MESSAGES]

4185=50=De nota master is momenteel online!

[PGM MENU OPTIONS]

4937=24=SCHERM WISSEN
4938=24=VOORRAAD OPVRAGEN
4939=24=WIJZIG KLANT
4940=24=TERMINAL VASTZETTEN
4941=24=PUNTEN WIJZIGEN


#####################################################################
# ICRTouch Version 2.536 - 23/4/2008                                #
#####################################################################

[FILE NAMES]

81=24=Product Hfdgrp teksten
82=24=Product Hfdgrp artikel
83=24=PLU Menu
84=24=KP Categorie
85=24=Reden Tabel
86=24=Nota Index
87=24=NOTA Detail
88=24=IP Printers

[REPORT DISPLAY MESSAGES]

675=40=Printing Reden tabel
676=40=Reden tabel ophalen

[REPORT TITLES]

755=24=Ltst keer PLU verkocht

[REPORT PRINTING]

977=40=Laatste keer verkocht, Lees Rapport
978=40=Laatste keer verkocht, Reset Rapport
979=40=** PLU laatste keer verkocht reset
980=40=Reden tabel periode ? Lees Rapport
981=40=Reden tabel periode ?  Reset Rapport
982=40=** Reden Tabel Periode ? Reset


[AUTOBROADCAST]

1304=50=Auto zenden IRC, Externe Product Groepen
1305=50=Auto zenden IRC, PLU Menu
1306=50=Auto zenden IRC, KP Categorie
1307=50=Auto zenden IRC, Reden tabel

[STATUS KEY]

2223=50=Alleen rekening printen?

[TRANSACTION KEY]

2266=50=Laat reden tabel zien
2267=50=Laat reden tabel zien, herstellngen
2268=50=Laat reden tabel zien, fout
2269=50=Geselecteerde artikel? (Nee=volgende artikel)

[FINALISE KEYS]

2302=50=Geen wisselgeldberekening?

[PLU]

2503=50=Willekeurige Code
2504=50=PLU Lijst#6 artikelen altijd prijs 0.00
2505=50=Artikel is PLU Menu artikel, gebruik dan 3e prijs

[PROGRAM SECTION2]

2661=50=Print prijzen?
2662=24=Sorteer
2663=50=KP Configuratie
2664=50=Bij elkaar optellen?
2665=50=Artikelen met verschillende kondimenten?
2666=50=PLU Menus met verschillende artikelen?
2667=50=Kondimenten altijd klein printen?

[PRODUCT GROUPS PROGRAM]

2771=50=Hoofdgroep naam
2772=24=Imp. Prdct Groepen, Ok?
2773=50=Hierdoor worden bestaande product groepen overschreven
2774=50=Weet u het zeker?
2775=50=Gebruik alternatieve toetsenbord tekst
2776=50=Negeer producten zonder een omschrijving
2777=50=Negeer artikelen zonder prijs
2778=50=Negeer weegartikelen
2779=30=Logos geimporteerd:
2780=30=Artikelen geimporteerd:
2781=50=PLU
2782=50=TEKST KLEUR
2783=50=ACHTERGROND KLEUR
2784=50=* VERWIJDER ARTIKEL
2785=50=* VOEG NIEUW ARTIKEL TOE
2786=50=Artikelen --------
2787=24=Importeer van
2788=50=Negeer lege groepen
2789=24=Tekst overschrijven
2790=24=Type artikel
2791=50=Importeer PLU Lijst (alleen toetsenbord)

[SET MENU PROGRAM]

2801=50=Naam
2802=50=Vervangende waarde

[PGM5 PRESETS]

2811=50=Klant Detail Verkoopnr

[KP CATEGORY]

2831=24=Tekst

[REASON TABLE]

2835=24=Reden

[DISPLAY MESSAGES]

3919=24=Vingerafdruk gebruiken
3920=24=DATUM:
3921=24=UITSTELLEN
3922=24=VERVANGEN
3923=24=STATUS: AANGESLOTEN
3924=24=STATUS: FOUT ONTVANGEN
3925=24=STATUS: UIT
3926=24=STATUS: NETWERK FOUT
3927=24=INDIVIDUELE NOTA
3928=24=INDIVIDUELE TAFEL
3929=24=ALLE NOTA'S/TAFELS

[ERROR MESSAGES]

4186=50=kan niet toewijzen

[PGM MENU NAMES]

4606=24=Externe Product Groepen
4607=24=Product Groepen
4608=24=Imp. Product Groepen
4609=24=PLU Menu
4610=24=Vastgelegd

[PGM MENU OPTIONS]

4942=24=UITSTELLEN
4943=24=Geen


#####################################################################
# ICRTouch Version 2.540 - 11/11/2008                               #
#####################################################################

[FILE NAMES]

89=24=Vaste teksten
90=24=Tafel Analyse

[PRINTER MESSAGES]

544=46=   TARIEF                    NET     BTW
545=24=TOEVOEGEN
546=24= Klant weer gebruiken:
547=24=Voortstuwing
548=5=(NT)

[REPORT DISPLAY MESSAGES]

677=40=Ophalen

[REPORT TITLES]

756=24=Tafel Reserveringen
757=24=Vandaag
758=24=Morgen
759=24=Alles
760=24=Tafel Analyse

[REPORT PRINTING]

983=40=** Tafel reserveringen reset
984=40=** Tafel Analyse Periode ? Totalen Reset
985=20=EERST GEBRUIKT:
986=20=LAATST GEBRUIKT:
987=40=PAS OP, BESTAND VOL, KAN DATA VERLOREN

[SYSTEM CONTROL 1]

1020=50=Laat einde verkoop totaal scherm zien?
1021=50=Alleen korting bij aantal na sub totaal?

[SYSTEM CONTROL 2]

1049=50=Marine brandstof - standaard voortstuwing %
1050=50=Mag voorstuwing % handmatig overschrijven?

[ORDER CONTROL]

1150=50=Printer support 180dpi verticaal printen?

[REPORT CONTROL]

1173=50=Geen Z rapport bij actieve verkopers?
1174=50=Geen Z rapport bij actieve nota's?

[CHECK TRACKING]

1224=50=Notabeheer?
1225=50=Tafelbeheer?
1226=50=Groepen beheer?
1227=50=PLU Hoofdgroep beheer?

[PRINT CONTROL]

1262=50=Print handtekening op tussennota?
1263=50=Print handtekening op afgerekende nota?

[AUTOBROADCAST]

1308=50=Auto zenden IRC,

[COMMS CONTROL]

1328=50=----------- Muntautomaat -----------
1329=50=Limiet uitgifte munten:
1330=50=Geen uitgifte als wisselgeld hoger is dan:
1331=50=Totaal wisselgeld in scherm laten zien?

[CUSTOMER CONTROL]

1521=50=Automatisch klant aanmaken wanneer niet gevonden?

[SCANNING PLU]

1542=50=Popup voor BTW tarief?
1543=50=Geen omzet verkoop beinvloed voorraad?
1544=50=Geen omzet verkoop beinvloed laatste keer verkocht?
1545=50=Geen omzet verkoop beinvloed muntautomaat?

[EFT CONTROL]

1571=50=Ja Betaal
1572=50=Tekst poort
1573=50=Bon poort
1574=50=Interactieve poort

[REINDEX PLU]

1587=50=Filter op groep:
1588=50=Filter op PLU Hoofdgroep:

[RANGE PROGRAMMING CUSTOMER]

1624=50=Filter op groep:

[TIMEZONESDETAILLINK]

1823=50=Verkoper Rapport, Record 1 

[FIXED CHARACTER]

1947=50=------------ Klant Verificatie

[TABLE RESERVATIONS]

2106=50=Reserveer verkoper ipv tafels?

[STATUS KEY]

2224=50=Gebruik KP status van bovenstaand artikel?
2225=50=Verwijderd zwarte lijst vlag? {Nee=set vlag}
2226=50=Vaste tekst

[CUSTOMER GROUP]

2381=50=Automatisch % bedrag bij storting
2382=50=Alleen na subtotaal?
2383=50=Punten berekeken over hele euro's?
2384=50=Ga naar prijs level 2?

[FILE MIX AND MATCH]

2421=50=Alleen voor prijs level 1 artikelen?

[PLU]

2506=50=Popup voor klant verificatie 1?
2507=50=Popup voor klant verificatie 2?
2508=50=Marine brandstof PLU?


[PROGRAM SECTION2]

2668=50=Alleen lokaal gebruik? {PocketTouch 2}
2669=50=Alleen PLUs van handheld? {PocketTouch 2}
2671=50=Geen omzet? {alleen TMS/PLU verkoop}

[PRODUCT GROUPS PROGRAM]

2792=50=* VERWIJDER DEZE GROEP
2793=50=Verwijder deze groep en alle gekoppelde artikelen

[PRESET MESSAGE]

2841=24=Tekst

[DISPLAY MESSAGES]

3930=24=Print lijst naar display
3931=24=T:
3932=24=C:
3933=24=Te betalen

[ERROR MESSAGES]

4187=50=Muntautomaat staat uit
4188=50=Weinig munten in muntautomaat
4189=50=Muntautomaat is bezig
4190=50=Actieve nota's
4191=50=Deze licentiecode komt niet overeen 
4192=50=met deze versie van TouchPoint
4193=50=Geen USBCR.DLL

[PORTAL]

4430=50=KP %d fout, opnieuw?
4431=50=KV %d fout, opnieuw?
4432=50=Bonprinter fout, opnieuw?
4433=50=De nota is momenteel elders in gebruik
4434=50=Verkeerd Format/Nota nummer
4435=50=Nota/Tafel bestaat niet
4436=50=Onbekend commando opgevraagd door client
4437=50=De server is bezig. Probeer aub opnieuw
4438=50=Server is bezig, wachten aub

[PGM MENU OPTIONS]

4944=24=Afronden op 0,100
4945=24=Apparaat op COM7
4946=24=Apparaat op COM8
4947=24=Bonprinter
4948=24=VASTE TEKST


#####################################################################
# ICRTouch Version 2.541 - 30/4/2009                                #
#####################################################################

[REPORT TITLES]

761=24=Z Rapport
762=24=X Rapport
763=24=Txn Rapport
764=24=Bank Rapport
765=24=Q Rapport
766=24=Account opgeteld Rapport
767=24=Account Detail Rapport
768=24=Einde van de dag
769=24=Offline Transactie Rapport
770=24=Laatst geprint Rapport (herprint)
771=24=Opgeslagen Offline Txn

[STATUS KEY]

2227=50=Bon printen tijdens de transactie?

[PROGRAM SECTION2]

2672=50=Gebruik vingerafdruk van de klant?

[ERROR MESSAGES]

4194=50=De verstrekte IP adres is verkeerd
4195=50=IP Adreses moet zijn in het formaat van XXX.XXX.XXX.XXX
4196=50=De target host is offline
4197=50=Kan niet verbinden met de poort
4198=50=De target host kan niet bereikt worden
4199=50=Verbinding niet tot stand gekomen met fout %d

[PGM MENU OPTIONS]

4949=24=KLANT VINGERAFDRUK
4950=25=STUUR NU NAAR KP
4951=25=DALLASSLOT


#####################################################################
# ICRTouch Version 2.542 - 27/5/2009                                #
#####################################################################

[PRINTER MESSAGES]

549=35=CODE:

[REPORT TITLES]

772=24=Klant korting

[REPORT PRINTING]

988=40=** Klant korting periode ? Reset
989=40=Klant korting Reset Rapport
990=40=Klant korting Lees Rapport
991=40=KORTING:
992=20=KORTING TOTAAL:



[COMMS CONTROL]

1332=50=Range Servant - dagen pin code geldig

[EFT CONTROL]

1575=50= Gebruik EFT dialoog voor CNP details?
1576=50= Popup voor adres?

[PLU]

2509=50=Genereer Range Servant ball dispenser code?
2510=50= Aantal rondjes laten zien

[PROGRAM SECTION2]

2673=50=- Internet ---------------------
2674=50=Back Office TCP Socket toegangscode

[DYNDNS]

5940=40=Gebruik Dynamic DNS Updator?
5941=40= Hostnaam
5942=40= Gebruikersnaam
5943=40= Toegangscode
5944=30=STS:
5945=30=Initialiseren ...
5946=30=Geen antwoord
5947=30=Verkeerd antwoord
5948=30=Verkeerde hostnaam formaat
5949=30=Verkeerde hostnaam
5950=30=Hostnaam niet in gebruik
5951=30=Geblokkeerd voor misbruik update!
5952=30=Verkeerde gebruikersnaam/toegangscode
5953=30=Onbekende fout
5954=10=Ok

[UPNP]

5960=40=Gebruik UPNP?
5961=40=STS:
5962=40=Zoeken ...
5963=40=Actief
5964=40=Verkeerd
5965=40=Gestopt
5966=24=Protocol
5967=24=UPNP
5968=40=Service Naam
5969=40=Externe Poort
5970=40=Interne Poort
5971=24=Gebruiken?
5972=24=Uitgeschakeld
5973=40= Startnummer poort voor indelen
5974=40=Gebruik standaard startnummer?


[UPDATE SERVICE]

5980=40=Uw huidige versie is up to date
5981=24=Controleer voor een update
5982=40=Update software naar:
5983=40=Update beschikbaar
5984=40=Kan niet bestand schrijven:
5985=40=Kan niet archief uitpakken:
5986=40=Kan geen verbinding maken met update service
5987=20=ONTVANGEN:
5988=40=START BESTAND BESTAAT NIET
5989=40=Modificaties;
5990=40=Opgelost;
5991=40=Notities;
5992=40=Display datum uitgave?
5993=10=VAN:
5994=10=TM:
5995=40=Kan niet archief openen:


#####################################################################
# ICRTouch Version 2.543 - 23/6/2009                                #
#####################################################################

[CURRENCY EXCHANGE]

1672=50=Euro naar vreemde valuta wisselkoers

[UPDATE SERVICE]

5996=40=Huidige VER NR


#####################################################################
# ICRTouch Version 2.552 - 19/10/2009                               #
#####################################################################

[FILE NAMES]

91=24=SEL
92=24=IDC Logo
93=24=IDC Artikel

[REPORT TITLES]

773=24=Schap Labels
774=24=SEL - Openstaand
775=24=SEL - Alles
776=24=SEL - Alleen reset
777=24=Gratis maal. - geen Dtl


[REPORT PRINTING]

993=40=Schap Label Lees Rapport
994=40=Schap Label Reset Rapport
995=40=, Openstaand
996=40=, Alles
997=40=** Openstaande Schap Labels Reset


[EFT CONTROL]

1577=50=Offline transacties doorvoeren?

[STATUS KEY]

2228=50=gebruik zoek dialoog?
2229=50=Herprint laatste pin bon?

[PROGRAM SECTION2]

2675=50=- TCP/IP ---------------------
2676=50=Adapter
2677=50=Gebruik DHCP ?
2678=50=IP Adres
2679=50=Subnet
2680=50=Gateway

[PORTAL]

4439=50=Verkeerd bestand
4440=50=Mist of verkeerd datalyt.ini invoer
4441=50=Verkeerde parameter

[PGM MENU OPTIONS]

4952=24=Uitlijnen
4953=24=Links
4954=24=Boven
4955=24=Centreer
4956=24=Rechts
4957=24=Beneden

[ACTIVATION]

5850=50=Wilt u uw apparaat activeren?
5851=50=Internet aansluiting is vereist
5852=50=Dank u voor het activeren van TouchPoint
5853=50=De software op dit apparaat kan niet langer worden gebruikt
5854=50=totdat het geactiveerd is
5855=50=U heeft nog %d dagen om dit apparaat te activeren
5856=50=Kan niet verbinden met ICRTouch.com
5857=50=Geen antwoord van ICRTouch.com
5858=50=Onbekend antwoord
5859=50=De hardware wijkt af van 
5860=50=het origineel geactiveerde apparaat
5861=50=Interne DB fout
5862=50=Activering mislukt

[UNITS]

5870=24=Eenheid
5871=40=%s%s per %s
5872=12=ml
5873=12=10ml
5874=12=100ml
5875=12=cl
5876=12=75cl
5877=12=liter
5878=12=gram
5879=12=1g
5880=12=10g
5881=12=100g
5882=12=kg
5883=12=10kg
5884=12=100kg
5885=12=1000kg
5886=12=cm
5887=12=meter
5888=12=m2
5889=12=eenheid 18
5890=12=eenheid 19
5891=12=eenheid 20
5892=12=eenheid 21
5893=12=eenheid 22
5894=12=eenheid 23
5895=12=eenheid 24
5896=12=eenheid 25
5897=12=eenheid 26
5898=12=eenheid 27
5899=12=eenheid 28


[SHELF EDGE LABELS]

5900=24=Type
5901=24=Inactief
5902=24=Vrije tekst
5903=24=Artikel naam
5904=24=Prijs
5905=24=Barcode
5906=24=Willkeurige code
5907=24=Regel
5908=24=Afbeelding
5909=24=Datum
5910=24=Stuks prijs

5920=24=Breetde
5921=24=Hoogte
5922=24=X pos
5923=24=Y pos
5924=24=Artikel
5925=24=Tekst
5926=24=Font
5927=24=Afmeting
5928=24=Gem kar breedte
5929=24=snij pos
5930=24=X2 pos
5931=24=Y2 pos
5932=24=dikte
5933=24=Afbeelding bestand
5934=40=Gebruik SEL printen
5935=40= openstaand SEL
5936=40= Eenheid
5937=40= Aantal per eenheid


#####################################################################
# ICRTouch Version 2.553 - 29/1/2010                                #
#####################################################################

[FILE NAMES]

94=24=Huur Code

[EFT CONTROL]

1578=50=Gebruik in Horeca?

[CUSTOMER GROUP]

2385=50=Geen account belasten met gratis maaltijd  bedrag?
2386=50=Geen BTW?

[PROGRAM SECTION2]

2681=50=Klant verplicht?

[RENTAL CODES]

5840=50=Code verlengd met %d dagen

[ACTIVATION]

5863=50=Wilt u offline activeren?
5864=50=De ingevoerde code is foutief
5865=24=Activeer TouchPoint

[SHELF EDGE LABELS]

5911=24=Prijs - 2de valuta


#####################################################################
# ICRTouch Version 2.560 - 28/2/2011                                #
#####################################################################

[FILE NAMES]

95=24=Etal
96=24=Klant gegevens logo
97=24=Klant gegevens artikelen

[REPORT TITLES]

778=24=Socket Journaal

[REPORT PRINTING]

998=40=** IDC Bestand Reset
999=40=** Socket Journaal Reset

[CHECK TRACKING]

1228=50=Print barcode op klantenbon?
1229=50=Laat nota tekst zien op tafel in plattegrond?

[CUSTOMER FILE]

1355=50=Vervaldatum
1356=50=Notities ----
1357=50=Mobiel
1358=50=Werk Tel
1359=50=Email

[CUSTOMER CONTROL]

1522=50=in lade vooraccount betalingen
1523=50= Toevoegen als negatieve waarde?

[STATUS KEY]

2230=50=Gebruik bonprinter 2?
3700=50=Mag bedrag overschreven worden?

[FILE MIX AND MATCH]

2422=50=Start datum:
2423=50=Eind datum:

[PLU]

2512=50= Overschrijf tweede omschrijving modifier

[PROGRAM SECTION2]

2682=50=--------- Bon Printer 2 ---------

[DISPLAY MESSAGES]

3934=40=Verwijder deze PLU?
3935=40=VOER EMAIL IN
3936=40=VOER MOBIEL IN
3937=40=VOER WERK TEL IN
3938=40=ALLE AB PROGRAMMERINGEN


[ERROR MESSAGES]

4200=40=BON PRINTER 2 FOUT
4201=50=CONTROLEER AUB BON PRINTER 2, OPNIEUW?

[PORTAL]

4442=50=Bestand fout
4443=50=Toegangscode nodig
4444=50=Te weinig voorraad
4445=50=Verkeerde verkoper

[PGM MENU OPTIONS]

4958=24=Run Script (Etal)
4959=40=Vlag %d
4960=40=Nummer:
4961=24=ICRTOUCH TYPE 2 (XML)

[ETAL]

5820=40=Versie Info
5821=24=Bestand
5822=24=Output Bestand
5823=24=Naam
5824=24=Gemaakt
5825=24=Laatst aangepast
5826=24=Min Ver nr
5827=24=Auteur


#####################################################################
# ICRTouch Version 2.562 -                                 #
#####################################################################

[PRINTER MESSAGES]

550=40=GEWIJZIGDE BESTANDEN:
551=40=TECHNEUT CODE GEBRUIKT
552=40=VERKEERDE BETAAL CODE INGEVOERD

#####################################################################
# ICRTouch Version 2.580 - 24/5/2012                                #
#####################################################################

[REPORT TITLES]

779=24=Betaalde nota's
780=24=Betaalde nota's - Alles
781=24=Betaalde nota's - Vandaag
782=24=Betaalde nota's - Datum bereik

[TICKET ISSUANCE]

1096=50=Print klant adres
1097=50=Print klant telefoonnummer

[REPORT CONTROL]

1175=50=Laat 'weet u zeker' reset popup niet zien?

[CHECK TRACKING]

1230=50=Print nota tekst extra groot?
1231=50=Sla afgerekende bonnen op?
1232=50=Veel geconsumeerd aan deze tafel
1233=50=Tijd voordat iemand naar tafel moet gaan (uu:mm)
1234=50=Bekijk plattegrond geprinte bonnen?
1235=50=Bereken couvert over subtotaal?
1236=50=Couvert berekenen over alle transacties?

[CUSTOMER CONTROL]

1524=50=Popup om wisselgeld te verrekenen met klant saldo?
1525=50=ADRES

[SPLIT REPORTING]

1732=50=Rapport 2 gebruikt order nummer 2?

[CUSTOMER GROUP]

2387=50=Print klant gegevens op KV?

[MIX AND MATCH 2]

2435=50=Koppel artikelen uit de volgende tabel?

[PLU]

2513=50=Kostprijs

[PROGRAM SECTION2]

2683=50=Schakel CTRL-M Macro Start uit?

[DISPLAY MESSAGES]

3939=40=Verreken wisselgeld met account saldo?
3940=40=Aantal stoelen?
3941=50=Tafel is samengevoegd en kan niet worden vergroot

[PGM MENU NAMES]

4612=24=Sla lege namen over?

[PGM MENU OPTIONS]

4963=24=BEKIJK BETAALDE NOTA'S
4964=24=SPEEL MACRO AF

[DYNDNS]

5955=40=Service
5956=24=Dyn
5957=24=Geen-IP
5958=40=Slechte Agent - ICRTouch geblokkeerd

[UPDATE SERVICE]

5997=40=Update klaar
5998=40=Opnieuw opstarten
5999=40=Opnieuw opstarten, weet u het zeker?

[ICRTOUCH CONNECT]

5800=50=ICRTouch Connect
5801=50=Toegangscode:
5802=50=
5803=50=Site ID:
5804=50=Tafel reserveringen?
5805=50=Laatste Status:

#####################################################################
# ICRTouch Version 2.600 - 11/7/2013                                #
#####################################################################

[FILE NAMES]

98=24=Systeemvlag 2

[PRINTER MESSAGES]

553=40=HANDMATIG LADE OPENEN

[REPORT CONTROL]

1176=50=Print niet willekeurige code in PLU Rapporten?

[PRINT CONTROL]

1264=50=Klantenbonnen opslaan?

[SCANNING PLU]

1546=50=Geen omzet verkoop printen op KP?

[JOURNAL CONTROL]

1837=50=Maak CCTV Journaal?

[PROGRAM SECTION2]

2684=50=Print tijd groot?

[PGM5 PRESETS]

2812=50=Laatste Web Shop Artikelnr
2813=50=Stats Upload Licentie 

[WEBSHOP]

2851=50=Betaalde verkoop bestemming
2852=50=COD verkoop bestemming
2853=24=In lade
2854=24=Auto nieuwe nota
2855=24=Klant account
2856=50=Print bon?

[CUSTOMER GROUP]

2388=50=Print notities op KP

[DISPLAY MESSAGES]

3942=50=Uploaden totalen naar hotel server, wachten aub

[PORTAL]

4446=50=Ticket Printer %d fout, opnieuw?

[PGM MENU NAMES]

4611=24=Webshop

[PGM MENU OPTIONS]

4965=24=PLUS ARTIKEL
4966=24=BEKIJK BONNEN

[ICRTOUCH CONNECT]

5806=50=Webshop?
5807=50=IDC Uploader?
5808=50=Postcode Adres opzoeken?
5809=50=Geen verbinding met ICRTouch.com
5810=50=Geen antwoord van ICRTouch.com
5811=50=Onbekend antwoord


[POSTCODE LOOKUP]

6010=50=Postcode
6011=50=Naam/Nummer
6012=50=Ok?
6013=50=Postcode adres opzoeken
6014=50=>> Adres opzoeken - Druk op Enter <<


#####################################################################
# ICRTouch Version 2.602 - 19/9/2013                                #
#####################################################################

[SYSTEM CONTROL 1]

1022=50=In Retour stand extra bon printen met handtekening strook?

[FINALISE KEYS]

2303=50=Laat wisselgeld niet zien?


#####################################################################
# ICRTouch Version 2.620 - 4/8/2014                                 #
#####################################################################

[PRINTER MESSAGES]

554=12=NR
555=12=NAAM
556=12=LIC
557=12=VER
558=12=IP
559=12=F/VERK.
560=12=CONTR SYS
561=12=KLANTEN
562=12=TIJD & AANW
563=12=EXT INFO
564=46=ER WORDEN VERSCHILLENDE VERSIES GEBRUIKT
565=46=DIT KAN TOT INSTABILITEIT LEIDEN 
566=46=CORRUPTE DATA

[REPORT CONTROL]

1177=50=Rapporten opslaan?

[CHECK TRACKING]

1237=50=Laat datum/tijd regel zien in registratiescherm?

[SCROLLING MESSAGE]

1904=50=Terminal gesloten tekst ->

[PROGRAM SECTION2]

2685=50=Bon/Rapport printer breedte:
2686=50=KP printer breedte:
2687=50=Geen valuta symbool?

[PRODUCT GROUPS PROGRAM]

2794=50=Importeer alleen nieuwe artikelen?

[STATUS KEY]

3701=50=Open lade 1?
3702=50=Open lade 2?
3703=50=Gebruik geen lade alarm?
3704=50=Print niet XZ teller in Rapport?
3705=50=Print niet XZ teller in EJ?
3706=50=Alleen volgend artikel?
3707=50=Vaste stoel:
3708=50=Display uitschakelen?

[DISPLAY MESSAGES]

3943=50=Controleer huur codes

[ERROR MESSAGES]

4202=50=BEWERKING NIET GELUKT, PROBEER ALS ADMIN

[PORTAL]

4447=50=NIET GEVONDEN
4448=50=GEEN MASTER


[PGM MENU OPTIONS]

4967=24=Lokale PIN App
4968=24=Ingenico RS232
4969=24=BEKIJK RAPPORTEN
4970=24=CATEGORIE SHIFT
4971=24=STOEL NUMMER
4972=24=KADOBON
4973=24=Pinautomaat
4974=24=Afronden op 0,10 (5/6)

[ICRTOUCH CONNECT]

5812=50=Tekst voorspellen?
5813=50=TouchTopUp Web?
5814=50=Sync master saldo's?

[TEXT PREDICTIONS]

6020=50=Caps Type
6021=24=Start Case
6022=24=Sentence case
6023=24=Hoofdletters
6024=24=Kleine letters

[ICRTOUCH CONNECT]

5790=50=Gebruik VNC server?
5791=50=Toegangscode:
5792=50=Poort:

[VIEW RECEIPTS]

6030=24=Bron
6031=24=Bonnen lijst
6032=24=TOW verkoopnr Lookup
6033=50=Bon niet gevonden


#####################################################################
# ICRTouch Version 2.621 -                                  #
#####################################################################

[FILE NAMES]

99=24=Sub Groep

[REPORT CONTROL]

1178=50=Print verkoop ratio in Groep rapporten?
1179=50=Print verkoop ratio in PLU Hoofdgroep rapporten?

[STATUS KEY]

3709=50=Gebruik zoek dialoog?

[ERROR MESSAGES]

4203=50=SSL niet aangesloten
4204=50=Kan niet aansluiten
4205=50=Geen antwoord van server

[SUB DEPT]

6040=50=Print niet totalen in de rapporten?

#####################################################################
# ICRTouch Version 2.64.0 - 25/2/2015                               #
#####################################################################

[FILE NAMES]

99=24=Sub Dept

[ORDER CONTROL]

1151=50=Compulsory Check/Table for KP items?
1152=50=Press Status Key:

[REPORT CONTROL]

1178=50=Print sales ratio on Dept reports?
1179=50=Print sales ratio on PLU Group reports?
1180=50=Do not print last date run?

[CHECK TRACKING]

1238=50=Print transfers to KP?

[TRANSACTION KEY]

2270=50=Preset Reason

[STATUS KEY]

3709=50=Use search dialog?
3710=50=Opens Tables?

[ERROR MESSAGES]

4203=50=SSL Connection Failed
4204=50=Failed to connect
4205=50=No response from server
4206=50=Check device for error

[PGM MENU OPTIONS]

4975=24=VIEW WEBSALES
4976=24=REASON TABLE

[ICRTOUCH CONNECT]

5815=50=Upload Non-Turnover Sales?

[SUB DEPT]

6040=50=Do not print total on reports?


#####################################################################
# ICRTouch Version 2.66.0 - 16/06/2016                              #
#####################################################################

[PRINTER MESSAGES]

567=50=DISCOUNTED ITEMS HAVE BEEN REMOVED FROM
568=50=THE SALE. PRINTED DISCOUNTS MAY SHOW THE
569=50=ORIGINAL AMOUNT AND COULD APPEAR WRONG
570=50= 


[CHECK TRACKING]

1239=50=Set location to FP level on new table?

[PRINT CONTROL]

1265=50=Archive more than
1266=50=Print bottom graphic logo?

[CUSTOMER CONTROL]

1526=50=Do not show 'available' at sign on?

[SCANNING PLU]

1547=50=Auto create new ISSN variants?
1548=50=Enable Pseudo @ quantities?

[PLU PRICES]

1855=50=4th @ Price

[TRANSACTION KEY]

2271=50=Preset Amount
2272=50=Adds to TIPS 2?
2273=50=Do not affect stock?

[PLU]

2514=50=Quantity of 4th @ Price

[PROGRAM SECTION2]

2670=50=Allowed to use EFT Pre-Auth?
2688=50=Search for Dallas iButton readers?

[SET MENU PROGRAM]

2803=50=No Defer?
2804=50=No Substitution?

[PRODUCT GROUPS PROGRAM]

2795=50=* MOVE GROUP UP 1

[PGM5 PRESETS]

2814=50=Last Check Serial Number

[STATUS KEY]

3711=50=Use QWERTY?

[DISPLAY MESSAGES]

3944=50=Searching, please wait

[ERROR MESSAGES]

4207=50=Over Pre-Auth limit

[PORTAL]

4449=50=TOO MANY CLIENT LICENCES

[PGM MENU OPTIONS]

4977=24=VOUCHER
4978=50=4th @ Price    
4979=24=EFT PREAUTH
4980=24=TIPS
4981=24=BANNER


[ICRTOUCH CONNECT]

5816=50=Enable auto backup?
5817=50=Enable PayTable?
5818=50=Barcode Predictions?

[CLOUD RESTORE]

6050=50=Cloud Data Restore
6051=50=Restore Date/Time
6052=50=Preview Files
6053=50=Do Restore
6054=24=Ready, Please Select
6055=24=Not Started
6056=50=Restore to Temp
6057=50=No backups available
6058=50=No backup selected
6059=50=Restore files?
6060=50=Last file
6061=24=Files Available
6062=24=All Dirs
6063=24=Directory
6064=24=Waiting to Connect...
6065=24=Completed
6066=24=Next Backup


#####################################################################
# ICRTouch Version 2.66.3 - 9/11/2016                               #
#####################################################################

[PGM MENU OPTIONS]

4981=24=BANNER

#####################################################################
# ICRTouch Version 2.66.5 - 9/3/2017                                #
#####################################################################

[REPORT PRINTING]

1000=40=TIMEOUT WAITING FOR DATA



#####################################################################
# ICRTouch Version 68.00 - 9/10/2017                                #
#####################################################################

[PRINTER MESSAGES]

571=50=START PAY SEAT
572=50=END PAY SEAT
573=1=Y
574=1=N
6403=12=RATE
6404=12=NET
6405=12=TAX
6406=40=TAX ANALYSIS
6407=12=DATE
6408=12=FILE
6409=12=ADD ON
6410=12=ADD IN
6411=30=EAT IN/TAKE OUT
6412=30=ON KEYB LEVEL
6413=30=NOT FOUND ON KEYB
6414=30=TAX RATE


[PRINT CONTROL]

1267=50=Only managers can print duplicate bills?
1268=50=Receipt alt-text usage

[PLU CONTROL]

1549=50=Reason table on Customer Verify?

[EFT CONTROL]

1579=50=Don't print merchant copy?

[PLU NAMES]

1894=50=Alt Text

[CLERK NAMES]

1897=50=NI Number

[FIXED CHARACTER]

1948=50=Decimal Mark
1949=50=Thousand Separator

[FILE MIX AND MATCH]

2424=50=Only as discount?

[PROGRAM SECTION2]

2689=50=Generate CollectionPoint status code?
2690=50=Printers Code Page
2691=50=Country
2692=50=Function Type
2693=50=POS Device
2694=50=Do not print qty on condiment items?
2695=50=Customer Displays Code Page
2696=50=CCTV Journal
2697=50=Append CR?
2698=50=Append LF?
2699=50=Persist connection?
2700=50=Code Page
6400=50=Output formatting chars
6401=50=Print sale total?
6402=50=Do not print reason on receipt?

[REASON TABLE]

2836=24=Key type

[ERROR MESSAGES]

4208=50=Voucher not found
4209=50=Voucher not yet active
4210=50=Voucher expired
4211=50=Invalid voucher type
4212=50=Voucher has been used too many times
4213=50=Voucher has a minimum spend value on it


[BUTTON TEXTS]

4340=24=KEYB

[PGM MENU OPTIONS]

4982=24=CUST VERIFY 1 (YES)
4983=24=CUST VERIFY 1 (NO)
4984=24=CUST VERIFY 2 (YES)
4985=24=CUST VERIFY 2 (NO)
4986=24=SET MENU SHIFT

[ICRTOUCH CONNECT]

5819=50=Enable stock download?
6090=50=Online vouchers?
6091=50=Use SSL?

[ICRTOUCH CONNECT]

5795=50=Enable EHP Server?

[RENTAL LICENCES]

6080=50=Your rental licence has the wrong licence number
6081=50=Your rental licence has the wrong serial number
6082=50=Your rental licence has expired
6083=24=Rental Licence
6084=50=Warning your licence expires in ? days

[PGM OPTS]

6120=50=Alt-text usage
6121=24=None
6122=24=Replace
6123=24=Under

[REPORT PRINTING]

6300=9=FORCE OUT

#####################################################################
# ICRTouch Version 68.10 - 2/1/2018                                 #
#####################################################################

[DISPLAY MESSAGES]

3945=50=Refresh rental licence

#####################################################################
# ICRTouch Version 68.30 - 8/8/2018                                 #
#####################################################################

[REPORT TITLES]

783=24=EFT TERMINAL LIST

[FINALISE KEYS]

2304=50=Prompt for device?

#####################################################################
# ETAL CUSTOM LANGUAGE TEXT - START                                 #
#####################################################################

[GENERIC SCRIPT TEXT]

7000=24=Script Enabled?
7001=24=Enter Amount
7002=24=Enter Quantity
7003=24=Enter Percentage
7004=24=Percentage
7005=24=Add Amount
7006=24=Add Quantity
7007=24=Subtract Amount
7008=24=Subtract Quantity
7009=24=Multiply Amount
7010=24=Multiply Quantity

7011=24=Make Adjustment

7012=24=Disclaimer

7013=24=Window Settings
7014=24=Script Settings
7015=24=Print Settings
7016=24=Dialog Settings
7017=24=Display Window ?

7018=40=Script will change PGM Data!
7019=40=Have you made a Backup ?
7020=24=Reset

7021=24=Window Filepath
7022=24=Load Filepath
7023=24=Save Filepath
7024=24=Config Filepath
7025=24=Input Filepath
7026=24=Output Filepath
7027=24=XML Filepath
7028=24=JSON Filepath
7029=24=CSV Filepath
7030=24=Remote FilePath
7031=24=Local FilePath

7032=24=License 
7033=50=TouchPoint must be licenced
7034=50=TouchPoint update required
7035=50=TouchPoint version Req %V

7036=24=Icon Size
7037=24=Number of Icons
7038=24=Button Size
7039=24=Button Colour
7040=24=Button Font
7041=24=Rows
7042=24=Columns
7043=24=Border
7044=24=Border Colour
7045=24=Spacing

7046=24=Remove %I
7047=50=Rcpt Print Message
7048=50=Jrnl Print Message

7049=24=Script Key Number
7050=24=Print Image

7051=50=Trigger on PLU Key
7052=50=Trigger on Transaction Key
7053=50=Trigger on Status Key Key
7054=50=Trigger on Finalise Key
7055=50=Trigger on Barcode
7056=50=Trigger on MagStrip
7057=50=Trigger on IButton

7058=24=Save
7059=24=Undo
7060=24=Done
7061=24=Menu
7062=24=Store
7063=24=Recall
7064=24=Max

7065=24=Filter for %F
7066=24=Stop Printing

7067=24=Server Address
7068=24=Archive Data
7069=24=Scheduled
7070=24=Scheduled Time

7071=12=Days
7072=12=Day
7073=12=Weeks
7074=12=Week
7075=12=Months
7076=12=Month
7077=12=Years
7078=12=Year
7079=12=Hours
7080=12=Hour
7081=12=Minutes
7082=12=Minute
7083=12=Seconds
7084=12=Second

7085=12=Milliseconds

7086=50=Use SEL Quantity

7087=50=Clerk Message
7088=50=Customer Message
7089=50=Custom Message

7090=24=Print Indent
7091=24=Print Header Text
7091=24=Print Summary
7092=24=Highlight Colour
7093=24=Background Colour
7094=24=Window XML
7095=24=Accepted
7096=24=Declined
7097=24=Maximum 
7098=25=Minimum


[ALLERGY SCRIPT]
7101=50=Allergy Warning 
7102=50=Remove allergen from sale?
7103=50=This Item contains 
7104=50=Customer is not allowed 
7105=50=No Allergen Set
7106=50=Sale contains following allergen

7107=50=Warning Dialog on PLU
7108=50=Resize To Optimum ?
7109=50=Re-prompt Disclaimer?

#####################################################################
# ETAL CUSTOM LANGUAGE TEXT - END                                   #
#####################################################################

#####################################################################
# ICRTouch Version 70.00 - 7/11/2018                                #
#####################################################################

[SYSTEM CONTROL 1]

1023=50=Item corrects go to reg buffer?

[SYSTEM CONTROL 2]

1049=50=Enable finger print reader

[CHECK TRACKING]

1240=50=Bill printing alt-text usage

[JOURNAL CONTROL]

1838=50=Verbose PGM mode changes?

[CUSTOMER GROUP]

2389=50=Use a weekly spend limit?
2390=50=Weekly spend limit

[ICRTOUCH CONNECT]

5802=50=HO Access Key:

[FINGER PRINTS]

6415=24=FINGER PRINT
6416=24=PRINTS STORED
6417=40=PLACE SAME FINGER ON THE READER
6418=40=PLACE A FINGER ON THE READER
6419=40=SAME FINGER TO VALIDATE
6421=40=ADD A PRINT
6422=40=ERASE ALL PRINTS

[DISPLAY MESSAGES]
6420=24=STATUS

[PLU ALLERGENS]
6424=40=ALLERGENS
6425=40=CELERY
6426=40=CEREALS CONTAINING GLUTEN
6427=40=CRUSTACEANS
6428=40=EGGS
6429=40=FISH
6430=40=LUPIN
6431=40=MILK
6432=40=MOLLUSCS
6433=40=MUSTARD
6434=40=NUTS
6435=40=PEANUTS
6436=40=SESAME SEEDS
6437=40=SOYA
6438=40=SULPHUR DIOXIDE
6439=40=ALLERGEN 15
6440=40=ALLERGEN 16

[PLU CONTROL]

6457=50=Customer verify 1 duty (1-100%)
6458=50=Customer verify 2 duty (1-100%)
6471=50=Enforced tax rate

[FISCAL]

6459=24=Fiscal
6463=24=POS Serial

6301=24=Fiscal Reports
6302=24=Fiscal/Today
6303=24=Fiscal/Yesterday
6304=24=Fiscal/Date
6464=40=CLERK IS TRAINEE
6473=24=FDM WARNING
6474=24=FDM ERROR
6475=40=FDM MEMORY IS 90% FULL
6476=40=SEE TICKET FOR MORE DETAILS
6477=24=DISCOUNT
6478=24=WORK IN
6479=24=WORK OUT
6480=50=NOT A VALID VAT RECEIPT
6481=30=PRODUCT NUMBER
6482=30=FIRMWARE VER
6483=30=TRANSACTION ID
6484=30=DATE / TIME
6485=30=MCID#
6486=30=PLU HASH
6487=30=PLU COUNT
6488=30=CONTROL DATA
6489=30=RECEIPT COUNTER
6490=30=RECEIPT SIGNATURE
6491=30=CONTROL MODULE ID
6492=30=VAT SIGNING CARD ID
6493=30=CLERK
6494=30=NI NUMBER
6495=50=REFUND
6496=50=TRAINING
6497=50=VAT RECEIPT
6498=50=Build not valid for selected country

[AUTH]

6460=24=Host
6461=24=User
6462=24=Password

[PRINT CONTROL]

6465=50=Rebuild receipt from reg buffer

[PGM OPTS]

6466=50=Rebuild Receipt
6467=24=Never
6468=24=Final Checks/Tables
6469=24=All Final Sales
6470=24=Always

[PROGRAM SECTION2]

6472=50=Language
