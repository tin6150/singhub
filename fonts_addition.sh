#!/bin/sh

### add fonts to improve visual appearance of topspin nmr GUI app
### Take up ~ 3GB of space (107 fonts)

### fonts found on centos6 machine
### installed into centos7 container
### and improved visual for topspin
### TBA: satisfy need for Schrodinger maestro?
### likely not not all fonts needed, but haven't determined which one yet
###
### Used by centos7_topspin.def
### wget -nc https://raw.githubusercontent.com/tin6150/singhub/master/fonts_addition.sh

yum install -y amiri-fonts \
amiri-fonts-common \
baekmuk-ttf-fonts-common \
bitmap-console-fonts \
bitmap-fangsongti-fonts \
bitmap-fixed-fonts \
bitmap-fonts-compat \
bitmap-lucida-typewriter-fonts \
bitmap-miscfixed-fonts \
cjkuni-fonts-common \
cjkuni-fonts-ghostscript \
cjkuni-ukai-fonts \
cjkuni-uming-fonts \
culmus-aharoni-clm-fonts \
culmus-caladings-clm-fonts \
culmus-david-clm-fonts \
culmus-drugulin-clm-fonts \
culmus-ellinia-clm-fonts \
culmus-fonts-common \
culmus-frank-ruehl-clm-fonts \
culmus-miriam-clm-fonts \
culmus-miriam-mono-clm-fonts \
culmus-nachlieli-clm-fonts \
culmus-yehuda-clm-fonts \
dejavu-fonts-common \
dejavu-lgc-sans-fonts \
dejavu-lgc-sans-mono-fonts \
dejavu-lgc-serif-fonts \
dejavu-sans-fonts \
dejavu-sans-mono-fonts \
dejavu-serif-fonts \
fontpackages-filesystem \
ghostscript-fonts \
google-crosextra-caladea-fonts \
google-crosextra-carlito-fonts \
ipa-gothic-fonts \
ipa-mincho-fonts \
ipa-pgothic-fonts \
ipa-pmincho-fonts \
kacst-art-fonts \
kacst-book-fonts \
kacst-decorative-fonts \
kacst-digital-fonts \
kacst-farsi-fonts \
kacst-fonts-common \
kacst-letter-fonts \
kacst-naskh-fonts \
kacst-office-fonts \
kacst-one-fonts \
kacst-pen-fonts \
kacst-poster-fonts \
kacst-qurn-fonts \
kacst-screen-fonts \
kacst-title-fonts \
kacst-titlel-fonts \
kurdit-unikurd-web-fonts \
liberation-fonts-common \
liberation-mono-fonts \
liberation-sans-fonts \
liberation-serif-fonts \
libreoffice-opensymbol-fonts \
lklug-fonts \
lohit-bengali-fonts \
lohit-gujarati-fonts \
lohit-kannada-fonts \
lohit-malayalam-fonts \
lohit-oriya-fonts \
lohit-punjabi-fonts \
lohit-tamil-fonts \
lohit-telugu-fonts \
paktype-fonts-common \
paktype-naqsh-fonts \
paktype-tehreer-fonts \
pothana2000-fonts \
saab-fonts \
samyak-fonts-common \
samyak-gujarati-fonts \
samyak-malayalam-fonts \
samyak-oriya-fonts \
samyak-tamil-fonts \
smc-anjalioldlipi-fonts \
smc-dyuthi-fonts \
smc-fonts-common \
smc-kalyani-fonts \
smc-meera-fonts \
smc-rachana-fonts \
smc-raghumalayalam-fonts \
smc-suruma-fonts \
texlive-texmf-errata-fonts \
texlive-texmf-fonts \
urw-fonts \
vemana2000-fonts \
vlgothic-fonts \
vlgothic-fonts-common \
vlgothic-p-fonts \
wqy-microhei-fonts \
xorg-x11-fonts-75dpi \
xorg-x11-fonts-ISO8859-14-100dpi \
xorg-x11-fonts-ISO8859-14-75dpi \
xorg-x11-fonts-ISO8859-15-75dpi \
xorg-x11-fonts-ISO8859-1-75dpi \
xorg-x11-fonts-ISO8859-2-100dpi \
xorg-x11-fonts-ISO8859-2-75dpi \
xorg-x11-fonts-ISO8859-9-100dpi \
xorg-x11-fonts-ISO8859-9-75dpi \
xorg-x11-fonts-misc \
xorg-x11-fonts-Type1 
