Mobile Vikings - The Rundown
============================

Algemeen
--------
- Interne links op de pagina (href=#sectie) scrollen. Geen plugin, maar 3 lijnen jQuery/CoffeeScript

- Knoppen nemen volledige breedte in op mobile en tablet: grotere aanraakzone -> verbeterde gebruiksvriendelijkheid

- Ik gebruik zo weinig mogelijk classes en ID's en zo veel mogelijk semantische [WAI-AIRA roles](http://www.alistapart.com/articles/waiaria)

- Ik heb [mijn eigen framework](https://github.com/KennyBrijs/Baloo-Boilerplate) samengesteld waarin ik:

	- Het beste uit [HTML5 Boilerplate](http://html5boilerplate.com/) haal: files en code die ik niet gebruik werden verwijderd

	- Het beste uit [320andup](http://stuffandnonsense.co.uk/projects/320andup/) haal: enkel de structuur van de CSS bestanden voor responsive webdevelopment

	- De SASS files opdeel volgens de principes van [Scalable and Modular Architecture for CSS: SMACSS](http://smacss.com/) wat zorgt voor makkelijker hergebruik van code en een betere onderhoudbaarheid

	- De code sorteer ik achteraf nog eens met CSSComb, wat ook zorgt voor uniformiteit, leesbaarheid en dus beter onderhoudbare code
	


Achtergronden
-------------
- De grote achtergrondafbeelding van zee wordt pas geladen bij tabletschermgroottes. Dit zorgt voor minder verbruik plus een eenvoudigere look op mobile -> minder afleiding op die beperkte schermruimte

- De achtergrond voor de content is op mobile maar half zo groot in pixeldimensie en minder dan 1/5e in bestandsgrootte. 238x238(17kb) vs. 476x476(105kb). Opnieuw: minder verbruik en meer snelheid



Logo
----
- CSS3 animatie bij hover (springt op en bounce)

- Responsive en Retina Image met picturefill.js
  Waarom picturefill.js:

	- Kleinere afbeeldingen op mobiel: minder dataverbruik: goedkoper en sneller

	- Fallback afbeelding naar keuze wanneer JavaScript uitgeschakeld is <noscript>

	- Geen overhead: sommige plugins laden eerst de fallback afbeeldingen en daarna de responsive image naar keuze, dankzij de <noscript> tag is dit niet het geval

	- De syntax van deze plugin [ligt enorm dicht tegen de W3C proposal voor responsive images](https://twitter.com/kennybrijs/status/245615652080066561), waardoor de overstap eenvoudig te maken is wanneer er uiteindelijk een standaard voor responsive images komt

- Geen image replacement dit is een gevaar bij de zoekmachines, soms zien ze deze technieken als hacks en dat wordt afgestraft. Google geeft het alt attribuut van img gelijke waarde als tekst, dus image replacement is ook helemaal niet nodig.



Menu
----
- Past zich aan aan verschillende schermbreedtes, net als de rest van de site.



Blog
----
- Titels zijn links: sommige gebruikers vinden het intuïtiever hier op te klikken -> verbeterde gebruiksvriendelijkheid

- Publicatiedatum gebruikt het HTML5 <time> element met pubdate attribuut -> semantiek, toepassingen zoals RSS readers kunnen hier iets mee.

- Er was gevraagd om optimalisatie voor sociale netwerken. Ik heb bewust géén share-buttons bij de blogposts geplaatst, [omdat deze meer kwaad dan goed doen](http://informationarchitects.net/blog/sweep-the-sleaze/)

	- Ze vertragen de pagina

	- Verschillende sites kregen méér verkeer van sociale netwerken wanneer ze deze buttons verwijderden

	- Mensen die sociale netwerken gebruiken wéten hoe ze zaken moeten delen. Als de inhoud goed is en ze willen hem delen zullen ze dat doen, en als dat niet het geval is zullen ze ook niet “tegen hun zin” op een share-button klikken. Daarnaast, als ze de link op hun tijdlijn kopiëren wordt dit veel meer gezien dan wanneer ze een artikel gewoon “leuk vinden.”

	- Wat ik wél heb gedaan is links naar de facebook en twitter account bij de nieuwsbriefsectie geplaatst, waar ze zinvol zijn: mensen kunnen op de hoogte blijven via verschillende kanalen.

		- De logo's zijn zeer klein gehouden om over te komen als een nuttige link in plaats van aandacht-trekkerij

		- Kleine verassingseffect bij hover in firefox (webkit ondersteunt geen transform animaties op inline of inline-block elementen)



Kaart
-----
- Standaard staat de kaart gezoomd op Hasselt. Als de gebruiker toestemming geeft om zijn locatie te zien wordt via HTML5 geolocation de locatie van de gebruiker aan de kaart toegevoegd en worden deze 2 markers automatisch binnen beeld gebracht.

- De kaart kan niet ingezoomd worden door te scrollen. Dit vloekte tegen de gebruiksvriendelijkheid: als je op de pagina naar beneden scrolde en de aanwijzer kwam op de map terecht was je plots aan het uitzoomen.

- De code voor de kaart is in een JavaScript class overgebracht voor makkelijk hergebruik en uitbreiding.

- De contactgegevens boven de kaart gebruiken het microformat vcard formaat, waardoor deze gegevens ook betekenis kunnen hebben voor bepaalde software (semantiek, kan makkelijk aan adressenlijst worden toegevoegd, &hellip;)

- Adres is link naar google maps met het juiste adres, als mensen er op klikken kunnen ze zo meteen de weg opvragen.

- Ook het telefoonnummer is een link (href="tel:"), mobiele gebruikers kunnen hier op klikken en dan staat hun gsm meteen klaar om te bellen of het nummer op te slaan.



Nieuwsbrief
-----------
- Label is aanklikbaar en brengt de focus naar het invoerveld. Een kleine “usability enhancement” die vaak vergeten wordt

- Validatie voor email in CoffeeScript

	- CSS3 animatie bij foutief email adres (label schudt “nee” -> intuitief en dus gebruiksvriendelijk)

		De bedoeling was om het label bij elke foutieve poging opnieuw te animeren, maar dit blijkt zeer moeilijk te zijn. [Zelfs Chris Coyier van CSS Tricks.com kan hier geen oplossing voor geven zonder hack](http://css-tricks.com/restart-css-animation/).

		Als het moét kan het dus—door dezelfde animatie twee keer te schrijven onder een andere naam—maar dit soort hacks vermijd ik liever.

- Als het email adres correct is wordt het opgeslagen via HTML5 localStorage zodat latere formulieren makkelijk automatisch aangevuld kunnen worden.