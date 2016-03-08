# Instrucciones

## Instalar debmirror y dependencias

```
# apt-get update
# apt-get install debmirror gnupg debian-archive-keyring
```

## Crear un nuevo usuario para que se encargue de administrar el mirror

```
# adduser --system --home /srv/mirrors --gid www-data --no-create-home umirror
# mkdir /srv/mirrors
# chown umirror:www-data /srv/mirrors
# chmod u+rwx,g+rxs-w,o-rwx /srv/mirrors
# su - umirror
```

## Importar las claves gpg

```
$ gpg --no-default-keyring --keyring trustedkeys.gpg --import /usr/share/keyrings/debian-archive-keyring.gpg
$ gpg --no-default-keyring --keyring trustedkeys.gpg --import /usr/share/keyrings/debian-role-keys.gpg
$ mkdir /srv/mirrors/debian
```

## Clonar el repositorio o descargar el script debian.sh

```
$ cd /srv/mirrors
$ git clone https://github.com/hlozada/debian-mirror.git
$ cd debian-mirror
```

## Aplicar permisos de ejecución al archivo debian.sh y ejecutar

```
$ chmod u+x debian.sh
$ ./debian.sh
```
