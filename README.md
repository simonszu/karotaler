karotaler
=========

Docker-Image mit einem Tool, um automatisch jeden Tag seinen Karotaler vom [Animexx](http://animexx.onlinewelten.com) abzuholen. 

Nutzung ist einfach:
Beim Start des Containers die Environmentvariablen `USER` und `PASSWORD` definieren.
Fertig. Ein Cronjob ruft jeden Morgen um 07:00 CE(S)T das Script auf, was sich den täglichen Karotaler abholt. #gönnteuch