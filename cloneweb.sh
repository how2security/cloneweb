#!/bin/bash

### CORES
amarelo="\e[33;1m"
azul="\e[34;1m"
verde="\e[32;1m"
vermelho="\e[31;1m"
fim="\e[m"

# BROWSER AGENT
AGENT="Mozilla/5.0 (Windows NT 10.0; WOW64)"

banner()
{
echo -e "$azul##############################################################$fim"
echo -e "$azul# By Wellington Luiz da Silva aka w3ll                       #$fim"
echo -e "$azul#                                                            #$fim"
echo -e "$azul# CLONEWEB   Version 1.0 - How2Sec Lab                       #$fim"
echo -e "$azul#                                                            #$fim"
echo -e "$azul# Created: 12/11/2016  Updated: 12/11/2016                   #$fim"
echo -e "$azul##############################################################$fim"

echo -e "\n"
}
banner

# Validando se o usuario passou a URL
if [ "$1" == "" ] ;then
	echo -e "$vermelho""[-] ERROR: You need to specify a URL$fim"
	echo -e "$verde""[+] Use: $0 http://www.exemplo.com.br\n$fim"
	exit 1
fi

# Criando o diretorio onde serao salvo os arquivos do servidor
DIR=`echo "$1" | cut -f3 -d"/"`
mkdir -p "mirrot.$DIR"
cd "mirrot.$DIR"

# Fazendo o download passando como parametro o User-Agent do Browser
# Isso para fazer bypass de WAF com filtros de Browsers
# As opcoes -m => de mirror (espelho) para espelhar o site, -k => para converter
# os links o conteúdo dinâmico, por fim a opção -w => para esperar X segundos
# antes de fazer a próxima requisição, fazendo o menos barulho possível no alvo
wget --user-agent="$AGENT" -mk -w 20 $1

cd -

echo -e "\n"
echo -e "$verde""[+] Search results saved in: mirror.$DIR""$fim"
